with Ada.Interrupts.Names;         use Ada.Interrupts.Names;
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

      procedure EXTI_Handler;
      pragma Attach_Handler (EXTI_Handler, EXTI15_10_Interrupt);

   end Handler;

end Exti;
