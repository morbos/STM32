with Ada.Real_Time; use Ada.Real_Time;
package body NStask is

   task body Idle
   is
   begin
      loop
         delay until Clock + Milliseconds (1000);
      end loop;
   end Idle;

end NStask;
