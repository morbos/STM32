with HAL;              use HAL;
with Ada.Real_Time;    use Ada.Real_Time;
with STM32.Device;     use STM32.Device;
with STM32.Board;      use STM32.Board;
with STM32.SAU;        use STM32.SAU;
with STM32.MPU;        use STM32.MPU;
with STM32.I2C;        use STM32.I2C;
with STM32.GPIO;       use STM32.GPIO;
with STM32_SVD.RCC;    use STM32_SVD.RCC;
with STM32_SVD.GTZC;   use STM32_SVD.GTZC;
with STM32_SVD.PWR;    use STM32_SVD.PWR;
with STM32_SVD.ICache; use STM32_SVD.ICache;
with STM32_SVD.DCACHE; use STM32_SVD.DCACHE;
with Peripherals;      use Peripherals;
with CM33;             use CM33;
with Ada.Real_Time;    use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with VEML6030_I2C;      use VEML6030_I2C;

use STM32; -- for GPIO_Alternate_Function

procedure Test_S is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (100);
   end My_Delay;

   procedure Cache_Enable;
   procedure Cache_Enable
   is
   begin
      DCACHE_Periph.DCACHE_CR.EN := True;
      ICache_Periph.ICACHE_CR.EN := True;
   end Cache_Enable;

   procedure Initialize_GPIO
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      I2C_AF   : GPIO_Alternate_Function
     );

   procedure Initialize_GPIO
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      I2C_AF   : GPIO_Alternate_Function
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      VEML6030_Clock_Speed  : constant := 400_000;
      I2C_Points           : constant GPIO_Points := SDA & SCL;
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

      Configure_Alternate_Function (I2C_Points, I2C_AF);

      STM32.I2C.Configure
        (Port.all,
         (Clock_Speed              => VEML6030_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

   end Initialize_GPIO;

   VEML         : VEML6030_Sensor  (VEML6030_Port'Access);

   Als          : UInt16;
begin
   Initialize_Board;
   Init_CM33;
--   Cache_Enable; If enabled.... device_id fails... hmmm
   Initialize_GPIO (Port   => VEML6030_I2C_Port,
                    SCL    => VEML6030_I2C_Clock_Pin,
                    SDA    => VEML6030_I2C_Data_Pin,
                    I2C_AF => VEML6030_I2C_Port_AF
                   );

   VEML.PowerUp;
   loop
      Als := VEML.Read_ALS;
   end loop;
end Test_S;
