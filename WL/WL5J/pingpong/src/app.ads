with HAL;          use HAL;
with System;
with Radio_Int;    use Radio_Int;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package App is

   type States is
     (LOWPOWER,
      RX,
      RX_TIMEOUT,
      RX_ERROR,
      TX,
      TX_TIMEOUT,
      CAD,
      CAD_TIMEOUT
     );

   State : States := LOWPOWER;

   IsMaster : Boolean := True;

   task Rx_Task is
      pragma Storage_Size (1 * 1024);
      pragma Priority (System.Max_Priority);
   end Rx_Task;

   task Tx_Task is
      pragma Storage_Size (1 * 1024);
      pragma Priority (System.Max_Priority);
   end Tx_Task;

   task Timeout_Task is
      pragma Storage_Size (1 * 1024);
      pragma Priority (System.Max_Priority);
   end Timeout_Task;

   task Cad_Task is
      pragma Storage_Size (1 * 1024);
      pragma Priority (System.Max_Priority);
   end Cad_Task;

   procedure App_Start;

end App;
