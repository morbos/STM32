--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.VREFBUF is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CSR_ENVR_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_HIZ_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_VRS_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_VRR_Field is Interfaces.Bit_Types.Bit;

   type CSR_Register is record
      ENVR          : CSR_ENVR_Field := 16#0#;
      HIZ           : CSR_HIZ_Field := 16#0#;
      VRS           : CSR_VRS_Field := 16#0#;
      VRR           : CSR_VRR_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      ENVR          at 0 range 0 .. 0;
      HIZ           at 0 range 1 .. 1;
      VRS           at 0 range 2 .. 2;
      VRR           at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CCR_TRIM_Field is Interfaces.Bit_Types.UInt6;

   type CCR_Register is record
      TRIM          : CCR_TRIM_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.Bit_Types.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      TRIM          at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type VREFBUF_Peripheral is record
      CSR : aliased CSR_Register;
      CCR : aliased CCR_Register;
   end record
     with Volatile;

   for VREFBUF_Peripheral use record
      CSR at 16#0# range 0 .. 31;
      CCR at 16#4# range 0 .. 31;
   end record;

   VREFBUF_Periph : aliased VREFBUF_Peripheral
     with Import, Address => System'To_Address (16#40010030#);

end Interfaces.STM32.VREFBUF;
