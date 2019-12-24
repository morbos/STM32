with LSM9DS1_SPI_IO;  use LSM9DS1_SPI_IO;
with HAL.SPI;         use HAL.SPI;

with LSM9DS1;
--  with Delay_Milliseconds;

package LSM9DS1_SPI is new LSM9DS1
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port,
   Sensor_Data_Buffer => SPI_Data_8b);
