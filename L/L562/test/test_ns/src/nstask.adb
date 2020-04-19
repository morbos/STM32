with HAL;            use HAL;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with Ada.Real_Time; use Ada.Real_Time;
package body NStask is

   task body Idle
   is
      function NS_To_S (X : UInt32) return UInt32;
      pragma Import (C, NS_To_S, "s_from_ns_veneer");
      X : UInt32 := 0;
   begin
      loop
         X := 1 + NS_To_S (X);
         delay until Clock + Milliseconds (1000);
      end loop;
   end Idle;

end NStask;
