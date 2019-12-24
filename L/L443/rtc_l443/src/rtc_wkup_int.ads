with Ada.Interrupts.Names; use Ada.Interrupts.Names;

package Rtc_Wkup_Int is

   protected Handler is
      pragma Interrupt_Priority;

   private

      procedure RTC_Wkup_Handler;
      pragma Attach_Handler (RTC_Wkup_Handler, RTC_WKUP_Interrupt);

   end Handler;

end Rtc_Wkup_Int;
