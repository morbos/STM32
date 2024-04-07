with LPS22HH_I2C_IO;  use LPS22HH_I2C_IO;
with HAL.I2C;         use HAL.I2C;
with HAL;

with LPS22HH;

package LPS22HH_I2C is new LPS22HH
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port);
