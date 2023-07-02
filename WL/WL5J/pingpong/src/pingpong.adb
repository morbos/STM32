
with HAL;           use HAL;
with HAL.SPI;       use HAL.SPI;
with Utils;         use Utils;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with STM32.SPI;     use STM32.SPI;
with STM32.SYSCFG;  use STM32.SYSCFG;
with STM32.RCC;     use STM32.RCC;
with STM32.USARTs;  use STM32.USARTs;
with STM32.SubGhzPhy; use STM32.SubGhzPhy;
with STM32.SubGhzRF;  use STM32.SubGhzRF;
with Radio_Int;       use Radio_Int;
with App;             use App;
with Hw;              use Hw;

with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure PingPong
is
begin
   Initialize_Board;
   Initialize_HW;
   SubGhzPhy_Init;
   SubGhzRF_Init;

   App_Start;

end PingPong;
