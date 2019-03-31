--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.WWDG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_T_Field is HAL.UInt7;

   type CR_Register is record
      T             : CR_T_Field := 16#0#;
      WDGA          : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      T             at 0 range 0 .. 6;
      WDGA          at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CFR_W_Field is HAL.UInt7;
   subtype CFR_WDGTB_Field is HAL.UInt3;

   type CFR_Register is record
      W              : CFR_W_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : HAL.UInt2 := 16#0#;
      EWI            : Boolean := False;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      WDGTB          : CFR_WDGTB_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : HAL.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFR_Register use record
      W              at 0 range 0 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      EWI            at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      WDGTB          at 0 range 11 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   type SR_Register is record
      EWIF          : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      EWIF          at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type WWDG_Peripheral is record
      CR  : aliased CR_Register;
      CFR : aliased CFR_Register;
      SR  : aliased SR_Register;
   end record
     with Volatile;

   for WWDG_Peripheral use record
      CR  at 16#0# range 0 .. 31;
      CFR at 16#4# range 0 .. 31;
      SR  at 16#8# range 0 .. 31;
   end record;

   WWDG_Periph : aliased WWDG_Peripheral
     with Import, Address => System'To_Address (16#40002C00#);

end STM32_SVD.WWDG;
