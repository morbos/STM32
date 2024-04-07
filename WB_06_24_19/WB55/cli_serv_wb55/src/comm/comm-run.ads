with HAL;               use HAL;
with Bluenrg_L2Cap_Aci; use Bluenrg_L2Cap_Aci;
with Hci;               use Hci;
with Hci_Le;            use Hci_Le;
with Memory;            use Memory;

with System;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Comm.Run is

   Connected               : Boolean := False;

   Scan_Go                 : Suspension_Object; --  Initiates the scan task

   Post_Conn_Go            : Suspension_Object; --  Finish up a connection

   Conn_Update_Go          : Suspension_Object; --  When an L2Cap resp message arr

   Matched                 : Boolean := False;  --  Set to true when client sees the server

   SW1_Remote_State        : Boolean := False;  --  Track the remote blue led state

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

--   procedure HCI_Event_CB (Pckt : DataBuffT);

   procedure GATT_Notification_CB
     (Buff   : DataBuffT;
      Offset : UInt8);

   procedure L2cap_Respond
     (Evt : Evt_L2cap_Conn_Upd_Req);

   procedure Advertising_Info_CB
     (Buff   : DataBuffT;
      Offset : UInt8);

   procedure Send_Message;

   task Scan_Task is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end Scan_Task;

   task Event_Task is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end Event_Task;

   task Post_Conn_Task is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end Post_Conn_Task;

end Comm.Run;
