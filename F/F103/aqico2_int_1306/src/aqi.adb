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
with PM_Task;         use PM_Task;
with Co2_Task;        use Co2_Task;
with Utils;           use Utils;
with Ada.Real_Time;   use Ada.Real_Time;
with Screen;          use Screen;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

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

   type Aq_Select is
     (AQI_Value,
      PM1_0_Value,
      PM2_5_Value,
      PM10_0_Value);

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

   Slot        : Aq_Range;
   AqiVal      : Float;
   X           : UInt16;
   Y           : UInt16;
   First       : Boolean  := True;
   LastSlot    : Aq_Range := Aq_Range'Last;
   LastData    : array (Aq_Select range AQI_Value .. PM10_0_Value) of UInt16 := (999, 999, 999, 999);
   LastCo2Conc : UInt16 := 9999;
   LastCo2Temp : Integer_8 := -50;
begin
   Initialize_Board;

   Configure_Tracing;

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

   Enable_Interrupts (USART_1, Received_Data_Not_Empty);

   Init_Co2;

   Init_Co2_INT;

   loop
      Suspend_Until_True (Update_Ready);
      if PM_Valid then
         for J in PM_Select loop  --  Load up the PM ug vals. AQI is later
            Gui (Aq_Select'Val (PM_Select'Pos (J) + 1)).Val := Swap (Frm.Pm_Ug (J));
         end loop;
         --  Handle PM2.5 AQI and the coloured rectangle resulting
         if Compute_Aqi (Swap (Frm.Pm_Ug (PM2_5)), Slot, AqiVal) then
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
