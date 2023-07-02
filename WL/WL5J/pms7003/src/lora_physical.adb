package body LoRa_Physical is

   procedure LoRa_Physical_Send (Routing: UInt8_Array; Mux: UInt8_Array; Payload : UInt8_Array)
   is
      PktLen := Routing'Length + Mux'Length + Payload'Length;
      Phys_Pkt : SPI_Data_8b (1 .. PktLen + 1);
      Off : Integer;
   begin
      Off := 1;
      for I in Routing'Range loop
         Phys_Pkt (Off) := Routing (I);
         Off := Off + 1;
      end for;
      for I in Mux'Range loop
         Phys_Pkt (Off) := Mux (I);
         Off := Off + 1;
      end for;
      for I in Payload'Range loop
         Phys_Pkt (Off) := Payload (I);
         Off := Off + 1;
      end for;
      Crc := Update (16#FF#, PhysPkt, PktLen);
      Phys_Pkt (Off) := Crc;

      --  vvvvv do this in a task that has state w/rcv
      Write_Buffer (Offset => 0, Buffer => Phys_Pkt);
      Set_Tx (0);

   end LoRa_Physical_Send;

end LoRa_Physical;
