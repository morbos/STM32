--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.SAI is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype ACR1_MODE_Field is Interfaces.Bit_Types.UInt2;
   subtype ACR1_PRTCFG_Field is Interfaces.Bit_Types.UInt2;
   subtype ACR1_DS_Field is Interfaces.Bit_Types.UInt3;
   subtype ACR1_LSBFIRST_Field is Interfaces.Bit_Types.Bit;
   subtype ACR1_CKSTR_Field is Interfaces.Bit_Types.Bit;
   subtype ACR1_SYNCEN_Field is Interfaces.Bit_Types.UInt2;
   subtype ACR1_MONO_Field is Interfaces.Bit_Types.Bit;
   subtype ACR1_OUTDRIV_Field is Interfaces.Bit_Types.Bit;
   subtype ACR1_SAIEN_Field is Interfaces.Bit_Types.Bit;
   subtype ACR1_DMAEN_Field is Interfaces.Bit_Types.Bit;
   subtype ACR1_NODIV_Field is Interfaces.Bit_Types.Bit;
   subtype ACR1_MCKDIV_Field is Interfaces.Bit_Types.UInt6;
   subtype ACR1_OSR_Field is Interfaces.Bit_Types.Bit;
   subtype ACR1_MCKEN_Field is Interfaces.Bit_Types.Bit;

   type ACR1_Register is record
      MODE           : ACR1_MODE_Field := 16#0#;
      PRTCFG         : ACR1_PRTCFG_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : Interfaces.Bit_Types.Bit := 16#0#;
      DS             : ACR1_DS_Field := 16#0#;
      LSBFIRST       : ACR1_LSBFIRST_Field := 16#0#;
      CKSTR          : ACR1_CKSTR_Field := 16#0#;
      SYNCEN         : ACR1_SYNCEN_Field := 16#0#;
      MONO           : ACR1_MONO_Field := 16#0#;
      OUTDRIV        : ACR1_OUTDRIV_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.Bit_Types.UInt2 := 16#0#;
      SAIEN          : ACR1_SAIEN_Field := 16#0#;
      DMAEN          : ACR1_DMAEN_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : Interfaces.Bit_Types.Bit := 16#0#;
      NODIV          : ACR1_NODIV_Field := 16#0#;
      MCKDIV         : ACR1_MCKDIV_Field := 16#0#;
      OSR            : ACR1_OSR_Field := 16#0#;
      MCKEN          : ACR1_MCKEN_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.Bit_Types.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACR1_Register use record
      MODE           at 0 range 0 .. 1;
      PRTCFG         at 0 range 2 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      DS             at 0 range 5 .. 7;
      LSBFIRST       at 0 range 8 .. 8;
      CKSTR          at 0 range 9 .. 9;
      SYNCEN         at 0 range 10 .. 11;
      MONO           at 0 range 12 .. 12;
      OUTDRIV        at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      SAIEN          at 0 range 16 .. 16;
      DMAEN          at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      NODIV          at 0 range 19 .. 19;
      MCKDIV         at 0 range 20 .. 25;
      OSR            at 0 range 26 .. 26;
      MCKEN          at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ACR2_FTH_Field is Interfaces.Bit_Types.UInt3;
   subtype ACR2_FFLUS_Field is Interfaces.Bit_Types.Bit;
   subtype ACR2_TRIS_Field is Interfaces.Bit_Types.Bit;
   subtype ACR2_MUTE_Field is Interfaces.Bit_Types.Bit;
   subtype ACR2_MUTE_VAL_Field is Interfaces.Bit_Types.Bit;
   subtype ACR2_MUTECN_Field is Interfaces.Bit_Types.UInt6;
   subtype ACR2_CPL_Field is Interfaces.Bit_Types.Bit;
   subtype ACR2_COMP_Field is Interfaces.Bit_Types.UInt2;

   type ACR2_Register is record
      FTH            : ACR2_FTH_Field := 16#0#;
      FFLUS          : ACR2_FFLUS_Field := 16#0#;
      TRIS           : ACR2_TRIS_Field := 16#0#;
      MUTE           : ACR2_MUTE_Field := 16#0#;
      MUTE_VAL       : ACR2_MUTE_VAL_Field := 16#0#;
      MUTECN         : ACR2_MUTECN_Field := 16#0#;
      CPL            : ACR2_CPL_Field := 16#0#;
      COMP           : ACR2_COMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACR2_Register use record
      FTH            at 0 range 0 .. 2;
      FFLUS          at 0 range 3 .. 3;
      TRIS           at 0 range 4 .. 4;
      MUTE           at 0 range 5 .. 5;
      MUTE_VAL       at 0 range 6 .. 6;
      MUTECN         at 0 range 7 .. 12;
      CPL            at 0 range 13 .. 13;
      COMP           at 0 range 14 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype AFRCR_FRL_Field is Interfaces.Bit_Types.Byte;
   subtype AFRCR_FSALL_Field is Interfaces.Bit_Types.UInt7;
   subtype AFRCR_FSDEF_Field is Interfaces.Bit_Types.Bit;
   subtype AFRCR_FSPOL_Field is Interfaces.Bit_Types.Bit;
   subtype AFRCR_FSOFF_Field is Interfaces.Bit_Types.Bit;

   type AFRCR_Register is record
      FRL            : AFRCR_FRL_Field := 16#0#;
      FSALL          : AFRCR_FSALL_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      FSDEF          : AFRCR_FSDEF_Field := 16#0#;
      FSPOL          : AFRCR_FSPOL_Field := 16#0#;
      FSOFF          : AFRCR_FSOFF_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : Interfaces.Bit_Types.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AFRCR_Register use record
      FRL            at 0 range 0 .. 7;
      FSALL          at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      FSDEF          at 0 range 16 .. 16;
      FSPOL          at 0 range 17 .. 17;
      FSOFF          at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype ASLOTR_FBOFF_Field is Interfaces.Bit_Types.UInt5;
   subtype ASLOTR_SLOTSZ_Field is Interfaces.Bit_Types.UInt2;
   subtype ASLOTR_NBSLOT_Field is Interfaces.Bit_Types.UInt4;
   subtype ASLOTR_SLOTEN_Field is Interfaces.Bit_Types.Short;

   type ASLOTR_Register is record
      FBOFF          : ASLOTR_FBOFF_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : Interfaces.Bit_Types.Bit := 16#0#;
      SLOTSZ         : ASLOTR_SLOTSZ_Field := 16#0#;
      NBSLOT         : ASLOTR_NBSLOT_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : Interfaces.Bit_Types.UInt4 := 16#0#;
      SLOTEN         : ASLOTR_SLOTEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ASLOTR_Register use record
      FBOFF          at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      SLOTSZ         at 0 range 6 .. 7;
      NBSLOT         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      SLOTEN         at 0 range 16 .. 31;
   end record;

   subtype AIM_OVRUDRIE_Field is Interfaces.Bit_Types.Bit;
   subtype AIM_MUTEDETIE_Field is Interfaces.Bit_Types.Bit;
   subtype AIM_WCKCFGIE_Field is Interfaces.Bit_Types.Bit;
   subtype AIM_FREQIE_Field is Interfaces.Bit_Types.Bit;
   subtype AIM_CNRDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype AIM_AFSDETIE_Field is Interfaces.Bit_Types.Bit;
   subtype AIM_LFSDETIE_Field is Interfaces.Bit_Types.Bit;

   type AIM_Register is record
      OVRUDRIE      : AIM_OVRUDRIE_Field := 16#0#;
      MUTEDETIE     : AIM_MUTEDETIE_Field := 16#0#;
      WCKCFGIE      : AIM_WCKCFGIE_Field := 16#0#;
      FREQIE        : AIM_FREQIE_Field := 16#0#;
      CNRDYIE       : AIM_CNRDYIE_Field := 16#0#;
      AFSDETIE      : AIM_AFSDETIE_Field := 16#0#;
      LFSDETIE      : AIM_LFSDETIE_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.Bit_Types.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AIM_Register use record
      OVRUDRIE      at 0 range 0 .. 0;
      MUTEDETIE     at 0 range 1 .. 1;
      WCKCFGIE      at 0 range 2 .. 2;
      FREQIE        at 0 range 3 .. 3;
      CNRDYIE       at 0 range 4 .. 4;
      AFSDETIE      at 0 range 5 .. 5;
      LFSDETIE      at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype ASR_OVRUDR_Field is Interfaces.Bit_Types.Bit;
   subtype ASR_MUTEDET_Field is Interfaces.Bit_Types.Bit;
   subtype ASR_WCKCFG_Field is Interfaces.Bit_Types.Bit;
   subtype ASR_FREQ_Field is Interfaces.Bit_Types.Bit;
   subtype ASR_CNRDY_Field is Interfaces.Bit_Types.Bit;
   subtype ASR_AFSDET_Field is Interfaces.Bit_Types.Bit;
   subtype ASR_LFSDET_Field is Interfaces.Bit_Types.Bit;
   subtype ASR_FLVL_Field is Interfaces.Bit_Types.UInt3;

   type ASR_Register is record
      OVRUDR         : ASR_OVRUDR_Field := 16#0#;
      MUTEDET        : ASR_MUTEDET_Field := 16#0#;
      WCKCFG         : ASR_WCKCFG_Field := 16#0#;
      FREQ           : ASR_FREQ_Field := 16#0#;
      CNRDY          : ASR_CNRDY_Field := 16#0#;
      AFSDET         : ASR_AFSDET_Field := 16#0#;
      LFSDET         : ASR_LFSDET_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : Interfaces.Bit_Types.UInt9 := 16#0#;
      FLVL           : ASR_FLVL_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : Interfaces.Bit_Types.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ASR_Register use record
      OVRUDR         at 0 range 0 .. 0;
      MUTEDET        at 0 range 1 .. 1;
      WCKCFG         at 0 range 2 .. 2;
      FREQ           at 0 range 3 .. 3;
      CNRDY          at 0 range 4 .. 4;
      AFSDET         at 0 range 5 .. 5;
      LFSDET         at 0 range 6 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      FLVL           at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype ACLRFR_COVRUDR_Field is Interfaces.Bit_Types.Bit;
   subtype ACLRFR_CMUTEDET_Field is Interfaces.Bit_Types.Bit;
   subtype ACLRFR_CWCKCFG_Field is Interfaces.Bit_Types.Bit;
   subtype ACLRFR_CCNRDY_Field is Interfaces.Bit_Types.Bit;
   subtype ACLRFR_CAFSDET_Field is Interfaces.Bit_Types.Bit;
   subtype ACLRFR_CLFSDET_Field is Interfaces.Bit_Types.Bit;

   type ACLRFR_Register is record
      COVRUDR       : ACLRFR_COVRUDR_Field := 16#0#;
      CMUTEDET      : ACLRFR_CMUTEDET_Field := 16#0#;
      CWCKCFG       : ACLRFR_CWCKCFG_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : Interfaces.Bit_Types.Bit := 16#0#;
      CCNRDY        : ACLRFR_CCNRDY_Field := 16#0#;
      CAFSDET       : ACLRFR_CAFSDET_Field := 16#0#;
      CLFSDET       : ACLRFR_CLFSDET_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.Bit_Types.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACLRFR_Register use record
      COVRUDR       at 0 range 0 .. 0;
      CMUTEDET      at 0 range 1 .. 1;
      CWCKCFG       at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      CCNRDY        at 0 range 4 .. 4;
      CAFSDET       at 0 range 5 .. 5;
      CLFSDET       at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype BCR1_MODE_Field is Interfaces.Bit_Types.UInt2;
   subtype BCR1_PRTCFG_Field is Interfaces.Bit_Types.UInt2;
   subtype BCR1_DS_Field is Interfaces.Bit_Types.UInt3;
   subtype BCR1_LSBFIRST_Field is Interfaces.Bit_Types.Bit;
   subtype BCR1_CKSTR_Field is Interfaces.Bit_Types.Bit;
   subtype BCR1_SYNCEN_Field is Interfaces.Bit_Types.UInt2;
   subtype BCR1_MONO_Field is Interfaces.Bit_Types.Bit;
   subtype BCR1_OUTDRIV_Field is Interfaces.Bit_Types.Bit;
   subtype BCR1_SAIEN_Field is Interfaces.Bit_Types.Bit;
   subtype BCR1_DMAEN_Field is Interfaces.Bit_Types.Bit;
   subtype BCR1_NODIV_Field is Interfaces.Bit_Types.Bit;
   subtype BCR1_MCKDIV_Field is Interfaces.Bit_Types.UInt6;
   subtype BCR1_OSR_Field is Interfaces.Bit_Types.Bit;
   subtype BCR1_MCKEN_Field is Interfaces.Bit_Types.Bit;

   type BCR1_Register is record
      MODE           : BCR1_MODE_Field := 16#0#;
      PRTCFG         : BCR1_PRTCFG_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : Interfaces.Bit_Types.Bit := 16#0#;
      DS             : BCR1_DS_Field := 16#0#;
      LSBFIRST       : BCR1_LSBFIRST_Field := 16#0#;
      CKSTR          : BCR1_CKSTR_Field := 16#0#;
      SYNCEN         : BCR1_SYNCEN_Field := 16#0#;
      MONO           : BCR1_MONO_Field := 16#0#;
      OUTDRIV        : BCR1_OUTDRIV_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.Bit_Types.UInt2 := 16#0#;
      SAIEN          : BCR1_SAIEN_Field := 16#0#;
      DMAEN          : BCR1_DMAEN_Field := 16#0#;
      --  unspecified
      Reserved_18_18 : Interfaces.Bit_Types.Bit := 16#0#;
      NODIV          : BCR1_NODIV_Field := 16#0#;
      MCKDIV         : BCR1_MCKDIV_Field := 16#0#;
      OSR            : BCR1_OSR_Field := 16#0#;
      MCKEN          : BCR1_MCKEN_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.Bit_Types.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BCR1_Register use record
      MODE           at 0 range 0 .. 1;
      PRTCFG         at 0 range 2 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      DS             at 0 range 5 .. 7;
      LSBFIRST       at 0 range 8 .. 8;
      CKSTR          at 0 range 9 .. 9;
      SYNCEN         at 0 range 10 .. 11;
      MONO           at 0 range 12 .. 12;
      OUTDRIV        at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      SAIEN          at 0 range 16 .. 16;
      DMAEN          at 0 range 17 .. 17;
      Reserved_18_18 at 0 range 18 .. 18;
      NODIV          at 0 range 19 .. 19;
      MCKDIV         at 0 range 20 .. 25;
      OSR            at 0 range 26 .. 26;
      MCKEN          at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype BCR2_FTH_Field is Interfaces.Bit_Types.UInt3;
   subtype BCR2_FFLUS_Field is Interfaces.Bit_Types.Bit;
   subtype BCR2_TRIS_Field is Interfaces.Bit_Types.Bit;
   subtype BCR2_MUTE_Field is Interfaces.Bit_Types.Bit;
   subtype BCR2_MUTE_VAL_Field is Interfaces.Bit_Types.Bit;
   subtype BCR2_MUTECN_Field is Interfaces.Bit_Types.UInt6;
   subtype BCR2_CPL_Field is Interfaces.Bit_Types.Bit;
   subtype BCR2_COMP_Field is Interfaces.Bit_Types.UInt2;

   type BCR2_Register is record
      FTH            : BCR2_FTH_Field := 16#0#;
      FFLUS          : BCR2_FFLUS_Field := 16#0#;
      TRIS           : BCR2_TRIS_Field := 16#0#;
      MUTE           : BCR2_MUTE_Field := 16#0#;
      MUTE_VAL       : BCR2_MUTE_VAL_Field := 16#0#;
      MUTECN         : BCR2_MUTECN_Field := 16#0#;
      CPL            : BCR2_CPL_Field := 16#0#;
      COMP           : BCR2_COMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BCR2_Register use record
      FTH            at 0 range 0 .. 2;
      FFLUS          at 0 range 3 .. 3;
      TRIS           at 0 range 4 .. 4;
      MUTE           at 0 range 5 .. 5;
      MUTE_VAL       at 0 range 6 .. 6;
      MUTECN         at 0 range 7 .. 12;
      CPL            at 0 range 13 .. 13;
      COMP           at 0 range 14 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BFRCR_FRL_Field is Interfaces.Bit_Types.Byte;
   subtype BFRCR_FSALL_Field is Interfaces.Bit_Types.UInt7;
   subtype BFRCR_FSDEF_Field is Interfaces.Bit_Types.Bit;
   subtype BFRCR_FSPOL_Field is Interfaces.Bit_Types.Bit;
   subtype BFRCR_FSOFF_Field is Interfaces.Bit_Types.Bit;

   type BFRCR_Register is record
      FRL            : BFRCR_FRL_Field := 16#0#;
      FSALL          : BFRCR_FSALL_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      FSDEF          : BFRCR_FSDEF_Field := 16#0#;
      FSPOL          : BFRCR_FSPOL_Field := 16#0#;
      FSOFF          : BFRCR_FSOFF_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : Interfaces.Bit_Types.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BFRCR_Register use record
      FRL            at 0 range 0 .. 7;
      FSALL          at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      FSDEF          at 0 range 16 .. 16;
      FSPOL          at 0 range 17 .. 17;
      FSOFF          at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype BSLOTR_FBOFF_Field is Interfaces.Bit_Types.UInt5;
   subtype BSLOTR_SLOTSZ_Field is Interfaces.Bit_Types.UInt2;
   subtype BSLOTR_NBSLOT_Field is Interfaces.Bit_Types.UInt4;
   subtype BSLOTR_SLOTEN_Field is Interfaces.Bit_Types.Short;

   type BSLOTR_Register is record
      FBOFF          : BSLOTR_FBOFF_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : Interfaces.Bit_Types.Bit := 16#0#;
      SLOTSZ         : BSLOTR_SLOTSZ_Field := 16#0#;
      NBSLOT         : BSLOTR_NBSLOT_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : Interfaces.Bit_Types.UInt4 := 16#0#;
      SLOTEN         : BSLOTR_SLOTEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BSLOTR_Register use record
      FBOFF          at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      SLOTSZ         at 0 range 6 .. 7;
      NBSLOT         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      SLOTEN         at 0 range 16 .. 31;
   end record;

   subtype BIM_OVRUDRIE_Field is Interfaces.Bit_Types.Bit;
   subtype BIM_MUTEDETIE_Field is Interfaces.Bit_Types.Bit;
   subtype BIM_WCKCFGIE_Field is Interfaces.Bit_Types.Bit;
   subtype BIM_FREQIE_Field is Interfaces.Bit_Types.Bit;
   subtype BIM_CNRDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype BIM_AFSDETIE_Field is Interfaces.Bit_Types.Bit;
   subtype BIM_LFSDETIE_Field is Interfaces.Bit_Types.Bit;

   type BIM_Register is record
      OVRUDRIE      : BIM_OVRUDRIE_Field := 16#0#;
      MUTEDETIE     : BIM_MUTEDETIE_Field := 16#0#;
      WCKCFGIE      : BIM_WCKCFGIE_Field := 16#0#;
      FREQIE        : BIM_FREQIE_Field := 16#0#;
      CNRDYIE       : BIM_CNRDYIE_Field := 16#0#;
      AFSDETIE      : BIM_AFSDETIE_Field := 16#0#;
      LFSDETIE      : BIM_LFSDETIE_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.Bit_Types.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BIM_Register use record
      OVRUDRIE      at 0 range 0 .. 0;
      MUTEDETIE     at 0 range 1 .. 1;
      WCKCFGIE      at 0 range 2 .. 2;
      FREQIE        at 0 range 3 .. 3;
      CNRDYIE       at 0 range 4 .. 4;
      AFSDETIE      at 0 range 5 .. 5;
      LFSDETIE      at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype BSR_OVRUDR_Field is Interfaces.Bit_Types.Bit;
   subtype BSR_MUTEDET_Field is Interfaces.Bit_Types.Bit;
   subtype BSR_WCKCFG_Field is Interfaces.Bit_Types.Bit;
   subtype BSR_FREQ_Field is Interfaces.Bit_Types.Bit;
   subtype BSR_CNRDY_Field is Interfaces.Bit_Types.Bit;
   subtype BSR_AFSDET_Field is Interfaces.Bit_Types.Bit;
   subtype BSR_LFSDET_Field is Interfaces.Bit_Types.Bit;
   subtype BSR_FLVL_Field is Interfaces.Bit_Types.UInt3;

   type BSR_Register is record
      OVRUDR         : BSR_OVRUDR_Field := 16#0#;
      MUTEDET        : BSR_MUTEDET_Field := 16#0#;
      WCKCFG         : BSR_WCKCFG_Field := 16#0#;
      FREQ           : BSR_FREQ_Field := 16#0#;
      CNRDY          : BSR_CNRDY_Field := 16#0#;
      AFSDET         : BSR_AFSDET_Field := 16#0#;
      LFSDET         : BSR_LFSDET_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : Interfaces.Bit_Types.UInt9 := 16#0#;
      FLVL           : BSR_FLVL_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : Interfaces.Bit_Types.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BSR_Register use record
      OVRUDR         at 0 range 0 .. 0;
      MUTEDET        at 0 range 1 .. 1;
      WCKCFG         at 0 range 2 .. 2;
      FREQ           at 0 range 3 .. 3;
      CNRDY          at 0 range 4 .. 4;
      AFSDET         at 0 range 5 .. 5;
      LFSDET         at 0 range 6 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      FLVL           at 0 range 16 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype BCLRFR_COVRUDR_Field is Interfaces.Bit_Types.Bit;
   subtype BCLRFR_CMUTEDET_Field is Interfaces.Bit_Types.Bit;
   subtype BCLRFR_CWCKCFG_Field is Interfaces.Bit_Types.Bit;
   subtype BCLRFR_CCNRDY_Field is Interfaces.Bit_Types.Bit;
   subtype BCLRFR_CAFSDET_Field is Interfaces.Bit_Types.Bit;
   subtype BCLRFR_CLFSDET_Field is Interfaces.Bit_Types.Bit;

   type BCLRFR_Register is record
      COVRUDR       : BCLRFR_COVRUDR_Field := 16#0#;
      CMUTEDET      : BCLRFR_CMUTEDET_Field := 16#0#;
      CWCKCFG       : BCLRFR_CWCKCFG_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : Interfaces.Bit_Types.Bit := 16#0#;
      CCNRDY        : BCLRFR_CCNRDY_Field := 16#0#;
      CAFSDET       : BCLRFR_CAFSDET_Field := 16#0#;
      CLFSDET       : BCLRFR_CLFSDET_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.Bit_Types.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BCLRFR_Register use record
      COVRUDR       at 0 range 0 .. 0;
      CMUTEDET      at 0 range 1 .. 1;
      CWCKCFG       at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      CCNRDY        at 0 range 4 .. 4;
      CAFSDET       at 0 range 5 .. 5;
      CLFSDET       at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype PDMCR_PDMEN_Field is Interfaces.Bit_Types.Bit;
   subtype PDMCR_MICNBR_Field is Interfaces.Bit_Types.UInt2;
   --  PDMCR_CKEN array element
   subtype PDMCR_CKEN_Element is Interfaces.Bit_Types.Bit;

   --  PDMCR_CKEN array
   type PDMCR_CKEN_Field_Array is array (1 .. 2) of PDMCR_CKEN_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PDMCR_CKEN
   type PDMCR_CKEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CKEN as a value
            Val : Interfaces.Bit_Types.UInt2;
         when True =>
            --  CKEN as an array
            Arr : PDMCR_CKEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PDMCR_CKEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   type PDMCR_Register is record
      PDMEN          : PDMCR_PDMEN_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : Interfaces.Bit_Types.UInt3 := 16#0#;
      MICNBR         : PDMCR_MICNBR_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      CKEN           : PDMCR_CKEN_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDMCR_Register use record
      PDMEN          at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      MICNBR         at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      CKEN           at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype PDMDLY_DLYM1L_Field is Interfaces.Bit_Types.UInt3;
   subtype PDMDLY_DLYM1R_Field is Interfaces.Bit_Types.UInt3;
   subtype PDMDLY_DLYM2L_Field is Interfaces.Bit_Types.UInt3;
   subtype PDMDLY_DLYM2R_Field is Interfaces.Bit_Types.UInt3;
   subtype PDMDLY_DLYM3L_Field is Interfaces.Bit_Types.UInt3;
   subtype PDMDLY_DLYM3R_Field is Interfaces.Bit_Types.UInt3;
   subtype PDMDLY_DLYM4L_Field is Interfaces.Bit_Types.UInt3;
   subtype PDMDLY_DLYM4R_Field is Interfaces.Bit_Types.UInt3;

   type PDMDLY_Register is record
      DLYM1L         : PDMDLY_DLYM1L_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Interfaces.Bit_Types.Bit := 16#0#;
      DLYM1R         : PDMDLY_DLYM1R_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      DLYM2L         : PDMDLY_DLYM2L_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : Interfaces.Bit_Types.Bit := 16#0#;
      DLYM2R         : PDMDLY_DLYM2R_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      DLYM3L         : PDMDLY_DLYM3L_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.Bit_Types.Bit := 16#0#;
      DLYM3R         : PDMDLY_DLYM3R_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : Interfaces.Bit_Types.Bit := 16#0#;
      DLYM4L         : PDMDLY_DLYM4L_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : Interfaces.Bit_Types.Bit := 16#0#;
      DLYM4R         : PDMDLY_DLYM4R_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : Interfaces.Bit_Types.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDMDLY_Register use record
      DLYM1L         at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      DLYM1R         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      DLYM2L         at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      DLYM2R         at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      DLYM3L         at 0 range 16 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      DLYM3R         at 0 range 20 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      DLYM4L         at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      DLYM4R         at 0 range 28 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SAI_Peripheral is record
      ACR1   : aliased ACR1_Register;
      ACR2   : aliased ACR2_Register;
      AFRCR  : aliased AFRCR_Register;
      ASLOTR : aliased ASLOTR_Register;
      AIM    : aliased AIM_Register;
      ASR    : aliased ASR_Register;
      ACLRFR : aliased ACLRFR_Register;
      ADR    : aliased Interfaces.Bit_Types.Word;
      BCR1   : aliased BCR1_Register;
      BCR2   : aliased BCR2_Register;
      BFRCR  : aliased BFRCR_Register;
      BSLOTR : aliased BSLOTR_Register;
      BIM    : aliased BIM_Register;
      BSR    : aliased BSR_Register;
      BCLRFR : aliased BCLRFR_Register;
      BDR    : aliased Interfaces.Bit_Types.Word;
      PDMCR  : aliased PDMCR_Register;
      PDMDLY : aliased PDMDLY_Register;
   end record
     with Volatile;

   for SAI_Peripheral use record
      ACR1   at 16#4# range 0 .. 31;
      ACR2   at 16#8# range 0 .. 31;
      AFRCR  at 16#C# range 0 .. 31;
      ASLOTR at 16#10# range 0 .. 31;
      AIM    at 16#14# range 0 .. 31;
      ASR    at 16#18# range 0 .. 31;
      ACLRFR at 16#1C# range 0 .. 31;
      ADR    at 16#20# range 0 .. 31;
      BCR1   at 16#24# range 0 .. 31;
      BCR2   at 16#28# range 0 .. 31;
      BFRCR  at 16#2C# range 0 .. 31;
      BSLOTR at 16#30# range 0 .. 31;
      BIM    at 16#34# range 0 .. 31;
      BSR    at 16#38# range 0 .. 31;
      BCLRFR at 16#3C# range 0 .. 31;
      BDR    at 16#40# range 0 .. 31;
      PDMCR  at 16#44# range 0 .. 31;
      PDMDLY at 16#48# range 0 .. 31;
   end record;

   SAI_Periph : aliased SAI_Peripheral
     with Import, Address => System'To_Address (16#40015400#);

end Interfaces.STM32.SAI;
