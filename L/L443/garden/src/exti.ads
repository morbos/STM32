with HAL;                          use HAL;
with Ada.Interrupts.Names;         use Ada.Interrupts.Names;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Exti is

   Tx_Done                 : Suspension_Object;
   Rx_Done                 : Suspension_Object;
   Motion_Seen             : Suspension_Object;
   Motion_Stopped          : Suspension_Object;

   Tx_Done_Flag            : Boolean;
   Rx_Done_Flag            : Boolean;
   Rx_Error_Flag           : Boolean;
   Cad_Done_Flag           : Boolean;

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure EXTI_Handler;
      pragma Attach_Handler (EXTI_Handler, EXTI0_Interrupt);
      pragma Attach_Handler (EXTI_Handler, EXTI1_Interrupt);

      procedure Motion_Handler;
      pragma Attach_Handler (Motion_Handler, EXTI2_Interrupt);

   end Handler;

end Exti;
