with Ada.Interrupts.Names; use Ada.Interrupts.Names;
with STM32.EXTI;           use STM32.EXTI;
with Peripherals;          use Peripherals;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Exti is

   Tx_Done                 : Suspension_Object;
   Rx_Done                 : Suspension_Object;


   Tx_Done_Flag            : Boolean;
   Rx_Done_Flag            : Boolean;
   Rx_Error_Flag           : Boolean;
   Cad_Done_Flag           : Boolean;

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure SW1_Handler;
      pragma Attach_Handler (SW1_Handler, SW1_Interrupt);

      procedure SW2_Handler;
      pragma Attach_Handler (SW2_Handler, SW2_Interrupt);

      procedure EXTI_Handler;
      pragma Attach_Handler (EXTI_Handler, EXTI2_Interrupt);
      pragma Attach_Handler (EXTI_Handler, EXTI3_Interrupt);


   end Handler;

end Exti;
