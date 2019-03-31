--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.CRS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_TRIM_Field is HAL.UInt6;

   type CR_Register is record
      SYNCOKIE       : Boolean := False;
      SYNCWARNIE     : Boolean := False;
      ERRIE          : Boolean := False;
      ESYNCIE        : Boolean := False;
      --  unspecified
      Reserved_4_4   : HAL.Bit := 16#0#;
      CEN            : Boolean := False;
      AUTOTRIMEN     : Boolean := False;
      SWSYNC         : Boolean := False;
      TRIM           : CR_TRIM_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : HAL.UInt18 := 16#0#;
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

   subtype CFGR_RELOAD_Field is HAL.UInt16;
   subtype CFGR_FELIM_Field is HAL.UInt8;
   subtype CFGR_SYNCDIV_Field is HAL.UInt3;
   subtype CFGR_SYNCSRC_Field is HAL.UInt2;

   type CFGR_Register is record
      RELOAD         : CFGR_RELOAD_Field := 16#0#;
      FELIM          : CFGR_FELIM_Field := 16#0#;
      SYNCDIV        : CFGR_SYNCDIV_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : HAL.Bit := 16#0#;
      SYNCSRC        : CFGR_SYNCSRC_Field := 16#0#;
      --  unspecified
      Reserved_30_30 : HAL.Bit := 16#0#;
      SYNCPOL        : Boolean := False;
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

   subtype ISR_FECAP_Field is HAL.UInt16;

   type ISR_Register is record
      SYNCOKF        : Boolean := False;
      SYNCWARNF      : Boolean := False;
      ERRF           : Boolean := False;
      ESYNCF         : Boolean := False;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      SYNCERR        : Boolean := False;
      SYNCMISS       : Boolean := False;
      TRIMOVF        : Boolean := False;
      --  unspecified
      Reserved_11_14 : HAL.UInt4 := 16#0#;
      FEDIR          : Boolean := False;
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

   type ICR_Register is record
      SYNCOKC       : Boolean := False;
      SYNCWARNC     : Boolean := False;
      ERRC          : Boolean := False;
      ESYNCC        : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
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

end STM32_SVD.CRS;
