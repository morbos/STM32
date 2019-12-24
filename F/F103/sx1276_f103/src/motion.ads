with System;
package Motion is

   task Motion_Task is
      pragma Storage_Size (1 * 1024);
      pragma Priority (System.Max_Priority);
   end Motion_Task;

end Motion;
