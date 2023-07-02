with HAL;           use HAL;
with HAL.SPI;       use HAL.SPI;

package LoRa is

   --  used in the API
   type LoRa_Array is new UInt8_Array (1 .. 256); --  You cannot send more than 256

   --  used when talking to the LoRa HW (SPI)
   type LoRa_Message is new SPI_Data_8b (1 .. 256);

end LoRa;
