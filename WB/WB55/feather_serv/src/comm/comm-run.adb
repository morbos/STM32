with Main;                 use Main;
with HW;                   use HW;
with Interfaces;           use Interfaces;
with STM32.Device;         use STM32.Device;
with STM32.Board;          use STM32.Board;
with STM32.Timers;         use STM32.Timers;
with STM32.IPCC;           use STM32.IPCC;
with STM32.GPIO;           use STM32.GPIO;
with BLE_Status;           use BLE_Status;
with Bluenrg_Aci;          use Bluenrg_Aci;
with Bluenrg_Gap;          use Bluenrg_Gap;
with Bluenrg_Gap_Aci;      use Bluenrg_Gap_Aci;
with Bluenrg_Gatt_Aci;     use Bluenrg_Gatt_Aci;
with Bluenrg_Hal_Aci;      use Bluenrg_Hal_Aci;
with Comm.Setup;           use Comm.Setup;
with Comm.TL;              use Comm.TL;
with Comm.Mbox;            use Comm.Mbox;
with Log;                  use Log;
with Peripherals;          use Peripherals;

use STM32;

with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Real_Time;        use Ada.Real_Time;

package body Comm.Run is

   type Post_Conn_States is
     (Idle,
      Need_Disc_Services,
      Await_Prim_Results,
      Need_Charac_Results,
      Await_Charac_Results,
      Need_Charac_Descriptors,
      Await_Charac_Descriptors,
      Set_Charac
     );
   Post_Conn_State    : Post_Conn_States := Need_Disc_Services;

   type Scan_States is
     (Need_Scan,
      Process_Results,
      Make_Connection,
      Check_Connection);
   Scan_State     : Scan_States := Need_Scan;

   procedure SetConnectable
   is
      Local_Name : UInt8_Array (1 .. 8);
      --  vvvvvvv BT4.0 spec C.11 adv and scan rsp data format
      Manuf_Data : UInt8_Array (1 .. 14) :=
        (13,     --  13 to follow
         AD_TYPE_MANUFACTURER_SPECIFIC_DATA,
         16#01#, --  SKD version
         16#00#,
         16#00#,
         16#00#,
         16#00#,
         16#00#,
         16#00#, -- BLE MAC start
         16#00#,
         16#00#,
         16#00#,
         16#00#,
         16#00# -- BLE MAC stop */
        );
      Dummy : UInt8_Array (1 .. 1);
      Status : BLE_Status_Code;
   begin
      Local_Name (1) := AD_TYPE_COMPLETE_LOCAL_NAME;
      for I in 1 .. 7 loop
         Local_Name (1 + I) := NodeName (I + 1);
      end loop;

      if Is_Server then
         Manuf_Data (4) := 16#83#; --   CFG_DEV_ID_P2P_SERVER1
      end if;

      --  BLE MAC
      Manuf_Data (09) := BDaddr (6);
      Manuf_Data (10) := BDaddr (5);
      Manuf_Data (11) := BDaddr (4);
      Manuf_Data (12) := BDaddr (3);
      Manuf_Data (13) := BDaddr (2);
      Manuf_Data (14) := BDaddr (1);

      --  disable scan response
      Status := Hci_Le_Set_Scan_Resp_Data (0, Dummy);
      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Hci_Le_Set_Scan_Resp_Data";
      end if;
      Status := Aci_Gap_Set_Discoverable
        (AdvType            => ADV_IND,
         AdvIntervMin       => 16#80#,
         AdvIntervMax       => 16#A0#,
         OwnAddrType        => PUBLIC_ADDR,
         AdvFilterPolicy    => NO_WHITE_LIST_USE,
         LocalNameLen       => Local_Name'Size / 8,
         LocalName          => Local_Name,
         ServiceUUIDLen     => 0,
         ServiceUUIDList    => Dummy,
         SlaveConnIntervMin => 0,
         SlaveConnIntervMax => 0);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gap_Set_Discoverable";
      end if;

      --  Send Advertising data
      Status := Aci_Gap_Update_Adv_Data
        (AdvLen  => (Manuf_Data'Size / 8),
         AdvData => Manuf_Data);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gap_Update_Adv_Data";
      end if;

   end SetConnectable;

   procedure GAP_ConnectionComplete_CB
     (Addr   : BDAddrT;
      Handle : UInt16)
   is
   begin
      Connected           := True;
      Connection_Handle   := Handle;
      if Is_Client then
         Set_True (Post_Conn_Go);
      else
         Clear (Red_LED);
      end if;
   end GAP_ConnectionComplete_CB;

   procedure GAP_DisconnectionComplete_CB
   is
   begin
      Connected          := False;
      Scan_State         := Need_Scan;
      Post_Conn_State    := Set_Charac;
      SetConnectable;
      Clear (Red_LED);
   end GAP_DisconnectionComplete_CB;

   procedure Read_Request_CB (Handle : UInt16)
   is
   begin
      null;
   end Read_Request_CB;

   procedure Attribute_Modified_CB
     (Handle      : UInt16;
      Buff        : DataBuffT;
      Offset      : UInt8;
      Data_Length : UInt8)
   is
      Idx : UInt8 := 1 +
        HCI_HDR_SIZE +
        HCI_EVENT_HDR_SIZE +
        EVT_BLUE_ACI_SIZE +
        EVT_BLUE_GATT_ATTRIBUTE_MODIFIED_SIZE;
   begin
      if Handle = LEDHandle + 1 then
         if Buff (Integer (Offset) + 2) = 1 then --  LED1
            Set (Red_LED);
         else
            Clear (Red_LED);
         end if;
      end if;
   end Attribute_Modified_CB;

   procedure GATT_Notification_CB
     (Buff   : DataBuffT;
      Offset : UInt8)
   is
      Evt : Evt_Gatt_Attr_Notification;
      for Evt'Alignment use 1;
      for Evt'Address use
        Buff (1 + Integer (Offset))'Address;
      Idx : Integer;
   begin
      Idx := 1 + Integer (Offset) + Evt'Size / 8;
      case Buff (Idx) is
         when 1 => --  Blue LED (its resource 1 per the setup with the server)
            if Buff (Idx + 1) = 1 then
               Set (Red_LED);
            else
               Clear (Red_LED);
            end if;
         when others =>
            null;
      end case;

   end GATT_Notification_CB;

   procedure L2cap_Respond (Evt : Evt_L2cap_Conn_Upd_Req)
   is
      Status : BLE_Status_Code;
   begin

      Status := Aci_Hal_Set_Radio_Activity_Mask (Mask => 16#00#);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Hal_Set_Radio_Activity_Mask";
      end if;

      Status :=
        Aci_L2cap_Connection_Parameter_Update_Response_IDB05A1
        (Conn_Handle           => Evt.Conn_Handle,
         Interval_Min          => Evt.Interval_Min,
         Interval_Max          => Evt.Interval_Max,
         Slave_Latency         => Evt.Slave_Latency,
         Timeout_Multiplier    => Evt.Timeout_Mult,
         Min_Conn_Event_Length => 0,
         Max_Conn_Event_Length => 16#ffff#,
         Id                    => Evt.Identifier,
         Stance                => Acceptable);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_L2cap_Connection_Parameter_Update_Response";
      end if;

      Status := Aci_Hal_Set_Radio_Activity_Mask (Mask => 16#20#);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Hal_Set_Radio_Activity_Mask";
      end if;

   end L2cap_Respond;
   --  Advertising_Info_CB: This proc searches the reports
   --  for responses that have the correct name we want to connect with.
   --  We also kick the scan task so it can review the match
   procedure Advertising_Info_CB
     (Buff   : DataBuffT;
      Offset : UInt8)
   is
      Sub_Event   : UInt8 := Buff (Integer (Offset));
      Num_Reports : UInt8 := Buff (Integer (Offset + 1));
      LOff        : UInt8 := Offset + 2;
   begin
      for I in 1 .. Num_Reports loop
         declare
            AdvInfo   : Evt_Le_Advertising_Info;
            for AdvInfo'Alignment use 1;
            for AdvInfo'Address use Buff (Integer (LOff))'Address;
            Budget    : UInt8;
            Accum     : UInt8 := 0;
            Len       : UInt8;
            Match_Len : UInt8;
         begin
            Budget := AdvInfo.Data_Length;
            LOff := LOff + EVT_LE_ADVERTISING_INFO_SIZE;
            loop
               --  Process the fields up to the budget
               Len := Buff (Integer (LOff)); --  First byte is the len of str
               --  Next vvv is the type of the string
               if Buff (Integer (LOff + 1)) = AD_TYPE_COMPLETE_LOCAL_NAME then
                  --  See if this is the server name
                  Match_Len := 0;
                  for J in 1 .. Serv_Name'Last loop --  Last char is computed
                     if Buff (Integer (LOff) + 1 + J) = Character'Pos (Serv_Name (J)) then
                        Match_Len := Match_Len + 1;
                     end if;
                  end loop;
                  if Match_Len = Len - 1 then
                     Peer_Addr := AdvInfo.Bdaddr; --  Update found peer's addr
                     Matched   := True;
                     Set_True (Scan_Go);
                     return;
                  end if;
               end if;
               LOff  := LOff + Len + 1;
               Accum := Accum + Len + 1;
               exit when Accum >= Budget;
            end loop;
         end;
      end loop;
      Set_True (Scan_Go);
   end Advertising_Info_CB;

   procedure Send_Message
   is
      Buff        : DataBuffT;
      Status      : BLE_Status_Code;
   begin
      Buff (1) := 1;
      Buff (2) := (if SW1_Remote_State then 0 else 1);
      SW1_Remote_State := not SW1_Remote_State;
      if Is_Client then
         Status := Aci_Gatt_Write_Without_Response
           (Conn_Handle  => Connection_Handle,
            --            Attr_Handle  => 16#0e#,
            Attr_Handle  => LEDHandle,
            Value_Len    => 2,
            Attr_Value   => Buff);
         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Aci_Gatt_Write_Without_Response";
         end if;
      else
         Status := Aci_Gatt_Update_Char_Value
           (ServHandle    => ServHandle,
            CharHandle    => ButtonHandle,
            CharValOffset => 0,
            CharValueLen  => 2,
            CharValue      => Buff);
         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Aci_Gatt_Update_Char_Value";
         end if;
      end if;
   end Send_Message;

   --  Used by the client to scan for a server
   --  Run as a state machine that guides the process of scanning to
   --  making a connection. Technically, this should be in comm-setup
   --  but it needs a lot of callbacks to work right.

   task body Scan_Task
   is
      Status         : BLE_Status_Code;
      Scan_Reload    : constant Time_Span := Milliseconds (11000); --  Scan duration is ~11sec
      Next_Scan      : Time;
   begin

      loop
         Suspend_Until_True (Scan_Go);
         if not Connected then
            case Scan_State is
               when Need_Scan =>
                  Matched := False;
                  --  vvvv starts a 10sec scan. Results are ISR callbacks
                  Status := Aci_Gap_Start_General_Discovery_Proc
                    (ScanInterval     => SCAN_P,
                     ScanWindow       => SCAN_L,
                     Own_Address_Type => 0,
                     FilterDuplicates => 1);
                  if Status /= BLE_STATUS_OK then
                     raise Program_Error with "Aci_Gap_Start_General_Discovery_Proc";
                  end if;

                  Scan_State := Process_Results;
                  Set_True (Scan_Go);
                  Next_Scan := Clock + Scan_Reload;
               when Process_Results =>
                  if Matched then
                     Status := Aci_Gap_Terminate_Gap_Procedure
                       (Procedure_Code => General_Discovery_Proc);
                     if Status /=  BLE_STATUS_OK then
                        raise Program_Error with "Aci_Gap_Terminate_Gap_Procedure";
                     end if;
                     Scan_State := Make_Connection;
                  else
                     if Clock > Next_Scan then
                        Scan_State := Need_Scan;
                     end if;
                  end if;
                  Set_True (Scan_Go);
               when Make_Connection =>
                  Status := Aci_Gap_Create_Connection
                    (ScanInterval        => SCAN_P,
                     ScanWindow          => SCAN_L,
                     Peer_Bdaddr_Type    => PUBLIC_ADDR,
                     Peer_Bdaddr         => Peer_Addr,
                     Own_Bdaddr_Type     => PUBLIC_ADDR,
                     Conn_Min_Interval   => CONN_P1,
                     Conn_Max_Interval   => CONN_P2,
                     Conn_Latency        => 0,
                     Supervision_Timeout => SUPERV_TIMEOUT,
                     Min_Conn_Length     => CONN_L1,
                     Max_Conn_Length     => CONN_L2);

                  if Status /= BLE_STATUS_OK then
                     raise Program_Error with "Aci_Gap_Create_Connection";
                  end if;
                  Scan_State := Check_Connection;
                  Set_True (Scan_Go);
               when Check_Connection =>
                  null;
            end case;
         else
            Scan_State := Need_Scan;
         end if;
      end loop;
   end Scan_Task;

   task body Event_Task
   is
      use EvtQueueBufferT;
      Ptr  : EvtQueueBufferT.ListNodePtr;
   begin
      loop
         Suspend_Until_True (IPCC_BLE_EVENT_SO);
         while not List_Is_Empty (HostEvtQueuePoolPtr) loop
            List_Remove_Head (HostEvtQueuePoolPtr, Ptr);
            declare
               Hci_Hdr    : Hci_Uart_Pckt;
               Buff       : DataBuffT := Ptr.Elem.DataBuff;
               for Hci_Hdr'Address use Buff (Integer (HCI_HDR_SIZE))'Address;
               Event_Pckt : Hci_Event_Pckt;
               for Event_Pckt'Alignment use 1;
               for Event_Pckt'Address use Buff (1 + Integer (HCI_HDR_SIZE))'Address;
            begin
               if Hci_Hdr.Pkt_Type = HCI_EVENT_PKT then
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
                                    GAP_ConnectionComplete_CB (Cc.Peer_Bdaddr, Cc.Handle);
                                 end;
                              when EVT_LE_CONN_UPDATE_COMPLETE =>
                                 Set_True (Conn_Update_Go);
                              when EVT_LE_ADVERTISING_REPORT =>
                                 declare
                                    Offset : constant UInt8 :=
                                      HCI_HDR_SIZE +
                                      HCI_EVENT_HDR_SIZE +
                                      EVT_LE_META_EVENT_SIZE;
                                 begin
                                    Advertising_Info_CB (Buff, Offset);
                                 end;
                              when others =>
                                 null;
                           end case;
                        end;
                     when EVT_VENDOR =>
                        declare
                           Offset : constant := HCI_HDR_SIZE +
                             HCI_EVENT_HDR_SIZE +
                             EVT_BLUE_ACI_SIZE;
                           Blue_Evt : Evt_Blue_Aci;
                           for Blue_Evt'Alignment use 1;
                           for Blue_Evt'Address use
                             Buff (1 + Integer (HCI_HDR_SIZE + HCI_EVENT_HDR_SIZE))'Address;
                        begin
                           case Blue_Evt.Ecode is
                              when EVT_BLUE_GATT_READ_PERMIT_REQ =>
                                 declare
                                    Pr : Evt_Gatt_Read_Permit_Req;
                                    for Pr'Alignment use 1;
                                    for Pr'Address use
                                      Buff (1 + Integer (Offset))'Address;
                                 begin
                                    Read_Request_CB (Pr.Attr_Handle);
                                 end;
                              when EVT_BLUE_GATT_ATTRIBUTE_MODIFIED_CODE =>
                                 declare
                                    Evt : Evt_Gatt_Attr_Modified_IDB05A1;
                                    for Evt'Alignment use 1;
                                    for Evt'Address use
                                      Buff (1 + Integer (Offset))'Address;
                                 begin
                                    Attribute_Modified_CB
                                      (Evt.Attr_Handle,
                                       Buff,
                                       Offset + EVT_BLUE_GATT_ATTRIBUTE_MODIFIED_SIZE + 1,
                                       Evt.Data_Length);
                                 end;
                              when EVT_BLUE_GATT_NOTIFICATION_CODE =>
                                 begin
                                    GATT_Notification_CB (Buff, Offset);
                                 end;
                              when EVT_BLUE_GATT_DISC_READ_CHAR_BY_UUID_RESP_CODE =>
                                 if Is_Client then
                                    null;
                                 end if;
                              when EVT_BLUE_L2CAP_CONN_UPD_REQ_CODE =>
                                 declare
                                    Evt : Evt_L2cap_Conn_Upd_Req;
                                    for Evt'Alignment use 1;
                                    for Evt'Address use
                                      Buff (1 + Integer (Offset))'Address;
                                 begin
                                    L2cap_Respond (Evt);
                                 end;
                              when EVT_BLUE_GATT_READ_GROUP_TYPE_RESP_CODE =>
                                 declare
                                    Evt : Evt_Blue_Gatt_Read_Group_Type_Resp;
                                    for Evt'Alignment use 1;
                                    for Evt'Address use
                                      Buff (1 + Integer (Offset))'Address;
                                 begin
                                    --  This vvv, when true means evt is a UUid
                                    if Evt.Evt_Len = Evt.Attr_Len and Evt.Evt_Len = 20 then
                                       Prim_Result_Table (Curr_Prim_Result_Idx).Svc_Handle_Start
                                         := Evt.Svc_Handle_Start;
                                       Prim_Result_Table (Curr_Prim_Result_Idx).Svc_Handle_End
                                         := Evt.Svc_Handle_End;
                                       Prim_Result_Table (Curr_Prim_Result_Idx).UUid
                                         := Evt.UUid;
                                       Curr_Prim_Result_Idx := Curr_Prim_Result_Idx + 1;
                                    end if;
                                 end;
                              when EVT_BLUE_GATT_READ_BY_TYPE_RESP_CODE =>
                                 declare
                                    Evt : Evt_Blue_Gatt_Read_By_Type_Resp;
                                    for Evt'Alignment use 1;
                                    for Evt'Address use
                                      Buff (1 + Integer (Offset))'Address;
                                 begin
                                    if Evt.Evt_Len = 16#15# then
                                       Charac_Result_Table (Curr_Charac_Result_Idx).Handle
                                         := Evt.Handle;
                                       Charac_Result_Table (Curr_Charac_Result_Idx).Properties
                                         := Evt.Properties;
                                       Charac_Result_Table (Curr_Charac_Result_Idx).Char_Val_Handle
                                         := Evt.Char_Val_Handle;
                                       Charac_Result_Table (Curr_Charac_Result_Idx).UUid
                                         := Evt.UUid;
                                       Curr_Charac_Result_Idx := Curr_Charac_Result_Idx + 1;
                                       if Evt.UUid = LED_UUid_Swapped then
                                          LEDHandle := Evt.Char_Val_Handle;
                                       elsif Evt.UUid = Button_UUid_Swapped then
                                          ButtonHandle := Evt.Char_Val_Handle;
                                       end if;
                                    end if;
                                 end;
                              when EVT_BLUE_GATT_PROCEDURE_COMPLETE =>
                                 Set_True (Procedure_Complete);
                              when 16#0004# => --  A proprietary heartbeat event...
                                 if Is_Client then
                                    if Connected then
                                       --                                       Set_True (LED_Go);
                                       null;
                                    end if;
                                 else
                                    null;
                                 end if;
                              when others =>
                                 null;
                           end case;
                        end;
                     when EVT_DISCONN_COMPLETE_CODE =>
                        GAP_DisconnectionComplete_CB;
                     when others =>
                        raise Program_Error with "unknown evtcode: " & Integer'Image (Integer (Event_Pckt.Evt));
                  end case;
               end if;
            end;
            List_Insert_Tail (FreeBufPoolPtr, Ptr);
            IPCC_Cpu1_SetFlag (HW_IPCC_MM_RELEASE_BUFFER_CHANNEL);
         end loop;
      end loop;

   end Event_Task;

   task body Post_Conn_Task
   is
      Status             : BLE_Status_Code;
      Curr_Prim_Result   : Prim_Result_Range;
      Curr_Charac_Result : Charac_Result_Range;
   begin
      Set_False (Procedure_Complete);
      loop
         Suspend_Until_True (Post_Conn_Go);
         if not Connected then
            raise Program_Error with "In post_conn_task and not connected";
         else
            case Post_Conn_State is
               when Need_Disc_Services =>
                  --  vvvv starts a 10sec scan. Results are ISR callbacks
                  Status := Aci_Gatt_Disc_All_Primary_Services
                    (Conn_Handle  => Connection_Handle);
                  if Status /= BLE_STATUS_OK then
                     raise Program_Error with "Aci_Gatt_Disc_All_Primary_Services";
                  end if;
                  Post_Conn_State := Await_Prim_Results;
                  Set_True (Post_Conn_Go);
               when Await_Prim_Results =>
                  Suspend_Until_True (Procedure_Complete);
                  Post_Conn_State := Need_Charac_Results;
                  Curr_Prim_Result := Prim_Result_Range'First;
                  Set_True (Post_Conn_Go);
               when Need_Charac_Results =>
                  if Curr_Prim_Result < Curr_Prim_Result_Idx then
                     Status := Aci_Gatt_Disc_All_Charac_Of_Serv
                       (Conn_Handle  => Connection_Handle,
                        Start_Handle => Prim_Result_Table (Curr_Prim_Result).Svc_Handle_Start,
                        End_Handle   => Prim_Result_Table (Curr_Prim_Result).Svc_Handle_End);
                     if Status /= BLE_STATUS_OK then
                        raise Program_Error with "Aci_Gatt_Disc_All_Charac_Of_Serv";
                     end if;
                     Post_Conn_State := Await_Charac_Results;
                     Clear (Red_LED);
                     Set_True (Post_Conn_Go);
                  else
                     Curr_Charac_Result := Charac_Result_Range'First;
                     Post_Conn_State := Need_Charac_Descriptors;
                     Set_True (Post_Conn_Go);
                  end if;
               when Await_Charac_Results =>
                  Suspend_Until_True (Procedure_Complete);
                  Post_Conn_State := Need_Charac_Results;
                  Curr_Prim_Result := Curr_Prim_Result + 1;
                  Set_True (Post_Conn_Go);
               when Need_Charac_Descriptors =>
                  if Curr_Charac_Result < Curr_Charac_Result_Idx then
                     Status := Aci_Gatt_Disc_All_Charac_Descriptors
                       (Conn_Handle
                          => Connection_Handle,
                        Start_Char_Handle
                          => Charac_Result_Table (Curr_Charac_Result).Handle,
                        End_Char_Handle
                          => Charac_Result_Table (Curr_Charac_Result).Char_Val_Handle);
                     if Status /= BLE_STATUS_OK then
                        raise Program_Error with "Aci_Gatt_Disc_All_Charac_Descriptors";
                     end if;
                     Post_Conn_State := Await_Charac_Descriptors;
                     Set_True (Post_Conn_Go);
                  else
                     Post_Conn_State := Set_Charac;
                     Set_True (Post_Conn_Go);
                  end if;
               when Await_Charac_Descriptors =>
                  Suspend_Until_True (Procedure_Complete);
                  Post_Conn_State := Need_Charac_Descriptors;
                  Curr_Charac_Result := Curr_Charac_Result + 1;
                  Set_True (Post_Conn_Go);
               when Set_Charac =>
                  declare
                     Buff : DataBuffT;
                  begin
                     Buff (1) := 1;
                     Buff (2) := 0;
                     Status := Aci_Gatt_Write_Charac_Descriptor
                       (Conn_Handle  => Connection_Handle,
                        --                        Attr_Handle  => 16#11#,
                        Attr_Handle  => ButtonHandle + 1,
                        Value_Len    => 2,
                        Attr_Value   => Buff);
                     if Status /= BLE_STATUS_OK then
                        raise Program_Error with "Aci_Gatt_Write_Charac_Descriptor";
                     end if;
                     Post_Conn_State := Idle;
--                     Clear (Blue_LED);
                     Set_True (Post_Conn_Go);
                  end;
               when Idle =>
                  null;
               when others =>
                  null;
            end case;
         end if;
      end loop;
   end Post_Conn_Task;


end Comm.Run;
