with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
--  with HAL.I2C;
--  with HAL.GPIO;        use HAL.GPIO;
with HAL.Bitmap;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.I2C;       use STM32.I2C;
with SSD1306;         use SSD1306;
with STM32.SubGhzPhy; use STM32.SubGhzPhy;
with STM32.SubGhzRF;  use STM32.SubGhzRF;
with Fonts;           use Fonts;
use STM32; -- for GPIO_Alternate_Function
with Ravenscar_Time;
with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;
with Radio_Int;       pragma Unreferenced (Radio_Int);
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure I2C_1306 is

--   Display : SSD1306_128x64_Screen (Port => Selected_I2C_Port,
--                                    RST => Selected_RST_Pin'Access,
--                                    Time => Ravenscar_Time.Delays);

   Display : SSD1306_Screen (Buffer_Size_In_Byte => (128 * 64) / 8,
                             Width => 128,
                             Height => 64,
                             Port => Selected_I2C_Port,
                             RST => Selected_RST_Pin'Access,
                             Time => Ravenscar_Time.Delays);

   procedure Initialize_I2C_GPIO
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      I2C_AF   : GPIO_Alternate_Function;
      RST      : GPIO_Point
     );

   procedure Initialize_I2C_GPIO
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      I2C_AF   : GPIO_Alternate_Function;
      RST      : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 400_000;
      I2C_Points           : constant GPIO_Points := SDA & SCL;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
      Enable_Clock (RST);
      Enable_Clock (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Resistors   := Pull_Up;
      Configure_IO (SCL, GPIO_Conf);
      Configure_IO (SDA, GPIO_Conf);

      Configure_Alternate_Function (I2C_Points, I2C_AF);

      STM32.I2C.Configure
        (Port.all,
         (Clock_Speed              => Selected_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (RST, Config => GPIO_Conf);

   end Initialize_I2C_GPIO;

   procedure Initialize_Debug_SubGhz_GPIO;

   procedure Initialize_Debug_SubGhz_GPIO
   is
      GPIO_Conf      : GPIO_Port_Configuration;
      SPI_Points     : constant GPIO_Points :=
        Debug_SubGhzPhy_NSS &
        Debug_SubGhzPhy_CLK &
        Debug_SubGhzPhy_MISO &
        Debug_SubGhzPhy_MOSI;
   begin
      Enable_Clock (SPI_Points);

      GPIO_Conf.Output_Type := Push_Pull;
      --      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Resistors   := Pull_Up;
      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      Configure_IO (SPI_Points, GPIO_Conf);

      Configure_Alternate_Function (SPI_Points, Debug_SubGhzPhy_AF);

   end Initialize_Debug_SubGhz_GPIO;

   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;

   X, Y : UInt16;
begin
   Initialize_Board;
   SubGhzPhy_Init;
   SubGhzRF_Init;

   Initialize_I2C_GPIO (Port   => Selected_I2C_Port,
                        SCL    => Selected_I2C_Clock_Pin,
                        SDA    => Selected_I2C_Data_Pin,
                        I2C_AF => Selected_I2C_Port_AF,
                        RST    => Selected_RST_Pin
                      );

--   Initialize_Debug_SubGhz_GPIO;

   Initialize (Display, False);

   Initialize_Layer (This => Display,
                     Layer => 1,
                     Mode => HAL.Bitmap.M_1);

   Fill_Region (This => Display,
                X_Start => 0,
                X_End => Display.Width - 1,
                Y_Start => 0,
                Y_End => Display.Height - 1, Colour => 1);

   Fill_Region (This => Display,
                X_Start => 1,
                X_End => Display.Width - 2,
                Y_Start => 1,
                Y_End => Display.Height - 2, Colour => 0);

   X := 4;
   Y := 10;
   DrawString (Display, X, Y, "Npkts : ", 1);
   X := 4;
   Y := 30;
   DrawString (Display, X, Y, "Crc8  : ", 1);

   --  Display what we have drawn.
   Turn_On (Display);

--   Initialize_Debug_SubGhz_GPIO;

   loop
      Suspend_Until_True (Radio_Int.Message_Go);
      X := 40;
      Y := 10;
      DrawString (Display, X, Y, "      ", 1);
      X := 40;
      Y := 10;
      DrawString (Display, X, Y, Radio_Int.Npkts'Image, 1);
      X := 40;
      Y := 30;
      DrawString (Display, X, Y, "      ", 1);
      X := 40;
      Y := 30;
      DrawString (Display, X, Y, Radio_Int.Crc8'Image, 1);
      Turn_Off (Green_LED);
   end loop;
end I2C_1306;
