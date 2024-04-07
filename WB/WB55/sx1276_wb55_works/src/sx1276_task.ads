with System;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Sx1276_Task is

   Send_Go          : Suspension_Object;

   Receive_Go       : Suspension_Object;

   procedure LoRa_Start;

   task LoRa_Send_Task is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end LoRa_Send_Task;

   task LoRa_Receive_Task is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end LoRa_Receive_Task;

end Sx1276_Task;
