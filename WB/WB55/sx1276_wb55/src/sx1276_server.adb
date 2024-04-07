package body LoRa_Server is

   TxBuffer : LoRa_Packet;
   RxBuffer : LoRa_Packet;

   RecLen : aliased Integer;
   RecLenPtr : Integer_Ptr := RecLen'Access;

   task body LoRa_Server is
   is
      Result : Boolean;
   begin
      loop
         Suspend_Until_True (LoRa_Go);
         if Recv_SX1276 (RxBuffer, RecLenPtr) then
            Parse_SX1276 (RxBuffer, RecLen);
         end if;
      end if;
   end LoRa_Server;

end Sx1276_Server;
