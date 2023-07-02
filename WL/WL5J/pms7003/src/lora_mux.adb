with LoRa_Routing;      use LoRa_Routing;

package body LoRa_Mux is

   procedure LoRa_Mux_Send (Cmd : UInt8; To : UInt8; Payload : LoRa_Array; Notify : SO_Ptr)
   is
      A         : LoRa_Array;
      Frame     : LoRa_Mux_Frame;
      for Frame'Alignment use 1;
      for Frame'Address use A'Address;
   begin
      --  Prep the CMD, initial Seq# and Retry
      Frame.Cmd := Cmd;
      Frame.Seq := UInt4 (LoRa_Mux_Seq_Num and 16#F#);
      Frame.Retry := 0;
      LoRa_Mux_Seq_Num := LoRa_Mux_Seq_Num + 1;
      LoRa_Routing_Send (To, A, Payload);
   end LoRa_Mux_Send;

end LoRa_Mux;
