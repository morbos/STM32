with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.EXTI;    use STM32.EXTI;
with HAL;           use HAL;

with LoRa_Client;

package body Exti is

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure EXTI_Handler is
      begin
         if External_Interrupt_Pending (EXTI_Line_13) then
            Clear_External_Interrupt (EXTI_Line_13);
            LoRa_Client.Notify_Button := True;
         end if;
      end EXTI_Handler;

   end Handler;

end Exti;
