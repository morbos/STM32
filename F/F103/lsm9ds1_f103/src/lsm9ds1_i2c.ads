with LSM9DS1_I2C_IO;  use LSM9DS1_I2C_IO;
with HAL.I2C;        use HAL.I2C;

with LSM9DS1;
--  with Delay_Milliseconds;

package LSM9DS1_I2C is new LSM9DS1
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port,
   Sensor_Data_Buffer => I2C_Data);

