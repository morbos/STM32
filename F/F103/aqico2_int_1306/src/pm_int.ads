with HAL;             use HAL;
with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package PM_Int is

   procedure Set_Threshold (N : Natural);

   function PM_Get_Char return UInt8;

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure IRQ_Handler;
      pragma Attach_Handler (IRQ_Handler, USART1_Interrupt);

   end Handler;

end PM_Int;
