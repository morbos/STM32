with LoRa_Base;   use LoRa_Base;
with Gen_List;

with System;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package LoRa_Server is

   use WorklistT;

   LoRa_Go          : Suspension_Object;

   LoRa_Notify_Go   : Suspension_Object;

   LoRa_LED_State   : Boolean := False;

   task LoRa_Server is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end LoRa_Server;

   task LoRa_Notifier is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end LoRa_Notifier;

   procedure LoRa_Rcv_Notify8 (P : ListNodePtr);

   procedure LoRa_Notify_LED (On : Boolean);

   procedure LoRa_Start;

end LoRa_Server;
