with HAL;                use HAL;
with STM32.Device;       use STM32.Device;
with STM32.Board;        use STM32.Board;
with CM33;               use CM33;

with Ada.Real_Time; use Ada.Real_Time;

use STM32; -- for GPIO_Alternate_Function

procedure Test_S is
   procedure S_To_NS;
   pragma Import (C, S_To_NS, "s_to_ns");
begin
   Initialize_Board;
   Init_CM33;
   S_To_NS; --  S_To_NS will not return.
end Test_S;
