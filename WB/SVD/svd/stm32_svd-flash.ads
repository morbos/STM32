--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.FLASH is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ACR_LATENCY_Field is HAL.UInt3;

   type ACR_Register is record
      LATENCY        : ACR_LATENCY_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      PRFTEN         : Boolean := False;
      ICEN           : Boolean := False;
      DCEN           : Boolean := False;
      ICRST          : Boolean := False;
      DCRST          : Boolean := False;
      --  unspecified
      Reserved_13_14 : HAL.UInt2 := 16#0#;
      PES            : Boolean := False;
      EMPTY          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACR_Register use record
      LATENCY        at 0 range 0 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      PRFTEN         at 0 range 8 .. 8;
      ICEN           at 0 range 9 .. 9;
      DCEN           at 0 range 10 .. 10;
      ICRST          at 0 range 11 .. 11;
      DCRST          at 0 range 12 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      PES            at 0 range 15 .. 15;
      EMPTY          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   type SR_Register is record
      EOP            : Boolean := False;
      OPERR          : Boolean := False;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      PROGERR        : Boolean := False;
      WRPERR         : Boolean := False;
      PGAERR         : Boolean := False;
      SIZERR         : Boolean := False;
      PGSERR         : Boolean := False;
      MISERR         : Boolean := False;
      FASTERR        : Boolean := False;
      --  unspecified
      Reserved_10_12 : HAL.UInt3 := 16#0#;
      OPTNV          : Boolean := False;
      RDERR          : Boolean := False;
      OPTVERR        : Boolean := False;
      BSY            : Boolean := False;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      CFGBSY         : Boolean := False;
      PESD           : Boolean := False;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      EOP            at 0 range 0 .. 0;
      OPERR          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      PROGERR        at 0 range 3 .. 3;
      WRPERR         at 0 range 4 .. 4;
      PGAERR         at 0 range 5 .. 5;
      SIZERR         at 0 range 6 .. 6;
      PGSERR         at 0 range 7 .. 7;
      MISERR         at 0 range 8 .. 8;
      FASTERR        at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      OPTNV          at 0 range 13 .. 13;
      RDERR          at 0 range 14 .. 14;
      OPTVERR        at 0 range 15 .. 15;
      BSY            at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      CFGBSY         at 0 range 18 .. 18;
      PESD           at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype CR_PNB_Field is HAL.UInt8;

   type CR_Register is record
      PG             : Boolean := False;
      PER            : Boolean := False;
      MER            : Boolean := False;
      PNB            : CR_PNB_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
      STRT           : Boolean := False;
      OPTSTRT        : Boolean := False;
      FSTPG          : Boolean := False;
      --  unspecified
      Reserved_19_23 : HAL.UInt5 := 16#0#;
      EOPIE          : Boolean := False;
      ERRIE          : Boolean := False;
      RDERRIE        : Boolean := False;
      OBL_LAUNCH     : Boolean := False;
      --  unspecified
      Reserved_28_29 : HAL.UInt2 := 16#0#;
      OPTLOCK        : Boolean := False;
      LOCK           : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      PG             at 0 range 0 .. 0;
      PER            at 0 range 1 .. 1;
      MER            at 0 range 2 .. 2;
      PNB            at 0 range 3 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      STRT           at 0 range 16 .. 16;
      OPTSTRT        at 0 range 17 .. 17;
      FSTPG          at 0 range 18 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      EOPIE          at 0 range 24 .. 24;
      ERRIE          at 0 range 25 .. 25;
      RDERRIE        at 0 range 26 .. 26;
      OBL_LAUNCH     at 0 range 27 .. 27;
      Reserved_28_29 at 0 range 28 .. 29;
      OPTLOCK        at 0 range 30 .. 30;
      LOCK           at 0 range 31 .. 31;
   end record;

   subtype ECCR_ADDR_ECC_Field is HAL.UInt17;
   subtype ECCR_CPUID_Field is HAL.UInt3;

   type ECCR_Register is record
      ADDR_ECC       : ECCR_ADDR_ECC_Field := 16#0#;
      --  unspecified
      Reserved_17_19 : HAL.UInt3 := 16#0#;
      SYSF_ECC       : Boolean := False;
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      ECCCIE         : Boolean := False;
      --  unspecified
      Reserved_25_25 : HAL.Bit := 16#0#;
      CPUID          : ECCR_CPUID_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : HAL.Bit := 16#0#;
      ECCC           : Boolean := False;
      ECCD           : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ECCR_Register use record
      ADDR_ECC       at 0 range 0 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      SYSF_ECC       at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      ECCCIE         at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      CPUID          at 0 range 26 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      ECCC           at 0 range 30 .. 30;
      ECCD           at 0 range 31 .. 31;
   end record;

   subtype OPTR_RDP_Field is HAL.UInt8;
   subtype OPTR_BOR_LEV_Field is HAL.UInt3;
   subtype OPTR_AGC_TRIM_Field is HAL.UInt3;

   type OPTR_Register is record
      RDP            : OPTR_RDP_Field := 16#0#;
      ESE            : Boolean := False;
      BOR_LEV        : OPTR_BOR_LEV_Field := 16#0#;
      nRST_STOP      : Boolean := False;
      nRST_STDBY     : Boolean := False;
      nRST_SHDW      : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      IWDG_SW        : Boolean := False;
      IWDG_STOP      : Boolean := False;
      IWDG_STBY      : Boolean := False;
      WWDG_SW        : Boolean := False;
      --  unspecified
      Reserved_20_22 : HAL.UInt3 := 16#0#;
      nBOOT1         : Boolean := False;
      SRAM2_PE       : Boolean := False;
      SRAM2_RST      : Boolean := False;
      nSWBOOT0       : Boolean := False;
      nBOOT0         : Boolean := False;
      --  unspecified
      Reserved_28_28 : HAL.Bit := 16#0#;
      AGC_TRIM       : OPTR_AGC_TRIM_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OPTR_Register use record
      RDP            at 0 range 0 .. 7;
      ESE            at 0 range 8 .. 8;
      BOR_LEV        at 0 range 9 .. 11;
      nRST_STOP      at 0 range 12 .. 12;
      nRST_STDBY     at 0 range 13 .. 13;
      nRST_SHDW      at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      IWDG_SW        at 0 range 16 .. 16;
      IWDG_STOP      at 0 range 17 .. 17;
      IWDG_STBY      at 0 range 18 .. 18;
      WWDG_SW        at 0 range 19 .. 19;
      Reserved_20_22 at 0 range 20 .. 22;
      nBOOT1         at 0 range 23 .. 23;
      SRAM2_PE       at 0 range 24 .. 24;
      SRAM2_RST      at 0 range 25 .. 25;
      nSWBOOT0       at 0 range 26 .. 26;
      nBOOT0         at 0 range 27 .. 27;
      Reserved_28_28 at 0 range 28 .. 28;
      AGC_TRIM       at 0 range 29 .. 31;
   end record;

   subtype PCROP1ASR_PCROP1A_STRT_Field is HAL.UInt9;

   type PCROP1ASR_Register is record
      PCROP1A_STRT  : PCROP1ASR_PCROP1A_STRT_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCROP1ASR_Register use record
      PCROP1A_STRT  at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype PCROP1AER_PCROP1A_END_Field is HAL.UInt9;

   type PCROP1AER_Register is record
      PCROP1A_END   : PCROP1AER_PCROP1A_END_Field := 16#0#;
      --  unspecified
      Reserved_9_30 : HAL.UInt22 := 16#0#;
      PCROP_RDP     : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCROP1AER_Register use record
      PCROP1A_END   at 0 range 0 .. 8;
      Reserved_9_30 at 0 range 9 .. 30;
      PCROP_RDP     at 0 range 31 .. 31;
   end record;

   subtype WRP1AR_WRP1A_STRT_Field is HAL.UInt8;
   subtype WRP1AR_WRP1A_END_Field is HAL.UInt8;

   type WRP1AR_Register is record
      WRP1A_STRT     : WRP1AR_WRP1A_STRT_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      WRP1A_END      : WRP1AR_WRP1A_END_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WRP1AR_Register use record
      WRP1A_STRT     at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      WRP1A_END      at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype WRP1BR_WRP1B_STRT_Field is HAL.UInt8;
   subtype WRP1BR_WRP1B_END_Field is HAL.UInt8;

   type WRP1BR_Register is record
      WRP1B_STRT     : WRP1BR_WRP1B_STRT_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      WRP1B_END      : WRP1BR_WRP1B_END_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WRP1BR_Register use record
      WRP1B_STRT     at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      WRP1B_END      at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PCROP1BSR_PCROP1B_STRT_Field is HAL.UInt9;

   type PCROP1BSR_Register is record
      PCROP1B_STRT  : PCROP1BSR_PCROP1B_STRT_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCROP1BSR_Register use record
      PCROP1B_STRT  at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype PCROP1BER_PCROP1B_END_Field is HAL.UInt9;

   type PCROP1BER_Register is record
      PCROP1B_END   : PCROP1BER_PCROP1B_END_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCROP1BER_Register use record
      PCROP1B_END   at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype IPCCBR_IPCCDBA_Field is HAL.UInt14;

   type IPCCBR_Register is record
      IPCCDBA        : IPCCBR_IPCCDBA_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : HAL.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPCCBR_Register use record
      IPCCDBA        at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   type C2ACR_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8 := 16#0#;
      PRFTEN         : Boolean := False;
      ICEN           : Boolean := False;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      ICRST          : Boolean := False;
      --  unspecified
      Reserved_12_14 : HAL.UInt3 := 16#0#;
      PES            : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2ACR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      PRFTEN         at 0 range 8 .. 8;
      ICEN           at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      ICRST          at 0 range 11 .. 11;
      Reserved_12_14 at 0 range 12 .. 14;
      PES            at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   type C2SR_Register is record
      EOP            : Boolean := False;
      OPERR          : Boolean := False;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      PROGERR        : Boolean := False;
      WRPERR         : Boolean := False;
      PGAERR         : Boolean := False;
      SIZERR         : Boolean := False;
      PGSERR         : Boolean := False;
      MISERR         : Boolean := False;
      FASTERR        : Boolean := False;
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      RDERR          : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      BSY            : Boolean := False;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      CFGBSY         : Boolean := False;
      PESD           : Boolean := False;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2SR_Register use record
      EOP            at 0 range 0 .. 0;
      OPERR          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      PROGERR        at 0 range 3 .. 3;
      WRPERR         at 0 range 4 .. 4;
      PGAERR         at 0 range 5 .. 5;
      SIZERR         at 0 range 6 .. 6;
      PGSERR         at 0 range 7 .. 7;
      MISERR         at 0 range 8 .. 8;
      FASTERR        at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      RDERR          at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      BSY            at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      CFGBSY         at 0 range 18 .. 18;
      PESD           at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype C2CR_PNB_Field is HAL.UInt8;

   type C2CR_Register is record
      PG             : Boolean := False;
      PER            : Boolean := False;
      MER            : Boolean := False;
      PNB            : C2CR_PNB_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
      STRT           : Boolean := False;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      FSTPG          : Boolean := False;
      --  unspecified
      Reserved_19_23 : HAL.UInt5 := 16#0#;
      EOPIE          : Boolean := False;
      ERRIE          : Boolean := False;
      RDERRIE        : Boolean := False;
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2CR_Register use record
      PG             at 0 range 0 .. 0;
      PER            at 0 range 1 .. 1;
      MER            at 0 range 2 .. 2;
      PNB            at 0 range 3 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      STRT           at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      FSTPG          at 0 range 18 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      EOPIE          at 0 range 24 .. 24;
      ERRIE          at 0 range 25 .. 25;
      RDERRIE        at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype SFR_SFSA_Field is HAL.UInt8;

   type SFR_Register is record
      SFSA           : SFR_SFSA_Field := 16#0#;
      FSD            : Boolean := False;
      --  unspecified
      Reserved_9_11  : HAL.UInt3 := 16#0#;
      DDS            : Boolean := False;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SFR_Register use record
      SFSA           at 0 range 0 .. 7;
      FSD            at 0 range 8 .. 8;
      Reserved_9_11  at 0 range 9 .. 11;
      DDS            at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype SRRVR_SBRV_Field is HAL.UInt18;
   subtype SRRVR_SBRSA_Field is HAL.UInt5;
   subtype SRRVR_SNBRSA_Field is HAL.UInt5;

   type SRRVR_Register is record
      SBRV           : SRRVR_SBRV_Field := 16#0#;
      SBRSA          : SRRVR_SBRSA_Field := 16#0#;
      BRSD           : Boolean := False;
      --  unspecified
      Reserved_24_24 : HAL.Bit := 16#0#;
      SNBRSA         : SRRVR_SNBRSA_Field := 16#0#;
      NBRSD          : Boolean := False;
      C2OPT          : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SRRVR_Register use record
      SBRV           at 0 range 0 .. 17;
      SBRSA          at 0 range 18 .. 22;
      BRSD           at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      SNBRSA         at 0 range 25 .. 29;
      NBRSD          at 0 range 30 .. 30;
      C2OPT          at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type FLASH_Peripheral is record
      ACR       : aliased ACR_Register;
      KEYR      : aliased HAL.UInt32;
      OPTKEYR   : aliased HAL.UInt32;
      SR        : aliased SR_Register;
      CR        : aliased CR_Register;
      ECCR      : aliased ECCR_Register;
      OPTR      : aliased OPTR_Register;
      PCROP1ASR : aliased PCROP1ASR_Register;
      PCROP1AER : aliased PCROP1AER_Register;
      WRP1AR    : aliased WRP1AR_Register;
      WRP1BR    : aliased WRP1BR_Register;
      PCROP1BSR : aliased PCROP1BSR_Register;
      PCROP1BER : aliased PCROP1BER_Register;
      IPCCBR    : aliased IPCCBR_Register;
      C2ACR     : aliased C2ACR_Register;
      C2SR      : aliased C2SR_Register;
      C2CR      : aliased C2CR_Register;
      SFR       : aliased SFR_Register;
      SRRVR     : aliased SRRVR_Register;
   end record
     with Volatile;

   for FLASH_Peripheral use record
      ACR       at 16#0# range 0 .. 31;
      KEYR      at 16#8# range 0 .. 31;
      OPTKEYR   at 16#C# range 0 .. 31;
      SR        at 16#10# range 0 .. 31;
      CR        at 16#14# range 0 .. 31;
      ECCR      at 16#18# range 0 .. 31;
      OPTR      at 16#20# range 0 .. 31;
      PCROP1ASR at 16#24# range 0 .. 31;
      PCROP1AER at 16#28# range 0 .. 31;
      WRP1AR    at 16#2C# range 0 .. 31;
      WRP1BR    at 16#30# range 0 .. 31;
      PCROP1BSR at 16#34# range 0 .. 31;
      PCROP1BER at 16#38# range 0 .. 31;
      IPCCBR    at 16#3C# range 0 .. 31;
      C2ACR     at 16#5C# range 0 .. 31;
      C2SR      at 16#60# range 0 .. 31;
      C2CR      at 16#64# range 0 .. 31;
      SFR       at 16#80# range 0 .. 31;
      SRRVR     at 16#84# range 0 .. 31;
   end record;

   FLASH_Periph : aliased FLASH_Peripheral
     with Import, Address => System'To_Address (16#58004000#);

end STM32_SVD.FLASH;
