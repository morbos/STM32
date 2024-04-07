with VEML6030_I2C_IO;  use VEML6030_I2C_IO;
with HAL.I2C;         use HAL.I2C;
with HAL;

with VEML6030;

package VEML6030_I2C is new VEML6030
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port);
