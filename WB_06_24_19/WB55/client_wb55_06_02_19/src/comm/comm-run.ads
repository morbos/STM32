with HAL;               use HAL;
with Bluenrg_L2Cap_Aci; use Bluenrg_L2Cap_Aci;
with Hci;               use Hci;
with Hci_Le;            use Hci_Le;
with Memory;            use Memory;

with System;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Comm.Run is

   Connected               : Boolean := False;
   Wait_For_Connection     : Boolean := True;
   First_Connection_Config : Boolean := False;

   Char_Running            : Boolean := False; --  True when client is rcving data

   Max_Len : Short_Float := 0.0;
   Min_Len : Short_Float := 99999.0;

   Client_Go  : Suspension_Object;  --  Initiates the scan task

   Matched    : Boolean := False; --  Set to true when client sees the server

   procedure SetConnectable;

   procedure GAP_ConnectionComplete_CB
     (Addr   : BDAddrT;
      Handle : UInt16);

   procedure GAP_DisconnectionComplete_CB;

   procedure Read_Request_CB (Handle : UInt16);

   procedure Attribute_Modified_CB
     (Handle      : UInt16;
      Buff        : DataBuffT;
      Offset      : UInt8;
      Data_Length : UInt8);

   procedure HCI_Event_CB (Pckt : DataBuffT);

   procedure GATT_Notification_CB
     (Buff   : DataBuffT;
      Offset : UInt8);

   procedure L2cap_Respond
     (Evt : Evt_L2cap_Conn_Upd_Req);

   procedure Advertising_Info_CB
     (Buff   : DataBuffT;
      Offset : UInt8);

   task Scan_Task is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end Scan_Task;

end Comm.Run;
