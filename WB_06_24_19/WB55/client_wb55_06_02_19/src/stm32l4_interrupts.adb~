with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.Timers;  use STM32.Timers;
with STM32.DMA;     use STM32.DMA;
with STM32.GPIO;    use STM32.GPIO;
with HAL;           use HAL;
with Main;          use Main;
with Comm.Run;      use Comm.Run;
with Audio;         use Audio;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

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
               Tick := Tick + 1;
            end if;
         end if;
         if Status (Timer_4, Timer_Update_Indicated) then
            if Interrupt_Enabled (Timer_4, Timer_Update_Interrupt) then
               Clear_Pending_Interrupt (Timer_4, Timer_Update_Interrupt);
               if Is_Server then
                  if not Current_State (Main_Go) then
                     Set_True (Main_Go);
                  end if;
               else
                  if not Connected then
                     Set_True (Client_Go);
                  end if;
               end if;
            end if;
         end if;
      end IRQ_Handler;
   end Handler;

end STM32L4_Interrupts;
