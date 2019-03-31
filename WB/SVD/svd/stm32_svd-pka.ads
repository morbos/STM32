--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.PKA is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_MODE_Field is HAL.UInt6;

   type CR_Register is record
      EN             : Boolean := False;
      START          : Boolean := False;
      --  unspecified
      Reserved_2_7   : HAL.UInt6 := 16#0#;
      MODE           : CR_MODE_Field := 16#0#;
      --  unspecified
      Reserved_14_16 : HAL.UInt3 := 16#0#;
      PROCENDIE      : Boolean := False;
      --  unspecified
      Reserved_18_18 : HAL.Bit := 16#0#;
      RAMERRIE       : Boolean := False;
      ADDRERRIE      : Boolean := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
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

   type SR_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      BUSY           : Boolean := False;
      PROCENDF       : Boolean := False;
      --  unspecified
      Reserved_18_18 : HAL.Bit := 16#0#;
      RAMERRF        : Boolean := False;
      ADDRERRF       : Boolean := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
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

   type CLRFR_Register is record
      --  unspecified
      Reserved_0_16  : HAL.UInt17 := 16#0#;
      PROCENDFC      : Boolean := False;
      --  unspecified
      Reserved_18_18 : HAL.Bit := 16#0#;
      RAMERRFC       : Boolean := False;
      ADDRERRFC      : Boolean := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
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

end STM32_SVD.PKA;
