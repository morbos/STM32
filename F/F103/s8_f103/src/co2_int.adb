with HAL;           use HAL;
with HAL.UART;      use HAL.UART;
with Peripherals;   use Peripherals;
with Co2_Task;      use Co2_Task;
with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.USARTs;  use STM32.USARTs;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;
with Hw;
package body Co2_Int is

   Step : constant Natural := 128;
   type Co2_Buff_Idx is mod Step;

   C        : UART_Data_8b (1 .. 1);
   Co2_Buff : UART_Data_8b (0 .. Step - 1) := (others => 0);
   Rd       : Co2_Buff_Idx := 0;
   Wr       : Co2_Buff_Idx := 0;

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
         C (1) := UInt8 (Current_Input (USART_3));
         Co2_Buff (Integer (Wr)) := C (1);
         Wr := Wr + 1;
      end IRQ_Handler;

   end Handler;

end Co2_Int;
