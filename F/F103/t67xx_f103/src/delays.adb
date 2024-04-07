with Ada.Real_Time; use Ada.Real_Time;

package body Delays is
   procedure Delay_Milliseconds (Count : Positive) is
   begin
      delay until Clock + Milliseconds (Count);
   end Delay_Milliseconds;
end Delays;
