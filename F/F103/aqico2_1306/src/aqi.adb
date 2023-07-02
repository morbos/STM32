with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Interfaces;      use Interfaces;
with Peripherals;     use Peripherals;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.USARTs;    use STM32.USARTs;
with SSD1306_SPI;     use SSD1306_SPI;
with Trace;           use Trace;
with Fonts;           use Fonts;
with Hw;              use Hw;
with Co2_Task;        use Co2_Task;
with Utils;           use Utils;
with Ada.Real_Time;   use Ada.Real_Time;
with Screen;          use Screen;

--  Compute Air Quality Index per Wikipedia entry.
--  Code uses a PMS7003 connected at 9600bps on USART_1 which
--  overrides the Ada use of USART_1 as a console.
procedure Aqi is
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
      N_0_3      : UInt16;   --  8
      N_0_5      : UInt16;   --  9
      N_1_0      : UInt16;   --  10
      N_2_5      : UInt16;   --  11
      N_5_0      : UInt16;   --  12
      N_10_0     : UInt16;   --  13
      Reserved   : UInt16;   --  14
      Csum       : UInt16;   --  15
   end record
     with Pack;

   --  We overlay a 32byte UART buffer on top of the Uart_Frame, in
   --  this way, we can structure the UART buffer.
   A         : UInt8_Array (1 .. 32);
   Frm       : Uart_Frame;
   for Frm'Alignment use 1;
   for Frm'Address use A'Address;

   --  Per the datasheet for the PSM7003
   Magic_Num : constant UInt8_Array (1 .. 2) := (16#42#, 16#4d#);

   type GuiT is record
      Str : String (1 .. 8);
      Val : UInt16;
   end record;

   type Gui_Array is array (AQI_Value .. PM10_0_Value) of GuiT;

   Gui : Gui_Array := (
                       ("AQI   : ", 999),
                       ("pm1   : ", 999),
                       ("pm2.5 : ", 999),
                       ("pm10  : ", 999));

--   Display : SSD1306_SPI_Screen (Port => Selected_SPI_Port,
--                                 Buffer_Size_In_Byte => (128 * 64) / 8,
--                                 Width => 128,
--                                 Height => 64,
--                                 CS => CS_Pin'Access,
--                                 DC => DC_Pin'Access,
--                                 RST => RST_Pin'Access,
--                                 Time => Ravenscar_Time.Delays);

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
      --  First 30 summed, last 2 are the sum
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

   Slot        : Aq_Range;
   AqiVal      : Float;
   X           : UInt16;
   Y           : UInt16;
   First       : Boolean  := True;
   LastSlot    : Aq_Range := Aq_Range'Last;
   LastData    : array (Aq_Select range AQI_Value .. PM10_0_Value) of UInt16 := (999, 999, 999, 999);
   LastCo2Conc : UInt16 := 9999;
   LastCo2Temp : Integer_8 := -50;
   Timed_Out   : Boolean;
begin
   Initialize_Board;

   Configure_Tracing;

--   delay until Clock + Milliseconds (1000);

   Turn_Off (Green_LED);

   Initialize_Screen (Display);

   --  Draw a bounding box by
   --  a) fill
   Fill_Region (This => Display,
                X_Start => 0,
                X_End => Display.Width - 1,
                Y_Start => 0,
                Y_End => Display.Height - 1, Colour => 1);

   --  b) unfill 1 pel in around.
   Fill_Region (This => Display,
                X_Start => 1,
                X_End => Display.Width - 2,
                Y_Start => 1,
                Y_End => Display.Height - 2, Colour => 0);

   Initialize_UART;

   Init_Co2;

   Init_Co2_INT;

   loop
      Timed_Out := False;
      declare
         Idx   : Integer := 1;
         Buff  : UART_Data_8b (1 .. 1);
         Stamp : Time;
         Status  : UART_Status;
      begin
         Stamp := Clock;
         loop
            if Clock > Stamp + Milliseconds (1000) then
               Turn_On (Green_LED);
               Timed_Out := True;
               exit;
            end if;
            if Rx_Ready (USART_1) then
               Receive (USART_1, Buff, Status, 100);
               if Status = Ok then
                  if Idx = 1 and Buff (1) /= Magic_Num (1) then
                     Idx := 1;
                  elsif Idx = 2 and Buff (1) /= Magic_Num (2) then
                     Idx := 1;
                  else
                     A (Idx) := Buff (1);
                     Idx := Idx + 1;
                     exit when Idx = 33;
                  end if;
               end if;
            end if;
         end loop;
      end;
      if not Timed_Out and Check_Valid then
         Turn_Off (Green_LED);
         for J in PM_Select loop
            Swap (Frm.Pm_Ug (J));
            Gui (Aq_Select'Val (PM_Select'Pos (J) + 1)).Val := Frm.Pm_Ug (J);
         end loop;
         --  Handle AQI and the coloured rectangle resulting
         if Compute_Aqi (Frm.Pm_Ug (PM2_5), Slot, AqiVal) then
            Gui (AQI_Value).Val := UInt16 (AqiVal);
         end if;
         if LastData (AQI_Value) /= Gui (AQI_Value).Val then
            X := 4;
            Y := 4;
            DrawString (Display, X, Y, "               ", 1);
            X := 4;
            Y := 4;
            DrawString (Display, X, Y, Gui (AQI_Value).Str & Gui (AQI_Value).Val'Image, 1);
            LastData (AQI_Value) := Gui (AQI_Value).Val;
         end if;
      else
         --         Turn_On (Green_LED);
         null;
      end if;
      if Reading_Valid then
         declare
            Idx : Integer := Integer (Aq_Select'Pos (Aq_Select'Last)) + 2;
            T  : Float;
            IT : Integer;
         begin
            if LastCo2Conc /= Curr_Co2_Reading.Concentration then
               X := 4;
               Y := 20;
               DrawString (Display, X, Y, "                   ", 1);
               X := 4;
               Y := 20;
               DrawString (Display, X, Y,
                           "Co2   : "
                             &
                             Curr_Co2_Reading.Concentration'Image, 1);
               LastCo2Conc := Curr_Co2_Reading.Concentration;
            end if;
            if LastCo2Temp /= Curr_Co2_Reading.Temp then
               T := Float (Curr_Co2_Reading.Temp) * (9.0 / 5.0) + 32.0;
               IT := Integer (T);
               X := 4;
               Y := 36;
               DrawString (Display, X, Y, "               ", 1);
               X := 4;
               Y := 36;
               DrawString (Display, X, Y, "Temp  : " & IT'Image, 1);
               LastCo2Temp := Curr_Co2_Reading.Temp;
            end if;
         end;
      end if;
   end loop;
end Aqi;
