with HAL;           use HAL;
with Peripherals;   use Peripherals;
with Co2_Task;      use Co2_Task;
with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.EXTI;    use STM32.EXTI;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Hw;
package body Co2_Int is

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure IRQ_Handler
      is
      begin
         if External_Interrupt_Pending (EXTI_Line_1) then
            Clear_External_Interrupt (EXTI_Line_1);
            Set_True (Co2_Ready);
         end if;
      end IRQ_Handler;

   end Handler;

end Co2_Int;
