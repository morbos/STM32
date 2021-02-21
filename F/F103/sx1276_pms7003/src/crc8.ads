with HAL;          use HAL;
with HAL.SPI;      use HAL.SPI;

package CRC8 is

   procedure Gen_CRC8_Table;

   function Update_CRC8 (Initial : UInt8; Pkt : SPI_Data_8b; Len : UInt32) return UInt8;

end CRC8;
