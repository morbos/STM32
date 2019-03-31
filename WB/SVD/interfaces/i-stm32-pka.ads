--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.PKA is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR_EN_Field is Interfaces.Bit_Types.Bit;
   subtype CR_START_Field is Interfaces.Bit_Types.Bit;
   subtype CR_MODE_Field is Interfaces.Bit_Types.UInt6;
   subtype CR_PROCENDIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_RAMERRIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ADDRERRIE_Field is Interfaces.Bit_Types.Bit;

   type CR_Register is record
      EN             : CR_EN_Field := 16#0#;
      START          : CR_START_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.Bit_Types.UInt6 := 16#0#;
      MODE           : CR_MODE_Field := 16#0#;
      --  unspecified
      Reserved_14_16 : Interfaces.Bit_Types.UInt3 := 16#0#;
      PROCENDIE      : CR_PROCENDIE_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : Interfaces.Bit_Types.Bit := 16#0#;
      RAMERRIE       : CR_RAMERRIE_Field := 16#0#;
      ADDRERRIE      : CR_ADDRERRIE_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : Interfaces.Bit_Types.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      EN             at 0 range 0 .. 0;
      START          at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      MODE           at 0 range 8 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      PROCENDIE      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      RAMERRIE       at 0 range 19 .. 19;
      ADDRERRIE      at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype SR_BUSY_Field is Interfaces.Bit_Types.Bit;
   subtype SR_PROCENDF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_RAMERRF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_ADDRERRF_Field is Interfaces.Bit_Types.Bit;

   type SR_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.Bit_Types.Short := 16#0#;
      BUSY           : SR_BUSY_Field := 16#0#;
      PROCENDF       : SR_PROCENDF_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : Interfaces.Bit_Types.Bit := 16#0#;
      RAMERRF        : SR_RAMERRF_Field := 16#0#;
      ADDRERRF       : SR_ADDRERRF_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : Interfaces.Bit_Types.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      BUSY           at 0 range 16 .. 16;
      PROCENDF       at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      RAMERRF        at 0 range 19 .. 19;
      ADDRERRF       at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype CLRFR_PROCENDFC_Field is Interfaces.Bit_Types.Bit;
   subtype CLRFR_RAMERRFC_Field is Interfaces.Bit_Types.Bit;
   subtype CLRFR_ADDRERRFC_Field is Interfaces.Bit_Types.Bit;

   type CLRFR_Register is record
      --  unspecified
      Reserved_0_16  : Interfaces.Bit_Types.UInt17 := 16#0#;
      PROCENDFC      : CLRFR_PROCENDFC_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : Interfaces.Bit_Types.Bit := 16#0#;
      RAMERRFC       : CLRFR_RAMERRFC_Field := 16#0#;
      ADDRERRFC      : CLRFR_ADDRERRFC_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : Interfaces.Bit_Types.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLRFR_Register use record
      Reserved_0_16  at 0 range 0 .. 16;
      PROCENDFC      at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      RAMERRFC       at 0 range 19 .. 19;
      ADDRERRFC      at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type PKA_Peripheral is record
      CR    : aliased CR_Register;
      SR    : aliased SR_Register;
      CLRFR : aliased CLRFR_Register;
   end record
     with Volatile;

   for PKA_Peripheral use record
      CR    at 16#0# range 0 .. 31;
      SR    at 16#4# range 0 .. 31;
      CLRFR at 16#8# range 0 .. 31;
   end record;

   PKA_Periph : aliased PKA_Peripheral
     with Import, Address => System'To_Address (16#58002000#);

end Interfaces.STM32.PKA;
