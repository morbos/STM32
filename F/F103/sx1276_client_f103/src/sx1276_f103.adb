
with HAL;           use HAL;
with HAL.SPI;       use HAL.SPI;
with SX1276_SPI;    use SX1276_SPI;
with Peripherals;   use Peripherals;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with STM32.SPI;     use STM32.SPI;
with STM32.SYSCFG;  use STM32.SYSCFG;
with STM32.EXTI;    use STM32.EXTI;
with STM32.RCC;     use STM32.RCC;

with SX1276_API;    use SX1276_API;
with LoRa_Client;   use LoRa_Client;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;
with Exti;  pragma Unreferenced (Exti);

procedure SX1276_f103 is

begin
   Initialize_Board;
   Initialize_SX1276;
   LoRa_Start;
   loop
      null;
   end loop;
end SX1276_f103;
