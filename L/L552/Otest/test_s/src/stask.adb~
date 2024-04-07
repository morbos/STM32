with HAL;           use HAL;
with Ada.Real_Time; use Ada.Real_Time;
package body Stask is
   procedure Led_On (X : UInt4);
   pragma Import (C, Led_On, "led_on");
   task body Idle
   is
      X : UInt4 := 0;
   begin
      loop
         Led_On (X);
         delay until Clock + Milliseconds (1000);
         X := X + 1;
      end loop;
   end Idle;

end Stask;
