
with HAL;           use HAL;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Try_l073 is
   procedure My_Delay (Param : Integer);

   procedure My_Delay (Param : Integer) is
   begin
      delay until Clock + Milliseconds (Param);
   end My_Delay;
begin
   Initialize_Board;
   loop
      Turn_On (LED1);
      My_Delay (1_000);
      Turn_Off (LED1);
      My_Delay (1_000);
   end loop;
end Try_l073;
