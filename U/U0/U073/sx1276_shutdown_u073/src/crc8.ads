with HAL;           use HAL;
with HAL.SPI;       use HAL.SPI;

package Crc8
is

   procedure Gen_Crc8_Table;
   procedure Update_Crc8 (Crc_Accum : in out UInt8; Data : UInt8_Array);
   procedure Update_Crc8 (Crc_Accum : in out UInt8; Data : SPI_Data_8b);

end Crc8;
