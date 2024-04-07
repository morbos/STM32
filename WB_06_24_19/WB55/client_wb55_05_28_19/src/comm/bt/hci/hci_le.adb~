with Hci;             use Hci;
with Utils;           use Utils;

package body Hci_Le is

   function Hci_Le_Read_Local_Version
     (Hci_Version        : out UInt8;
      Hci_Revision       : out UInt16;
      Lmp_Pal_Version    : out UInt8;
      Manufacturer_Name  : out UInt16;
      Lmp_Pal_Subversion : out UInt16) return BLE_Status_Code
   is
      Rq       : Hci_Request;
      RqBuff   : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      RespBuff : aliased DataBuffT;
      Resp     : Read_Local_Version_Rp;
      for Resp'Address use RespBuff'Address;
   begin
      RqBuff   := (others => 0);
      RespBuff := (others => 0);

      Rq.Opcode.Ogf := OGF_INFO_PARAM;
      Rq.Opcode.Ocf := OCF_READ_LOCAL_VERSION;
      Rq.Clen       := 0;
      Rq.Rparam     := RespBuff'Unchecked_Access;
      Rq.Rlen       := READ_LOCAL_VERSION_RP_SIZE;

      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      end if;

      if Resp.Status > 0 then
         return BLE_Status_Code (Resp.Status);
      end if;

      Hci_Version        := Resp.Hci_Version;
      Hci_Revision       :=  Btohs (Resp.Hci_Revision);
      Lmp_Pal_Version    := Resp.Lmp_Pal_Version;
      Manufacturer_Name  := Btohs (Resp.Manufacturer_Name);
      Lmp_Pal_Subversion := Btohs (Resp.Lmp_Pal_Subversion);

      return BLE_STATUS_OK;

   end Hci_Le_Read_Local_Version;

   function Hci_Reset return BLE_Status_Code
   is begin
      return BLE_STATUS_OK;
   end Hci_Reset;

   function Hci_Disconnect
     (Handle : UInt16;
      Reason : UInt8) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Disconnect;

   function Hci_Le_Read_Buffer_Size
     (Pkt_Len : out UInt16;
      Max_Pkt : out UInt8) return BLE_Status_Code
   is
      pragma Unreferenced (Pkt_Len);
      pragma Unreferenced (Max_Pkt);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Read_Buffer_Size;

   function Hci_Le_Set_Advertising_Parameters
     (Min_Interval       : UInt16;
      Max_Interval       : UInt16;
      Advtype            : UInt8;
      Own_Bdaddr_Type    : UInt8;
      Direct_Bdaddr_Type : UInt8;
      Direct_Bdaddr      : BDAddrT;
      Chan_Map           : UInt8;
      Filter             : UInt8) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Set_Advertising_Parameters;

   function Hci_Le_Set_Advertising_Data
     (Length : UInt8;
      Data   : UInt8_Array) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Set_Advertising_Data;

   function Hci_Le_Set_Advertise_Enable
     (Enable : UInt8) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Set_Advertise_Enable;

   function Hci_Le_Set_Scan_Parameters
     (Scan_Type       : UInt8;
      Interval        : UInt16;
      Window          : UInt16;
      Own_Bdaddr_Type : UInt8;
      Filter          : UInt8) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Set_Scan_Parameters;

   function Hci_Le_Set_Scan_Enable
     (Enable     : UInt8;
      Filter_Dup : UInt8) return BLE_Status_Code
   is
      pragma Unreferenced (Enable);
      pragma Unreferenced (Filter_Dup);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Set_Scan_Enable;

   function Hci_Le_Rand
     (Random_Number : out UInt8_Array) return BLE_Status_Code
   is
      pragma Unreferenced (Random_Number);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Rand;

   function Hci_Le_Set_Scan_Resp_Data
     (Length : UInt8;
      Data   : UInt8_Array) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Scan_Resp_Cp : Le_Set_Scan_Response_Data_Cp;
      ScanBuf : aliased DataBuffT;
      for Scan_Resp_Cp'Alignment use 1;
      for Scan_Resp_Cp'Address use ScanBuf'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
   begin
      RqBuff              := (others => 0);
      ScanBuf             := (others => 0);
      Scan_Resp_Cp.Length := Length;
      if Length > 0 then
         for I in 1 .. Length loop
            if I < 32 then
               Scan_Resp_Cp.Data (Integer (I)) := Data (Integer (I));
            end if;
         end loop;
      end if;
      Rq.Opcode.Ogf := OGF_LE_CTL;
      Rq.Opcode.Ocf := OCF_LE_SET_SCAN_RESPONSE_DATA;
      Rq.Cparam     := ScanBuf'Unchecked_Access;
      Rq.Clen       := LE_SET_SCAN_RESPONSE_DATA_CP_SIZE;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;
      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Hci_Le_Set_Scan_Resp_Data;

   function Hci_Le_Read_Advertising_Channel_Tx_Power
     (Tx_Power_Level : out UInt8) return BLE_Status_Code
   is
      pragma Unreferenced (Tx_Power_Level);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Read_Advertising_Channel_Tx_Power;

   function Hci_Le_Set_Random_Address
     (BDaddr : BDAddrT) return BLE_Status_Code
   is
      Rq           : Hci_Request;
      RqBuff       : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Status       : BLE_Status_Code;
      StatBuf      : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
      Arg          : aliased DataBuffT;
      Local_Bdaddr : aliased BDAddrT := BDaddr;
      for Local_Bdaddr'Address use Arg'Address;
   begin
      RqBuff        := (others => 0);
      Rq.Opcode.Ogf := OGF_LE_CTL;
      Rq.Opcode.Ocf := OCF_LE_SET_RANDOM_ADDRESS;
      Rq.Cparam     := Arg'Unchecked_Access;
      Rq.Clen       := LE_SET_RANDOM_ADDRESS_CP_SIZE;
      Rq.Rparam     := StatBuf'Unchecked_Access;
      Rq.Rlen       := 1;
      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Hci_Le_Set_Random_Address;

   function Hci_Read_Bd_Addr
     (BDaddr : BDAddrT) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Read_Bd_Addr;

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
      Max_Ce_Length       : UInt16) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Create_Connection;

   function Hci_Le_Create_Connection_Cancel return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Create_Connection_Cancel;

   function Hci_Le_Encrypt
     (Key           : UInt8_Array;
      PlaintextData : UInt8_Array;
      EncryptedData : out UInt8_Array) return BLE_Status_Code
   is
      pragma Unreferenced (Key);
      pragma Unreferenced (PlaintextData);
      pragma Unreferenced (EncryptedData);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Encrypt;

   function Hci_Le_Ltk_Request_Reply
     (Key : UInt8_Array) return BLE_Status_Code
   is
      pragma Unreferenced (Key);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Ltk_Request_Reply;

   function Hci_Le_Ltk_Request_Neg_Reply return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Ltk_Request_Neg_Reply;

   function Hci_Le_Read_White_List_Size
     (Size : out UInt8) return BLE_Status_Code
   is
      pragma Unreferenced (Size);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Read_White_List_Size;

   function Hci_Le_Clear_White_List return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Clear_White_List;

   function Hci_Le_Add_Device_To_White_List
     (Bdaddr_Type : UInt8;
      Bdaddr      : BDAddrT) return BLE_Status_Code
   is
      pragma Unreferenced (Bdaddr_Type);
      pragma Unreferenced (Bdaddr);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Add_Device_To_White_List;

   function Hci_Le_Remove_Device_From_White_List
     (Bdaddr_Type : UInt8;
      Bdaddr      : BDAddrT) return BLE_Status_Code
   is
      pragma Unreferenced (Bdaddr_Type);
      pragma Unreferenced (Bdaddr);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Remove_Device_From_White_List;

   function Hci_Read_Transmit_Power_Level
     (Conn_Handle : out UInt16;
      Conntype    : UInt8;
      Tx_Level    : out UInt8) return BLE_Status_Code
   is
      pragma Unreferenced (Conn_Handle);
      pragma Unreferenced (Conntype);
      pragma Unreferenced (Tx_Level);
   begin
      return BLE_STATUS_OK;
   end Hci_Read_Transmit_Power_Level;

   function Hci_Read_Rssi
     (Conn_Handle : out UInt16;
      Rssi        : out UInt8) return BLE_Status_Code
   is
      pragma Unreferenced (Conn_Handle);
      pragma Unreferenced (Rssi);
   begin
      return BLE_STATUS_OK;
   end Hci_Read_Rssi;

   function Hci_Le_Read_Local_Supported_Features
     (Features : out UInt8) return BLE_Status_Code
   is
      pragma Unreferenced (Features);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Read_Local_Supported_Features;

   function Hci_Le_Read_Channel_Map
     (Conn_Handle : out UInt16;
      Ch_Map      : UInt8_Array) return BLE_Status_Code
   is
      pragma Unreferenced (Conn_Handle);
      pragma Unreferenced (Ch_Map);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Read_Channel_Map;

   function Hci_Le_Read_Supported_States
     (States : UInt8_Array) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Read_Supported_States;

   function Hci_Le_Receiver_Test
     (Frequency : UInt8) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Receiver_Test;

   function Hci_Le_Transmitter_Test
     (Frequency : UInt8;
      Length    : UInt8;
      Payload   : UInt8) return BLE_Status_Code
   is
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Transmitter_Test;

   function Hci_Le_Test_End
     (Num_Pkts : out UInt16) return BLE_Status_Code
   is
      pragma Unreferenced (Num_Pkts);
   begin
      return BLE_STATUS_OK;
   end Hci_Le_Test_End;

end Hci_Le;
