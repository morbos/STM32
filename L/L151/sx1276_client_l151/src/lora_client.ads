with HAL;          use HAL;
with LoRa_Base;    use LoRa_Base;
with System;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package LoRa_Client is

   LoRa_Go    : Suspension_Object;

   Notify_Button : Boolean := False;

   task LoRa_Client is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end LoRa_Client;

   procedure LoRa_Notify_Button;

   procedure LoRa_Rcv_Notify8 (P : WorklistT.ListNodePtr);

   procedure LoRa_Start;

end LoRa_Client;
