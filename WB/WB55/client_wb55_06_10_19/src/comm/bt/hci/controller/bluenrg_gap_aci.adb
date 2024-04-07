with Utils;             use Utils;

package body Bluenrg_Gap_Aci is
   function Aci_Gap_Init
     (Role                   : UInt8;
      Privacy_Enabled        : UInt8;
      Device_Name_Char_Len   : UInt8;
      Service_Handle         : out UInt16;
      Dev_Name_Char_Handle   : out UInt16;
      Appearance_Char_Handle : out UInt16) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Cp      : Gap_Init_Cp_IDB05A1;
      CpBuf   : aliased DataBuffT;
      for Cp'Address use CpBuf'Address;
      Resp    : Gap_Init_Rp;
      RespBuf : aliased DataBuffT;
      for Resp'Address use RespBuf'Address;
   begin

      Cp.Role                 := Role;
      Cp.Privacy_Enabled      := Privacy_Enabled;
      Cp.Device_Name_Char_Len := Device_Name_Char_Len;

      RqBuff         := (others => 0);
      Rq.Opcode.Ogf  := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf  := OCF_GAP_INIT;
      Rq.Cparam      := CpBuf'Unchecked_Access;
      Rq.Clen        := Cp'Size / 8;
      Rq.Rparam      := RespBuf'Unchecked_Access;
      Rq.Rlen        := GAP_INIT_RP_SIZE;
      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      end if;

      if Resp.Status > 0 then
         return BLE_Status_Code (Resp.Status);
      end if;

      Service_Handle         := Resp.Service_Handle;
      Dev_Name_Char_Handle   := Resp.Dev_Name_Char_Handle;
      Appearance_Char_Handle := Resp.Appearance_Char_Handle;

      return BLE_STATUS_OK;

   end Aci_Gap_Init;

   function Aci_Gap_Set_Auth_Requirement
     (Bonding_Mode            : UInt8;
      Mitm_Mode               : UInt8;
      Secure_Pairing          : UInt8;
      Keypress_Notify         : UInt8;
      Min_Encryption_Key_Size : Encryption_Key_Size;
      Max_Encryption_Key_Size : Encryption_Key_Size;
      Use_Fixed_Pin           : UInt8;
      Fixed_Pin               : UInt32;
      Identity_Addr_Type      : UInt8) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Cp      : Gap_Set_Auth_Requirement_Cp;
      CpBuf   : aliased DataBuffT;
      for Cp'Address use CpBuf'Address;
   begin
      CpBuf         := (others => 0);
      Cp.Bonding_Mode            := Bonding_Mode;
      Cp.Mitm_Mode               := Mitm_Mode;
      Cp.Secure_Pairing          := Secure_Pairing;
      Cp.Keypress_Notify         := Keypress_Notify;
      Cp.Min_Encryption_Key_Size := UInt8 (Min_Encryption_Key_Size);
      Cp.Max_Encryption_Key_Size := UInt8 (Max_Encryption_Key_Size);
      Cp.Use_Fixed_Pin           := Use_Fixed_Pin;
      Cp.Fixed_Pin               := Fixed_Pin;
      Cp.Identity_Addr_Type      := Identity_Addr_Type;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GAP_SET_AUTH_REQUIREMENT;
      Rq.Cparam     := CpBuf'Unchecked_Access;
      Rq.Clen       := Cp'Size / 8;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gap_Set_Auth_Requirement;

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
      SlaveConnIntervMax : UInt16) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Buffer  : aliased DataBuffT;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Idx     : UInt8 := 1;
   begin
      if LocalNameLen + ServiceUUIDLen + 14 > 40 then
         return BLE_STATUS_INVALID_PARAMS;
      end if;
      Buffer (Integer (Idx)) := AdvType;
      Idx := Idx + 1;

      To_UInt8_From_UInt16 (Buffer (Integer (Idx + 1)), Buffer (Integer (Idx)), AdvIntervMin);
      Idx := Idx + 2;

      To_UInt8_From_UInt16 (Buffer (Integer (Idx + 1)), Buffer (Integer (Idx)), AdvIntervMax);
      Idx := Idx + 2;

      Buffer (Integer (Idx)) := OwnAddrType;
      Idx := Idx + 1;

      Buffer (Integer (Idx)) := AdvFilterPolicy;
      Idx := Idx + 1;

      Buffer (Integer (Idx)) := LocalNameLen;
      Idx := Idx + 1;

      if LocalNameLen > 0 then
         for I in 1 .. 8 loop
            Buffer (Integer (Idx) + I - 1) := LocalName (Integer (I));
         end loop;
      end if;
      Idx := Idx + LocalNameLen;

      Buffer (Integer (Idx)) := ServiceUUIDLen;
      Idx := Idx + 1;

      if ServiceUUIDLen > 0 then
         for I in 1 .. ServiceUUIDLen loop
            Buffer (Integer (Idx + I - 1)) := ServiceUUIDList (Integer (I));
         end loop;
      end if;
      Idx := Idx + ServiceUUIDLen;

      To_UInt8_From_UInt16 (Buffer (Integer (Idx + 1)), Buffer (Integer (Idx)), SlaveConnIntervMin);
      Idx := Idx + 2;

      To_UInt8_From_UInt16 (Buffer (Integer (Idx + 1)), Buffer (Integer (Idx)), SlaveConnIntervMax);
      Idx := Idx + 2;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GAP_SET_DISCOVERABLE;
      Rq.Cparam     := Buffer'Unchecked_Access;
      Rq.Clen       := Idx - 1;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gap_Set_Discoverable;

   function Aci_Gap_Update_Adv_Data
     (AdvLen  : UInt8;
      AdvData : UInt8_Array) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Buffer  : aliased DataBuffT;
      Idx     : UInt8 := 1;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
   begin
      if AdvLen > 31 then
         return BLE_STATUS_INVALID_PARAMS;
      end if;

      Buffer (Integer (Idx)) := AdvLen;
      Idx := Idx + 1;

      for I in 1 .. AdvLen loop
         Buffer (Integer (Idx + I - 1)) := AdvData (Integer (I));
      end loop;
      Idx := Idx + AdvLen;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GAP_UPDATE_ADV_DATA;
      Rq.Cparam     := Buffer'Unchecked_Access;
      Rq.Clen       := Idx - 1;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;

   end Aci_Gap_Update_Adv_Data;

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
      Max_Conn_Length     : UInt16) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Cp      : Gap_Create_Connection_Cp;
      CpBuf   : aliased DataBuffT;
      for Cp'Alignment use 1;
      for Cp'Address use CpBuf'Address;
   begin
      Cp.ScanInterval        := ScanInterval;
      Cp.ScanWindow          := ScanWindow;
      Cp.Peer_Bdaddr_Type    := Peer_Bdaddr_Type;
      Cp.Peer_Bdaddr         := Peer_Bdaddr;
      Cp.Own_Bdaddr_Type     := Own_Bdaddr_Type;
      Cp.Conn_Min_Interval   := Conn_Min_Interval;
      Cp.Conn_Max_Interval   := Conn_Max_Interval;
      Cp.Conn_Latency        := Conn_Latency;
      Cp.Supervision_Timeout := Supervision_Timeout;
      Cp.Min_Conn_Length     := Min_Conn_Length;
      Cp.Max_Conn_Length     := Max_Conn_Length;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GAP_CREATE_CONNECTION;
      Rq.Cparam     := CpBuf'Unchecked_Access;
      Rq.Clen       := Cp'Size / 8;
      Rq.Event      := EVT_CMD_STATUS_CODE;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gap_Create_Connection;

   function Aci_Gap_Start_General_Discovery_Proc
     (ScanInterval     : UInt16;
      ScanWindow       : UInt16;
      Own_Address_Type : UInt8;
      FilterDuplicates : UInt8) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Cp      : Gap_Start_General_Discovery_Proc_Cp;
      CpBuf   : aliased DataBuffT;
      for Cp'Alignment use 1;
      for Cp'Address use CpBuf'Address;
   begin
      Cp.ScanInterval        := ScanInterval;
      Cp.ScanWindow          := ScanWindow;
      Cp.Own_Address_Type    := Own_Address_Type;
      Cp.FilterDuplicates    := FilterDuplicates;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GAP_START_GENERAL_DISCOVERY_PROC;
      Rq.Cparam     := CpBuf'Unchecked_Access;
      Rq.Clen       := Cp'Size / 8;
      Rq.Event      := EVT_CMD_STATUS_CODE;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gap_Start_General_Discovery_Proc;

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
      Max_Conn_Length     : UInt16) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Cp      : Gap_Start_Name_Discovery_Proc_Cp;
      CpBuf   : aliased DataBuffT;
      for Cp'Alignment use 1;
      for Cp'Address use CpBuf'Address;
   begin
      Cp.ScanInterval        := ScanInterval;
      Cp.ScanWindow          := ScanWindow;
      Cp.Peer_Bdaddr_Type    := Peer_Bdaddr_Type;
      Cp.Peer_Bdaddr         := Peer_Bdaddr;
      Cp.Own_Bdaddr_Type     := Own_Bdaddr_Type;
      Cp.Conn_Min_Interval   := Conn_Min_Interval;
      Cp.Conn_Max_Interval   := Conn_Max_Interval;
      Cp.Conn_Latency        := Conn_Latency;
      Cp.Supervision_Timeout := Supervision_Timeout;
      Cp.Min_Conn_Length     := Min_Conn_Length;
      Cp.Max_Conn_Length     := Max_Conn_Length;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GAP_START_NAME_DISCOVERY_PROC;
      Rq.Cparam     := CpBuf'Unchecked_Access;
      Rq.Clen       := Cp'Size / 8;
      Rq.Event      := EVT_CMD_STATUS_CODE;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gap_Start_Name_Discovery_Proc;

   function Aci_Gap_Terminate_Gap_Procedure
     (Procedure_Code : Procedure_Codes) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Cp      : UInt8;
      CpBuf   : aliased DataBuffT;
      for Cp'Address use CpBuf'Address;
   begin
      Cp            := UInt8 (Procedure_Code'Enum_Rep);
      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GAP_TERMINATE_GAP_PROCEDURE;
      Rq.Cparam     := CpBuf'Unchecked_Access;
      Rq.Clen       := Cp'Size / 8;
      Rq.Event      := EVT_CMD_STATUS_CODE;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_Gap_Terminate_Gap_Procedure;

   function Aci_Gap_Configure_Whitelist return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
   begin
      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GAP_CONFIGURE_WHITELIST;
      Rq.Cparam     := null;
      Rq.Clen       := 0;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;

   end Aci_Gap_Configure_Whitelist;

   function Aci_Gap_Set_IO_Capabilty
     (Capability : UInt8) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Buffer  : aliased DataBuffT;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
   begin
      Buffer (1) := Capability;

      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf := OCF_GAP_SET_IO_CAPABILITY;
      Rq.Cparam     := Buffer'Unchecked_Access;
      Rq.Clen       := 1;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;

   end Aci_Gap_Set_IO_Capabilty;

end Bluenrg_Gap_Aci;
