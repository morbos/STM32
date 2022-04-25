with HAL;             use HAL;
with PM_Int;          use PM_Int;
with Ada.Real_Time;   use Ada.Real_Time;
with Hw;              use Hw;
package body PM_Task is

   function Check_Valid return Boolean
   is
      Sum : UInt16 := 0;
   begin
      --  First 30 summed, last 2 are the sum
      for I in 1 .. 30 loop
         Sum := Sum + UInt16 (PM_Curr (I));
      end loop;
      if Swap (Frm.Csum) = Sum then
         return True;
      else
         return False;
      end if;
   end Check_Valid;

   task body New_PM
   is
   begin
      loop
         Suspend_Until_True (PM_Ready);
         if Check_Valid then
            Turn_Off (Green_LED);
            PM_Valid := True;
            Set_True (Update_Ready);
         else
            PM_Curr := (others => 0);
            Turn_On (Green_LED);
            PM_Valid := False;
         end if;
      end loop;
   end New_PM;
end PM_Task;
