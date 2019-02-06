with BlueNRG_SPI_IO;   use BlueNRG_SPI_IO;
with HAL.SPI;          use HAL.SPI;

with BlueNRG;

package BlueNRG_SPI is new BlueNRG
  (IO_Port            => IO_Port,
   Any_IO_Port        => Any_IO_Port
  );
