with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with Peripherals;   use Peripherals;
with HAL;           use HAL;
with Utils;         use Utils;
with Exti;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Motion is
   task body Motion_Task
   is
   begin
      loop
         Suspend_Until_True (Exti.Motion_Seen);
         Turn_Off (LED_Pin);
         Suspend_Until_True (Exti.Motion_Stopped);
         Turn_On (LED_Pin);
      end loop;
   end Motion_Task;
end Motion;
