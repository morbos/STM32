package body LoRa_Routing is

   procedure LoRa_Routing_Send (To: UInt8; Cmd: LoRa_Array; Payload : LoRa_Array)
   is
      A         : UInt8_Array (1 .. (LoRa_Routing_Frame'Size) / 8);
      Frame     : LoRa_Routing_Frame;
      for Frame'Alignment use 1;
      for Frame'Address use A'Address;
   begin
      Frame.To    := To;
      Frame.From := From;
      LoRa_Physical_Send (A, Cmd, Payload);
   end LoRa_Routing_Send;

end LoRa_Routing;
