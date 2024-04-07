package body Iface is

   Og_Time : Time;

   procedure Iface_Init is
   begin
      Og_Time := Clock;
   end Iface_Init;

   procedure HAL_Delay (Dly : unsigned)
   is
   begin
      delay until Clock + Milliseconds (10);
   end HAL_Delay;

   function HAL_GetTick return unsigned
   is
      Newtime : Time := Clock;
      Diff    : Time_Span;
      Retval  : Unsigned := 0;
      for Retval'Address use Diff'Address;
   begin
      Diff := Newtime - Og_Time;
      return Retval;
   end HAL_GetTick;

end Iface;
