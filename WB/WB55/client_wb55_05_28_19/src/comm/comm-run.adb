with Main;                 use Main;
with Interfaces;           use Interfaces;
with STM32.Device;         use STM32.Device;
with STM32.Timers;         use STM32.Timers;
with BLE_Status;           use BLE_Status;
with Bluenrg_Aci;          use Bluenrg_Aci;
with Bluenrg_Gap;          use Bluenrg_Gap;
with Bluenrg_Gap_Aci;      use Bluenrg_Gap_Aci;
with Bluenrg_Gatt_Aci;     use Bluenrg_Gatt_Aci;
with Comm.Setup;           use Comm.Setup;

use STM32;

with Ada.Real_Time;        use Ada.Real_Time;
with Ada.Numerics.Short_Elementary_Functions;
use  Ada.Numerics.Short_Elementary_Functions;

package body Comm.Run is

   procedure SetConnectable
   is
      Local_Name : UInt8_Array (1 .. 8);
      --  vvvvvvv BT4.0 spec C.11 adv and scan rsp data format
      Manuf_Data : UInt8_Array (1 .. 26) :=
        (2, -- 2 bytes follow
         AD_TYPE_TX_POWER_LEVEL,
         16#00#, --  0 dBm Trasmission Power
         --
         8,       --  8 bytes (1 + 7)
         AD_TYPE_COMPLETE_LOCAL_NAME,
         NodeName (2),
         NodeName (3),
         NodeName (4),
         NodeName (5),
         NodeName (6),
         NodeName (7),
         NodeName (8),
         --
         13,     --  13 to follow
         AD_TYPE_MANUFACTURER_SPECIFIC_DATA,
         16#01#, --  SKD version
         16#02#,
         AttribVals (1),
         AttribVals (2),
         AttribVals (3),
         AttribVals (4),
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

      --  BLE MAC
      Manuf_Data (21) := BDaddr (6);
      Manuf_Data (22) := BDaddr (5);
      Manuf_Data (23) := BDaddr (4);
      Manuf_Data (24) := BDaddr (3);
      Manuf_Data (25) := BDaddr (2);
      Manuf_Data (26) := BDaddr (1);

      --  disable scan response
      Status := Hci_Le_Set_Scan_Resp_Data (0, Dummy);
      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Hci_Le_Set_Scan_Resp_Data";
      end if;
      Status := Aci_Gap_Set_Discoverable
        (AdvType            => ADV_IND,
         AdvIntervMin       => 2048,
         AdvIntervMax       => 4096,
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
        (AdvLen  => 26,
         AdvData => Manuf_Data);

      if Status /= BLE_STATUS_OK then
         raise Program_Error with "Aci_Gap_Update_Adv_Data";
      end if;

   end SetConnectable;

   procedure GAP_ConnectionComplete_CB
     (Addr   : BDAddrT;
      Handle : UInt16)
   is
      Status : BLE_Status_Code;
   begin
      Connected           := True;
      Connection_Handle   := Handle;
      Wait_For_Connection := False;
      if Is_Server then
         Status := Aci_L2cap_Connection_Parameter_Update_Request
           (Handle             => Handle,
            Interval_Min       => 8,
            Interval_Max       => 17,
            Slave_Latency      => 0,
            Timeout_Multiplier => 400);

         if Status /= BLE_STATUS_OK then
            raise Program_Error with "Aci_L2cap_Connection_Parameter_Update_Request";
         end if;
      end if;

   end GAP_ConnectionComplete_CB;

   procedure GAP_DisconnectionComplete_CB
   is
   begin
      null;
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
   begin
      null;
   end Attribute_Modified_CB;

   procedure GATT_Notification_CB
     (Buff   : DataBuffT;
      Offset : UInt8)
   is
   begin
      null;
   end GATT_Notification_CB;

   procedure L2cap_Respond (Evt : Evt_L2cap_Conn_Upd_Req)
   is
      Status : BLE_Status_Code;
   begin
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
   end L2cap_Respond;
   --  Advertising_Info_CB: This proc searches the reports
   --  for responses that have a local_name and that that
   --  local name is 'MkAda S' the server we want
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
                  for J in 1 .. (Board_Name'Last - 1) loop --  Last char is computed
                     if Buff (Integer (LOff) + 1 + J) = Character'Pos (Board_Name (J)) then
                        Match_Len := Match_Len + 1;
                     end if;
                  end loop;
                  if Buff (Integer (LOff) + 1 + Board_Name'Last) = Character'Pos ('S')  then
                     Match_Len := Match_Len + 1;
                  end if;
                  if Match_Len = Len - 1 then
                     Peer_Addr := AdvInfo.Bdaddr; --  Update found peer's addr
                     Matched   := True;
                     Set_True (Client_Go);
                     return;
                  end if;
               end if;
               LOff  := LOff + Len + 1;
               Accum := Accum + Len + 1;
               exit when Accum >= Budget;
            end loop;
         end;
      end loop;
      Set_True (Client_Go);
   end Advertising_Info_CB;
   --  Process replies that came from the queue
   procedure HCI_Event_CB (Pckt : DataBuffT)
   is
      Hci_Hdr    : Hci_Uart_Pckt;
      Buff       : aliased DataBuffT := Pckt;
      for Hci_Hdr'Address use Buff'Address;
      Event_Pckt : Hci_Event_Pckt;
      for Event_Pckt'Alignment use 1;
      for Event_Pckt'Address use Buff (1 + Integer (HCI_HDR_SIZE))'Address;
   begin
      if Hci_Hdr.Pkt_Type /= HCI_EVENT_PKT then
         return;
      end if;
      case Event_Pckt.Evt is
         when EVT_DISCONN_COMPLETE_CODE =>
            GAP_DisconnectionComplete_CB;
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
                  when EVT_BLUE_GAP_PROCEDURE_COMPLETE =>
                     Set_True (Client_Go);
                  when others =>
                     null;
               end case;
            end;
         when others =>
            null;
      end case;
   end HCI_Event_CB;

   --  Used by the client to scan for a server
   --  Run as a state machine that guides the process of scanning to
   --  making a connection. Technically, this should be in comm-setup
   --  but it needs a lot of callbacks to work right.

   task body Scan_Task
   is
      type Scan_States is
        (Need_Scan,
         Process_Results,
         Make_Connection,
         Check_Connection);
      Status         : BLE_Status_Code;
      Scan_Reload    : constant Time_Span := Milliseconds (11000); --  Scan is ~10sec
      Scan_State     : Scan_States := Need_Scan;
      Next_Scan      : Time;
   begin
      loop
         Suspend_Until_True (Client_Go);
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
               when Check_Connection =>
                  null;
            end case;
         else
            Scan_State := Need_Scan;
         end if;
      end loop;
   end Scan_Task;

end Comm.Run;
