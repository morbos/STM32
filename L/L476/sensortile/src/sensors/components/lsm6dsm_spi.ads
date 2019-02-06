with LSM6DSM_SPI_IO;   use LSM6DSM_SPI_IO;
with HAL.SPI;          use HAL.SPI;

with LSM6DSM;

package LSM6DSM_SPI is new LSM6DSM
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port,
   Sensor_Data_Buffer => SPI_Data_8b);
