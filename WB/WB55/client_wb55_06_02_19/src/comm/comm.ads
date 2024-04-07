with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Comm is

   IPCC_SYSTEM_EVENT_SO    : Suspension_Object;

   IPCC_BLE_EVENT_SO       : Suspension_Object;

   IPCC_HCI_SEND_REQ_SO    : Suspension_Object; --  Only when the event is the send_req blocker

   procedure Initialize_Comm;

end Comm;
