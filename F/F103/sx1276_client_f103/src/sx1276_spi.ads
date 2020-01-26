with SX1276_SPI_IO;   use SX1276_SPI_IO;
with HAL.SPI;         use HAL.SPI;

with SX1276;
--  with Delay_Milliseconds;

package SX1276_SPI is new SX1276
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port,
   Sensor_Data_Buffer => SPI_Data_8b);
