--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.HSEM is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype R_PROCID_Field is Interfaces.Bit_Types.Byte;
   subtype R_COREID_Field is Interfaces.Bit_Types.UInt4;
   subtype R_LOCK_Field is Interfaces.Bit_Types.Bit;

   type R_Register is record
      PROCID         : R_PROCID_Field := 16#0#;
      COREID         : R_COREID_Field := 16#0#;
      --  unspecified
      Reserved_12_30 : Interfaces.Bit_Types.UInt19 := 16#0#;
      LOCK           : R_LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for R_Register use record
      PROCID         at 0 range 0 .. 7;
      COREID         at 0 range 8 .. 11;
      Reserved_12_30 at 0 range 12 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype RLR_PROCID_Field is Interfaces.Bit_Types.Byte;
   subtype RLR_COREID_Field is Interfaces.Bit_Types.UInt4;
   subtype RLR_LOCK_Field is Interfaces.Bit_Types.Bit;

   type RLR_Register is record
      PROCID         : RLR_PROCID_Field := 16#0#;
      COREID         : RLR_COREID_Field := 16#0#;
      --  unspecified
      Reserved_12_30 : Interfaces.Bit_Types.UInt19 := 16#0#;
      LOCK           : RLR_LOCK_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RLR_Register use record
      PROCID         at 0 range 0 .. 7;
      COREID         at 0 range 8 .. 11;
      Reserved_12_30 at 0 range 12 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype CR_COREID_Field is Interfaces.Bit_Types.UInt4;
   subtype CR_KEY_Field is Interfaces.Bit_Types.Short;

   type CR_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.Bit_Types.Byte := 16#0#;
      COREID         : CR_COREID_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : Interfaces.Bit_Types.UInt4 := 16#0#;
      KEY            : CR_KEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      COREID         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      KEY            at 0 range 16 .. 31;
   end record;

   subtype KEYR_KEY_Field is Interfaces.Bit_Types.Short;

   type KEYR_Register is record
      --  unspecified
      Reserved_0_15 : Interfaces.Bit_Types.Short := 16#0#;
      KEY           : KEYR_KEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for KEYR_Register use record
      Reserved_0_15 at 0 range 0 .. 15;
      KEY           at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type HSEM_Peripheral is record
      R0     : aliased R_Register;
      R1     : aliased R_Register;
      R2     : aliased R_Register;
      R3     : aliased R_Register;
      R4     : aliased R_Register;
      R5     : aliased R_Register;
      R6     : aliased R_Register;
      R7     : aliased R_Register;
      R8     : aliased R_Register;
      R9     : aliased R_Register;
      R10    : aliased R_Register;
      R11    : aliased R_Register;
      R12    : aliased R_Register;
      R13    : aliased R_Register;
      R14    : aliased R_Register;
      R15    : aliased R_Register;
      R16    : aliased R_Register;
      R17    : aliased R_Register;
      R18    : aliased R_Register;
      R19    : aliased R_Register;
      R20    : aliased R_Register;
      R21    : aliased R_Register;
      R22    : aliased R_Register;
      R23    : aliased R_Register;
      R24    : aliased R_Register;
      R25    : aliased R_Register;
      R26    : aliased R_Register;
      R27    : aliased R_Register;
      R28    : aliased R_Register;
      R29    : aliased R_Register;
      R30    : aliased R_Register;
      R31    : aliased R_Register;
      RLR0   : aliased RLR_Register;
      RLR1   : aliased RLR_Register;
      RLR2   : aliased RLR_Register;
      RLR3   : aliased RLR_Register;
      RLR4   : aliased RLR_Register;
      RLR5   : aliased RLR_Register;
      RLR6   : aliased RLR_Register;
      RLR7   : aliased RLR_Register;
      RLR8   : aliased RLR_Register;
      RLR9   : aliased RLR_Register;
      RLR10  : aliased RLR_Register;
      RLR11  : aliased RLR_Register;
      RLR12  : aliased RLR_Register;
      RLR13  : aliased RLR_Register;
      RLR14  : aliased RLR_Register;
      RLR15  : aliased RLR_Register;
      RLR16  : aliased RLR_Register;
      RLR17  : aliased RLR_Register;
      RLR18  : aliased RLR_Register;
      RLR19  : aliased RLR_Register;
      RLR20  : aliased RLR_Register;
      RLR21  : aliased RLR_Register;
      RLR22  : aliased RLR_Register;
      RLR23  : aliased RLR_Register;
      RLR24  : aliased RLR_Register;
      RLR25  : aliased RLR_Register;
      RLR26  : aliased RLR_Register;
      RLR27  : aliased RLR_Register;
      RLR28  : aliased RLR_Register;
      RLR29  : aliased RLR_Register;
      RLR30  : aliased RLR_Register;
      RLR31  : aliased RLR_Register;
      C1IER  : aliased Interfaces.Bit_Types.Word;
      C1ICR  : aliased Interfaces.Bit_Types.Word;
      C1ISR  : aliased Interfaces.Bit_Types.Word;
      C1MISR : aliased Interfaces.Bit_Types.Word;
      C2IER  : aliased Interfaces.Bit_Types.Word;
      C2ICR  : aliased Interfaces.Bit_Types.Word;
      C2ISR  : aliased Interfaces.Bit_Types.Word;
      C2MISR : aliased Interfaces.Bit_Types.Word;
      CR     : aliased CR_Register;
      KEYR   : aliased KEYR_Register;
   end record
     with Volatile;

   for HSEM_Peripheral use record
      R0     at 16#0# range 0 .. 31;
      R1     at 16#4# range 0 .. 31;
      R2     at 16#8# range 0 .. 31;
      R3     at 16#C# range 0 .. 31;
      R4     at 16#10# range 0 .. 31;
      R5     at 16#14# range 0 .. 31;
      R6     at 16#18# range 0 .. 31;
      R7     at 16#1C# range 0 .. 31;
      R8     at 16#20# range 0 .. 31;
      R9     at 16#24# range 0 .. 31;
      R10    at 16#28# range 0 .. 31;
      R11    at 16#2C# range 0 .. 31;
      R12    at 16#30# range 0 .. 31;
      R13    at 16#34# range 0 .. 31;
      R14    at 16#38# range 0 .. 31;
      R15    at 16#3C# range 0 .. 31;
      R16    at 16#40# range 0 .. 31;
      R17    at 16#44# range 0 .. 31;
      R18    at 16#48# range 0 .. 31;
      R19    at 16#4C# range 0 .. 31;
      R20    at 16#50# range 0 .. 31;
      R21    at 16#54# range 0 .. 31;
      R22    at 16#58# range 0 .. 31;
      R23    at 16#5C# range 0 .. 31;
      R24    at 16#60# range 0 .. 31;
      R25    at 16#64# range 0 .. 31;
      R26    at 16#68# range 0 .. 31;
      R27    at 16#6C# range 0 .. 31;
      R28    at 16#70# range 0 .. 31;
      R29    at 16#74# range 0 .. 31;
      R30    at 16#78# range 0 .. 31;
      R31    at 16#7C# range 0 .. 31;
      RLR0   at 16#80# range 0 .. 31;
      RLR1   at 16#84# range 0 .. 31;
      RLR2   at 16#88# range 0 .. 31;
      RLR3   at 16#8C# range 0 .. 31;
      RLR4   at 16#90# range 0 .. 31;
      RLR5   at 16#94# range 0 .. 31;
      RLR6   at 16#98# range 0 .. 31;
      RLR7   at 16#9C# range 0 .. 31;
      RLR8   at 16#A0# range 0 .. 31;
      RLR9   at 16#A4# range 0 .. 31;
      RLR10  at 16#A8# range 0 .. 31;
      RLR11  at 16#AC# range 0 .. 31;
      RLR12  at 16#B0# range 0 .. 31;
      RLR13  at 16#B4# range 0 .. 31;
      RLR14  at 16#B8# range 0 .. 31;
      RLR15  at 16#BC# range 0 .. 31;
      RLR16  at 16#C0# range 0 .. 31;
      RLR17  at 16#C4# range 0 .. 31;
      RLR18  at 16#C8# range 0 .. 31;
      RLR19  at 16#CC# range 0 .. 31;
      RLR20  at 16#D0# range 0 .. 31;
      RLR21  at 16#D4# range 0 .. 31;
      RLR22  at 16#D8# range 0 .. 31;
      RLR23  at 16#DC# range 0 .. 31;
      RLR24  at 16#E0# range 0 .. 31;
      RLR25  at 16#E4# range 0 .. 31;
      RLR26  at 16#E8# range 0 .. 31;
      RLR27  at 16#EC# range 0 .. 31;
      RLR28  at 16#F0# range 0 .. 31;
      RLR29  at 16#F4# range 0 .. 31;
      RLR30  at 16#F8# range 0 .. 31;
      RLR31  at 16#FC# range 0 .. 31;
      C1IER  at 16#100# range 0 .. 31;
      C1ICR  at 16#104# range 0 .. 31;
      C1ISR  at 16#108# range 0 .. 31;
      C1MISR at 16#10C# range 0 .. 31;
      C2IER  at 16#110# range 0 .. 31;
      C2ICR  at 16#114# range 0 .. 31;
      C2ISR  at 16#118# range 0 .. 31;
      C2MISR at 16#11C# range 0 .. 31;
      CR     at 16#140# range 0 .. 31;
      KEYR   at 16#144# range 0 .. 31;
   end record;

   HSEM_Periph : aliased HSEM_Peripheral
     with Import, Address => System'To_Address (16#58001400#);

end Interfaces.STM32.HSEM;
