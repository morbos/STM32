--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.COMP is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype COMP1_CSR_PWRMODE_Field is HAL.UInt2;
   subtype COMP1_CSR_INMSEL_Field is HAL.UInt3;
   subtype COMP1_CSR_INPSEL_Field is HAL.UInt2;
   subtype COMP1_CSR_HYST_Field is HAL.UInt2;
   subtype COMP1_CSR_BLANKING_Field is HAL.UInt3;
   subtype COMP1_CSR_INMESEL_Field is HAL.UInt2;

   type COMP1_CSR_Register is record
      EN             : Boolean := False;
      --  unspecified
      Reserved_1_1   : HAL.Bit := 16#0#;
      PWRMODE        : COMP1_CSR_PWRMODE_Field := 16#0#;
      INMSEL         : COMP1_CSR_INMSEL_Field := 16#0#;
      INPSEL         : COMP1_CSR_INPSEL_Field := 16#0#;
      --  unspecified
      Reserved_9_14  : HAL.UInt6 := 16#0#;
      POLARITY       : Boolean := False;
      HYST           : COMP1_CSR_HYST_Field := 16#0#;
      BLANKING       : COMP1_CSR_BLANKING_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : HAL.Bit := 16#0#;
      BRGEN          : Boolean := False;
      SCALEN         : Boolean := False;
      --  unspecified
      Reserved_24_24 : HAL.Bit := 16#0#;
      INMESEL        : COMP1_CSR_INMESEL_Field := 16#0#;
      --  unspecified
      Reserved_27_29 : HAL.UInt3 := 16#0#;
      VALUE          : Boolean := False;
      LOCK           : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP1_CSR_Register use record
      EN             at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      PWRMODE        at 0 range 2 .. 3;
      INMSEL         at 0 range 4 .. 6;
      INPSEL         at 0 range 7 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      POLARITY       at 0 range 15 .. 15;
      HYST           at 0 range 16 .. 17;
      BLANKING       at 0 range 18 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      BRGEN          at 0 range 22 .. 22;
      SCALEN         at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      INMESEL        at 0 range 25 .. 26;
      Reserved_27_29 at 0 range 27 .. 29;
      VALUE          at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype COMP2_CSR_PWRMODE_Field is HAL.UInt2;
   subtype COMP2_CSR_INMSEL_Field is HAL.UInt3;
   subtype COMP2_CSR_INPSEL_Field is HAL.UInt2;
   subtype COMP2_CSR_HYST_Field is HAL.UInt2;
   subtype COMP2_CSR_BLANKING_Field is HAL.UInt3;
   subtype COMP2_CSR_INMESEL_Field is HAL.UInt2;

   type COMP2_CSR_Register is record
      EN             : Boolean := False;
      --  unspecified
      Reserved_1_1   : HAL.Bit := 16#0#;
      PWRMODE        : COMP2_CSR_PWRMODE_Field := 16#0#;
      INMSEL         : COMP2_CSR_INMSEL_Field := 16#0#;
      INPSEL         : COMP2_CSR_INPSEL_Field := 16#0#;
      WINMODE        : Boolean := False;
      --  unspecified
      Reserved_10_14 : HAL.UInt5 := 16#0#;
      POLARITY       : Boolean := False;
      HYST           : COMP2_CSR_HYST_Field := 16#0#;
      BLANKING       : COMP2_CSR_BLANKING_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : HAL.Bit := 16#0#;
      BRGEN          : Boolean := False;
      SCALEN         : Boolean := False;
      --  unspecified
      Reserved_24_24 : HAL.Bit := 16#0#;
      INMESEL        : COMP2_CSR_INMESEL_Field := 16#0#;
      --  unspecified
      Reserved_27_29 : HAL.UInt3 := 16#0#;
      VALUE          : Boolean := False;
      LOCK           : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for COMP2_CSR_Register use record
      EN             at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      PWRMODE        at 0 range 2 .. 3;
      INMSEL         at 0 range 4 .. 6;
      INPSEL         at 0 range 7 .. 8;
      WINMODE        at 0 range 9 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      POLARITY       at 0 range 15 .. 15;
      HYST           at 0 range 16 .. 17;
      BLANKING       at 0 range 18 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      BRGEN          at 0 range 22 .. 22;
      SCALEN         at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      INMESEL        at 0 range 25 .. 26;
      Reserved_27_29 at 0 range 27 .. 29;
      VALUE          at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type COMP_Peripheral is record
      COMP1_CSR : aliased COMP1_CSR_Register;
      COMP2_CSR : aliased COMP2_CSR_Register;
   end record
     with Volatile;

   for COMP_Peripheral use record
      COMP1_CSR at 16#0# range 0 .. 31;
      COMP2_CSR at 16#4# range 0 .. 31;
   end record;

   COMP_Periph : aliased COMP_Peripheral
     with Import, Address => System'To_Address (16#40010200#);

end STM32_SVD.COMP;
