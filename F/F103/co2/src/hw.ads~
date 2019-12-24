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
   procedure Initialize_UART;

   procedure Initialize_Screen (Display : in out ST7735R_Screen);

private

   procedure Initialize_Screen_GPIO
     (Port     : access SPI_Port;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point;
      MISO     : GPIO_Point;
      CS       : GPIO_Point;
      RST      : GPIO_Point;
      RS       : GPIO_Point
     );


   procedure Initialize_UART_GPIO;

end Hw;
