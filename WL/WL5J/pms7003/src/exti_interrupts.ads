with Ada.Interrupts.Names; use Ada.Interrupts.Names;
with STM32.EXTI;           use STM32.EXTI;
with Peripherals;          use Peripherals;

package Exti_Interrupts is

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure Button_Handler;
      pragma Attach_Handler (Button_Handler, Button_Interrupt);

   end Handler;

end Exti_Interrupts;
