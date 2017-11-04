with Ada.Real_Time; use Ada.Real_Time;

package body Delays is
   Timeout_Time   : Time;
   procedure Init_Timeout (Timeout : Positive)
   is
   begin
      Timeout_Time := Clock + Milliseconds (Timeout);
   end Init_Timeout;
   procedure Delay_Milliseconds (Count : Positive) is
   begin
      delay until Clock + Milliseconds (Count);
   end Delay_Milliseconds;
   function TimeoutP return Boolean
   is
   begin
      if Clock > Timeout_Time then
         return True;
      else
         return False;
      end if;
   end TimeoutP;
end Delays;
