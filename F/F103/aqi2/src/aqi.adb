with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.USARTs;    use STM32.USARTs;
with STM32.SPI;       use STM32.SPI;
with ST7735R;         use ST7735R;
with Fonts;           use Fonts;
with HAL.SPI;
use STM32; -- for GPIO_Alternate_Function
with Ravenscar_Time;
with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;
with Utils;           use Utils;

procedure Aqi is
   type Breakpoints is record
      Clow   : Float;
      Chigh  : Float;
      Ilow   : UInt16;
      Ihigh  : UInt16;
      Colour : UInt16;
   end record;
   type Aq_Array is array (1 .. 7) of Breakpoints;
   AqA : constant Aq_Array := (
                               (0.0, 12.0, 0, 50, ST7735_GREEN),
                               (12.1, 35.4, 51, 100, ST7735_YELLOW),
                               (35.5, 55.4, 101, 150, ST7735_ORANGE),
                               (55.5, 150.4, 151, 200, ST7735_RED),
                               (150.5, 250.4, 201, 300, ST7735_PURPLE),
                               (250.5, 350.4, 301, 400, ST7735_MAROON),
                               (350.5, 500.4, 401, 500, ST7735_MAROON));

   Magic_Num : constant := 16#424d#;

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

   A         : UInt8_Array (1 .. 32);
   Frm       : Uart_Frame;
   for Frm'Alignment use 1;
   for Frm'Address use A'Address;

   Display : ST7735R_Screen (Port => Selected_SPI_Port,
                             CS => CS_Pin'Access,
                             RS => RS_Pin'Access,
                             RST => RST_Pin'Access,
                             Time => Ravenscar_Time.Delays);

   procedure Initialize_GPIO
     (Port     : access SPI_Port;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      RS       : GPIO_Point
     );

   procedure Initialize_GPIO
     (Port     : access SPI_Port;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      RS       : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Config               : SPI_Configuration;
   begin
      Enable_Clock (SCL);
      Enable_Clock (MOSI);
      Enable_Clock (MISO);
      Enable_Clock (CS);
      Enable_Clock (RST);
      Enable_Clock (RS);
      Enable_Clock (Port.all);

      Enable (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      Configure_IO (SCL,  GPIO_Conf);
      Configure_IO (MOSI, GPIO_Conf);
      Configure_IO (MISO, GPIO_Conf);

      Config.Mode := Master;
      --      Config.Baud_Rate_Prescaler := BRP_32;
      Config.Baud_Rate_Prescaler := BRP_4;
      Config.Clock_Polarity := Low;
      Config.Clock_Phase := P1Edge;
      Config.First_Bit := MSB;
      Config.CRC_Poly := 7;
      Config.Slave_Management := Software_Managed;  --  essential!!
      Config.Direction := D2Lines_FullDuplex;
      Config.Data_Size := HAL.SPI.Data_Size_8b;

      Disable (Selected_SPI_Port.all);
      Configure (Selected_SPI_Port.all, Config);
      Enable (Selected_SPI_Port.all);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (CS, Config => GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (RST, Config => GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (RS, Config => GPIO_Conf);

   end Initialize_GPIO;

   procedure Initialize_UART_GPIO;
   procedure Initialize_UART_GPIO is
      Configuration : GPIO_Port_Configuration;
   begin
      Enable_Clock (USART_1);
      Enable_Clock (RX_Pin & TX_Pin);

      Configuration.Mode := Mode_In;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Floating;

      Configure_IO (RX_Pin, Configuration);

      Configuration.Mode := Mode_Out;
      Configuration.Speed := Speed_2MHz;
      Configuration.Output_Type := Push_Pull;
      Configuration.Resistors := Pull_Up;

      Configure_IO (TX_Pin, Configuration);

--      Configure_Alternate_Function (RX_Pin & TX_Pin, AF => GPIO_AF_USART1_7);
   end Initialize_UART_GPIO;

   procedure Initialize_UART;
   procedure Initialize_UART
   is
   begin
      Initialize_UART_GPIO;

      Disable (USART_1);

      Set_Baud_Rate    (USART_1, 9600);
      Set_Mode         (USART_1, Tx_Rx_Mode);
      Set_Stop_Bits    (USART_1, Stopbits_1);
      Set_Word_Length  (USART_1, Word_Length_8);
      Set_Parity       (USART_1, No_Parity);
      Set_Flow_Control (USART_1, No_Flow_Control);

      Enable (USART_1);

   end Initialize_UART;

   procedure Swap (X : in out UInt16);

   procedure Swap (X : in out UInt16)
   is
      Result : UInt16 := X;
   begin
      Result := Shift_Left (X, 8) or (Shift_Right (X, 8));
      X := Result;
   end Swap;

   function Compute_Aqi (Pm25 : UInt16; Idx : out Integer) return Float;

   function Compute_Aqi (Pm25 : UInt16; Idx : out Integer) return Float
   is
      Fpm25 : Float := Float (Pm25);
      Found : Integer := 99;
      Aqi_Val : Float;
   begin
      for I in 1 .. 7 loop
         if Fpm25 >= AqA (I).Clow and Fpm25 <= AqA (I).Chigh then
            Found := I;
            exit;
         end if;
      end loop;
      Idx := Found;
      if Found /= 99 then
         Aqi_Val :=
           ((Float (AqA (Found).Ihigh - AqA (Found).Ilow)
           /
              Float (AqA (Found).Chigh - AqA (Found).Clow))
           * (Fpm25 - AqA (Found).Clow))
           + Float (AqA (Found).Ilow);
         return Aqi_Val;
      else
         return 0.0;
      end if;
   end Compute_Aqi;

   function Check_Valid return Boolean;

   function Check_Valid return Boolean
   is
      Sum : UInt16 := 0;
   begin
      Swap (Frm.Magic);
      if Frm.Magic /= Magic_Num and Frm.Len /= 28 then
         return False;
      end if;
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

   Col_Limit : Positive;
   Row_Limit : Positive;
   Total     : Natural;
   Pm25      : UInt16;
   AqiVal    : Float;
   AqiInt    : UInt16;
   Found     : Integer;
   Last      : Integer;
   X         : UInt16;
   Y         : UInt16;
begin
   Initialize_Board;

   Turn_Off (Green_LED);

   Initialize_UART;

   Initialize_GPIO (Port  => Selected_SPI_Port,
                    SCL   => Selected_SPI_Clock_Pin,
                    MISO  => Selected_SPI_Miso_Pin,
                    MOSI  => Selected_SPI_Mosi_Pin,
                    CS    => CS_Pin,
                    RST   => RST_Pin,
                    RS    => RS_Pin
                   );

   Initialize (Display);

   Set_Frame_Rate_Normal (LCD         => Display,
                          RTN         => 1,
                          Front_Porch => 16#2c#,
                          Back_Porch  => 16#2d#);

   Set_Frame_Rate_Idle (LCD           => Display,
                          RTN         => 1,
                          Front_Porch => 16#2c#,
                          Back_Porch  => 16#2d#);

   Set_Frame_Rate_Partial_Full (LCD              => Display,
                                RTN_Part         => 1,
                                Front_Porch_Part => 16#2c#,
                                Back_Porch_Part  => 16#2d#,
                                RTN_Full         => 1,
                                Front_Porch_Full => 16#2c#,
                                Back_Porch_Full  => 16#2d#);

   Set_Inversion_Control (LCD          => Display,
                          Normal       => Line_Inversion,
                          Idle         => Line_Inversion,
                          Full_Partial => Line_Inversion);

   Set_Power_Control_1 (LCD  => Display,
                        AVDD => 5,
                        VRHP => 2,
                        VRHN => 2,
                        MODE => 2);

   Set_Power_Control_2 (LCD   => Display,
                        VGH25 => 3,
                        VGSEL => 1,
                        VGHBT => 1);

   Set_Power_Control_3 (LCD => Display,
                        P1  => 16#A#,
                        P2  => 0);

   Set_Power_Control_4 (LCD => Display,
                        P1  => 16#8A#,
                        P2  => 16#2A#);

   Set_Power_Control_5 (LCD => Display,
                        P1  => 16#8A#,
                        P2  => 16#EE#);

   Set_Vcom (LCD => Display, VCOMS => 16#E#);

   Display_Inversion_Off (Display);

   Set_Memory_Data_Access (LCD                 => Display,
                           Color_Order         => RGB_Order,
                           Vertical            => Vertical_Refresh_Top_Bottom,
                           Horizontal          => Horizontal_Refresh_Left_Right,
                           Row_Addr_Order      => Row_Address_Bottom_Top,
                           Column_Addr_Order   => Column_Address_Right_Left,
                           Row_Column_Exchange => False);

   Set_Pixel_Format (LCD => Display, Pix_Fmt => Pixel_16bits);

   Set_Display (LCD => Display, Data => ST7735_BLACK);

   Turn_On (Display);
   Col_Limit := Width (Display) - 1;
   Row_Limit := Height (Display) - 1;
   Total := Width (Display) * Height (Display);
   Last := 99;
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
               if Idx = 1 and Buff (1) /= 16#42# then
                  Idx := 1;
               elsif Idx = 2 and Buff (1) /= 16#4d# then
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
         Swap (Frm.Pm1_Std);
         Swap (Frm.Pm10_Std);
         AqiVal := Compute_Aqi (Pm25, Found);
         AqiInt := UInt16 (AqiVal);
         if Found /= 0 and Found /= Last then
            DrawRect (Display, 10, 10, 110, 124, AqA (Found).Colour);
            DrawRect (Display, 11, 11, 108, 122, AqA (Found).Colour);
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
            Last := Found;
         end if;
      else
         Turn_On (Green_LED);
      end if;
   end loop;
end Aqi;
