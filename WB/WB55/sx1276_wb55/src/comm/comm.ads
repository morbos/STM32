with HAL;               use HAL;
with UUid;              use UUid;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Comm is

   IPCC_SYSTEM_EVENT_SO    : Suspension_Object;

   IPCC_BLE_EVENT_SO       : Suspension_Object;

   IPCC_HCI_SEND_REQ_SO    : Suspension_Object; --  Only when the event is the send_req blocker

   Procedure_Complete      : Suspension_Object; --  c10 event recv'd

   type Prim_Results is record
      Svc_Handle_Start : UInt16;
      Svc_Handle_End   : UInt16;
      UUid             : UUidT;
   end record;

   MAX_PRIM_RESULTS : constant := 10;
   type Prim_Result_Range is range 1 .. MAX_PRIM_RESULTS;

   type Prim_Result_Table_T is array (Prim_Result_Range) of Prim_Results;

   Prim_Result_Table : Prim_Result_Table_T;

   Curr_Prim_Result_Idx : Prim_Result_Range := Prim_Result_Range'First;

   type Charac_Results is record
      Handle          : UInt16;
      Properties      : UInt8;
      Char_Val_Handle : UInt16;
      UUid            : UUidT;
   end record;

   MAX_CHARAC_RESULTS : constant := 10;
   type Charac_Result_Range is range 1 .. MAX_CHARAC_RESULTS;

   type Charac_Result_Table_T is array (Charac_Result_Range) of Charac_Results;

   Charac_Result_Table : Charac_Result_Table_T;

   Curr_Charac_Result_Idx : Charac_Result_Range := Charac_Result_Range'First;

   procedure Initialize_Comm;

end Comm;
