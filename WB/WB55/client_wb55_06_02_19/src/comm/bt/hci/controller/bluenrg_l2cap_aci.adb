with HAL;             use HAL;
with Hci;             use Hci;
with Ogf_Ocf;         use Ogf_Ocf;
with UUid;            use UUid;
with Memory;          use Memory;

package body Bluenrg_L2Cap_Aci is

   function Aci_L2cap_Connection_Parameter_Update_Request
     (Handle             : UInt16;
      Interval_Min       : UInt16;
      Interval_Max       : UInt16;
      Slave_Latency      : UInt16;
      Timeout_Multiplier : UInt16
     ) return BLE_Status_Code
   is
      Rq     : Hci_Request;
      RqBuff : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Cp      : L2cap_Conn_Param_Update_Req_Cp;
      CpBuf   : aliased DataBuffT;
      for Cp'Alignment use 1;
      for Cp'Address use CpBuf'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
   begin
      Cp.Conn_Handle        := Handle;
      Cp.Interval_Min       := Interval_Min;
      Cp.Interval_Max       := Interval_Max;
      Cp.Slave_Latency      := Slave_Latency;
      Cp.Timeout_Multiplier := Timeout_Multiplier;

      RqBuff         := (others => 0);
      Rq.Opcode.Ogf  := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf  := OCF_L2CAP_CONN_PARAM_UPDATE_REQ;
      Rq.Cparam      := CpBuf'Unchecked_Access;
      Rq.Clen        := Cp'Size / 8;
      Rq.Event       := EVT_CMD_STATUS_CODE;
      Rq.Rparam      := StatBuf'Unchecked_Access;
      Rq.Rlen        := 1;
      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_L2cap_Connection_Parameter_Update_Request;

   function Aci_L2cap_Connection_Parameter_Update_Response_IDB05A1
     (Conn_Handle           : UInt16;
      Interval_Min          : UInt16;
      Interval_Max          : UInt16;
      Slave_Latency         : UInt16;
      Timeout_Multiplier    : UInt16;
      Min_Conn_Event_Length : UInt16;
      Max_Conn_Event_Length : UInt16;
      Id                    : UInt8;
      Stance                : Connection_Parameter_Acceptance) return BLE_Status_Code
   is
      Rq      : Hci_Request;
      RqBuff  : UInt8_Array (1 .. Rq'Size / 8);
      for RqBuff'Address use Rq'Address;
      Cp      : L2cap_Conn_Param_Update_Resp_Cp_IDB05A1;
      CpBuf   : aliased DataBuffT;
      for Cp'Alignment use 1;
      for Cp'Address use CpBuf'Address;
      Status  : BLE_Status_Code;
      StatBuf : aliased DataBuffT;
      for Status'Address use StatBuf'Address;
   begin
      Cp.Conn_Handle           := Conn_Handle;
      Cp.Interval_Min          := Interval_Min;
      Cp.Interval_Max          := Interval_Max;
      Cp.Slave_Latency         := Slave_Latency;
      Cp.Timeout_Multiplier    := Timeout_Multiplier;
      Cp.Min_Conn_Event_Length := Min_Conn_Event_Length;
      Cp.Max_Conn_Event_Length := Max_Conn_Event_Length;
      Cp.Id                    := Id;
      Cp.Stance                := UInt8 (Stance'Enum_Rep);

      RqBuff         := (others => 0);
      Rq.Opcode.Ogf  := OGF_VENDOR_CMD;
      Rq.Opcode.Ocf  := OCF_L2CAP_CONN_PARAM_UPDATE_RESP;
      Rq.Cparam      := CpBuf'Unchecked_Access;
      Rq.Clen        := Cp'Size / 8;
      Rq.Rparam      := StatBuf'Unchecked_Access;
      Rq.Rlen        := 1;
      if Hci_Send_Req (Rq, False) < 0 then
         return BLE_STATUS_TIMEOUT;
      else
         return Status;
      end if;
   end Aci_L2cap_Connection_Parameter_Update_Response_IDB05A1;

end Bluenrg_L2Cap_Aci;
