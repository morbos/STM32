--  with SX1276_API;      use SX1276_API;
with LoRa_Client;    use LoRa_Client;
package body LoRa_Base is

   TxBuffer : LoRa_Packet;
   RxBuffer : LoRa_Packet;

   RecLen : aliased Integer;
   RecLenPtr : Integer_Ptr := RecLen'Access;

   RecRSSI : aliased Integer;
   RecRSSI_Ptr : Integer_Ptr := RecRSSI'Access;

   procedure Send_SX1276 (Buffer : LoRa_Packet; Len : Integer);
   pragma Import (C, Send_SX1276, "send_sx1276_from_ns");
   function Recv_SX1276 (Buffer : LoRa_Packet;
                         Len    : Integer_Ptr;
                         RSSI   : Integer_Ptr) return UInt32;
   pragma Import (C, Recv_SX1276, "recv_sx1276_from_ns");

   procedure LoRa_Ping
   is
   begin
      LoRa_Ping (LoRa_BCAST);
   end LoRa_Ping;

   procedure LoRa_Ping (To : UInt8)
   is
      Hdr : LoRa_Header;
   begin
      Hdr.To    := To;
      Hdr.From  := My_Id;
      Hdr.ID    := 0;
      Hdr.Flags := 0;
   end LoRa_Ping;

   function LoRa_Receive return Boolean
   is
      Result : Boolean;
   begin
      --  vvvv this is used in the L5 veneer, and is UInt32.
      if 1 = Recv_SX1276 (RxBuffer, RecLenPtr, RecRSSI_Ptr) then
         LoRa_Parse;
         Result := True;
      else
         Result := False;
      end if;
      return Result;
   end LoRa_Receive;

   procedure LoRa_Send_Ping_Reply (To : UInt8)
   is
      Hdr : LoRa_Header;
      for Hdr'Address use TxBuffer'Address;
      for Hdr'Alignment use 1;
      Len : Integer := (Hdr'Size / 8) + 1;
   begin
      Hdr.To := To;
      Hdr.From := My_Id;
      TxBuffer (Len) := LORA_CMD_PING_REPLY;
      Send_SX1276 (TxBuffer, Len);
   end LoRa_Send_Ping_Reply;

   procedure LoRa_Notify_Button
   is
      Hdr : LoRa_Header;
      for Hdr'Address use TxBuffer'Address;
      for Hdr'Alignment use 1;
      HdrLen : Integer := (Hdr'Size / 8);
      Notify : Notify8;
      CmdLen : Integer := 1;
      for Notify'Address use TxBuffer (HdrLen + CmdLen + 1)'Address;
      for Notify'Alignment use 1;
      NotifyLen : Integer := (Notify'Size / 8);
      Len : Integer := HdrLen + CmdLen + NotifyLen;
   begin
      --  We need to see a server with RSSI > 0
      if Neighbours (0) = 0 then
         return;
      end if;
      Hdr.To := 0; --  Alert the server
      Hdr.From := My_Id;
      TxBuffer (HdrLen + 1) := LORA_NOTIFY8;
      Notify.Mask := 2; --  Bit0 will be for the LED
      Notify.Value := 2; --  Set the button
      Send_SX1276 (TxBuffer, Len);
   end LoRa_Notify_Button;

   procedure LoRa_Handle_Notify8
   is
      Hdr : LoRa_Header;
      for Hdr'Address use RxBuffer'Address;
      for Hdr'Alignment use 1;
      HdrLen : Integer := (Hdr'Size / 8);
      Notify : Notify8;
      CmdLen : Integer := 1;
      for Notify'Address use RxBuffer (HdrLen + CmdLen + 1)'Address;
      for Notify'Alignment use 1;
      NotifyLen : Integer := (Notify'Size / 8);
      Len : Integer := HdrLen + CmdLen + NotifyLen;
   begin
      if 1 = (Notify.Mask and 1) then
         if 1 = (Notify.Value and 1) then
            Turn_On (Blue_LED);
         else
            Turn_Off (Blue_LED);
         end if;
      end if;
   end LoRa_Handle_Notify8;

   procedure LoRa_Parse
   is
      Hdr : LoRa_Header;
      for Hdr'Address use RxBuffer'Address;
      for Hdr'Alignment use 1;
      Len : Integer := (Hdr'Size / 8);
   begin
      if (Hdr.To = LoRa_BCAST) or (Hdr.To = My_Id) then
         --  Its for us.
         case RxBuffer (Len + 1) is
            when LORA_CMD_PING  =>
               Neighbours (Integer (Hdr.From)) := UInt8 (RecRSSI);
               LoRa_Send_Ping_Reply (To => Hdr.From);
            when LORA_CMD_PING_REPLY =>
               null;
            when LORA_NOTIFY8  =>
               LoRa_Handle_Notify8;
            when LORA_NOTIFY8_REPLY =>
               null;
            when others =>
               null;
         end case;
      end if;
   end LoRa_Parse;

end LoRa_Base;
