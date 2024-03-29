with HAL;           use HAL;
with HAL.SPI;       use HAL.SPI;
with Utils;         use Utils;
with Peripherals;   use Peripherals;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with STM32.SPI;     use STM32.SPI;
with STM32.SYSCFG;  use STM32.SYSCFG;
with STM32.RCC;     use STM32.RCC;
with STM32.USARTs;  use STM32.USARTs;
with STM32.SubGhzPhy; use STM32.SubGhzPhy;
with STM32.SubGhzRF;  use STM32.SubGhzRF;
with Radio_Int;       use Radio_Int;
with Radio_Tasks;     use Radio_Tasks;
with LoRa;            use LoRa;
with LoRa_Mux;        use LoRa_Mux;
with Exti_Interrupts;     pragma Unreferenced (Exti_Interrupts);
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with CRC8;          use CRC8;

with Hw;            use Hw;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure PMS7003 is

   --  Air quality record, interpretation of Wikipedia page
   type Breakpoints is record
      Clow   : Float;
      Chigh  : Float;
      Ilow   : UInt16;
      Ihigh  : UInt16;
   end record;

   type Aq_Range is range 1 .. 7;
   --  Air quality array, per Wikipedia
   type Aq_Array is array (Aq_Range) of Breakpoints;
   --  Colours are consistent with the charts
   AqA : constant Aq_Array := (
                               (0.0,    12.0,   0,  50),
                               (12.1,   35.4,  51, 100),
                               (35.5,   55.4, 101, 150),
                               (55.5,  150.4, 151, 200),
                               (150.5, 250.4, 201, 300),
                               (250.5, 350.4, 301, 400),
                               (350.5, 500.4, 401, 500));

   type Aq_Select is
     (AQI_Value,
      PM1_0_Value,
      PM2_5_Value,
      PM10_0_Value);

   type PM_Select is
     (PM1_0,
      PM2_5,
      PM10_0);

   type PM_Array is array (PM_Select range PM1_0 .. PM10_0) of UInt16;

   type Uart_Frame is record
      Magic      : UInt16;   --  0
      Len        : UInt16;   --  1
      Pm_Ug      : PM_Array; --  2 .. 4
      Pm1_Conc   : PM_Array; --  5 .. 7
      N_0_3um    : UInt16;   --  8
      N_0_5um    : UInt16;   --  9
      N_1_0um    : UInt16;   --  10
      N_2_5um    : UInt16;   --  11
      N_5_0um    : UInt16;   --  12
      N_10_0um   : UInt16;   --  13
      Reserved   : UInt16;   --  14
      Csum       : UInt16;   --  15
   end record
     with Pack;

   LORA_CMD_PING                 : constant UInt8 := 16#00#;
   LORA_CMD_PING_REPLY           : constant UInt8 := 16#01#;
   --  8 bit notify cmd.
   LORA_NOTIFY8                  : constant UInt8 := 16#02#;
   LORA_NOTIFY8_REPLY            : constant UInt8 := 16#03#;

   LORA_AQI                      : constant UInt8 := 16#04#;
   LORA_AQI_REPLY                : constant UInt8 := 16#05#;

   LoRa_BCAST : constant UInt8 := 16#FF#;

   type Aqi_Frame is record
      Aqi       : UInt16;
      PM1_0     : UInt16;
      PM2_5     : UInt16;
      PM10      : UInt16;
   end record
     with Pack;

   AqiVal      : Float;
   AqiDone     : aliased Suspension_Object;

   --  We overlay a 32byte UART buffer on top of the Uart_Frame, in
   --  this way, we can structure the UART buffer.
   A         : UInt8_Array (1 .. 32);
   Frm       : Uart_Frame;
   for Frm'Alignment use 1;
   for Frm'Address use A'Address;

   Bad_Aqi     : Integer := 0;
   Invalid     : Integer := 0;
   TxDone      : Integer := 0;

   --  Per the datasheet for the PMS3003
   Magic_Num : constant UInt8_Array (1 .. 2) := (16#42#, 16#4d#);

   procedure Swap (X : in out UInt16);

   procedure Swap (X : in out UInt16)
   is
      Result : UInt16 := X;
   begin
      Result := Shift_Left (X, 8) or (Shift_Right (X, 8));
      X := Result;
   end Swap;

   function Compute_Aqi (Pm25 : UInt16; Idx : out Aq_Range; Aqi_Val : out Float) return Boolean;

   function Compute_Aqi (Pm25 : UInt16; Idx : out Aq_Range; Aqi_Val : out Float) return Boolean
   is
      Fpm25 : Float   := Float (Pm25);
      Found : Boolean := False;
   begin
      for I in Aq_Range loop
         if Fpm25 >= AqA (I).Clow and Fpm25 <= AqA (I).Chigh then
            Found := True;
            Idx := I;
            exit;
         end if;
      end loop;
      if not Found then
         return False;
      end if;
      Aqi_Val :=
        ((Float (AqA (Idx).Ihigh - AqA (Idx).Ilow)
            /
            Float (AqA (Idx).Chigh - AqA (Idx).Clow))
         * (Fpm25 - AqA (Idx).Clow))
        + Float (AqA (Idx).Ilow);
      return True;
   end Compute_Aqi;

   function Check_Valid return Boolean;

   --  Validate the checksum. We already checked the magic# prior.
   function Check_Valid return Boolean
   is
      Sum : UInt16 := 0;
   begin
      --  32byte pkt. Last 2 are the csum
      for I in 1 .. 30 loop
         Sum := Sum + UInt16 (A (I));
      end loop;
      Swap (Frm.Csum);
      if Frm.Csum = Sum then
         return True;
      else
         return False;
      end if;
   end Check_Valid;
   procedure SendAqi;
   procedure SendAqi
   is
      --      A         : LoRa_Array (1 .. (Aqi_Frame'Size) / 8);
      A         : LoRa_Array;
      Frame     : Aqi_Frame;
      for Frame'Alignment use 1;
      for Frame'Address use A'Address;
   begin
      Set_Standby (RC_13_MHz);
--      Set_False (CadDone_Go);
      --  Wait on clear air detect
--      Set_CadParams (NSyms => Two, Peak => 50, Min => 20, ExitMode => 1, Timeout => 100 * 64);  --  15.625us T/o
--      Set_Cad;
--      loop
         --  Add a timeout here
--         exit when Current_State (CadDone_Go);
--      end loop;
--      Set_Standby (RC_13_MHz);
      Frame.Aqi := UInt16 (AqiVal);
      Frame.PM1_0 := Frm.Pm_Ug (PM1_0);
      Frame.PM2_5 := Frm.Pm_Ug (PM2_5);
      Frame.PM10 := Frm.Pm_Ug (PM10_0);
      LoRa_Mux_Send (Cmd => LORA_AQI, To => 0, Payload => A, Notify => AqiDone'Unchecked_Access);  --  0 is the gateway
   end SendAqi;

   Slot        : Aq_Range;
   Goal        : Time;
begin
   Initialize_Board;
   Initialize_HW;
   SubGhzPhy_Init;
   SubGhzRF_Init;
   Gen_CRC8_Table;
   Radio_Tasks_Init;

--   Set_CadParams (NSyms => Two, Peak => 50, Min => 20, ExitMode => 1, Timeout => 100*64); --  15.625us T/o
--   Goal := Clock + Milliseconds (25000);
   Goal := Clock + Milliseconds (5000);
   loop
      declare
         Idx   : Integer := 1;
         Buff  : UInt8_Array (1 .. 2);
         C     : UInt9;
         Here  : UInt32 := 0;
         for C'Alignment use 1;
         for C'Address use Buff'Address;
      begin
         loop
            if Rx_Ready (USART_1) then
               Receive (USART_1, C);
               if Idx = 1 and Buff (1) /= Magic_Num (1) then
                  Idx := 1;
               elsif Idx = 2 and Buff (1) /= Magic_Num (2) then
                  Idx := 1;
               else
                  A (Idx) := Buff (1);
                  Idx := Idx + 1;
                  exit when Idx = (A'Size / 8) + 1;
               end if;
            end if;
         end loop;
         if Check_Valid then
            for J in PM_Select loop
               Swap (Frm.Pm_Ug (J));
            end loop;
            if Compute_Aqi (Frm.Pm_Ug (PM2_5), Slot, AqiVal) then
               --  Send this out every 25secs
               if Clock > Goal then
                  SendAqi;
                  --                  Goal := Clock + Milliseconds (25000);
                  Goal := Clock + Milliseconds (5000);
               end if;
            else
               Bad_Aqi := Bad_Aqi + 1;
            end if;
         else
            Invalid := Invalid + 1;
         end if;
      end;
   end loop;

end PMS7003;
