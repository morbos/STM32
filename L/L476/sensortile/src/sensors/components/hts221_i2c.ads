with HTS221_I2C_IO;  use HTS221_I2C_IO;
with HAL.I2C;        use HAL.I2C;
with HAL;

with HTS221;

package HTS221_I2C is new HTS221
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port);
