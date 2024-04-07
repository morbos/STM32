with SX1276_API;      use SX1276_API;

package body LoRa_Base is

   TxBuffer : LoRa_Packet;
   RxBuffer : LoRa_Packet;

   RecLen : aliased Integer;
   RecLenPtr : Integer_Ptr := RecLen'Access;

   procedure LoRa_Ping
   is
      Hdr : LoRa_Header;
   begin
      LoRa_Ping (LoRa_BCAST);
   end LoRa_Ping;

   procedure LoRa_Ping (To : UInt8)
   is
      Hdr : LoRa_Header;
   begin
      Hdr.To    := To;
      Hdr.From  := UInt8 (LoRa_ID and 16#ff#);
      Hdr.ID    := 0;
      Hdr.Flags := 0;
   end LoRa_Ping;

   function LoRa_Receive return Boolean
   is
      Result : Boolean;
   begin
      --  vvvv this is used in the L5 veneer, and is UInt32.
      if 1 = Recv_SX1276 (RxBuffer, RecLenPtr) then
         LoRa_Parse (RxBuffer, RecLen);
         Result := True;
      else
         Result := False;
      end if;
      return Result;
   end LoRa_Receive;

   procedure LoRa_Parse (Buffer : LoRa_Packet; Len : Integer)
   is
   begin
      null;
   end LoRa_Parse;

   function LoRa_ID return UInt32
   is
      Local_Id : UInt32;
      pragma Import (C, Local_Id, "local_id");
   begin
      return Local_Id;
   end LoRa_ID;

end LoRa_Base;
