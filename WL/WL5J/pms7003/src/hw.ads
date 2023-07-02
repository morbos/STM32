with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.USARTs;    use STM32.USARTs;
with STM32.SPI;       use STM32.SPI;
with ST7735R;         use ST7735R;
with HAL.SPI;
use STM32; -- for GPIO_Alternate_Function

package Hw
is

   procedure Initialize_HW;

private

   procedure Configure_Button;

   procedure Initialize_UART_GPIO;

   procedure Initialize_UART;

end Hw;
