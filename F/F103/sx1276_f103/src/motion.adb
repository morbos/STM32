with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with HAL;           use HAL;
with Utils;         use Utils;
with Exti;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Motion is
   task body Motion_Task
   is
   begin
      loop
         Suspend_Until_True (Exti.Motion_Seen);
         Turn_On (Green_LED);
         Suspend_Until_True (Exti.Motion_Stopped);
         Turn_Off (Green_LED);
      end loop;
   end Motion_Task;
end Motion;
