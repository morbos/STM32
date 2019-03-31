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
      R31    : aliased R_Register;
      RLR0   : aliased RLR_Register;
      RLR1   : aliased RLR_Register;
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
      R31    at 16#7C# range 0 .. 31;
      RLR0   at 16#80# range 0 .. 31;
      RLR1   at 16#84# range 0 .. 31;
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
