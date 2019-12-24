with HAL;    use HAL;
--  with NStask; use NStask;
with Ada.Real_Time; use Ada.Real_Time;
procedure Test_Ns is
   function NS_To_S (X : UInt32) return UInt32;
   pragma Import (C, NS_To_S, "s_from_ns_veneer");
   X : UInt32 := 0;
   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;
begin
   loop
--      X := 1 + NS_To_S (X);
      My_Delay;
--      null;
   end loop;
end Test_Ns;
