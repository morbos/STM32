--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.CRS is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR_SYNCOKIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_SYNCWARNIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ERRIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ESYNCIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_CEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR_AUTOTRIMEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR_SWSYNC_Field is Interfaces.Bit_Types.Bit;
   subtype CR_TRIM_Field is Interfaces.Bit_Types.UInt6;

   type CR_Register is record
      SYNCOKIE       : CR_SYNCOKIE_Field := 16#0#;
      SYNCWARNIE     : CR_SYNCWARNIE_Field := 16#0#;
      ERRIE          : CR_ERRIE_Field := 16#0#;
      ESYNCIE        : CR_ESYNCIE_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : Interfaces.Bit_Types.Bit := 16#0#;
      CEN            : CR_CEN_Field := 16#0#;
      AUTOTRIMEN     : CR_AUTOTRIMEN_Field := 16#0#;
      SWSYNC         : CR_SWSYNC_Field := 16#0#;
      TRIM           : CR_TRIM_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : Interfaces.Bit_Types.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      SYNCOKIE       at 0 range 0 .. 0;
      SYNCWARNIE     at 0 range 1 .. 1;
      ERRIE          at 0 range 2 .. 2;
      ESYNCIE        at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      CEN            at 0 range 5 .. 5;
      AUTOTRIMEN     at 0 range 6 .. 6;
      SWSYNC         at 0 range 7 .. 7;
      TRIM           at 0 range 8 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype CFGR_RELOAD_Field is Interfaces.Bit_Types.Short;
   subtype CFGR_FELIM_Field is Interfaces.Bit_Types.Byte;
   subtype CFGR_SYNCDIV_Field is Interfaces.Bit_Types.UInt3;
   subtype CFGR_SYNCSRC_Field is Interfaces.Bit_Types.UInt2;
   subtype CFGR_SYNCPOL_Field is Interfaces.Bit_Types.Bit;

   type CFGR_Register is record
      RELOAD         : CFGR_RELOAD_Field := 16#0#;
      FELIM          : CFGR_FELIM_Field := 16#0#;
      SYNCDIV        : CFGR_SYNCDIV_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : Interfaces.Bit_Types.Bit := 16#0#;
      SYNCSRC        : CFGR_SYNCSRC_Field := 16#0#;
      --  unspecified
      Reserved_30_30 : Interfaces.Bit_Types.Bit := 16#0#;
      SYNCPOL        : CFGR_SYNCPOL_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      RELOAD         at 0 range 0 .. 15;
      FELIM          at 0 range 16 .. 23;
      SYNCDIV        at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      SYNCSRC        at 0 range 28 .. 29;
      Reserved_30_30 at 0 range 30 .. 30;
      SYNCPOL        at 0 range 31 .. 31;
   end record;

   subtype ISR_SYNCOKF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_SYNCWARNF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ERRF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ESYNCF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_SYNCERR_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_SYNCMISS_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TRIMOVF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_FEDIR_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_FECAP_Field is Interfaces.Bit_Types.Short;

   type ISR_Register is record
      SYNCOKF        : ISR_SYNCOKF_Field := 16#0#;
      SYNCWARNF      : ISR_SYNCWARNF_Field := 16#0#;
      ERRF           : ISR_ERRF_Field := 16#0#;
      ESYNCF         : ISR_ESYNCF_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : Interfaces.Bit_Types.UInt4 := 16#0#;
      SYNCERR        : ISR_SYNCERR_Field := 16#0#;
      SYNCMISS       : ISR_SYNCMISS_Field := 16#0#;
      TRIMOVF        : ISR_TRIMOVF_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : Interfaces.Bit_Types.UInt4 := 16#0#;
      FEDIR          : ISR_FEDIR_Field := 16#0#;
      FECAP          : ISR_FECAP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      SYNCOKF        at 0 range 0 .. 0;
      SYNCWARNF      at 0 range 1 .. 1;
      ERRF           at 0 range 2 .. 2;
      ESYNCF         at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      SYNCERR        at 0 range 8 .. 8;
      SYNCMISS       at 0 range 9 .. 9;
      TRIMOVF        at 0 range 10 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      FEDIR          at 0 range 15 .. 15;
      FECAP          at 0 range 16 .. 31;
   end record;

   subtype ICR_SYNCOKC_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_SYNCWARNC_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_ERRC_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_ESYNCC_Field is Interfaces.Bit_Types.Bit;

   type ICR_Register is record
      SYNCOKC       : ICR_SYNCOKC_Field := 16#0#;
      SYNCWARNC     : ICR_SYNCWARNC_Field := 16#0#;
      ERRC          : ICR_ERRC_Field := 16#0#;
      ESYNCC        : ICR_ESYNCC_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      SYNCOKC       at 0 range 0 .. 0;
      SYNCWARNC     at 0 range 1 .. 1;
      ERRC          at 0 range 2 .. 2;
      ESYNCC        at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type CRS_Peripheral is record
      CR   : aliased CR_Register;
      CFGR : aliased CFGR_Register;
      ISR  : aliased ISR_Register;
      ICR  : aliased ICR_Register;
   end record
     with Volatile;

   for CRS_Peripheral use record
      CR   at 16#0# range 0 .. 31;
      CFGR at 16#4# range 0 .. 31;
      ISR  at 16#8# range 0 .. 31;
      ICR  at 16#C# range 0 .. 31;
   end record;

   CRS_Periph : aliased CRS_Peripheral
     with Import, Address => System'To_Address (16#40006000#);

end Interfaces.STM32.CRS;
