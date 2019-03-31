--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.LPTIM2 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   type ISR_Register is record
      CMPM          : Boolean := False;
      ARRM          : Boolean := False;
      EXTTRIG       : Boolean := False;
      CMPOK         : Boolean := False;
      ARROK         : Boolean := False;
      UP            : Boolean := False;
      DOWN          : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      CMPM          at 0 range 0 .. 0;
      ARRM          at 0 range 1 .. 1;
      EXTTRIG       at 0 range 2 .. 2;
      CMPOK         at 0 range 3 .. 3;
      ARROK         at 0 range 4 .. 4;
      UP            at 0 range 5 .. 5;
      DOWN          at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   type ICR_Register is record
      CMPMCF        : Boolean := False;
      ARRMCF        : Boolean := False;
      EXTTRIGCF     : Boolean := False;
      CMPOKCF       : Boolean := False;
      ARROKCF       : Boolean := False;
      UPCF          : Boolean := False;
      DOWNCF        : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      CMPMCF        at 0 range 0 .. 0;
      ARRMCF        at 0 range 1 .. 1;
      EXTTRIGCF     at 0 range 2 .. 2;
      CMPOKCF       at 0 range 3 .. 3;
      ARROKCF       at 0 range 4 .. 4;
      UPCF          at 0 range 5 .. 5;
      DOWNCF        at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   type IER_Register is record
      CMPMIE        : Boolean := False;
      ARRMIE        : Boolean := False;
      EXTTRIGIE     : Boolean := False;
      CMPOKIE       : Boolean := False;
      ARROKIE       : Boolean := False;
      UPIE          : Boolean := False;
      DOWNIE        : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IER_Register use record
      CMPMIE        at 0 range 0 .. 0;
      ARRMIE        at 0 range 1 .. 1;
      EXTTRIGIE     at 0 range 2 .. 2;
      CMPOKIE       at 0 range 3 .. 3;
      ARROKIE       at 0 range 4 .. 4;
      UPIE          at 0 range 5 .. 5;
      DOWNIE        at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype CFGR_CKPOL_Field is HAL.UInt2;
   subtype CFGR_CKFLT_Field is HAL.UInt2;
   subtype CFGR_TRGFLT_Field is HAL.UInt2;
   subtype CFGR_PRESC_Field is HAL.UInt3;
   subtype CFGR_TRIGSEL_Field is HAL.UInt3;
   subtype CFGR_TRIGEN_Field is HAL.UInt2;

   type CFGR_Register is record
      CKSEL          : Boolean := False;
      CKPOL          : CFGR_CKPOL_Field := 16#0#;
      CKFLT          : CFGR_CKFLT_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      TRGFLT         : CFGR_TRGFLT_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : HAL.Bit := 16#0#;
      PRESC          : CFGR_PRESC_Field := 16#0#;
      --  unspecified
      Reserved_12_12 : HAL.Bit := 16#0#;
      TRIGSEL        : CFGR_TRIGSEL_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : HAL.Bit := 16#0#;
      TRIGEN         : CFGR_TRIGEN_Field := 16#0#;
      TIMOUT         : Boolean := False;
      WAVE           : Boolean := False;
      WAVEPOL        : Boolean := False;
      PRELOAD        : Boolean := False;
      COUNTMODE      : Boolean := False;
      ENC            : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      CKSEL          at 0 range 0 .. 0;
      CKPOL          at 0 range 1 .. 2;
      CKFLT          at 0 range 3 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TRGFLT         at 0 range 6 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      PRESC          at 0 range 9 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      TRIGSEL        at 0 range 13 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      TRIGEN         at 0 range 17 .. 18;
      TIMOUT         at 0 range 19 .. 19;
      WAVE           at 0 range 20 .. 20;
      WAVEPOL        at 0 range 21 .. 21;
      PRELOAD        at 0 range 22 .. 22;
      COUNTMODE      at 0 range 23 .. 23;
      ENC            at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   type CR_Register is record
      ENABLE        : Boolean := False;
      SNGSTRT       : Boolean := False;
      CNTSTRT       : Boolean := False;
      COUNTRST      : Boolean := False;
      RSTARE        : Boolean := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      ENABLE        at 0 range 0 .. 0;
      SNGSTRT       at 0 range 1 .. 1;
      CNTSTRT       at 0 range 2 .. 2;
      COUNTRST      at 0 range 3 .. 3;
      RSTARE        at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype CMP_CMP_Field is HAL.UInt16;

   type CMP_Register is record
      CMP            : CMP_CMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMP_Register use record
      CMP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ARR_ARR_Field is HAL.UInt16;

   type ARR_Register is record
      ARR            : ARR_ARR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register use record
      ARR            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CNT_CNT_Field is HAL.UInt16;

   type CNT_Register is record
      CNT            : CNT_CNT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type OR_Register is record
      OR_0          : Boolean := False;
      OR_1          : Boolean := False;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register use record
      OR_0          at 0 range 0 .. 0;
      OR_1          at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type LPTIM2_Peripheral is record
      ISR  : aliased ISR_Register;
      ICR  : aliased ICR_Register;
      IER  : aliased IER_Register;
      CFGR : aliased CFGR_Register;
      CR   : aliased CR_Register;
      CMP  : aliased CMP_Register;
      ARR  : aliased ARR_Register;
      CNT  : aliased CNT_Register;
      OR_k : aliased OR_Register;
   end record
     with Volatile;

   for LPTIM2_Peripheral use record
      ISR  at 16#0# range 0 .. 31;
      ICR  at 16#4# range 0 .. 31;
      IER  at 16#8# range 0 .. 31;
      CFGR at 16#C# range 0 .. 31;
      CR   at 16#10# range 0 .. 31;
      CMP  at 16#14# range 0 .. 31;
      ARR  at 16#18# range 0 .. 31;
      CNT  at 16#1C# range 0 .. 31;
      OR_k at 16#20# range 0 .. 31;
   end record;

   LPTIM2_Periph : aliased LPTIM2_Peripheral
     with Import, Address => System'To_Address (16#40008000#);

end STM32_SVD.LPTIM2;
