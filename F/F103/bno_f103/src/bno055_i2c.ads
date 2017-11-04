with BNO055_I2C_IO;  use BNO055_I2C_IO;
with HAL.I2C;        use HAL.I2C;

with Bosch_BNO055;
with Delay_Milliseconds;

package BNO055_I2C is new Bosch_BNO055
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port,
   Sensor_Data_Buffer => I2C_Data);

