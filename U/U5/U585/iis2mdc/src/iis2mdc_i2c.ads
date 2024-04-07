with IIS2MDC_I2C_IO;  use IIS2MDC_I2C_IO;
with HAL.I2C;         use HAL.I2C;
with HAL;

with IIS2MDC;

package IIS2MDC_I2C is new IIS2MDC
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port);
