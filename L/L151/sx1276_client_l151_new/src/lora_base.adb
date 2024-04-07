with SX1276_API;     use SX1276_API;
with LoRa_Client;    use LoRa_Client;
package body LoRa_Base is

   TxBuffer : LoRa_Packet;
   RxBuffer : LoRa_Packet;

   RecLen : aliased Integer;
   RecLenPtr : Integer_Ptr := RecLen'Access;

   RecRSSI : aliased Integer;
   RecRSSI_Ptr : Integer_Ptr := RecRSSI'Access;

   SeqNum : UInt4 := 0;

   function LoRa_GetQueueEntry return ListNodePtr
   is
      X : ListNodePtr;
   begin
      --  Get a worklist entry
      List_Remove_Head (WorklistPoolPtr, X);
      --  Put it in the workQ
      List_Insert_Tail (WorklistQueuePtr, X);
      return X;
   end LoRa_GetQueueEntry;

   procedure LoRa_Ping
   is
   begin
      LoRa_Ping (LoRa_BCAST);
   end LoRa_Ping;

   procedure LoRa_Ping (To : UInt8)
   is
      N   : ListNodePtr;
   begin
      N := LoRa_GetQueueEntry;
      N.Elem.Hdr.To    := To;
      N.Elem.Hdr.From  := My_Id;
      N.Elem.Cmd := (Cmd => LORA_CMD_PING, others => 0);
      LoRa_Send (N, False);
   end LoRa_Ping;

   procedure LoRa_Send (N : ListNodePtr; Reply : Boolean)
   is
      X   : ListNodePtr;
   begin
--  vvvv needs thought.
      if List_Is_Empty (WorklistPoolPtr) then
         --  Delay here till the list frees up
         null;
      end if;

      if not Reply then
         X := LoRa_GetQueueEntry;
      else
         X := N;
      end if;
      X.Elem.Timestamp := Clock;
      X.Elem.RSSI := 0;
      X.Elem.Hdr := N.Elem.Hdr;
      X.Elem.Cmd := N.Elem.Cmd;
      if Reply then
         X.Elem.Cmd.SeqNum := N.Elem.Cmd.SeqNum;
      else
         X.Elem.Cmd.SeqNum := SeqNum;
      end if;
      X.Elem.Payload := N.Elem.Payload;
      declare
         HdrLen : Integer := LoRa_Header'Size / 8;
         Pkt : aliased LoRa_Packet := TxBuffer;
         LHdr : aliased LoRa_Header := X.Elem.Hdr;
         for LHdr'Address use Pkt'Address;
         for LHdr'Alignment use 1;
         LCmd : aliased LoRa_CmdHeader := X.Elem.Cmd;
         for LCmd'Address use Pkt ((LoRa_Header'Size / 8)  + 1)'Address;
         for LCmd'Alignment use 1;
         CmdLen : Integer := LoRa_CmdHeader'Size / 8;
         Len : Integer;
         LNotify : aliased Notify8 := X.Elem.Payload;
         for LNotify'Address use Pkt (((LoRa_CmdHeader'Size + LoRa_Header'Size) / 8)  + 1)'Address;
         for LNotify'Alignment use 1;
         NotifyLen : Integer := Notify8'Size / 8;
         Result : Boolean;
      begin
         case N.Elem.Cmd.Cmd is
            when LORA_NOTIFY8  =>
               Len := HdrLen + CmdLen + NotifyLen;
            when LORA_NOTIFY8_REPLY =>
               Len := HdrLen + CmdLen + NotifyLen;
            when others =>
               Len := HdrLen + CmdLen;
         end case;
         Result := Send_SX1276 (Pkt, Len);
         SeqNum := SeqNum + 1;
      end;

   end LoRa_Send;

   function LoRa_Receive return Boolean
   is
      X   : ListNodePtr;
      Result : Boolean := False;
      Size : Natural;
   begin
      --  vvvv this is used in the L5 veneer, and is UInt32.
      if 1 = Recv_SX1276 (RxBuffer, RecLenPtr, RecRSSI_Ptr) then
         if (RxBuffer (1) = LoRa_BCAST) or (RxBuffer (1) = My_Id) then
            --  Get a worklist entry
            List_Remove_Head (WorklistPoolPtr, X);
            --  Put it in the workQ
            List_Insert_Tail (WorklistQueuePtr, X);
            Size := List_Get_Size (WorklistQueuePtr);
            LoRa_Parse (RxBuffer, X);
            Result := True;
         end if;
      end if;
      return Result;
   end LoRa_Receive;

   procedure LoRa_Send_Ping_Reply (P : ListNodePtr)
   is
      N : ListNodePtr;
   begin
      N := LoRa_GetQueueEntry;
      N.Elem.Hdr.To := P.Elem.Hdr.From;
      N.Elem.Hdr.From := My_Id;
      N.Elem.Cmd := (Cmd => LORA_CMD_PING_REPLY, others => 0);
      N.Elem.Cmd.SeqNum := P.Elem.Cmd.SeqNum;
      N.Elem.NeedReply := False;
      LoRa_Send (N, True);
   end LoRa_Send_Ping_Reply;

   procedure LoRa_Rcv_Ping_Reply (P : ListNodePtr)
   is
   begin
      null;
   end LoRa_Rcv_Ping_Reply;

   procedure LoRa_Send_Notify8_Reply (P : ListNodePtr)
   is
      N : ListNodePtr;
   begin
      N := LoRa_GetQueueEntry;
      N.Elem.Hdr.To := P.Elem.Hdr.From;
      N.Elem.Hdr.From := My_Id;
      N.Elem.Cmd := (Cmd => LORA_NOTIFY8_REPLY, others => 0);
      N.Elem.Cmd.SeqNum := P.Elem.Cmd.SeqNum;
      N.Elem.Payload := P.Elem.Payload;
      N.Elem.NeedReply := False;
      P.Elem.ReplySent := True;
      LoRa_Send (N, True);
   end LoRa_Send_Notify8_Reply;

   procedure LoRa_Rcv_Notify8_Reply (Ptr : ListNodePtr; Notify : Notify8)
   is
      P : ListNodePtr;
      N : ListNodePtr;
      X : ListNodePtr;
   begin
      --  A reply means we must have the orig in the Q
      P := WorklistQueuePtr;
      if not List_Is_Empty (P) then
         List_Get_Next_Node (P, N);
         loop
            exit when N = P;
            List_Get_Next_Node (N, X);
            --  To = From
            if (N.Elem.Hdr.To = Ptr.Elem.Hdr.From) and
               (N.Elem.Cmd.Cmd = LORA_NOTIFY8) and
               (N.Elem.Cmd.SeqNum = Ptr.Elem.Cmd.SeqNum)
            then
               List_Remove_Node (N);
               List_Insert_Tail (WorklistPoolPtr, N);
            end if;
            N := X;
         end loop;
      end if;
   end LoRa_Rcv_Notify8_Reply;

   procedure LoRa_Parse (Buf : LoRa_Packet; P : in out ListNodePtr)
   is
      Hdr : LoRa_Header;
      HdrLen : Integer := LoRa_Header'Size / 8;
      for Hdr'Address use Buf'Address;
      for Hdr'Alignment use 1;
      Cmd : LoRa_CmdHeader;
      CmdLen : Integer := LoRa_CmdHeader'Size / 8;
      for Cmd'Address use Buf (HdrLen + 1)'Address;
      for Cmd'Alignment use 1;
      Len : Integer := (HdrLen + CmdLen);
   begin
      P.Elem.Timestamp := Clock;
      P.Elem.RSSI := UInt8 (RecRSSI);
      P.Elem.Hdr := Hdr;
      P.Elem.Cmd := Cmd;
      case Cmd.Cmd is
         when LORA_CMD_PING  =>
--            Turn_On (Green_LED);
            LoRa_Send_Ping_Reply (P);
         when LORA_CMD_PING_REPLY =>
            LoRa_Rcv_Ping_Reply (P);
            List_Remove_Node (P);
            List_Insert_Tail (WorklistPoolPtr, P);
         when LORA_NOTIFY8  =>
            declare
               Notify : Notify8;
               for Notify'Address use Buf (Len + 1)'Address;
               for Notify'Alignment use 1;
            begin
               P.Elem.ReplySeen := True;
               P.Elem.Payload := Notify;
               LoRa_Rcv_Notify8 (P);
            end;
         when LORA_NOTIFY8_REPLY =>
            declare
               Notify : Notify8;
               for Notify'Address use Buf (Len + 1)'Address;
               for Notify'Alignment use 1;
            begin
               P.Elem.ReplySeen := True;
               P.Elem.Payload := Notify;
               LoRa_Rcv_Notify8_Reply (P, Notify);
            end;
         when others =>
            null;
      end case;
   end LoRa_Parse;

   function My_Find (ListHead : ListNodePtr; X : ListNodePtr) return Boolean
   is
      Basepri : UInt32 := GetSetMIN_Basepri;
      Size    : Natural := 0;
      Temp    : ListNodePtr;
   begin
      Temp := ListHead.Next;
      loop
         if Temp = X then
            return True;
         end if;
         Temp := Temp.Next;
         exit when Temp = ListHead;
      end loop;
      Set_Basepri (Basepri);
      return False;
   end My_Find;

   procedure Reset_List
   is
   begin
      List_Init_Head (WorklistPoolPtr);
      List_Init_Head (WorklistQueuePtr);

      for Index in 1 .. WORKLIST_NUM_MAX loop
         List_Insert_Tail (WorklistPoolPtr, WorklistBuffer (Index)'Access);
      end loop;
   end Reset_List;

   procedure LoRa_Sweep
   is
      P    : ListNodePtr;
      N    : ListNodePtr;
      X    : ListNodePtr;
      Node : UInt8;
      --      Timeout  : Natural := 1000;
      Timeout  : Natural := 500;
   begin
      --  Scan the queue looking for pkts that never got replies
      --  A reply means we must have the orig in the Q
      P := WorklistQueuePtr;
      if not List_Is_Empty (P) then
         List_Get_Next_Node (P, N);
         loop
            exit when N = P;
            if not My_Find (P, N) then
               --  Deal with a corrupt list
               Reset_List;
               return;
            end if;

            List_Get_Next_Node (N, X);
            --  Delete:
            --  1)  To: BCAST
            --  2)  Replies
            --  3)  NOTIFY8's with retry count = N
            --  Resend
            --  NOTIFY8's
            Node := N.Elem.Hdr.From;
            if ((Clock - N.Elem.Timestamp) > Milliseconds (Timeout + Natural (Node * 10))) then
               if N.Elem.Hdr.To = LoRa_BCAST then
                  List_Remove_Node (N);
                  List_Insert_Tail (WorklistPoolPtr, N);
               else
                  case N.Elem.Cmd.Cmd is
                     when LORA_NOTIFY8  =>
                        if N.Elem.Cmd.Retry = LORA_RETRY_LIMIT then
                           List_Remove_Node (N);
                           List_Insert_Tail (WorklistPoolPtr, N);
                        else
                           --  Send it again if its outbound
                           if N.Elem.Hdr.To /= My_Id then
                              N.Elem.Cmd.Retry := N.Elem.Cmd.Retry + 1;
                              LoRa_Send (N, True);
                           elsif N.Elem.ReplySent then
                              List_Remove_Node (N);
                              List_Insert_Tail (WorklistPoolPtr, N);
                           end if;
                        end if;
                        --                  when LORA_NOTIFY8_REPLY =>
                        --                     null;
                     when LORA_CMD_PING =>
                        if N.Elem.ReplySent then
                              List_Remove_Node (N);
                              List_Insert_Tail (WorklistPoolPtr, N);
                        end if;
                     when LORA_CMD_PING_REPLY =>
                        --  Remove it.
                        List_Remove_Node (N);
                        List_Insert_Tail (WorklistPoolPtr, N);
                     when others =>
                        List_Remove_Node (N);
                        List_Insert_Tail (WorklistPoolPtr, N);
                  end case;
               end if;
            end if;
            N := X;
         end loop;
      end if;

   end LoRa_Sweep;

end LoRa_Base;
