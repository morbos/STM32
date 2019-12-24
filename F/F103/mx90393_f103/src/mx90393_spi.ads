with MX90393_SPI_IO;  use MX90393_SPI_IO;
with HAL.SPI;         use HAL.SPI;

with MX90393;
--  with Delay_Milliseconds;

package MX90393_SPI is new MX90393
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port,
   Sensor_Data_Buffer => SPI_Data_8b);
