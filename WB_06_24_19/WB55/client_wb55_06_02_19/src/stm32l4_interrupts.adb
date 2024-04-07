with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.Timers;  use STM32.Timers;
with HAL;           use HAL;
with Main;          use Main;
with Comm.Run;      use Comm.Run;
with Log;           use Log;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with STM32L4_Interrupts;  pragma Unreferenced (STM32L4_Interrupts);

package body STM32L4_Interrupts is

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure IRQ_Handler is
      begin
         if Status (Timer_2, Timer_Update_Indicated) then
            if Interrupt_Enabled (Timer_2, Timer_Update_Interrupt) then
               Clear_Pending_Interrupt (Timer_2, Timer_Update_Interrupt);
               if Is_Client then
                  if not Connected then
                     Logger (16#84#);
                     Set_True (Client_Go);
                  end if;
               end if;
            end if;
         end if;
      end IRQ_Handler;
   end Handler;

end STM32L4_Interrupts;
