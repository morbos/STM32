with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package STM32L4_Interrupts is

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure IRQ_Handler;
      pragma Attach_Handler (IRQ_Handler, TIM2_Interrupt);

   end Handler;

end STM32L4_Interrupts;
