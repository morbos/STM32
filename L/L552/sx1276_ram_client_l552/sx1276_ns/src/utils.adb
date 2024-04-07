with System.Machine_Code; use System.Machine_Code;
private with STM32_SVD.NVIC;
private with Cortex_M_SVD.SCB;
private with Ada.Interrupts;
private with Ada.Interrupts.Names;
pragma Warnings (Off);
private with System.BB.Parameters;
private with System.Interrupts;
private with System.BB.Interrupts;
pragma Warnings (On);

with Ada.Real_Time; use Ada.Real_Time;

package body Utils
is

   function Get_Basepri return UInt32
   is
      R : UInt32;
   begin
      Asm ("mrs %0, BASEPRI", Outputs => UInt32'Asm_Output ("=r", R),
           Volatile => True);
      return R;
   end Get_Basepri;

   procedure Set_Basepri (Pri : UInt32)
   is
   begin
      Asm ("msr BASEPRI, %0", Inputs => UInt32'Asm_Input ("r", Pri),
           Volatile => True);
   end Set_Basepri;
   function GetSetMIN_Basepri return UInt32
   is
      R : UInt32;
   begin
      Asm ("mrs %0, BASEPRI", Outputs => UInt32'Asm_Output ("=r", R),
           Volatile => True);
      Set_Basepri (MIN_BASEPRI);
      return R;
   end GetSetMIN_Basepri;

   procedure MS_Delay (Units : Integer) is
   begin
      delay until Clock + Milliseconds (Units);
   end MS_Delay;

end Utils;
