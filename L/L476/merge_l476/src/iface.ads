with Interfaces.C;   use Interfaces.C;
with Ada.Real_Time;  use Ada.Real_Time;

package Iface is

   procedure Iface_Init;

   procedure HAL_Delay (Dly : unsigned) with
     Convention => C,
     Export => True,
     External_Name => "HAL_Delay";

   function HAL_GetTick return unsigned with
     Convention => C,
     Export => True,
     External_Name => "HAL_GetTick";

end Iface;
