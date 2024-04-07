with HAL;                 use HAL;
package Utils is

   procedure Disable_Interrupts;
   procedure Enable_Interrupts;
   function Get_Primask return UInt32;
   procedure Set_Primask (R : UInt32);

end Utils;
