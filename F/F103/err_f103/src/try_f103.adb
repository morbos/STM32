
with HAL;           use HAL;
with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.I2C;     use STM32.I2C;
with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Try_F103 is
   procedure Test;
   pragma Import (C, Test, "test");

   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;
begin
   Initialize_Board;
   Test;
   loop
      Turn_On (Green_LED);
      My_Delay;
      Turn_Off (Green_LED);
      My_Delay;
      Put_Line ("Hello, World!");
   end loop;
end Try_F103;
