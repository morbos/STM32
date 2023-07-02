with HAL;           use HAL;
with LoRa;          use LoRa;

package LoRa_Routing is

   From : UInt8 := 1; --  This is temp. Need accessor to pull it from the binary

   type LoRa_Routing_Frame is record
      To       : UInt8;
      From     : UInt8;
   end record
     with Pack;

   procedure LoRa_Routing_Send (To: UInt8; Cmd: LoRa_Array; Payload : LoRa_Array);

end LoRa_Routing;
