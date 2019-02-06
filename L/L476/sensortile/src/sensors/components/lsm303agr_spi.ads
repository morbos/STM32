with LSM303AGR_SPI_IO;  use LSM303AGR_SPI_IO;
with HAL.SPI;           use HAL.SPI;
with System;

with LSM303AGR;

package LSM303AGR_SPI is new LSM303AGR
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port,
   Sensor_Data_Buffer => SPI_Data_8b);
