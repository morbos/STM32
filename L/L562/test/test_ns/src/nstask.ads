with System;

package NStask is

   task Idle is
      pragma Storage_Size (1 * 1024);
      pragma Priority (System.Max_Priority);
   end Idle;

end NStask;
