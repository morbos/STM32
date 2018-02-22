with STM32.GPIO;      use STM32.GPIO;
with HAL;             use HAL;
with HAL.SPI;
with System;
with Ada.Real_Time;   use Ada.Real_Time;

package Dotstar is

   type Colours is (Red, Green, Blue);

   type Dotstar_Matrix_Idx is mod 2 ** 6;
   type Dotstar_Cell is record
      Red     : HAL.UInt8;
      Green   : HAL.UInt8;
      Blue    : HAL.UInt8;
      Global  : HAL.UInt5;
      Rsvd    : HAL.UInt3 := 2#111#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for Dotstar_Cell use record
      Red     at 3 range  0 .. 7;
      Green   at 2 range  0 .. 7;
      Blue    at 1 range  0 .. 7;
      Global  at 0 range  0 .. 4;
      Rsvd    at 0 range  5 .. 7;
   end record;

   type Cell4
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            Val : Dotstar_Cell;
         when True =>
            Arr : HAL.SPI.SPI_Data_8b (1 .. 4);
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access;

   type Dotstar_Elem
     (Port  : not null HAL.SPI.Any_SPI_Port) is limited private;

   procedure Initialize (This : in out Dotstar_Elem);

   procedure Test (This : in out Dotstar_Elem; Index : Dotstar_Matrix_Idx);

private

   type Dotstar_Elem (Port : not null HAL.SPI.Any_SPI_Port)
   is limited record
      null;
   end record;

end Dotstar;
