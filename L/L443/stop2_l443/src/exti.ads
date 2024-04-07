with HAL;                          use HAL;
with Ada.Interrupts.Names;         use Ada.Interrupts.Names;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package Exti is

   Motion_Seen             : Suspension_Object;
   Motion_Stopped          : Suspension_Object;

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure Motion_Handler;
      pragma Attach_Handler (Motion_Handler, EXTI2_Interrupt);

   end Handler;

end Exti;
