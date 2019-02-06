with STC3115_I2C_IO;  use STC3115_I2C_IO;
with HAL.I2C;         use HAL.I2C;
with HAL;

with STC3115;

package STC3115_I2C is new STC3115
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port);
