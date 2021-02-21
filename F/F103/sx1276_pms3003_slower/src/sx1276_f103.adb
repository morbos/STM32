
with HAL;           use HAL;
with HAL.SPI;       use HAL.SPI;
with SX1276_SPI;    use SX1276_SPI;
with Utils;         use Utils;
with Peripherals;   use Peripherals;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with STM32.SPI;     use STM32.SPI;
with STM32.SYSCFG;  use STM32.SYSCFG;
with STM32.EXTI;    use STM32.EXTI;
with STM32.RCC;     use STM32.RCC;
with STM32.USARTs;  use STM32.USARTs;
with STM32_SVD.AFIO; use STM32_SVD.AFIO;
with CRC8;          use CRC8;

with Hw;            use Hw;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;
with Exti;  pragma Unreferenced (Exti);

procedure SX1276_f103 is
   SX : SX1276_Radio (SX1276_Port'Access);

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

   type PM_Select is
     (PM1_0,
      PM2_5,
      PM10_0);

   type Aq_Select is
     (AQI_Value,
      PM1_0_Value,
      PM2_5_Value,
      PM10_0_Value);

   type PM_Array is array (PM_Select range PM1_0 .. PM10_0) of UInt16;

   type Uart_Frame is record
      Magic      : UInt16;   --  0
      Len        : UInt16;   --  1
      Pm_Ug      : PM_Array; --  2 .. 4
      Pm1_Conc   : PM_Array; --  5 .. 7
      Reserved1  : UInt16;   --  8
      Reserved2  : UInt16;   --  9
      Reserved3  : UInt16;   --  10
      Csum       : UInt16;   --  11
   end record
     with Pack;

   type LoRa_Packet is record
      Aqi    : UInt16;
      Pm_Ug  : PM_Array;
      Crc    : UInt8;
   end record
     with Pack;

   --  We overlay a 24byte UART buffer on top of the Uart_Frame, in
   --  this way, we can structure the UART buffer.
   A         : UInt8_Array (1 .. 24);
   Frm       : Uart_Frame;
   for Frm'Alignment use 1;
   for Frm'Address use A'Address;

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
      --  First 22 summed, last 2 are the sum
      for I in 1 .. 22 loop
         Sum := Sum + UInt16 (A (I));
      end loop;
      Swap (Frm.Csum);
      if Frm.Csum = Sum then
         return True;
      else
         return False;
      end if;
   end Check_Valid;

   ------------------------------
   -- Initialize_SX1276 --
   ------------------------------
   procedure Initialize_SX1276;

   procedure Initialize_SX1276 is
      type Reset_Stance is (Assert, Deassert)
        with Size => 1;
      procedure Init_SPI;
      procedure Init_GPIO;
      procedure Init_Interrupts;
      procedure Reset (Stance : Reset_Stance);

      --------------
      -- Init_SPI --
      --------------

      procedure Init_SPI is
         Config : SPI_Configuration;
      begin
         Enable_Clock (SX1276_SPI_Port.all);
         Enable (SX1276_SPI_Port.all);
         STM32.Device.Reset (SX1276_SPI_Port.all);

         Config.Mode := Master;
         Config.Baud_Rate_Prescaler := BRP_4;
         Config.Clock_Polarity := Low;
         Config.Clock_Phase := P1Edge;
         Config.First_Bit := MSB;
         Config.CRC_Poly := 7;
         Config.Slave_Management := Software_Managed;  --  essential!!
         Config.Direction := D2Lines_FullDuplex;
         Config.Data_Size := HAL.SPI.Data_Size_8b;
--         Config.Fifo_Level := True;

         Disable (SX1276_SPI_Port.all);
         Configure (SX1276_SPI_Port.all, Config);
         Enable (SX1276_SPI_Port.all);

      end Init_SPI;

      procedure Reset (Stance : Reset_Stance)
      is
      begin
         if Stance = Assert then
            SX1276_Reset_Pin.Clear;
         else
            SX1276_Reset_Pin.Set;
         end if;
      end Reset;
      ---------------
      -- Init_GPIO --
      ---------------

      procedure Init_GPIO is
         Config : GPIO_Port_Configuration;
         SPI_Points : constant GPIO_Points := SX1276_SPI_Mosi_Pin &
           SX1276_SPI_Miso_Pin & SX1276_SPI_Clock_Pin;

         DIO_Points : constant GPIO_Points :=
           SX1276_DIO_0_Pin &
           SX1276_DIO_1_Pin;
--           SX1276_DIO_2_Pin &
--           SX1276_DIO_3_Pin &
--           SX1276_DIO_4_Pin &
--           SX1276_DIO_5_Pin;

      begin
         Enable_Clock (SPI_Points);

         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;
         Config.Mode        := Mode_AF;

         Configure_IO (SPI_Points, Config);
--         Configure_Alternate_Function (SPI_Points, SX1276_SPI_Port_AF);

         Enable_Clock (SX1276_NSS_Pin);

         Config.Mode        := Mode_Out;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;

         SX1276_NSS_Pin.Configure_IO (Config);
         SX1276_NSS_Pin.Set;

         Enable_Clock (SX1276_Reset_Pin);
         Config.Mode        := Mode_Out;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Floating;
         Config.Speed       := Speed_50MHz;

         SX1276_Reset_Pin.Configure_IO (Config);
         Reset (Assert);
         Reset (Deassert);

         Enable_Clock (DIO_Points);
         Config.Mode        := Mode_In;
         Config.Output_Type := Push_Pull;
         Config.Resistors   := Pull_Down;
         Config.Speed       := Speed_2MHz;

         Configure_IO (DIO_Points, Config);

      end Init_GPIO;

      procedure Init_Interrupts
      is
         Int_Points : constant GPIO_Points :=
           SX1276_DIO_0_Pin &
           SX1276_DIO_1_Pin;
         Index : Integer;
      begin
--         SYSCFG_Clock_Enable;
         for Point of Int_Points loop
--            Connect_External_Interrupt (Point);
            Index := GPIO_Pin'Pos (Point.Pin);
            Enable_External_Interrupt (External_Line_Number'Val (Index), Interrupt_Rising_Edge);
         end loop;
         AFIO_Periph.EXTICR1.EXTI.Arr (0) := 1;
         AFIO_Periph.EXTICR1.EXTI.Arr (1) := 1;
      end Init_Interrupts;
   begin
      Init_GPIO;
      Init_SPI;
      Init_Interrupts;
   end Initialize_SX1276;

   Slot        : Aq_Range;
   AqiVal      : Float;
   Goal        : Time;
begin
   Initialize_Board;
   Initialize_UART;
   Initialize_SX1276;
   Gen_CRC8_Table;
   SX.Init;
   Turn_Off (Green_LED);
   Goal := Clock + Milliseconds (25000);
   loop
      declare
         Idx   : Integer := 1;
         Buff  : UInt8_Array (1 .. 2);
         C     : UInt9;
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
                  exit when Idx = 25;
               end if;
            end if;
         end loop;
      end;
      if Check_Valid then
         Turn_Off (Green_LED);
         for J in PM_Select loop
            Swap (Frm.Pm_Ug (J));
         end loop;
         if Compute_Aqi (Frm.Pm_Ug (PM2_5), Slot, AqiVal) then
            declare
               --               S : String := UInt16'Image (X);
               Airq : LoRa_Packet;
               TxBuffer : SPI_Data_8b (1 .. 9);
               for Airq'Address use TxBuffer'Address;
               for Airq'Alignment use 1;
            begin
               Airq.Aqi := UInt16 (AqiVal);
               Airq.Pm_Ug := Frm.Pm_Ug;
               Airq.Crc := Update_CRC8 (16#FF#, TxBuffer, 8);
               if Clock > Goal then
                  SX.Send (TxBuffer, 9);
                  Goal := Clock + Milliseconds (25000);
               end if;
            end;
         end if;
      else
         Turn_On (Green_LED);
      end if;
   end loop;
end SX1276_f103;
