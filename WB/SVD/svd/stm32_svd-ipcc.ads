--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.IPCC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   type C1CR_Register is record
      RXOIE          : Boolean := False;
      --  unspecified
      Reserved_1_15  : HAL.UInt15 := 16#0#;
      TXFIE          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1CR_Register use record
      RXOIE          at 0 range 0 .. 0;
      Reserved_1_15  at 0 range 1 .. 15;
      TXFIE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   type C1MR_Register is record
      CH1OM          : Boolean := False;
      CH2OM          : Boolean := False;
      CH3OM          : Boolean := False;
      CH4OM          : Boolean := False;
      CH5OM          : Boolean := False;
      CH6OM          : Boolean := False;
      --  unspecified
      Reserved_6_15  : HAL.UInt10 := 16#0#;
      CH1FM          : Boolean := False;
      CH2FM          : Boolean := False;
      CH3FM          : Boolean := False;
      CH4FM          : Boolean := False;
      CH5FM          : Boolean := False;
      CH6FM          : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1MR_Register use record
      CH1OM          at 0 range 0 .. 0;
      CH2OM          at 0 range 1 .. 1;
      CH3OM          at 0 range 2 .. 2;
      CH4OM          at 0 range 3 .. 3;
      CH5OM          at 0 range 4 .. 4;
      CH6OM          at 0 range 5 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      CH1FM          at 0 range 16 .. 16;
      CH2FM          at 0 range 17 .. 17;
      CH3FM          at 0 range 18 .. 18;
      CH4FM          at 0 range 19 .. 19;
      CH5FM          at 0 range 20 .. 20;
      CH6FM          at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   type C1SCR_Register is record
      CH1C           : Boolean := False;
      CH2C           : Boolean := False;
      CH3C           : Boolean := False;
      CH4C           : Boolean := False;
      CH5C           : Boolean := False;
      CH6C           : Boolean := False;
      --  unspecified
      Reserved_6_15  : HAL.UInt10 := 16#0#;
      CH1S           : Boolean := False;
      CH2S           : Boolean := False;
      CH3S           : Boolean := False;
      CH4S           : Boolean := False;
      CH5S           : Boolean := False;
      CH6S           : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1SCR_Register use record
      CH1C           at 0 range 0 .. 0;
      CH2C           at 0 range 1 .. 1;
      CH3C           at 0 range 2 .. 2;
      CH4C           at 0 range 3 .. 3;
      CH5C           at 0 range 4 .. 4;
      CH6C           at 0 range 5 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      CH1S           at 0 range 16 .. 16;
      CH2S           at 0 range 17 .. 17;
      CH3S           at 0 range 18 .. 18;
      CH4S           at 0 range 19 .. 19;
      CH5S           at 0 range 20 .. 20;
      CH6S           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   type C1TOC2SR_Register is record
      CH1F          : Boolean := False;
      CH2F          : Boolean := False;
      CH3F          : Boolean := False;
      CH4F          : Boolean := False;
      CH5F          : Boolean := False;
      CH6F          : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1TOC2SR_Register use record
      CH1F          at 0 range 0 .. 0;
      CH2F          at 0 range 1 .. 1;
      CH3F          at 0 range 2 .. 2;
      CH4F          at 0 range 3 .. 3;
      CH5F          at 0 range 4 .. 4;
      CH6F          at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   type C2CR_Register is record
      RXOIE          : Boolean := False;
      --  unspecified
      Reserved_1_15  : HAL.UInt15 := 16#0#;
      TXFIE          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2CR_Register use record
      RXOIE          at 0 range 0 .. 0;
      Reserved_1_15  at 0 range 1 .. 15;
      TXFIE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   type C2MR_Register is record
      CH1OM          : Boolean := False;
      CH2OM          : Boolean := False;
      CH3OM          : Boolean := False;
      CH4OM          : Boolean := False;
      CH5OM          : Boolean := False;
      CH6OM          : Boolean := False;
      --  unspecified
      Reserved_6_15  : HAL.UInt10 := 16#0#;
      CH1FM          : Boolean := False;
      CH2FM          : Boolean := False;
      CH3FM          : Boolean := False;
      CH4FM          : Boolean := False;
      CH5FM          : Boolean := False;
      CH6FM          : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2MR_Register use record
      CH1OM          at 0 range 0 .. 0;
      CH2OM          at 0 range 1 .. 1;
      CH3OM          at 0 range 2 .. 2;
      CH4OM          at 0 range 3 .. 3;
      CH5OM          at 0 range 4 .. 4;
      CH6OM          at 0 range 5 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      CH1FM          at 0 range 16 .. 16;
      CH2FM          at 0 range 17 .. 17;
      CH3FM          at 0 range 18 .. 18;
      CH4FM          at 0 range 19 .. 19;
      CH5FM          at 0 range 20 .. 20;
      CH6FM          at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   type C2SCR_Register is record
      CH1C           : Boolean := False;
      CH2C           : Boolean := False;
      CH3C           : Boolean := False;
      CH4C           : Boolean := False;
      CH5C           : Boolean := False;
      CH6C           : Boolean := False;
      --  unspecified
      Reserved_6_15  : HAL.UInt10 := 16#0#;
      CH1S           : Boolean := False;
      CH2S           : Boolean := False;
      CH3S           : Boolean := False;
      CH4S           : Boolean := False;
      CH5S           : Boolean := False;
      CH6S           : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2SCR_Register use record
      CH1C           at 0 range 0 .. 0;
      CH2C           at 0 range 1 .. 1;
      CH3C           at 0 range 2 .. 2;
      CH4C           at 0 range 3 .. 3;
      CH5C           at 0 range 4 .. 4;
      CH6C           at 0 range 5 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      CH1S           at 0 range 16 .. 16;
      CH2S           at 0 range 17 .. 17;
      CH3S           at 0 range 18 .. 18;
      CH4S           at 0 range 19 .. 19;
      CH5S           at 0 range 20 .. 20;
      CH6S           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   type C2TOC1SR_Register is record
      CH1F          : Boolean := False;
      CH2F          : Boolean := False;
      CH3F          : Boolean := False;
      CH4F          : Boolean := False;
      CH5F          : Boolean := False;
      CH6F          : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2TOC1SR_Register use record
      CH1F          at 0 range 0 .. 0;
      CH2F          at 0 range 1 .. 1;
      CH3F          at 0 range 2 .. 2;
      CH4F          at 0 range 3 .. 3;
      CH5F          at 0 range 4 .. 4;
      CH6F          at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type IPCC_Peripheral is record
      C1CR     : aliased C1CR_Register;
      C1MR     : aliased C1MR_Register;
      C1SCR    : aliased C1SCR_Register;
      C1TOC2SR : aliased C1TOC2SR_Register;
      C2CR     : aliased C2CR_Register;
      C2MR     : aliased C2MR_Register;
      C2SCR    : aliased C2SCR_Register;
      C2TOC1SR : aliased C2TOC1SR_Register;
   end record
     with Volatile;

   for IPCC_Peripheral use record
      C1CR     at 16#0# range 0 .. 31;
      C1MR     at 16#4# range 0 .. 31;
      C1SCR    at 16#8# range 0 .. 31;
      C1TOC2SR at 16#C# range 0 .. 31;
      C2CR     at 16#10# range 0 .. 31;
      C2MR     at 16#14# range 0 .. 31;
      C2SCR    at 16#18# range 0 .. 31;
      C2TOC1SR at 16#1C# range 0 .. 31;
   end record;

   IPCC_Periph : aliased IPCC_Peripheral
     with Import, Address => System'To_Address (16#58000C00#);

end STM32_SVD.IPCC;
