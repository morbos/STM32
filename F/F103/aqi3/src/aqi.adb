with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with Peripherals;     use Peripherals;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.USARTs;    use STM32.USARTs;
with ST7735R;         use ST7735R;
with Fonts;           use Fonts;
with Hw;              use Hw;
with Ravenscar_Time;
with Utils;           use Utils;

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
      Colour : UInt16;
   end record;
   type Aq_Range is range 1 .. 7;
   --  Air quality array, per Wikipedia
   type Aq_Array is array (Aq_Range) of Breakpoints;
   --  Colours are consistent with the charts
   AqA : constant Aq_Array := (
                               (0.0,    12.0,   0,  50, ST7735_GREEN),
                               (12.1,   35.4,  51, 100, ST7735_YELLOW),
                               (35.5,   55.4, 101, 150, ST7735_ORANGE),
                               (55.5,  150.4, 151, 200, ST7735_RED),
                               (150.5, 250.4, 201, 300, ST7735_PURPLE),
                               (250.5, 350.4, 301, 400, ST7735_MAROON),
                               (350.5, 500.4, 401, 500, ST7735_MAROON));

   type Uart_Frame is record
      Magic      : UInt16; --  0
      Len        : UInt16; --  1
      Pm1_Std    : UInt16; --  2
      Pm2_5_Std  : UInt16; --  3
      Pm10_Std   : UInt16; --  4
      Pm1_Conc   : UInt16; --  5
      Pm2_5_Conc : UInt16; --  6
      Pm10_Conc  : UInt16; --  7
      N_0_3      : UInt16; --  8
      N_0_5      : UInt16; --  9
      N_1_0      : UInt16; --  10
      N_2_5      : UInt16; --  11
      N_5_0      : UInt16; --  12
      N_10_0     : UInt16; --  13
      Reserved   : UInt16; --  14
      Csum       : UInt16; --  15
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

   Display : ST7735R_Screen (Port => Selected_SPI_Port,
                             CS   => CS_Pin'Access,
                             RS   => RS_Pin'Access,
                             RST  => RST_Pin'Access,
                             Time => Ravenscar_Time.Delays);


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

   Pm25      : UInt16;
   Slot      : Aq_Range;
   AqiVal    : Float;
   AqiInt    : UInt16;
   X         : UInt16;
   Y         : UInt16;
   First     : Boolean  := True;
   Last      : Aq_Range := Aq_Range'Last;
begin
   Initialize_Board;

   Turn_Off (Green_LED);

   Initialize_UART;

   Initialize_Screen (Display);

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
                  exit when Idx = 33;
               end if;
            end if;
         end loop;
      end;
      if Check_Valid then
         Turn_Off (Green_LED);
         Swap (Frm.Pm2_5_Std);
         Pm25 := Frm.Pm2_5_Std;
         if Compute_Aqi (Pm25, Slot, AqiVal) then
            if First or Slot /= Last then
               Swap (Frm.Pm1_Std);
               Swap (Frm.Pm10_Std);
               AqiInt := UInt16 (AqiVal);
               DrawRect (Display, 10, 10, 110, 124, AqA (Slot).Colour);
               DrawRect (Display, 11, 11, 108, 122, AqA (Slot).Colour);
               X := 20;
               Y := 30;
               DrawString (Display, X, Y, "               ", ST7735_BLUE, ST7735_BLACK);
               X := 20;
               Y := 30;
               DrawString (Display, X, Y, "AQI    : " & AqiInt'Image, ST7735_BLUE, ST7735_BLACK);
               X := 20;
               Y := 50;
               DrawString (Display, X, Y, "              ", ST7735_BLUE, ST7735_BLACK);
               X := 20;
               Y := 50;
               DrawString (Display, X, Y, "pm2.5 : " & Pm25'Image, ST7735_BLUE, ST7735_BLACK);
               X := 20;
               Y := 70;
               DrawString (Display, X, Y, "               ", ST7735_BLUE, ST7735_BLACK);
               X := 20;
               Y := 70;
               DrawString (Display, X, Y, "pm1   : " & Frm.Pm1_Std'Image, ST7735_BLUE, ST7735_BLACK);
               X := 20;
               Y := 90;
               DrawString (Display, X, Y, "               ", ST7735_BLUE, ST7735_BLACK);
               X := 20;
               Y := 90;
               DrawString (Display, X, Y, "pm10  : " & Frm.Pm10_Std'Image, ST7735_BLUE, ST7735_BLACK);
               First := False;
               Last := Slot;
            end if;
         end if;
      else
         Turn_On (Green_LED);
      end if;
   end loop;
end Aqi;
