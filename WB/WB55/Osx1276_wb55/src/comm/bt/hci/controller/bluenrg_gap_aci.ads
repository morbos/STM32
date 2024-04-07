with HAL;             use HAL;
with Hci;             use Hci;
with Hci_Le;          use Hci_Le;
with Ogf_Ocf;         use Ogf_Ocf;
with BLE_Status;      use BLE_Status;
with Memory;          use Memory;

package Bluenrg_Gap_Aci is

   type Oob_DataT is new UInt8_Array (1 .. 16);

   OCF_GAP_SET_DISCOVERABLE       : constant UInt10 := 16#083#;
   OCF_GAP_SET_IO_CAPABILITY      : constant UInt10 := 16#085#;
   OCF_GAP_SET_AUTH_REQUIREMENT   : constant UInt10 := 16#086#;
   OCF_GAP_UPDATE_ADV_DATA        : constant UInt10 := 16#08E#;
   OCF_GAP_CONFIGURE_WHITELIST    : constant UInt10 := 16#092#;

   type Gap_Set_Auth_Requirement_Cp is record
      Bonding_Mode            : UInt8;
      Mitm_Mode               : UInt8;
      Secure_Pairing          : UInt8;
      Keypress_Notify         : UInt8;
      Min_Encryption_Key_Size : UInt8;
      Max_Encryption_Key_Size : UInt8;
      Use_Fixed_Pin           : UInt8;
      Fixed_Pin               : UInt32;
      Identity_Addr_Type      : UInt8;
   end record
     with Pack;
   GAP_SET_AUTH_REQUIREMENT_CP_SIZE : constant UInt8 := 26;

   OCF_GAP_CREATE_CONNECTION       : constant UInt10 := 16#09C#;
   type Gap_Create_Connection_Cp is record
      ScanInterval        : UInt16;
      ScanWindow          : UInt16;
      Peer_Bdaddr_Type    : UInt8;
      Peer_Bdaddr         : BDAddrT;
      Own_Bdaddr_Type     : UInt8;
      Conn_Min_Interval   : UInt16;
      Conn_Max_Interval   : UInt16;
      Conn_Latency        : UInt16;
      Supervision_Timeout : UInt16;
      Min_Conn_Length     : UInt16;
      Max_Conn_Length     : UInt16;
   end record
     with Pack;
   GAP_CREATE_CONNECTION_CP_SIZE : constant UInt8 := 24;

   OCF_GAP_START_GENERAL_DISCOVERY_PROC : constant UInt10 := 16#097#;
   type Gap_Start_General_Discovery_Proc_Cp is record
      ScanInterval     : UInt16;
      ScanWindow       : UInt16;
      Own_Address_Type : UInt8;
      FilterDuplicates : UInt8;
   end record
     with Pack;
   GAP_START_GENERAL_DISCOVERY_PROC_CP_SIZE : constant UInt8 := 6;


   OCF_GAP_START_NAME_DISCOVERY_PROC   : constant UInt10 := 16#098#;
   type Gap_Start_Name_Discovery_Proc_Cp is record
      ScanInterval        : UInt16;
      ScanWindow          : UInt16;
      Peer_Bdaddr_Type    : UInt8;
      Peer_Bdaddr         : BDAddrT;
      Own_Bdaddr_Type     : UInt8;
      Conn_Min_Interval   : UInt16;
      Conn_Max_Interval   : UInt16;
      Conn_Latency        : UInt16;
      Supervision_Timeout : UInt16;
      Min_Conn_Length     : UInt16;
      Max_Conn_Length     : UInt16;
   end record
     with Pack;
   GAP_START_NAME_DISCOVERY_PROC_CP_SIZE : constant UInt8 := 24;

   OCF_GAP_TERMINATE_GAP_PROCEDURE    : constant UInt10 := 16#09D#;

   EVT_BLUE_GAP_PROCEDURE_COMPLETE    : constant UInt16 := 16#0407#;

   type Procedure_Codes is
     (Limited_Discovery_Proc,
      General_Discovery_Proc,
      Name_Discovery_Proc,
      Auto_Connection_Establishment_Proc,
      General_Connection_Establishment_Proc,
      Selective_Connection_Establishment_Proc,
      Direct_Connection_Establishment_Proc,
      Observation_Proc);

   for Procedure_Codes use
     (Limited_Discovery_Proc                  => 16#01#,
      General_Discovery_Proc                  => 16#02#,
      Name_Discovery_Proc                     => 16#04#,
      Auto_Connection_Establishment_Proc      => 16#08#,
      General_Connection_Establishment_Proc   => 16#10#,
      Selective_Connection_Establishment_Proc => 16#20#,
      Direct_Connection_Establishment_Proc    => 16#40#,
      Observation_Proc                        => 16#80#);

   function Aci_Gap_Init
     (Role                   : UInt8;
      Privacy_Enabled        : UInt8;
      Device_Name_Char_Len   : UInt8;
      Service_Handle         : out UInt16;
      Dev_Name_Char_Handle   : out UInt16;
      Appearance_Char_Handle : out UInt16) return BLE_Status_Code;

   function Aci_Gap_Set_Auth_Requirement
     (Bonding_Mode            : UInt8;
      Mitm_Mode               : UInt8;
      Secure_Pairing          : UInt8;
      Keypress_Notify         : UInt8;
      Min_Encryption_Key_Size : Encryption_Key_Size;
      Max_Encryption_Key_Size : Encryption_Key_Size;
      Use_Fixed_Pin           : UInt8;
      Fixed_Pin               : UInt32;
      Identity_Addr_Type      : UInt8) return BLE_Status_Code;

   function Aci_Gap_Set_Discoverable
     (AdvType            : UInt8;
      AdvIntervMin       : UInt16;
      AdvIntervMax       : UInt16;
      OwnAddrType        : UInt8;
      AdvFilterPolicy    : UInt8;
      LocalNameLen       : UInt8;
      LocalName          : UInt8_Array;
      ServiceUUIDLen     : UInt8;
      ServiceUUIDList    : UInt8_Array;
      SlaveConnIntervMin : UInt16;
      SlaveConnIntervMax : UInt16) return BLE_Status_Code;

   function Aci_Gap_Update_Adv_Data
     (AdvLen  : UInt8;
      AdvData : UInt8_Array) return BLE_Status_Code;

   function Aci_Gap_Create_Connection
     (ScanInterval        : UInt16;
      ScanWindow          : UInt16;
      Peer_Bdaddr_Type    : UInt8;
      Peer_Bdaddr         : BDAddrT;
      Own_Bdaddr_Type     : UInt8;
      Conn_Min_Interval   : UInt16;
      Conn_Max_Interval   : UInt16;
      Conn_Latency        : UInt16;
      Supervision_Timeout : UInt16;
      Min_Conn_Length     : UInt16;
      Max_Conn_Length     : UInt16) return BLE_Status_Code;

   function Aci_Gap_Start_General_Discovery_Proc
     (ScanInterval     : UInt16;
      ScanWindow       : UInt16;
      Own_Address_Type : UInt8;
      FilterDuplicates : UInt8) return BLE_Status_Code;

   function Aci_Gap_Start_Name_Discovery_Proc
     (ScanInterval        : UInt16;
      ScanWindow          : UInt16;
      Peer_Bdaddr_Type    : UInt8;
      Peer_Bdaddr         : BDAddrT;
      Own_Bdaddr_Type     : UInt8;
      Conn_Min_Interval   : UInt16;
      Conn_Max_Interval   : UInt16;
      Conn_Latency        : UInt16;
      Supervision_Timeout : UInt16;
      Min_Conn_Length     : UInt16;
      Max_Conn_Length     : UInt16) return BLE_Status_Code;

   function Aci_Gap_Terminate_Gap_Procedure
     (Procedure_Code : Procedure_Codes) return BLE_Status_Code;

   function Aci_Gap_Configure_Whitelist return BLE_Status_Code;

   function Aci_Gap_Set_IO_Capabilty
     (Capability : UInt8) return BLE_Status_Code;

end Bluenrg_Gap_Aci;
