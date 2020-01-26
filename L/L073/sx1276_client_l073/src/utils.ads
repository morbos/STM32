with Interfaces;    use Interfaces;
with HAL;           use HAL;


package Utils
is
   MAX_BASEPRI : constant := 16#40#; --  Group 3. Any group lower can get in
   MIN_BASEPRI : constant := 16#20#; --  Group 2. Our ISR serve base.
   DMA_BASEPRI : constant := 16#10#; --  Group 1. The highest pri
   function Get_Basepri return UInt32;

   procedure Set_Basepri (Pri : UInt32);

   function GetSetMIN_Basepri return UInt32;

   procedure MS_Delay (Units : Integer);

end Utils;
