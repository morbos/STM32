--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.SAI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ACR1_MODE_Field is HAL.UInt2;
   subtype ACR1_PRTCFG_Field is HAL.UInt2;
   subtype ACR1_DS_Field is HAL.UInt3;
   subtype ACR1_SYNCEN_Field is HAL.UInt2;
   subtype ACR1_MCKDIV_Field is HAL.UInt6;

   type ACR1_Register is record
      MODE           : ACR1_MODE_Field := 16#0#;
      PRTCFG         : ACR1_PRTCFG_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : HAL.Bit := 16#0#;
      DS             : ACR1_DS_Field := 16#0#;
      LSBFIRST       : Boolean := False;
      CKSTR          : Boolean := False;
      SYNCEN         : ACR1_SYNCEN_Field := 16#0#;
      MONO           : Boolean := False;
      OUTDRIV        : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      SAIEN          : Boolean := False;
      DMAEN          : Boolean := False;
      --  unspecified
      Reserved_18_18 : HAL.Bit := 16#0#;
      NODIV          : Boolean := False;
      MCKDIV         : ACR1_MCKDIV_Field := 16#0#;
      OSR            : Boolean := False;
      MCKEN          : Boolean := False;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
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

   subtype ACR2_FTH_Field is HAL.UInt3;
   subtype ACR2_MUTECN_Field is HAL.UInt6;
   subtype ACR2_COMP_Field is HAL.UInt2;

   type ACR2_Register is record
      FTH            : ACR2_FTH_Field := 16#0#;
      FFLUS          : Boolean := False;
      TRIS           : Boolean := False;
      MUTE           : Boolean := False;
      MUTE_VAL       : Boolean := False;
      MUTECN         : ACR2_MUTECN_Field := 16#0#;
      CPL            : Boolean := False;
      COMP           : ACR2_COMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

   subtype AFRCR_FRL_Field is HAL.UInt8;
   subtype AFRCR_FSALL_Field is HAL.UInt7;

   type AFRCR_Register is record
      FRL            : AFRCR_FRL_Field := 16#0#;
      FSALL          : AFRCR_FSALL_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      FSDEF          : Boolean := False;
      FSPOL          : Boolean := False;
      FSOFF          : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
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

   subtype ASLOTR_FBOFF_Field is HAL.UInt5;
   subtype ASLOTR_SLOTSZ_Field is HAL.UInt2;
   subtype ASLOTR_NBSLOT_Field is HAL.UInt4;
   subtype ASLOTR_SLOTEN_Field is HAL.UInt16;

   type ASLOTR_Register is record
      FBOFF          : ASLOTR_FBOFF_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      SLOTSZ         : ASLOTR_SLOTSZ_Field := 16#0#;
      NBSLOT         : ASLOTR_NBSLOT_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
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

   type AIM_Register is record
      OVRUDRIE      : Boolean := False;
      MUTEDETIE     : Boolean := False;
      WCKCFGIE      : Boolean := False;
      FREQIE        : Boolean := False;
      CNRDYIE       : Boolean := False;
      AFSDETIE      : Boolean := False;
      LFSDETIE      : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
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

   subtype ASR_FLVL_Field is HAL.UInt3;

   type ASR_Register is record
      OVRUDR         : Boolean := False;
      MUTEDET        : Boolean := False;
      WCKCFG         : Boolean := False;
      FREQ           : Boolean := False;
      CNRDY          : Boolean := False;
      AFSDET         : Boolean := False;
      LFSDET         : Boolean := False;
      --  unspecified
      Reserved_7_15  : HAL.UInt9 := 16#0#;
      FLVL           : ASR_FLVL_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
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

   type ACLRFR_Register is record
      COVRUDR       : Boolean := False;
      CMUTEDET      : Boolean := False;
      CWCKCFG       : Boolean := False;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      CCNRDY        : Boolean := False;
      CAFSDET       : Boolean := False;
      CLFSDET       : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
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

   subtype BCR1_MODE_Field is HAL.UInt2;
   subtype BCR1_PRTCFG_Field is HAL.UInt2;
   subtype BCR1_DS_Field is HAL.UInt3;
   subtype BCR1_SYNCEN_Field is HAL.UInt2;
   subtype BCR1_MCKDIV_Field is HAL.UInt6;

   type BCR1_Register is record
      MODE           : BCR1_MODE_Field := 16#0#;
      PRTCFG         : BCR1_PRTCFG_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : HAL.Bit := 16#0#;
      DS             : BCR1_DS_Field := 16#0#;
      LSBFIRST       : Boolean := False;
      CKSTR          : Boolean := False;
      SYNCEN         : BCR1_SYNCEN_Field := 16#0#;
      MONO           : Boolean := False;
      OUTDRIV        : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      SAIEN          : Boolean := False;
      DMAEN          : Boolean := False;
      --  unspecified
      Reserved_18_18 : HAL.Bit := 16#0#;
      NODIV          : Boolean := False;
      MCKDIV         : BCR1_MCKDIV_Field := 16#0#;
      OSR            : Boolean := False;
      MCKEN          : Boolean := False;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
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

   subtype BCR2_FTH_Field is HAL.UInt3;
   subtype BCR2_MUTECN_Field is HAL.UInt6;
   subtype BCR2_COMP_Field is HAL.UInt2;

   type BCR2_Register is record
      FTH            : BCR2_FTH_Field := 16#0#;
      FFLUS          : Boolean := False;
      TRIS           : Boolean := False;
      MUTE           : Boolean := False;
      MUTE_VAL       : Boolean := False;
      MUTECN         : BCR2_MUTECN_Field := 16#0#;
      CPL            : Boolean := False;
      COMP           : BCR2_COMP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

   subtype BFRCR_FRL_Field is HAL.UInt8;
   subtype BFRCR_FSALL_Field is HAL.UInt7;

   type BFRCR_Register is record
      FRL            : BFRCR_FRL_Field := 16#0#;
      FSALL          : BFRCR_FSALL_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      FSDEF          : Boolean := False;
      FSPOL          : Boolean := False;
      FSOFF          : Boolean := False;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
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

   subtype BSLOTR_FBOFF_Field is HAL.UInt5;
   subtype BSLOTR_SLOTSZ_Field is HAL.UInt2;
   subtype BSLOTR_NBSLOT_Field is HAL.UInt4;
   subtype BSLOTR_SLOTEN_Field is HAL.UInt16;

   type BSLOTR_Register is record
      FBOFF          : BSLOTR_FBOFF_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      SLOTSZ         : BSLOTR_SLOTSZ_Field := 16#0#;
      NBSLOT         : BSLOTR_NBSLOT_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
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

   type BIM_Register is record
      OVRUDRIE      : Boolean := False;
      MUTEDETIE     : Boolean := False;
      WCKCFGIE      : Boolean := False;
      FREQIE        : Boolean := False;
      CNRDYIE       : Boolean := False;
      AFSDETIE      : Boolean := False;
      LFSDETIE      : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
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

   subtype BSR_FLVL_Field is HAL.UInt3;

   type BSR_Register is record
      OVRUDR         : Boolean := False;
      MUTEDET        : Boolean := False;
      WCKCFG         : Boolean := False;
      FREQ           : Boolean := False;
      CNRDY          : Boolean := False;
      AFSDET         : Boolean := False;
      LFSDET         : Boolean := False;
      --  unspecified
      Reserved_7_15  : HAL.UInt9 := 16#0#;
      FLVL           : BSR_FLVL_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
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

   type BCLRFR_Register is record
      COVRUDR       : Boolean := False;
      CMUTEDET      : Boolean := False;
      CWCKCFG       : Boolean := False;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      CCNRDY        : Boolean := False;
      CAFSDET       : Boolean := False;
      CLFSDET       : Boolean := False;
      --  unspecified
      Reserved_7_31 : HAL.UInt25 := 16#0#;
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

   subtype PDMCR_MICNBR_Field is HAL.UInt2;

   --  PDMCR_CKEN array
   type PDMCR_CKEN_Field_Array is array (1 .. 2) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PDMCR_CKEN
   type PDMCR_CKEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CKEN as a value
            Val : HAL.UInt2;
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
      PDMEN          : Boolean := False;
      --  unspecified
      Reserved_1_3   : HAL.UInt3 := 16#0#;
      MICNBR         : PDMCR_MICNBR_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      CKEN           : PDMCR_CKEN_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
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

   subtype PDMDLY_DLYM1L_Field is HAL.UInt3;
   subtype PDMDLY_DLYM1R_Field is HAL.UInt3;
   subtype PDMDLY_DLYM2L_Field is HAL.UInt3;
   subtype PDMDLY_DLYM2R_Field is HAL.UInt3;
   subtype PDMDLY_DLYM3L_Field is HAL.UInt3;
   subtype PDMDLY_DLYM3R_Field is HAL.UInt3;
   subtype PDMDLY_DLYM4L_Field is HAL.UInt3;
   subtype PDMDLY_DLYM4R_Field is HAL.UInt3;

   type PDMDLY_Register is record
      DLYM1L         : PDMDLY_DLYM1L_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      DLYM1R         : PDMDLY_DLYM1R_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      DLYM2L         : PDMDLY_DLYM2L_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      DLYM2R         : PDMDLY_DLYM2R_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      DLYM3L         : PDMDLY_DLYM3L_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : HAL.Bit := 16#0#;
      DLYM3R         : PDMDLY_DLYM3R_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      DLYM4L         : PDMDLY_DLYM4L_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : HAL.Bit := 16#0#;
      DLYM4R         : PDMDLY_DLYM4R_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
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
      ADR    : aliased HAL.UInt32;
      BCR1   : aliased BCR1_Register;
      BCR2   : aliased BCR2_Register;
      BFRCR  : aliased BFRCR_Register;
      BSLOTR : aliased BSLOTR_Register;
      BIM    : aliased BIM_Register;
      BSR    : aliased BSR_Register;
      BCLRFR : aliased BCLRFR_Register;
      BDR    : aliased HAL.UInt32;
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

end STM32_SVD.SAI;
