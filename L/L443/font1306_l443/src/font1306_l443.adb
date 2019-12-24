--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
with SSD1306_SPI;     use SSD1306_SPI;
with Fonts;           use Fonts;
with HAL.SPI;
with HAL.Bitmap;
use STM32; -- for GPIO_Alternate_Function
with Ravenscar_Time;
with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Font1306_L443 is

   Display : SSD1306_SPI_Screen (Port => Selected_SPI_Port,
                                 Buffer_Size_In_Byte => (128 * 64) / 8,
                                 Width => 128,
                                 Height => 64,
                                 CS => CS_Pin'Access,
                                 DC => DC_Pin'Access,
                                 RST => RST_Pin'Access,
                                 Time => Ravenscar_Time.Delays);

   procedure Initialize_GPIO
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      DC       : GPIO_Point
     );

   procedure Initialize_GPIO
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      DC       : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      SPI_Points           : constant GPIO_Points := Selected_SPI_Clock_Pin &
                                                     Selected_SPI_Miso_Pin  &
                                                     Selected_SPI_Mosi_Pin;
      Config               : SPI_Configuration;
   begin
      Enable_Clock (SCL);
      Enable_Clock (MOSI);
      Enable_Clock (MISO);
      Enable_Clock (CS);
      Enable_Clock (RST);
      Enable_Clock (DC);
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

      Configure_Alternate_Function (SPI_Points, SPI_AF);

      Config.Mode := Master;
      Config.Baud_Rate_Prescaler := BRP_8;  -- 10Mhz @spec

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

      CS_Pin.Set;

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (RST, Config => GPIO_Conf);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (DC, Config => GPIO_Conf);

   end Initialize_GPIO;

   X, Y : UInt16;
begin
   Initialize_GPIO (Port   => Selected_SPI_Port,
                    SPI_AF => Selected_SPI_Port_AF,
                    SCL    => Selected_SPI_Clock_Pin,
                    MISO   => Selected_SPI_Miso_Pin,
                    MOSI   => Selected_SPI_Mosi_Pin,
                    CS     => CS_Pin,
                    RST    => RST_Pin,
                    DC     => DC_Pin
                   );

   Initialize (Display, False);

   Initialize_Layer (This => Display,
                     Layer => 1,
                     Mode => HAL.Bitmap.M_1);

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

   --   DrawChar (Display, 20, 20, 'H', 1);
   X := 4;
   Y := 4;
   DrawString (Display, X, Y, "Hi From Ada!", 1);
   X := 4;
   Y := 20;
   DrawString (Display, X, Y, "SSD1306 SPI OLED", 1);
   X := 4;
   Y := 36;
   DrawString (Display, X, Y, "via a Bluepill+", 1);

   --  Display what we have drawn.
   Turn_On (Display);

   loop
      null;
   end loop;
end Font1306_L443;
