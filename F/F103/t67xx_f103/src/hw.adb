with STM32.AFIO;     use STM32.AFIO;
with HAL.Bitmap;

package body Hw
is

   --------------------------------
   ---  Initialize_Co2_I2C  --
   --------------------------------

   procedure Initialize_Co2_I2C
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point)
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 100_000;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
      Enable_Clock (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Resistors   := Pull_Up;
      Configure_IO (SCL, GPIO_Conf);
      Configure_IO (SDA, GPIO_Conf);

      STM32.I2C.Configure
        (Port.all,
         (Clock_Speed              => Selected_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

   end Initialize_Co2_I2C;

   procedure Init_Co2_HW
   is
   begin
      Initialize_Co2_I2C
        (Port     => Co2_I2C_Port,
         SCL      => Co2_I2C_Clock_Pin,
         SDA      => Co2_I2C_Data_Pin
        );

   end Init_Co2_HW;
end Hw;
