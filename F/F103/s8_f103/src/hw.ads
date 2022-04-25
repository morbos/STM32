with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.USARTs;    use STM32.USARTs;
with STM32.SPI;       use STM32.SPI;
with STM32.EXTI;      use STM32.EXTI;
with SSD1306_SPI;     use SSD1306_SPI;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with HAL.SPI;
use STM32; -- for GPIO_Alternate_Function

package Hw
is
   procedure Initialize_UART;

   procedure Init_Co2_INT;

   Update_Ready        : Suspension_Object;

private

   procedure Initialize_UART_GPIO;

end Hw;
