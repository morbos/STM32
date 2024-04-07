with HAL;             use HAL;
with Hci;             use Hci;
with Ogf_Ocf;         use Ogf_Ocf;
with UUid;            use UUid;
with BLE_Status;      use BLE_Status;

package Bluenrg_L2Cap_Aci is

   OCF_L2CAP_CONN_PARAM_UPDATE_REQ : constant UInt10 := 16#181#;

   type L2cap_Conn_Param_Update_Req_Cp is record
      Conn_Handle        : UInt16;
      Interval_Min       : UInt16;
      Interval_Max       : UInt16;
      Slave_Latency      : UInt16;
      Timeout_Multiplier : UInt16;
   end record
     with Pack;

   L2CAP_CONN_PARAM_UPDATE_REQ_CP_SIZE : constant := 10;

   EVT_BLUE_L2CAP_CONN_UPD_REQ_CODE  : constant UInt16 := 16#0802#;
   type Evt_L2cap_Conn_Upd_Req is record
      Conn_Handle        : UInt16;
      Event_Data_Length  : UInt8;
      Identifier         : UInt8;
      L2cap_Length       : UInt16;
      Interval_Min       : UInt16;
      Interval_Max       : UInt16;
      Slave_Latency      : UInt16;
      Timeout_Mult       : UInt16;
   end record
     with Pack;

   OCF_L2CAP_CONN_PARAM_UPDATE_RESP : constant UInt10 := 16#182#;
   type L2cap_Conn_Param_Update_Resp_Cp_IDB05A1 is record
      Conn_Handle           : UInt16;
      Interval_Min          : UInt16;
      Interval_Max          : UInt16;
      Slave_Latency         : UInt16;
      Timeout_Multiplier    : UInt16;
      Min_Conn_Event_Length : UInt16;
      Max_Conn_Event_Length : UInt16;
      Id                    : UInt8;
      Stance                : UInt8;
   end record
     with Pack;

   type Connection_Parameter_Acceptance is
     (Not_Acceptable,
      Acceptable);

   function Aci_L2cap_Connection_Parameter_Update_Request
     (Handle             : UInt16;
      Interval_Min       : UInt16;
      Interval_Max       : UInt16;
      Slave_Latency      : UInt16;
      Timeout_Multiplier : UInt16
     ) return BLE_Status_Code;

   function Aci_L2cap_Connection_Parameter_Update_Response_IDB05A1
     (Conn_Handle           : UInt16;
      Interval_Min          : UInt16;
      Interval_Max          : UInt16;
      Slave_Latency         : UInt16;
      Timeout_Multiplier    : UInt16;
      Min_Conn_Event_Length : UInt16;
      Max_Conn_Event_Length : UInt16;
      Id                    : UInt8;
      Stance                : Connection_Parameter_Acceptance) return BLE_Status_Code;

end Bluenrg_L2Cap_Aci;
