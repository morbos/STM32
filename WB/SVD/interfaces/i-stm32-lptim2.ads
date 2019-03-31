--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.LPTIM2 is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype ISR_CMPM_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ARRM_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_EXTTRIG_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_CMPOK_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ARROK_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_UP_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_DOWN_Field is Interfaces.Bit_Types.Bit;

   type ISR_Register is record
      CMPM          : ISR_CMPM_Field := 16#0#;
      ARRM          : ISR_ARRM_Field := 16#0#;
      EXTTRIG       : ISR_EXTTRIG_Field := 16#0#;
      CMPOK         : ISR_CMPOK_Field := 16#0#;
      ARROK         : ISR_ARROK_Field := 16#0#;
      UP            : ISR_UP_Field := 16#0#;
      DOWN          : ISR_DOWN_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.Bit_Types.UInt25 := 16#0#;
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

   subtype ICR_CMPMCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_ARRMCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_EXTTRIGCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_CMPOKCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_ARROKCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_UPCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_DOWNCF_Field is Interfaces.Bit_Types.Bit;

   type ICR_Register is record
      CMPMCF        : ICR_CMPMCF_Field := 16#0#;
      ARRMCF        : ICR_ARRMCF_Field := 16#0#;
      EXTTRIGCF     : ICR_EXTTRIGCF_Field := 16#0#;
      CMPOKCF       : ICR_CMPOKCF_Field := 16#0#;
      ARROKCF       : ICR_ARROKCF_Field := 16#0#;
      UPCF          : ICR_UPCF_Field := 16#0#;
      DOWNCF        : ICR_DOWNCF_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.Bit_Types.UInt25 := 16#0#;
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

   subtype IER_CMPMIE_Field is Interfaces.Bit_Types.Bit;
   subtype IER_ARRMIE_Field is Interfaces.Bit_Types.Bit;
   subtype IER_EXTTRIGIE_Field is Interfaces.Bit_Types.Bit;
   subtype IER_CMPOKIE_Field is Interfaces.Bit_Types.Bit;
   subtype IER_ARROKIE_Field is Interfaces.Bit_Types.Bit;
   subtype IER_UPIE_Field is Interfaces.Bit_Types.Bit;
   subtype IER_DOWNIE_Field is Interfaces.Bit_Types.Bit;

   type IER_Register is record
      CMPMIE        : IER_CMPMIE_Field := 16#0#;
      ARRMIE        : IER_ARRMIE_Field := 16#0#;
      EXTTRIGIE     : IER_EXTTRIGIE_Field := 16#0#;
      CMPOKIE       : IER_CMPOKIE_Field := 16#0#;
      ARROKIE       : IER_ARROKIE_Field := 16#0#;
      UPIE          : IER_UPIE_Field := 16#0#;
      DOWNIE        : IER_DOWNIE_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.Bit_Types.UInt25 := 16#0#;
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

   subtype CFGR_CKSEL_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_CKPOL_Field is Interfaces.Bit_Types.UInt2;
   subtype CFGR_CKFLT_Field is Interfaces.Bit_Types.UInt2;
   subtype CFGR_TRGFLT_Field is Interfaces.Bit_Types.UInt2;
   subtype CFGR_PRESC_Field is Interfaces.Bit_Types.UInt3;
   subtype CFGR_TRIGSEL_Field is Interfaces.Bit_Types.UInt3;
   subtype CFGR_TRIGEN_Field is Interfaces.Bit_Types.UInt2;
   subtype CFGR_TIMOUT_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_WAVE_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_WAVEPOL_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_PRELOAD_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_COUNTMODE_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_ENC_Field is Interfaces.Bit_Types.Bit;

   type CFGR_Register is record
      CKSEL          : CFGR_CKSEL_Field := 16#0#;
      CKPOL          : CFGR_CKPOL_Field := 16#0#;
      CKFLT          : CFGR_CKFLT_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : Interfaces.Bit_Types.Bit := 16#0#;
      TRGFLT         : CFGR_TRGFLT_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : Interfaces.Bit_Types.Bit := 16#0#;
      PRESC          : CFGR_PRESC_Field := 16#0#;
      --  unspecified
      Reserved_12_12 : Interfaces.Bit_Types.Bit := 16#0#;
      TRIGSEL        : CFGR_TRIGSEL_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Interfaces.Bit_Types.Bit := 16#0#;
      TRIGEN         : CFGR_TRIGEN_Field := 16#0#;
      TIMOUT         : CFGR_TIMOUT_Field := 16#0#;
      WAVE           : CFGR_WAVE_Field := 16#0#;
      WAVEPOL        : CFGR_WAVEPOL_Field := 16#0#;
      PRELOAD        : CFGR_PRELOAD_Field := 16#0#;
      COUNTMODE      : CFGR_COUNTMODE_Field := 16#0#;
      ENC            : CFGR_ENC_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : Interfaces.Bit_Types.UInt7 := 16#0#;
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

   subtype CR_ENABLE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_SNGSTRT_Field is Interfaces.Bit_Types.Bit;
   subtype CR_CNTSTRT_Field is Interfaces.Bit_Types.Bit;
   subtype CR_COUNTRST_Field is Interfaces.Bit_Types.Bit;
   subtype CR_RSTARE_Field is Interfaces.Bit_Types.Bit;

   type CR_Register is record
      ENABLE        : CR_ENABLE_Field := 16#0#;
      SNGSTRT       : CR_SNGSTRT_Field := 16#0#;
      CNTSTRT       : CR_CNTSTRT_Field := 16#0#;
      COUNTRST      : CR_COUNTRST_Field := 16#0#;
      RSTARE        : CR_RSTARE_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : Interfaces.Bit_Types.UInt27 := 16#0#;
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

   subtype CMP_CMP_Field is Interfaces.Bit_Types.Short;

   type CMP_Register is record
      CMP            : CMP_CMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CMP_Register use record
      CMP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ARR_ARR_Field is Interfaces.Bit_Types.Short;

   type ARR_Register is record
      ARR            : ARR_ARR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register use record
      ARR            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CNT_CNT_Field is Interfaces.Bit_Types.Short;

   type CNT_Register is record
      CNT            : CNT_CNT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OR_OR_0_Field is Interfaces.Bit_Types.Bit;
   subtype OR_OR_1_Field is Interfaces.Bit_Types.Bit;

   type OR_Register is record
      OR_0          : OR_OR_0_Field := 16#0#;
      OR_1          : OR_OR_1_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : Interfaces.Bit_Types.UInt30 := 16#0#;
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

end Interfaces.STM32.LPTIM2;
