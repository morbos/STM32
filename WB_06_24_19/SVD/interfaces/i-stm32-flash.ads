--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.FLASH is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype ACR_LATENCY_Field is Interfaces.Bit_Types.UInt3;
   subtype ACR_PRFTEN_Field is Interfaces.Bit_Types.Bit;
   subtype ACR_ICEN_Field is Interfaces.Bit_Types.Bit;
   subtype ACR_DCEN_Field is Interfaces.Bit_Types.Bit;
   subtype ACR_ICRST_Field is Interfaces.Bit_Types.Bit;
   subtype ACR_DCRST_Field is Interfaces.Bit_Types.Bit;
   subtype ACR_PES_Field is Interfaces.Bit_Types.Bit;
   subtype ACR_EMPTY_Field is Interfaces.Bit_Types.Bit;

   type ACR_Register is record
      LATENCY        : ACR_LATENCY_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : Interfaces.Bit_Types.UInt5 := 16#0#;
      PRFTEN         : ACR_PRFTEN_Field := 16#0#;
      ICEN           : ACR_ICEN_Field := 16#0#;
      DCEN           : ACR_DCEN_Field := 16#0#;
      ICRST          : ACR_ICRST_Field := 16#0#;
      DCRST          : ACR_DCRST_Field := 16#0#;
      --  unspecified
      Reserved_13_14 : Interfaces.Bit_Types.UInt2 := 16#0#;
      PES            : ACR_PES_Field := 16#0#;
      EMPTY          : ACR_EMPTY_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
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

   subtype SR_EOP_Field is Interfaces.Bit_Types.Bit;
   subtype SR_OPERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_PROGERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_WRPERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_PGAERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_SIZERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_PGSERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_MISERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_FASTERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_OPTNV_Field is Interfaces.Bit_Types.Bit;
   subtype SR_RDERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_OPTVERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_BSY_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CFGBSY_Field is Interfaces.Bit_Types.Bit;
   subtype SR_PESD_Field is Interfaces.Bit_Types.Bit;

   type SR_Register is record
      EOP            : SR_EOP_Field := 16#0#;
      OPERR          : SR_OPERR_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.Bit_Types.Bit := 16#0#;
      PROGERR        : SR_PROGERR_Field := 16#0#;
      WRPERR         : SR_WRPERR_Field := 16#0#;
      PGAERR         : SR_PGAERR_Field := 16#0#;
      SIZERR         : SR_SIZERR_Field := 16#0#;
      PGSERR         : SR_PGSERR_Field := 16#0#;
      MISERR         : SR_MISERR_Field := 16#0#;
      FASTERR        : SR_FASTERR_Field := 16#0#;
      --  unspecified
      Reserved_10_12 : Interfaces.Bit_Types.UInt3 := 16#0#;
      OPTNV          : SR_OPTNV_Field := 16#0#;
      RDERR          : SR_RDERR_Field := 16#0#;
      OPTVERR        : SR_OPTVERR_Field := 16#0#;
      BSY            : SR_BSY_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : Interfaces.Bit_Types.Bit := 16#0#;
      CFGBSY         : SR_CFGBSY_Field := 16#0#;
      PESD           : SR_PESD_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : Interfaces.Bit_Types.UInt12 := 16#0#;
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

   subtype CR_PG_Field is Interfaces.Bit_Types.Bit;
   subtype CR_PER_Field is Interfaces.Bit_Types.Bit;
   subtype CR_MER_Field is Interfaces.Bit_Types.Bit;
   subtype CR_PNB_Field is Interfaces.Bit_Types.Byte;
   subtype CR_STRT_Field is Interfaces.Bit_Types.Bit;
   subtype CR_OPTSTRT_Field is Interfaces.Bit_Types.Bit;
   subtype CR_FSTPG_Field is Interfaces.Bit_Types.Bit;
   subtype CR_EOPIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ERRIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_RDERRIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_OBL_LAUNCH_Field is Interfaces.Bit_Types.Bit;
   subtype CR_OPTLOCK_Field is Interfaces.Bit_Types.Bit;
   subtype CR_LOCK_Field is Interfaces.Bit_Types.Bit;

   type CR_Register is record
      PG             : CR_PG_Field := 16#0#;
      PER            : CR_PER_Field := 16#0#;
      MER            : CR_MER_Field := 16#0#;
      PNB            : CR_PNB_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : Interfaces.Bit_Types.UInt5 := 16#0#;
      STRT           : CR_STRT_Field := 16#0#;
      OPTSTRT        : CR_OPTSTRT_Field := 16#0#;
      FSTPG          : CR_FSTPG_Field := 16#0#;
      --  unspecified
      Reserved_19_23 : Interfaces.Bit_Types.UInt5 := 16#0#;
      EOPIE          : CR_EOPIE_Field := 16#0#;
      ERRIE          : CR_ERRIE_Field := 16#0#;
      RDERRIE        : CR_RDERRIE_Field := 16#0#;
      OBL_LAUNCH     : CR_OBL_LAUNCH_Field := 16#0#;
      --  unspecified
      Reserved_28_29 : Interfaces.Bit_Types.UInt2 := 16#0#;
      OPTLOCK        : CR_OPTLOCK_Field := 16#0#;
      LOCK           : CR_LOCK_Field := 16#0#;
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

   subtype ECCR_ADDR_ECC_Field is Interfaces.Bit_Types.UInt17;
   subtype ECCR_SYSF_ECC_Field is Interfaces.Bit_Types.Bit;
   subtype ECCR_ECCCIE_Field is Interfaces.Bit_Types.Bit;
   subtype ECCR_CPUID_Field is Interfaces.Bit_Types.UInt3;
   subtype ECCR_ECCC_Field is Interfaces.Bit_Types.Bit;
   subtype ECCR_ECCD_Field is Interfaces.Bit_Types.Bit;

   type ECCR_Register is record
      ADDR_ECC       : ECCR_ADDR_ECC_Field := 16#0#;
      --  unspecified
      Reserved_17_19 : Interfaces.Bit_Types.UInt3 := 16#0#;
      SYSF_ECC       : ECCR_SYSF_ECC_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : Interfaces.Bit_Types.UInt3 := 16#0#;
      ECCCIE         : ECCR_ECCCIE_Field := 16#0#;
      --  unspecified
      Reserved_25_25 : Interfaces.Bit_Types.Bit := 16#0#;
      CPUID          : ECCR_CPUID_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : Interfaces.Bit_Types.Bit := 16#0#;
      ECCC           : ECCR_ECCC_Field := 16#0#;
      ECCD           : ECCR_ECCD_Field := 16#0#;
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

   subtype OPTR_RDP_Field is Interfaces.Bit_Types.Byte;
   subtype OPTR_ESE_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_BOR_LEV_Field is Interfaces.Bit_Types.UInt3;
   subtype OPTR_nRST_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_nRST_STDBY_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_nRST_SHDW_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_IWDG_SW_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_IWDG_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_IWDG_STBY_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_WWDG_SW_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_nBOOT1_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_SRAM2_PE_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_SRAM2_RST_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_nSWBOOT0_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_nBOOT0_Field is Interfaces.Bit_Types.Bit;
   subtype OPTR_AGC_TRIM_Field is Interfaces.Bit_Types.UInt3;

   type OPTR_Register is record
      RDP            : OPTR_RDP_Field := 16#0#;
      ESE            : OPTR_ESE_Field := 16#0#;
      BOR_LEV        : OPTR_BOR_LEV_Field := 16#0#;
      nRST_STOP      : OPTR_nRST_STOP_Field := 16#0#;
      nRST_STDBY     : OPTR_nRST_STDBY_Field := 16#0#;
      nRST_SHDW      : OPTR_nRST_SHDW_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      IWDG_SW        : OPTR_IWDG_SW_Field := 16#0#;
      IWDG_STOP      : OPTR_IWDG_STOP_Field := 16#0#;
      IWDG_STBY      : OPTR_IWDG_STBY_Field := 16#0#;
      WWDG_SW        : OPTR_WWDG_SW_Field := 16#0#;
      --  unspecified
      Reserved_20_22 : Interfaces.Bit_Types.UInt3 := 16#0#;
      nBOOT1         : OPTR_nBOOT1_Field := 16#0#;
      SRAM2_PE       : OPTR_SRAM2_PE_Field := 16#0#;
      SRAM2_RST      : OPTR_SRAM2_RST_Field := 16#0#;
      nSWBOOT0       : OPTR_nSWBOOT0_Field := 16#0#;
      nBOOT0         : OPTR_nBOOT0_Field := 16#0#;
      --  unspecified
      Reserved_28_28 : Interfaces.Bit_Types.Bit := 16#0#;
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

   subtype PCROP1ASR_PCROP1A_STRT_Field is Interfaces.Bit_Types.UInt9;

   type PCROP1ASR_Register is record
      PCROP1A_STRT  : PCROP1ASR_PCROP1A_STRT_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.Bit_Types.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCROP1ASR_Register use record
      PCROP1A_STRT  at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype PCROP1AER_PCROP1A_END_Field is Interfaces.Bit_Types.UInt9;
   subtype PCROP1AER_PCROP_RDP_Field is Interfaces.Bit_Types.Bit;

   type PCROP1AER_Register is record
      PCROP1A_END   : PCROP1AER_PCROP1A_END_Field := 16#0#;
      --  unspecified
      Reserved_9_30 : Interfaces.Bit_Types.UInt22 := 16#0#;
      PCROP_RDP     : PCROP1AER_PCROP_RDP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCROP1AER_Register use record
      PCROP1A_END   at 0 range 0 .. 8;
      Reserved_9_30 at 0 range 9 .. 30;
      PCROP_RDP     at 0 range 31 .. 31;
   end record;

   subtype WRP1AR_WRP1A_STRT_Field is Interfaces.Bit_Types.Byte;
   subtype WRP1AR_WRP1A_END_Field is Interfaces.Bit_Types.Byte;

   type WRP1AR_Register is record
      WRP1A_STRT     : WRP1AR_WRP1A_STRT_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : Interfaces.Bit_Types.Byte := 16#0#;
      WRP1A_END      : WRP1AR_WRP1A_END_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WRP1AR_Register use record
      WRP1A_STRT     at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      WRP1A_END      at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype WRP1BR_WRP1B_STRT_Field is Interfaces.Bit_Types.Byte;
   subtype WRP1BR_WRP1B_END_Field is Interfaces.Bit_Types.Byte;

   type WRP1BR_Register is record
      WRP1B_STRT     : WRP1BR_WRP1B_STRT_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : Interfaces.Bit_Types.Byte := 16#0#;
      WRP1B_END      : WRP1BR_WRP1B_END_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WRP1BR_Register use record
      WRP1B_STRT     at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      WRP1B_END      at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype PCROP1BSR_PCROP1B_STRT_Field is Interfaces.Bit_Types.UInt9;

   type PCROP1BSR_Register is record
      PCROP1B_STRT  : PCROP1BSR_PCROP1B_STRT_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.Bit_Types.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCROP1BSR_Register use record
      PCROP1B_STRT  at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype PCROP1BER_PCROP1B_END_Field is Interfaces.Bit_Types.UInt9;

   type PCROP1BER_Register is record
      PCROP1B_END   : PCROP1BER_PCROP1B_END_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.Bit_Types.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PCROP1BER_Register use record
      PCROP1B_END   at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype IPCCBR_IPCCDBA_Field is Interfaces.Bit_Types.UInt14;

   type IPCCBR_Register is record
      IPCCDBA        : IPCCBR_IPCCDBA_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : Interfaces.Bit_Types.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPCCBR_Register use record
      IPCCDBA        at 0 range 0 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype C2ACR_PRFTEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2ACR_ICEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2ACR_ICRST_Field is Interfaces.Bit_Types.Bit;
   subtype C2ACR_PES_Field is Interfaces.Bit_Types.Bit;

   type C2ACR_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.Bit_Types.Byte := 16#0#;
      PRFTEN         : C2ACR_PRFTEN_Field := 16#0#;
      ICEN           : C2ACR_ICEN_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : Interfaces.Bit_Types.Bit := 16#0#;
      ICRST          : C2ACR_ICRST_Field := 16#0#;
      --  unspecified
      Reserved_12_14 : Interfaces.Bit_Types.UInt3 := 16#0#;
      PES            : C2ACR_PES_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
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

   subtype C2SR_EOP_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_OPERR_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_PROGERR_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_WRPERR_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_PGAERR_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_SIZERR_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_PGSERR_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_MISERR_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_FASTERR_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_RDERR_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_BSY_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_CFGBSY_Field is Interfaces.Bit_Types.Bit;
   subtype C2SR_PESD_Field is Interfaces.Bit_Types.Bit;

   type C2SR_Register is record
      EOP            : C2SR_EOP_Field := 16#0#;
      OPERR          : C2SR_OPERR_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.Bit_Types.Bit := 16#0#;
      PROGERR        : C2SR_PROGERR_Field := 16#0#;
      WRPERR         : C2SR_WRPERR_Field := 16#0#;
      PGAERR         : C2SR_PGAERR_Field := 16#0#;
      SIZERR         : C2SR_SIZERR_Field := 16#0#;
      PGSERR         : C2SR_PGSERR_Field := 16#0#;
      MISERR         : C2SR_MISERR_Field := 16#0#;
      FASTERR        : C2SR_FASTERR_Field := 16#0#;
      --  unspecified
      Reserved_10_13 : Interfaces.Bit_Types.UInt4 := 16#0#;
      RDERR          : C2SR_RDERR_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      BSY            : C2SR_BSY_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : Interfaces.Bit_Types.Bit := 16#0#;
      CFGBSY         : C2SR_CFGBSY_Field := 16#0#;
      PESD           : C2SR_PESD_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : Interfaces.Bit_Types.UInt12 := 16#0#;
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

   subtype C2CR_PG_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_PER_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_MER_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_PNB_Field is Interfaces.Bit_Types.Byte;
   subtype C2CR_STRT_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_FSTPG_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_EOPIE_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_ERRIE_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR_RDERRIE_Field is Interfaces.Bit_Types.Bit;

   type C2CR_Register is record
      PG             : C2CR_PG_Field := 16#0#;
      PER            : C2CR_PER_Field := 16#0#;
      MER            : C2CR_MER_Field := 16#0#;
      PNB            : C2CR_PNB_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : Interfaces.Bit_Types.UInt5 := 16#0#;
      STRT           : C2CR_STRT_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : Interfaces.Bit_Types.Bit := 16#0#;
      FSTPG          : C2CR_FSTPG_Field := 16#0#;
      --  unspecified
      Reserved_19_23 : Interfaces.Bit_Types.UInt5 := 16#0#;
      EOPIE          : C2CR_EOPIE_Field := 16#0#;
      ERRIE          : C2CR_ERRIE_Field := 16#0#;
      RDERRIE        : C2CR_RDERRIE_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : Interfaces.Bit_Types.UInt5 := 16#0#;
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

   subtype SFR_SFSA_Field is Interfaces.Bit_Types.Byte;
   subtype SFR_FSD_Field is Interfaces.Bit_Types.Bit;
   subtype SFR_DDS_Field is Interfaces.Bit_Types.Bit;

   type SFR_Register is record
      SFSA           : SFR_SFSA_Field := 16#0#;
      FSD            : SFR_FSD_Field := 16#0#;
      --  unspecified
      Reserved_9_11  : Interfaces.Bit_Types.UInt3 := 16#0#;
      DDS            : SFR_DDS_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : Interfaces.Bit_Types.UInt19 := 16#0#;
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

   subtype SRRVR_SBRV_Field is Interfaces.Bit_Types.UInt18;
   subtype SRRVR_SBRSA_Field is Interfaces.Bit_Types.UInt5;
   subtype SRRVR_BRSD_Field is Interfaces.Bit_Types.Bit;
   subtype SRRVR_SNBRSA_Field is Interfaces.Bit_Types.UInt5;
   subtype SRRVR_NBRSD_Field is Interfaces.Bit_Types.Bit;
   subtype SRRVR_C2OPT_Field is Interfaces.Bit_Types.Bit;

   type SRRVR_Register is record
      SBRV           : SRRVR_SBRV_Field := 16#0#;
      SBRSA          : SRRVR_SBRSA_Field := 16#0#;
      BRSD           : SRRVR_BRSD_Field := 16#0#;
      --  unspecified
      Reserved_24_24 : Interfaces.Bit_Types.Bit := 16#0#;
      SNBRSA         : SRRVR_SNBRSA_Field := 16#0#;
      NBRSD          : SRRVR_NBRSD_Field := 16#0#;
      C2OPT          : SRRVR_C2OPT_Field := 16#0#;
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
      KEYR      : aliased Interfaces.Bit_Types.Word;
      OPTKEYR   : aliased Interfaces.Bit_Types.Word;
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

end Interfaces.STM32.FLASH;
