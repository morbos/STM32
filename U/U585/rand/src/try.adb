with HAL;           use HAL;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.RNG;
with STM32.Board;   use STM32.Board;
with Ada.Text_IO;   use Ada.Text_IO;

with Semihosting;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Try is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;
   Rand : UInt32;
begin
   Initialize_Board;
   STM32.RNG.Enable_Rng;

   loop
      Rand := STM32.RNG.Random;
      Semihosting.Log_Line ("Rand: " & Rand'Img); --  Output needs scaling by 2**(n+1);
      Turn_On (Green_LED);
      My_Delay;
      Turn_Off (Green_LED);
      My_Delay;
   end loop;
end Try;
