with HAL;                use HAL;
with HAL.Bitmap;
with Interfaces;         use Interfaces;
with STM32.Device;       use STM32.Device;
with STM32.Board;        use STM32.Board;
with STM32.MPU;          use STM32.MPU;
with STM32.GPIO;         use STM32.GPIO;
with STM32.I2C;          use STM32.I2C;
with Peripherals;        use Peripherals;
with SSD1306;            use SSD1306;
with Fonts;              use Fonts;

use STM32; -- for GPIO_Alternate_Function
with Ravenscar_Time;
with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;
with Ada.Real_Time;   use Ada.Real_Time;

procedure Test_Ns is
   procedure Init_MPU;
   procedure Init_MPU
   is
      Ram : Attr_Type := (Outer => 4, Inner => 4);
      Dev : Attr_Type := (Outer => 0, Inner => 0);
   begin
      Add_Attrib (AttrIdx => 0, Attrib => Ram);
      Add_Attrib (AttrIdx => 1, Attrib => Dev);
      Add_Region (Region_Num => 0,
                  Addr       => 16#3000_0000#,
                  Size       => (2 ** 18),
                  AttIdx     => 0);
      Add_Region (Region_Num => 1,
                  Addr       => 16#2000_0000#,
                  Size       => (2 ** 18),
                  AttIdx     => 0);
      Add_Region (Region_Num => 3,
                  Addr       => 16#4000_0000#,
                  Size       => 16#1000_0000#,
                  AttIdx     => 1);
      Add_Region (Region_Num => 4,
                  Addr       => 16#E000_0000#,
                  Size       => 16#1000_0000#,
                  AttIdx     => 1);
      Enable_MPU;
   end Init_MPU;

   procedure Initialize_GPIO
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      I2C_AF   : GPIO_Alternate_Function;
      RST      : GPIO_Point
     );

   procedure Initialize_GPIO
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      I2C_AF   : GPIO_Alternate_Function;
      RST      : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 100_000;
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

   end Initialize_GPIO;

   X, Y : UInt16;
   Display : SSD1306_Screen (Buffer_Size_In_Byte => (128 * 64) / 8,
                             Width => 128,
                             Height => 64,
                             Port => Selected_I2C_Port,
                             RST => Selected_RST_Pin'Access,
                             Time => Ravenscar_Time.Delays);
begin
   Initialize_GPIO (Port   => Selected_I2C_Port,
                    SCL    => Selected_I2C_Clock_Pin,
                    SDA    => Selected_I2C_Data_Pin,
                    I2C_AF => Selected_I2C_Port_AF,
                    RST    => Selected_RST_Pin
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


   X := 4;
   Y := 4;
   DrawString (Display, X, Y, "Hi From Ada!", 1);
   X := 4;
   Y := 20;
   DrawString (Display, X, Y, "SSD1306 I2C OLED", 1);
   X := 4;
   Y := 36;
   DrawString (Display, X, Y, "via an STM32L562", 1);

   --  Display what we have drawn.
   Turn_On (Display);
   loop
      null;
   end loop;
end Test_Ns;
