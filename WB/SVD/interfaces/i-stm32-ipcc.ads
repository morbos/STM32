--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.IPCC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype C1CR_RXOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C1CR_TXFIE_Field is Interfaces.Bit_Types.Bit;

   type C1CR_Register is record
      RXOIE          : C1CR_RXOIE_Field := 16#0#;
      --  unspecified
      Reserved_1_15  : Interfaces.Bit_Types.UInt15 := 16#0#;
      TXFIE          : C1CR_TXFIE_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1CR_Register use record
      RXOIE          at 0 range 0 .. 0;
      Reserved_1_15  at 0 range 1 .. 15;
      TXFIE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype C1MR_CH1OM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH2OM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH3OM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH4OM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH5OM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH6OM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH1FM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH2FM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH3FM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH4FM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH5FM_Field is Interfaces.Bit_Types.Bit;
   subtype C1MR_CH6FM_Field is Interfaces.Bit_Types.Bit;

   type C1MR_Register is record
      CH1OM          : C1MR_CH1OM_Field := 16#0#;
      CH2OM          : C1MR_CH2OM_Field := 16#0#;
      CH3OM          : C1MR_CH3OM_Field := 16#0#;
      CH4OM          : C1MR_CH4OM_Field := 16#0#;
      CH5OM          : C1MR_CH5OM_Field := 16#0#;
      CH6OM          : C1MR_CH6OM_Field := 16#0#;
      --  unspecified
      Reserved_6_15  : Interfaces.Bit_Types.UInt10 := 16#0#;
      CH1FM          : C1MR_CH1FM_Field := 16#0#;
      CH2FM          : C1MR_CH2FM_Field := 16#0#;
      CH3FM          : C1MR_CH3FM_Field := 16#0#;
      CH4FM          : C1MR_CH4FM_Field := 16#0#;
      CH5FM          : C1MR_CH5FM_Field := 16#0#;
      CH6FM          : C1MR_CH6FM_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
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

   subtype C1SCR_CH1C_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH2C_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH3C_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH4C_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH5C_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH6C_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH1S_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH2S_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH3S_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH4S_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH5S_Field is Interfaces.Bit_Types.Bit;
   subtype C1SCR_CH6S_Field is Interfaces.Bit_Types.Bit;

   type C1SCR_Register is record
      CH1C           : C1SCR_CH1C_Field := 16#0#;
      CH2C           : C1SCR_CH2C_Field := 16#0#;
      CH3C           : C1SCR_CH3C_Field := 16#0#;
      CH4C           : C1SCR_CH4C_Field := 16#0#;
      CH5C           : C1SCR_CH5C_Field := 16#0#;
      CH6C           : C1SCR_CH6C_Field := 16#0#;
      --  unspecified
      Reserved_6_15  : Interfaces.Bit_Types.UInt10 := 16#0#;
      CH1S           : C1SCR_CH1S_Field := 16#0#;
      CH2S           : C1SCR_CH2S_Field := 16#0#;
      CH3S           : C1SCR_CH3S_Field := 16#0#;
      CH4S           : C1SCR_CH4S_Field := 16#0#;
      CH5S           : C1SCR_CH5S_Field := 16#0#;
      CH6S           : C1SCR_CH6S_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
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

   subtype C1TOC2SR_CH1F_Field is Interfaces.Bit_Types.Bit;
   subtype C1TOC2SR_CH2F_Field is Interfaces.Bit_Types.Bit;
   subtype C1TOC2SR_CH3F_Field is Interfaces.Bit_Types.Bit;
   subtype C1TOC2SR_CH4F_Field is Interfaces.Bit_Types.Bit;
   subtype C1TOC2SR_CH5F_Field is Interfaces.Bit_Types.Bit;
   subtype C1TOC2SR_CH6F_Field is Interfaces.Bit_Types.Bit;

   type C1TOC2SR_Register is record
      CH1F          : C1TOC2SR_CH1F_Field := 16#0#;
      CH2F          : C1TOC2SR_CH2F_Field := 16#0#;
      CH3F          : C1TOC2SR_CH3F_Field := 16#0#;
      CH4F          : C1TOC2SR_CH4F_Field := 16#0#;
      CH5F          : C1TOC2SR_CH5F_Field := 16#0#;
      CH6F          : C1TOC2SR_CH6F_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.Bit_Types.UInt26 := 16#0#;
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

   subtype C2CR_RXOIE_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_TXFIE_Field is Interfaces.Bit_Types.Bit;

   type C2CR_Register is record
      RXOIE          : C2CR_RXOIE_Field := 16#0#;
      --  unspecified
      Reserved_1_15  : Interfaces.Bit_Types.UInt15 := 16#0#;
      TXFIE          : C2CR_TXFIE_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2CR_Register use record
      RXOIE          at 0 range 0 .. 0;
      Reserved_1_15  at 0 range 1 .. 15;
      TXFIE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype C2MR_CH1OM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH2OM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH3OM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH4OM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH5OM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH6OM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH1FM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH2FM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH3FM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH4FM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH5FM_Field is Interfaces.Bit_Types.Bit;
   subtype C2MR_CH6FM_Field is Interfaces.Bit_Types.Bit;

   type C2MR_Register is record
      CH1OM          : C2MR_CH1OM_Field := 16#0#;
      CH2OM          : C2MR_CH2OM_Field := 16#0#;
      CH3OM          : C2MR_CH3OM_Field := 16#0#;
      CH4OM          : C2MR_CH4OM_Field := 16#0#;
      CH5OM          : C2MR_CH5OM_Field := 16#0#;
      CH6OM          : C2MR_CH6OM_Field := 16#0#;
      --  unspecified
      Reserved_6_15  : Interfaces.Bit_Types.UInt10 := 16#0#;
      CH1FM          : C2MR_CH1FM_Field := 16#0#;
      CH2FM          : C2MR_CH2FM_Field := 16#0#;
      CH3FM          : C2MR_CH3FM_Field := 16#0#;
      CH4FM          : C2MR_CH4FM_Field := 16#0#;
      CH5FM          : C2MR_CH5FM_Field := 16#0#;
      CH6FM          : C2MR_CH6FM_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
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

   subtype C2SCR_CH1C_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH2C_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH3C_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH4C_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH5C_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH6C_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH1S_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH2S_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH3S_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH4S_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH5S_Field is Interfaces.Bit_Types.Bit;
   subtype C2SCR_CH6S_Field is Interfaces.Bit_Types.Bit;

   type C2SCR_Register is record
      CH1C           : C2SCR_CH1C_Field := 16#0#;
      CH2C           : C2SCR_CH2C_Field := 16#0#;
      CH3C           : C2SCR_CH3C_Field := 16#0#;
      CH4C           : C2SCR_CH4C_Field := 16#0#;
      CH5C           : C2SCR_CH5C_Field := 16#0#;
      CH6C           : C2SCR_CH6C_Field := 16#0#;
      --  unspecified
      Reserved_6_15  : Interfaces.Bit_Types.UInt10 := 16#0#;
      CH1S           : C2SCR_CH1S_Field := 16#0#;
      CH2S           : C2SCR_CH2S_Field := 16#0#;
      CH3S           : C2SCR_CH3S_Field := 16#0#;
      CH4S           : C2SCR_CH4S_Field := 16#0#;
      CH5S           : C2SCR_CH5S_Field := 16#0#;
      CH6S           : C2SCR_CH6S_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
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

   subtype C2TOC1SR_CH1F_Field is Interfaces.Bit_Types.Bit;
   subtype C2TOC1SR_CH2F_Field is Interfaces.Bit_Types.Bit;
   subtype C2TOC1SR_CH3F_Field is Interfaces.Bit_Types.Bit;
   subtype C2TOC1SR_CH4F_Field is Interfaces.Bit_Types.Bit;
   subtype C2TOC1SR_CH5F_Field is Interfaces.Bit_Types.Bit;
   subtype C2TOC1SR_CH6F_Field is Interfaces.Bit_Types.Bit;

   type C2TOC1SR_Register is record
      CH1F          : C2TOC1SR_CH1F_Field := 16#0#;
      CH2F          : C2TOC1SR_CH2F_Field := 16#0#;
      CH3F          : C2TOC1SR_CH3F_Field := 16#0#;
      CH4F          : C2TOC1SR_CH4F_Field := 16#0#;
      CH5F          : C2TOC1SR_CH5F_Field := 16#0#;
      CH6F          : C2TOC1SR_CH6F_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.Bit_Types.UInt26 := 16#0#;
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

end Interfaces.STM32.IPCC;
