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

   procedure HCI_Isr
   is
--      use HciDataPacketT;
--      HciReadPacket : ListNodePtr;
--      Len           : UInt16;
--      BLE           : BlueNRG_Radio   (BlueNRG_Port'Access);
   begin
      null;
--      Clear_External_Interrupt (EXTI_Line_5);
--
--      while BlueNRG_DataPresent loop
--         if not List_Is_Empty (HciReadPktPoolPtr) then
--            List_Remove_Head (HciReadPktPoolPtr, HciReadPacket);
--            Len := BLE.BlueNRG_SPI_Read_All (HciReadPacket.Elem.DataBuff);
--            if Len > 0 then
--               Logger (16#BB#);
--               Logger (UInt8 (Len and 16#ff#));
--               HciReadPacket.Elem.Data_Len := UInt8 (Len and 16#FF#);
--               if HCI_Verify (HciReadPacket) = 0 then
--                  for I in 1 .. Len loop
--                     Logger (HciReadPacket.Elem.DataBuff (Integer (I)));
--                  end loop;
--                  List_Insert_Tail (HciReadPktRxQueuePtr, HciReadPacket);
--               else
--                  List_Insert_Head (HciReadPktPoolPtr, HciReadPacket);
--               end if;
--            else
--               List_Insert_Head (HciReadPktPoolPtr, HciReadPacket);
--            end if;
--         else
--            --  HCI Read Packet Pool is empty, wait for a free packet.
--            Clear_External_Interrupt (EXTI_Line_5);
--            exit;
--         end if;
--      end loop;
   end HCI_Isr;

   procedure Hci_Write
     (Data1    : DataBuffT;
      Data2    : DataBuffT;
      N_Bytes1 : UInt8;
      N_Bytes2 : UInt8)
   is
   begin
      Logger (16#aa#);
      Logger (N_Bytes1);
      Logger (N_Bytes2);
      for I in 1 .. N_Bytes1 loop
         Logger (Data1 (Integer (I)));
      end loop;
      for I in 1 .. N_Bytes2 loop
         Logger (Data2 (Integer (I)));
      end loop;
--      Hal_Write_Serial (Data1, Data2, N_Bytes1, N_Bytes2);
   end Hci_Write;

   procedure Hci_Send_Cmd
     (Opcode : Opcode_Type;
      Plen   : UInt8;
      Param  : DataBuffT)
   is
--      HeaderSize : constant Integer := Integer (HCI_HDR_SIZE + HCI_COMMAND_HDR_SIZE);
--      Header     : DataBuffT;
--      Hc         : Hci_Command_Hdr;
--      for Hc'Address use Header (2)'Address;
--      Dummy      : DataBuffT;
   begin
--      Hc.Opcode := Opcode;
--      Hc.Plen   := Plen;

--      Header (1) := HCI_COMMAND_PKT;

      --  Osal_MemCpy(header+1, &hc, sizeof(hc));

--      if Plen > 0 then
--         Hci_Write (Header, Param, UInt8 (HeaderSize), Plen);
--      else -- When the param is not set, pass a dummy buffer
--         Hci_Write (Header, Dummy, UInt8 (HeaderSize), Plen);
--      end if;
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

   procedure Free_Event_List
   is
      use HciDataPacketT;
      Pckt    : ListNodePtr;
   begin
--      Disable_SPI_IRQ;
      while List_Get_Size (HciReadPktPoolPtr) < HCI_READ_PACKET_NUM_MAX / 2 loop
         List_Remove_Head (HciReadPktRxQueuePtr, Pckt);
         List_Insert_Tail (HciReadPktPoolPtr, Pckt);
         --  Explicit call to HCI_Isr(), since it cannot be called by ISR if IRQ is kept high by
         --  BlueNRG
         HCI_Isr;
      end loop;
--      Enable_SPI_IRQ;
   end Free_Event_List;

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
      Logger (16#60#);
      while not List_Is_Empty (HostTxQueuePoolPtr) loop
         Logger (16#61#);
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
                        Logger (16#62#);
                        R.Rparam (1) := CsEvent.Status;
                     else
                        Logger (16#63#);
                     end if;
                  when TL_BLEEVT_CC_OPCODE =>
                     if Opcode.Val = CcEvent.Cmdcode then
                        Logger (16#64#);
                        Idx := (TL_EvtSerial_T'Size / 8) + (TL_CcEvt_T'Size / 8);
                        for I in 1 .. R.Rlen loop
                           R.Rparam (Integer (I)) := Buff (Integer (I + Idx));
                        end loop;
                     end if;
                  when others =>
                     Logger (16#65#);
                     raise Program_Error with "unknown evtcode";
               end case;
            end if;
         end;
      end loop;

      return 0;

   end Hci_Send_Req;

   task body Hci_Event_Task
   is
      use EvtQueueBufferT;
      Ptr  : EvtQueueBufferT.ListNodePtr;
      Basepri : UInt32 := Get_Basepri;
   begin
      loop
         Set_Basepri (Basepri);
         Suspend_Until_True (IPCC_BLE_EVENT_SO);
         Basepri := GetSetMIN_Basepri;
         Logger (16#70#);
         while not List_Is_Empty (HostTxQueuePoolPtr) loop
            List_Remove_Head (HostTxQueuePoolPtr, Ptr);
            Set_Basepri (Basepri);
            declare
               Hci_Hdr    : Hci_Uart_Pckt;
               Buff       : DataBuffT := Ptr.Elem.DataBuff;
               for Hci_Hdr'Address use Buff (Integer (HCI_HDR_SIZE))'Address;
               Event_Pckt : Hci_Event_Pckt;
               for Event_Pckt'Alignment use 1;
               for Event_Pckt'Address use Buff (1 + Integer (HCI_HDR_SIZE))'Address;
--               Len        : UInt8 :=
--                 Ptr.Elem.Data_Len - (1 + HCI_EVENT_HDR_SIZE);
            begin
               if Hci_Hdr.Pkt_Type = HCI_EVENT_PKT then
                  Logger (16#71#);
                  case Event_Pckt.Evt is
                     when EVT_LE_META_EVENT_CODE =>
                        declare
                           Me : Evt_Le_Meta_Event;
                           for Me'Alignment use 1;
                           for Me'Address use
                             Buff (1 + Integer (HCI_HDR_SIZE + HCI_EVENT_HDR_SIZE))'Address;
                        begin
                           case Me.Subevent is
                              when EVT_LE_CONN_COMPLETE =>
                                 declare
                                    Cc : Evt_Le_Connection_Complete;
                                    for Cc'Alignment use 1;
                                    for Cc'Address use
                                      Buff (1 + Integer (HCI_HDR_SIZE +
                                                           HCI_EVENT_HDR_SIZE +
                                                           EVT_LE_META_EVENT_SIZE))'Address;
                                 begin
                                    Logger (16#72#);
                                    GAP_ConnectionComplete_CB (Cc.Peer_Bdaddr, Cc.Handle);
                                 end;
                              when EVT_LE_ADVERTISING_REPORT =>
                                 declare
                                    Offset : constant UInt8 :=
                                      HCI_HDR_SIZE +
                                      HCI_EVENT_HDR_SIZE +
                                      EVT_LE_META_EVENT_SIZE;
                                 begin
                                    Logger (16#73#);
                                    Advertising_Info_CB (Buff, Offset);
                                 end;
                              when others =>
                                 null;
                           end case;
                        end;
                     when TL_BLEEVT_CC_OPCODE =>
                        declare
                           CcEvent    : TL_CcEvt_T;
                           for CcEvent'Alignment use 1;
                           for CcEvent'Address use Buff (1 + (TL_EvtSerial_T'Size / 8))'Address;
                        begin
                           Logger (16#75#);
                        end;
                     when others =>
                        Logger (16#74#);
                        raise Program_Error with "unknown evtcode";
                  end case;
               end if;
            end;
         end loop;
      end loop;
   end Hci_Event_Task;

end Hci;
