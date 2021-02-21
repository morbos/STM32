with HAL;    use HAL;
with Ada.Interrupts.Names;         use Ada.Interrupts.Names;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Exti is

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure EXTI_Handler;
      pragma Attach_Handler (EXTI_Handler, EXTI13_Interrupt);

   end Handler;

end Exti;
