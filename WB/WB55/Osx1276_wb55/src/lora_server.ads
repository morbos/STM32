with System;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package LoRa_Server is

   LoRa_Go          : Suspension_Object;

   task LoRa_Server is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end LoRa_Server;

   procedure LoRa_Start;

end LoRa_Server;
