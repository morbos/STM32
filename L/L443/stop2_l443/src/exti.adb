with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.EXTI;    use STM32.EXTI;
with HAL;           use HAL;
with Utils;         use Utils;
with Peripherals;   use Peripherals;

package body Exti is

   type Motion_Enum is (Waiting_For_High, Waiting_For_Low);

   Motion_State : Motion_Enum := Waiting_For_High;

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure Motion_Handler is
      begin
         if External_Interrupt_Pending (EXTI_Line_2) then
            Clear_External_Interrupt (EXTI_Line_2);
               Set_True (Motion_Seen);
--            if Motion_State = Waiting_For_High then
--               Set_True (Motion_Seen);
--               Enable_External_Interrupt (EXTI_Line_2, Interrupt_Falling_Edge);
--               Motion_State := Waiting_For_Low;
--            else
--               Set_True (Motion_Stopped);
--               Enable_External_Interrupt (EXTI_Line_2, Interrupt_Rising_Edge);
--               Motion_State := Waiting_For_High;
--            end if;
         end if;
      end Motion_Handler;

   end Handler;

end Exti;
