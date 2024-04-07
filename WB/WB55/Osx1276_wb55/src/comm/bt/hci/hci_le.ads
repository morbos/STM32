with HAL;        use HAL;
with BLE_Status; use BLE_Status;
with Ogf_Ocf;    use Ogf_Ocf;
with Memory;     use Memory;

package Hci_Le is

   type BDAddrT is new UInt8_Array (1 .. 6);

   PUBLIC_ADDR                  : constant UInt8 := 0;
   RANDOM_ADDR                  : constant UInt8 := 1;
   STATIC_RANDOM_ADDR           : constant UInt8 := 1;
   RESOLVABLE_PRIVATE_ADDR      : constant UInt8 := 2;
   NON_RESOLVABLE_PRIVATE_ADDR  : constant UInt8 := 3;

   ADV_IND                      : constant UInt8 := 16#00#;
   ADV_DIRECT_IND               : constant UInt8 := 16#01#;
   ADV_SCAN_IND                 : constant UInt8 := 16#02#;
   ADV_NONCONN_IND              : constant UInt8 := 16#03#;
   SCAN_RSP                     : constant UInt8 := 16#04#;

   NO_WHITE_LIST_USE         : constant UInt8 := 16#00#;
   WHITE_LIST_FOR_ONLY_SCAN  : constant UInt8 := 16#01#;
   WHITE_LIST_FOR_ONLY_CONN  : constant UInt8 := 16#02#;
   WHITE_LIST_FOR_ALL        : constant UInt8 := 16#03#;

   LE_SET_RANDOM_ADDRESS_CP_SIZE    : constant UInt8 := UInt8 (BDAddrT'Size / 8);

   OGF_LE_CTL                       : constant UInt6  := 16#08#;
   OCF_LE_SET_RANDOM_ADDRESS        : constant UInt10 := 16#005#;
   OCF_LE_SET_DEFAULT_PHY           : constant UInt10 := 16#031#;

   OCF_LE_SET_SCAN_RESPONSE_DATA    : constant UInt10 := 16#009#;

   type Le_Set_Scan_Response_Data_Cp is record
      Length : UInt8;
      Data   : UInt8_Array (1 .. 31);
   end record
     with Pack;
   LE_SET_SCAN_RESPONSE_DATA_CP_SIZE   : constant UInt8  := 32;

   EVT_LE_META_EVENT_CODE    : constant UInt8 := 16#3E#;
   type Evt_Le_Meta_Event is record
      Subevent : UInt8;
   end record
     with Pack;
   EVT_LE_META_EVENT_SIZE    : constant UInt8 := 16#01#;

   EVT_LE_CONN_COMPLETE : constant UInt8 := 16#01#;
   type Evt_Le_Connection_Complete is record
      Status                : UInt8;
      Handle                : UInt16;
      Role                  : UInt8;
      Peer_Bdaddr_Type      : UInt8;
      Peer_Bdaddr           : BDAddrT;
      Interval              : UInt16;
      Latency               : UInt16;
      Supervision_Timeout   : UInt16;
      Master_Clock_Accuracy : UInt16;
   end record
     with Pack;
   EVT_LE_CONN_COMPLETE_SIZE : constant UInt8 := 18;

   EVT_LE_ADVERTISING_REPORT : constant UInt8 := 16#02#;
   type Evt_Le_Advertising_Info is record
      Evt_Type              : UInt8;
      Bdaddr_Type           : UInt8;
      Bdaddr                : BDAddrT;
      Data_Length           : UInt8;
   end record
     with Pack;
   EVT_LE_ADVERTISING_INFO_SIZE : constant UInt8 := 9;

   EVT_LE_CONN_UPDATE_COMPLETE : constant UInt8 := 16#03#;
   type Evt_Le_Connection_Update_Complete is record
      Status              : UInt8;
      Handle              : UInt16;
      Interval            : UInt16;
      Latency             : UInt16;
      Supervision_Timeout : UInt16;
   end record
     with Pack;
   EVT_LE_CONN_UPDATE_COMPLETE_SIZE  : constant UInt8 := 9;

   EVT_LE_READ_REMOTE_USED_FEATURES_COMPLETE_CODE : constant UInt8 := 16#04#;
   type Evt_Le_Read_Remote_Used_Features_Complete is record
      Status   : UInt8;
      Handle   : UInt16;
      Features : UInt8_Array (1 .. 8);
   end record
     with Pack;
   EVT_LE_READ_REMOTE_USED_FEATURES_COMPLETE_SIZE : constant UInt8 := 11;

   EVT_LE_LTK_REQUEST : constant UInt8 := 16#05#;
   type Evt_Le_Long_Term_Key_Request is record
      Handle : UInt16;
      Random : UInt8_Array (1 .. 8);
      Ediv   : UInt16;
   end record
     with Pack;
   EVT_LE_LTK_REQUEST_SIZE : constant UInt8 := 12;

   function Hci_Le_Read_Local_Version
     (Hci_Version        : out UInt8;
      Hci_Revision       : out UInt16;
      Lmp_Pal_Version    : out UInt8;
      Manufacturer_Name  : out UInt16;
      Lmp_Pal_Subversion : out UInt16) return BLE_Status_Code;

   function Hci_Reset return BLE_Status_Code;

   function Hci_Disconnect
     (Handle : UInt16;
      Reason : UInt8) return BLE_Status_Code;

   function Hci_Le_Read_Buffer_Size
     (Pkt_Len : out UInt16;
      Max_Pkt : out UInt8) return BLE_Status_Code;

   function Hci_Le_Set_Advertising_Parameters
     (Min_Interval       : UInt16;
      Max_Interval       : UInt16;
      Advtype            : UInt8;
      Own_Bdaddr_Type    : UInt8;
      Direct_Bdaddr_Type : UInt8;
      Direct_Bdaddr      : BDAddrT;
      Chan_Map           : UInt8;
      Filter             : UInt8) return BLE_Status_Code;

   function Hci_Le_Set_Advertising_Data
     (Length : UInt8;
      Data   : UInt8_Array) return BLE_Status_Code;

   function Hci_Le_Set_Advertise_Enable
     (Enable : UInt8) return BLE_Status_Code;

   function Hci_Le_Set_Scan_Parameters
     (Scan_Type       : UInt8;
      Interval        : UInt16;
      Window          : UInt16;
      Own_Bdaddr_Type : UInt8;
      Filter          : UInt8) return BLE_Status_Code;

   function Hci_Le_Set_Scan_Enable
     (Enable     : UInt8;
      Filter_Dup : UInt8) return BLE_Status_Code;

   function Hci_Le_Rand
     (Random_Number : out UInt8_Array) return BLE_Status_Code;

   function Hci_Le_Set_Scan_Resp_Data
     (Length : UInt8;
      Data   : UInt8_Array) return BLE_Status_Code;

   function Hci_Le_Read_Advertising_Channel_Tx_Power
     (Tx_Power_Level : out UInt8) return BLE_Status_Code;

   function Hci_Le_Set_Random_Address
     (BDaddr : BDAddrT) return BLE_Status_Code;

   function Hci_Le_Set_Default_Phy
     (All_Phys : UInt8;
      TX_Phys  : UInt8;
      RX_Phys  : UInt8) return BLE_Status_Code;

   function Hci_Read_Bd_Addr
     (BDaddr : BDAddrT) return BLE_Status_Code;

   function Hci_Le_Create_Connection
     (Interval            : UInt16;
      Window              : UInt16;
      Initiator_Filter    : UInt8;
      Peer_Bdaddr_Type    : UInt8;
      Peer_Bdaddr         : BDAddrT;
      Own_Bdaddr_Type     : UInt8;
      Min_Interval        : UInt16;
      Max_Interval        : UInt16;
      Latency             : UInt16;
      Supervision_Timeout : UInt16;
      Min_Ce_Length       : UInt16;
      Max_Ce_Length       : UInt16) return BLE_Status_Code;

   function Hci_Le_Create_Connection_Cancel return BLE_Status_Code;

   function Hci_Le_Encrypt
     (Key           : UInt8_Array;
      PlaintextData : UInt8_Array;
      EncryptedData : out UInt8_Array) return BLE_Status_Code;

   function Hci_Le_Ltk_Request_Reply
     (Key : UInt8_Array) return BLE_Status_Code;

   function Hci_Le_Ltk_Request_Neg_Reply return BLE_Status_Code;

   function Hci_Le_Read_White_List_Size
     (Size : out UInt8) return BLE_Status_Code;

   function Hci_Le_Clear_White_List return BLE_Status_Code;

   function Hci_Le_Add_Device_To_White_List
     (Bdaddr_Type : UInt8;
      Bdaddr      : BDAddrT) return BLE_Status_Code;

   function Hci_Le_Remove_Device_From_White_List
     (Bdaddr_Type : UInt8;
      Bdaddr      : BDAddrT) return BLE_Status_Code;

   function Hci_Read_Transmit_Power_Level
     (Conn_Handle : out UInt16;
      Conntype    : UInt8;
      Tx_Level    : out UInt8) return BLE_Status_Code;

   function Hci_Read_Rssi
     (Conn_Handle : out UInt16;
      Rssi        : out UInt8) return BLE_Status_Code;

   function Hci_Le_Read_Local_Supported_Features
     (Features : out UInt8) return BLE_Status_Code;

   function Hci_Le_Read_Channel_Map
     (Conn_Handle : out UInt16;
      Ch_Map : UInt8_Array) return BLE_Status_Code;

   function Hci_Le_Read_Supported_States
     (States : UInt8_Array) return BLE_Status_Code;

   function Hci_Le_Receiver_Test
     (Frequency : UInt8) return BLE_Status_Code;

   function Hci_Le_Transmitter_Test
     (Frequency : UInt8;
      Length    : UInt8;
      Payload   : UInt8) return BLE_Status_Code;

   function Hci_Le_Test_End
     (Num_Pkts : out UInt16) return BLE_Status_Code;

end Hci_Le;
