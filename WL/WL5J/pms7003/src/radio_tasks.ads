with HAL;          use HAL;
with HAL.SPI;      use HAL.SPI;
with LoRa;         use LoRa;
with System;
with Radio_Int;    use Radio_Int;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with Gen_List;

package Radio_Tasks is

   RADIO_MAX_TX_QUEUE : constant Natural := 5;
   package Radio_Tx_Queue_T is new Gen_List (LoRa_Message, RADIO_MAX_TX_QUEUE);
   use Radio_Tx_Queue_T;

   Radio_Tx_Queue_Buffer   : ListNode_Array;

   procedure Radio_Tasks_Init;

   task Radio_Task_Manager is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end Radio_Task_Manager;

end Radio_Tasks;
