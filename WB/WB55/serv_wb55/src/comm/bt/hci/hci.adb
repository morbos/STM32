with Hci_Le;        use Hci_Le;
with Comm;          use Comm;
with Comm.Run;      use Comm.Run;
with Comm.TL;       use Comm.TL;
with Log;           use Log;
with Utils;         use Utils;
with Gen_List;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Hci is

   procedure Hci_Timeout_Callback
   is
   begin
      null;
   end Hci_Timeout_Callback;

   procedure Hci_Init
   is
      --  Elem : HciReadPktPoolPtr;
   begin
      --  Initialize list heads of ready and free hci data packet queues
      List_Init_Head (HciReadPktPoolPtr);
      List_Init_Head (HciReadPktRxQueuePtr);

      --  Initialize the queue of free hci data packets
      for Index in 1 .. HCI_READ_PACKET_NUM_MAX loop
         List_Insert_Tail (HciReadPktPoolPtr, HciReadPacketBuffer (Index)'Access);
      end loop;
   end Hci_Init;

   function HCI_Verify (HciReadPacket : ListNodePtr) return Integer
   is
      Buffer : DataBuffT := HciReadPacket.Elem.DataBuff;
      HCI_PCK_TYPE_OFFSET              : constant Integer :=  1;
      EVENT_PARAMETER_TOT_LEN_OFFSET   : constant Integer :=  3;
   begin

      if Buffer (HCI_PCK_TYPE_OFFSET) /= HCI_EVENT_PKT then
         return 1;  -- Incorrect type.
      end if;
      if Buffer (EVENT_PARAMETER_TOT_LEN_OFFSET) /= UInt8 (HciReadPacket.Elem.Data_Len - (1 + HCI_EVENT_HDR_SIZE)) then
         return 2; --  Wrong length (packet truncated or too long).
      end if;
      return 0;
   end HCI_Verify;

   function HCI_Queue_Empty return Boolean
   is
   begin
      return List_Is_Empty (HciReadPktRxQueuePtr);
   end HCI_Queue_Empty;

   procedure Hci_Send_Cmd
     (Opcode : Opcode_Type;
      Plen   : UInt8;
      Param  : DataBuffT)
   is
   begin
      TL_BLE_Send_Cmd (Opcode, Plen, Param);
   end Hci_Send_Cmd;

   procedure Move_List
     (Dest_List : ListNodePtr;
      Src_List  : ListNodePtr)
   is
      Tmp_Node : ListNodePtr;
   begin
      while not List_Is_Empty (Src_List) loop
         List_Remove_Tail (Src_List, Tmp_Node);
         List_Insert_Head (Dest_List, Tmp_Node);
      end loop;
   end Move_List;

   function Is_Hci_Send_Req_Event (Ptr : EvtQueueBufferT.ListNodePtr) return Boolean
   is
      EvtSerial  : TL_EvtSerial_T;
      Buff       : DataBuffT := Ptr.Elem.DataBuff;
      for EvtSerial'Address use Buff'Address;
      Event      : TL_Evt_T;
      for Event'Alignment use 1;
      for Event'Address use Buff (1 + 1)'Address; --  Skip Type_Code
      CsEvent    : TL_CsEvt_T;
      for CsEvent'Alignment use 1;
      for CsEvent'Address use Buff (1 + (TL_EvtSerial_T'Size / 8))'Address;
      CcEvent    : TL_CcEvt_T;
      for CcEvent'Alignment use 1;
      for CcEvent'Address use Buff (1 + (TL_EvtSerial_T'Size / 8))'Address;
      Opcode     : Opcode_Field;
   begin
      if EvtSerial.Type_Code = HCI_EVENT_PKT then
         Opcode.Result := Hci_Send_Req_Opcode;
         case Event.Evtcode is
            when TL_BLEEVT_CS_OPCODE =>
               if Opcode.Val = CsEvent.Cmdcode then
                  return True;
               end if;
            when TL_BLEEVT_CC_OPCODE =>
               if Opcode.Val = CcEvent.Cmdcode then
                  return True;
               end if;
            when others =>
               return False;
         end case;
      end if;
      return False;
   end Is_Hci_Send_Req_Event;

   function Hci_Send_Req
     (R     : in out Hci_Request;
      Async : Boolean) return Integer
   is
      use EvtQueueBufferT;
      Ptr  : EvtQueueBufferT.ListNodePtr;
      Dummy           : DataBuffT;
   begin
      Hci_Send_Req_Opcode := R.Opcode;
      if R.Clen > 0 then
         Hci_Send_Cmd (R.Opcode, R.Clen, R.Cparam.all);
      else
         Hci_Send_Cmd (R.Opcode, R.Clen, Dummy);
      end if;

      if Async then
         return 0;
      end if;

      Suspend_Until_True (IPCC_HCI_SEND_REQ_SO);
      while not List_Is_Empty (HostTxQueuePoolPtr) loop
         List_Remove_Head (HostTxQueuePoolPtr, Ptr);
         declare
            EvtSerial  : TL_EvtSerial_T;
            Buff       : DataBuffT := Ptr.Elem.DataBuff;
            for EvtSerial'Address use Buff'Address;
            Event      : TL_Evt_T;
            for Event'Alignment use 1;
            for Event'Address use Buff (1 + 1)'Address; --  Skip Type_Code
            CsEvent    : TL_CsEvt_T;
            for CsEvent'Alignment use 1;
            for CsEvent'Address use Buff (1 + (TL_EvtSerial_T'Size / 8))'Address;
            CcEvent    : TL_CcEvt_T;
            for CcEvent'Alignment use 1;
            for CcEvent'Address use Buff (1 + (TL_EvtSerial_T'Size / 8))'Address;
            Idx        : UInt8;
            Opcode     : Opcode_Field;
         begin
            if EvtSerial.Type_Code = HCI_EVENT_PKT then
               Opcode.Result := R.Opcode;
               case Event.Evtcode is
                  when TL_BLEEVT_CS_OPCODE =>
                     if Opcode.Val = CsEvent.Cmdcode then
                        R.Rparam (1) := CsEvent.Status;
                     end if;
                  when TL_BLEEVT_CC_OPCODE =>
                     if Opcode.Val = CcEvent.Cmdcode then
                        Idx := (TL_EvtSerial_T'Size / 8) + (TL_CcEvt_T'Size / 8);
                        for I in 1 .. R.Rlen loop
                           R.Rparam (Integer (I)) := Buff (Integer (I + Idx));
                        end loop;
                     end if;
                  when others =>
                     raise Program_Error with "unknown evtcode";
               end case;
            end if;
         end;
      end loop;

      return 0;

   end Hci_Send_Req;

end Hci;
