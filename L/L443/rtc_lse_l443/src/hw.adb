with HAL;              use HAL;
with STM32.RCC;        use STM32.RCC;
with STM32_SVD.RCC;    use STM32_SVD.RCC;
with STM32.EXTI;       use STM32.EXTI;
with STM32_SVD.EXTI;   use STM32_SVD.EXTI;

package body Hw is

   procedure Enable_EXTI20
   is
      Line : constant External_Line_Number := EXTI_Line_20;
      Index : constant Natural := External_Line_Number'Pos (Line);
   begin
      Enable_External_Interrupt (Line, Interrupt_Rising_Edge);
--      EXTI_Periph.IMR1.Arr (Index) := True;
   end Enable_EXTI20;

   procedure RTC_Use_Lse
   is
   begin
      RCC_Periph.BDCR.LSEON := True;
      loop
         exit when RCC_Periph.BDCR.LSERDY;
      end loop;
      loop
         RCC_Periph.BDCR.RTCSEL := 1;
         exit when RCC_Periph.BDCR.RTCSEL = 1;
      end loop;
   end RTC_Use_Lse;

end Hw;
