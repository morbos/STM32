with STM32.GPIO;      use STM32.GPIO;
with System;
with HAL;             use HAL;
with Peripherals;     use Peripherals;
with Ada.Real_Time;   use Ada.Real_Time;

package Neo is

   type Colours is (Red, Green, Blue);

   type Neo_Matrix_Idx is mod 2 ** 6;
   type Neo_Cell is record
      Red     : HAL.UInt8;
      Green   : HAL.UInt8;
      Blue    : HAL.UInt8;
   end record
     with Bit_Order => System.Low_Order_First;

   for Neo_Cell use record
      Red     at 2 range  0 .. 7;
      Green   at 1 range  0 .. 7;
      Blue    at 0 range  0 .. 7;
   end record;

   type Cell3
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            Val : Neo_Cell;
         when True =>
            Arr : UInt8_Array (1 .. 3);
      end case;
   end record
     with Unchecked_Union, Size => 24;

   procedure Test (NeoP : in out GPIO_Point; N : Positive);

   procedure Emit (NeoP : in out GPIO_Point; X : Cell3);

   procedure Test2 (NeoP : in out GPIO_Point);

end Neo;
