with HAL;          use HAL;

package CRC8 is

   procedure Gen_CRC8_Table;

   function Update_CRC8 (Initial : UInt8; Pkt : UInt8_Array; Len : UInt32) return UInt8;

end CRC8;
