with System.Machine_Code; use System.Machine_Code;

package body Utils is

   NL : constant String := ASCII.LF & ASCII.HT;

   ------------------------
   -- Disable_Interrupts --
   ------------------------

   procedure Disable_Interrupts is
   begin
      Asm ("cpsid i", Volatile => True);
   end Disable_Interrupts;

   -----------------------
   -- Enable_Interrupts --
   -----------------------

   procedure Enable_Interrupts
   is
   begin
      Asm ("cpsie i" & NL
         & "dsb"     & NL
         & "isb",
           Clobber => "memory", Volatile => True);
   end Enable_Interrupts;

   function Get_Primask return UInt32
   is
      R : UInt32;
   begin
      Asm ("mrs %0, PRIMASK", Outputs => UInt32'Asm_Output ("=r", R),
           Volatile => True);
      return R;
   end Get_Primask;

   procedure Set_Primask (R : UInt32)
   is
   begin
      Asm ("msr PRIMASK, %0", Inputs => UInt32'Asm_Input ("r", R),
           Volatile => True);
   end Set_Primask;

end Utils;
