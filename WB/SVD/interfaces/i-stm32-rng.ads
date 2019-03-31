--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.RNG is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR_RNGEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR_IE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_CED_Field is Interfaces.Bit_Types.Bit;

   type CR_Register is record
      --  unspecified
      Reserved_0_1  : Interfaces.Bit_Types.UInt2 := 16#0#;
      RNGEN         : CR_RNGEN_Field := 16#0#;
      IE            : CR_IE_Field := 16#0#;
      --  unspecified
      Reserved_4_4  : Interfaces.Bit_Types.Bit := 16#0#;
      CED           : CR_CED_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.Bit_Types.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      Reserved_0_1  at 0 range 0 .. 1;
      RNGEN         at 0 range 2 .. 2;
      IE            at 0 range 3 .. 3;
      Reserved_4_4  at 0 range 4 .. 4;
      CED           at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype SR_DRDY_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CECS_Field is Interfaces.Bit_Types.Bit;
   subtype SR_SECS_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CEIS_Field is Interfaces.Bit_Types.Bit;
   subtype SR_SEIS_Field is Interfaces.Bit_Types.Bit;

   type SR_Register is record
      DRDY          : SR_DRDY_Field := 16#0#;
      CECS          : SR_CECS_Field := 16#0#;
      SECS          : SR_SECS_Field := 16#0#;
      --  unspecified
      Reserved_3_4  : Interfaces.Bit_Types.UInt2 := 16#0#;
      CEIS          : SR_CEIS_Field := 16#0#;
      SEIS          : SR_SEIS_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.Bit_Types.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      DRDY          at 0 range 0 .. 0;
      CECS          at 0 range 1 .. 1;
      SECS          at 0 range 2 .. 2;
      Reserved_3_4  at 0 range 3 .. 4;
      CEIS          at 0 range 5 .. 5;
      SEIS          at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type RNG_Peripheral is record
      CR : aliased CR_Register;
      SR : aliased SR_Register;
      DR : aliased Interfaces.Bit_Types.Word;
   end record
     with Volatile;

   for RNG_Peripheral use record
      CR at 16#0# range 0 .. 31;
      SR at 16#4# range 0 .. 31;
      DR at 16#8# range 0 .. 31;
   end record;

   RNG_Periph : aliased RNG_Peripheral
     with Import, Address => System'To_Address (16#58001000#);

end Interfaces.STM32.RNG;
