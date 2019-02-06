with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package BlueNrg_Int is

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure IRQ_Handler;
      pragma Attach_Handler (IRQ_Handler, EXTI9_5_Interrupt);

   end Handler;

end BlueNrg_Int;
