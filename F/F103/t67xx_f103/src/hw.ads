with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.I2C;       use STM32.I2C;
with STM32.SPI;       use STM32.SPI;
with STM32.EXTI;      use STM32.EXTI;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with HAL.SPI;
use STM32; -- for GPIO_Alternate_Function

package Hw
is

   procedure Init_Co2_HW;

private

   procedure Initialize_Co2_I2C (Port     : access I2C_Port;
                                 SCL      : GPIO_Point;
                                 SDA      : GPIO_Point);

end Hw;
