with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package Co2_Int is

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure IRQ_Handler;
      pragma Attach_Handler (IRQ_Handler, EXTI1_Interrupt);

   end Handler;

end Co2_Int;
