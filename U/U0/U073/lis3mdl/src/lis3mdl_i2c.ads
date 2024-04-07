with LIS3MDL_I2C_IO;  use LIS3MDL_I2C_IO;
with HAL.I2C;         use HAL.I2C;
with HAL;

with LIS3MDL;

package LIS3MDL_I2C is new LIS3MDL
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port);
