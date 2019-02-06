with HAL;           use HAL;
with Peripherals;   use Peripherals;
with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.EXTI;    use STM32.EXTI;
with Hci;           use Hci;

package body BlueNrg_Int is

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure IRQ_Handler
      is
      begin
         if External_Interrupt_Pending (EXTI_Line_5) then
            HCI_Isr;
            HCI_ProcessEvent := True;
         end if;
      end IRQ_Handler;

   end Handler;

end BlueNrg_Int;
