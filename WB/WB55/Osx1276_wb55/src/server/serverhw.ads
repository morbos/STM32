with System;

package ServerHW is

   procedure Configure_SW2;

   procedure Initialize_Server_HW;

   task SW2_Task is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end SW2_Task;

end ServerHW;
