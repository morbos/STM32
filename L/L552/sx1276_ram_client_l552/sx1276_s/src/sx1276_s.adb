with HAL;            use HAL;
with HAL.SPI;        use HAL.SPI;
with Ada.Real_Time;  use Ada.Real_Time;
with NS_Api;         use NS_Api;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with SX1276_API;     use SX1276_API;
with Trace;          use Trace;
with CM33;           use CM33;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

procedure SX1276_S is
   procedure S_To_NS;
   pragma Import (C, S_To_NS, "s_to_ns");
begin
   Initialize_Board;
   Init_CM33;
   S_To_NS; --  S_To_NS will not return.
end SX1276_S;
