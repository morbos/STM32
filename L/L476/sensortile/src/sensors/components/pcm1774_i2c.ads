with PCM1774_I2C_IO;  use PCM1774_I2C_IO;
with HAL.I2C;         use HAL.I2C;
with HAL;

with PCM1774;

package PCM1774_I2C is new PCM1774
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port);
