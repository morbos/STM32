with LPS22HB_SPI_IO;  use LPS22HB_SPI_IO;
with HAL.SPI;         use HAL.SPI;

with LPS22HB;
--  with Delay_Milliseconds;

package LPS22HB_SPI is new LPS22HB
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port,
   Sensor_Data_Buffer => SPI_Data_8b);
