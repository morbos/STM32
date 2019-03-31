--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.TIM17 is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_CEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_UDIS_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_URS_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_OPM_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_ARPE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_CKD_Field is Interfaces.Bit_Types.UInt2;
   subtype CR1_UIFREMAP_Field is Interfaces.Bit_Types.Bit;

   type CR1_Register is record
      CEN            : CR1_CEN_Field := 16#0#;
      UDIS           : CR1_UDIS_Field := 16#0#;
      URS            : CR1_URS_Field := 16#0#;
      OPM            : CR1_OPM_Field := 16#0#;
      --  unspecified
      Reserved_4_6   : Interfaces.Bit_Types.UInt3 := 16#0#;
      ARPE           : CR1_ARPE_Field := 16#0#;
      CKD            : CR1_CKD_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : Interfaces.Bit_Types.Bit := 16#0#;
      UIFREMAP       : CR1_UIFREMAP_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      ARPE           at 0 range 7 .. 7;
      CKD            at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CR2_CCPC_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_CCUS_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_CCDS_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS1_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS1N_Field is Interfaces.Bit_Types.Bit;

   type CR2_Register is record
      CCPC           : CR2_CCPC_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : Interfaces.Bit_Types.Bit := 16#0#;
      CCUS           : CR2_CCUS_Field := 16#0#;
      CCDS           : CR2_CCDS_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : Interfaces.Bit_Types.UInt4 := 16#0#;
      OIS1           : CR2_OIS1_Field := 16#0#;
      OIS1N          : CR2_OIS1N_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype DIER_UIE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC1IE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_COMIE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_BIE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_UDE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC1DE_Field is Interfaces.Bit_Types.Bit;

   type DIER_Register is record
      UIE            : DIER_UIE_Field := 16#0#;
      CC1IE          : DIER_CC1IE_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : Interfaces.Bit_Types.UInt3 := 16#0#;
      COMIE          : DIER_COMIE_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.Bit_Types.Bit := 16#0#;
      BIE            : DIER_BIE_Field := 16#0#;
      UDE            : DIER_UDE_Field := 16#0#;
      CC1DE          : DIER_CC1DE_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      COMIE          at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype SR_UIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC1IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_COMIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_BIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC1OF_Field is Interfaces.Bit_Types.Bit;

   type SR_Register is record
      UIF            : SR_UIF_Field := 16#0#;
      CC1IF          : SR_CC1IF_Field := 16#0#;
      --  unspecified
      Reserved_2_4   : Interfaces.Bit_Types.UInt3 := 16#0#;
      COMIF          : SR_COMIF_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.Bit_Types.Bit := 16#0#;
      BIF            : SR_BIF_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : Interfaces.Bit_Types.Bit := 16#0#;
      CC1OF          : SR_CC1OF_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      COMIF          at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype EGR_UG_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_CC1G_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_COMG_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_BG_Field is Interfaces.Bit_Types.Bit;

   type EGR_Register is record
      UG            : EGR_UG_Field := 16#0#;
      CC1G          : EGR_CC1G_Field := 16#0#;
      --  unspecified
      Reserved_2_4  : Interfaces.Bit_Types.UInt3 := 16#0#;
      COMG          : EGR_COMG_Field := 16#0#;
      --  unspecified
      Reserved_6_6  : Interfaces.Bit_Types.Bit := 16#0#;
      BG            : EGR_BG_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      Reserved_2_4  at 0 range 2 .. 4;
      COMG          at 0 range 5 .. 5;
      Reserved_6_6  at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CCMR1_Output_CC1S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR1_Output_OC1FE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR1_Output_OC1PE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR1_Output_OC1M_Field is Interfaces.Bit_Types.UInt3;
   subtype CCMR1_Output_OC1M_Field_1 is Interfaces.Bit_Types.Bit;

   type CCMR1_Output_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      OC1FE          : CCMR1_Output_OC1FE_Field := 16#0#;
      OC1PE          : CCMR1_Output_OC1PE_Field := 16#0#;
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : Interfaces.Bit_Types.Byte := 16#0#;
      OC1M_1         : CCMR1_Output_OC1M_Field_1 := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Output_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      CC1S           at 0 range 1 .. 2;
      OC1FE          at 0 range 3 .. 3;
      OC1PE          at 0 range 4 .. 4;
      OC1M           at 0 range 5 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      OC1M_1         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype CCMR1_Input_CC1S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR1_Input_IC1PSC_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR1_Input_IC1F_Field is Interfaces.Bit_Types.UInt4;

   type CCMR1_Input_Register is record
      CC1S          : CCMR1_Input_CC1S_Field := 16#0#;
      IC1PSC        : CCMR1_Input_IC1PSC_Field := 16#0#;
      IC1F          : CCMR1_Input_IC1F_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register use record
      CC1S          at 0 range 0 .. 1;
      IC1PSC        at 0 range 2 .. 3;
      IC1F          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CCER_CC1E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC1P_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC1NE_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC1NP_Field is Interfaces.Bit_Types.Bit;

   type CCER_Register is record
      CC1E          : CCER_CC1E_Field := 16#0#;
      CC1P          : CCER_CC1P_Field := 16#0#;
      CC1NE         : CCER_CC1NE_Field := 16#0#;
      CC1NP         : CCER_CC1NP_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register use record
      CC1E          at 0 range 0 .. 0;
      CC1P          at 0 range 1 .. 1;
      CC1NE         at 0 range 2 .. 2;
      CC1NP         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CNT_CNT_Field is Interfaces.Bit_Types.Short;
   subtype CNT_UIFCPY_Field is Interfaces.Bit_Types.Bit;

   type CNT_Register is record
      CNT            : CNT_CNT_Field := 16#0#;
      --  unspecified
      Reserved_16_30 : Interfaces.Bit_Types.UInt15 := 16#0#;
      UIFCPY         : CNT_UIFCPY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_30 at 0 range 16 .. 30;
      UIFCPY         at 0 range 31 .. 31;
   end record;

   subtype PSC_PSC_Field is Interfaces.Bit_Types.Short;

   type PSC_Register is record
      PSC            : PSC_PSC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PSC_Register use record
      PSC            at 0 range 0 .. 15;
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

   subtype RCR_REP_Field is Interfaces.Bit_Types.Byte;

   type RCR_Register is record
      REP           : RCR_REP_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      REP           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CCR1_CCR1_Field is Interfaces.Bit_Types.Short;

   type CCR1_Register is record
      CCR1           : CCR1_CCR1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR1_Register use record
      CCR1           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BDTR_DT_Field is Interfaces.Bit_Types.Byte;
   subtype BDTR_LOCK_Field is Interfaces.Bit_Types.UInt2;
   subtype BDTR_OSSI_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_OSSR_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_BKE_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_BKP_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_AOE_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_MOE_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_BKDSRM_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_BKBID_Field is Interfaces.Bit_Types.Bit;

   type BDTR_Register is record
      DT             : BDTR_DT_Field := 16#0#;
      LOCK           : BDTR_LOCK_Field := 16#0#;
      OSSI           : BDTR_OSSI_Field := 16#0#;
      OSSR           : BDTR_OSSR_Field := 16#0#;
      BKE            : BDTR_BKE_Field := 16#0#;
      BKP            : BDTR_BKP_Field := 16#0#;
      AOE            : BDTR_AOE_Field := 16#0#;
      MOE            : BDTR_MOE_Field := 16#0#;
      --  unspecified
      Reserved_16_25 : Interfaces.Bit_Types.UInt10 := 16#0#;
      BKDSRM         : BDTR_BKDSRM_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : Interfaces.Bit_Types.Bit := 16#0#;
      BKBID          : BDTR_BKBID_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BDTR_Register use record
      DT             at 0 range 0 .. 7;
      LOCK           at 0 range 8 .. 9;
      OSSI           at 0 range 10 .. 10;
      OSSR           at 0 range 11 .. 11;
      BKE            at 0 range 12 .. 12;
      BKP            at 0 range 13 .. 13;
      AOE            at 0 range 14 .. 14;
      MOE            at 0 range 15 .. 15;
      Reserved_16_25 at 0 range 16 .. 25;
      BKDSRM         at 0 range 26 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      BKBID          at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype DCR_DBA_Field is Interfaces.Bit_Types.UInt5;
   subtype DCR_DBL_Field is Interfaces.Bit_Types.UInt5;

   type DCR_Register is record
      DBA            : DCR_DBA_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : Interfaces.Bit_Types.UInt3 := 16#0#;
      DBL            : DCR_DBL_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : Interfaces.Bit_Types.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCR_Register use record
      DBA            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DBL            at 0 range 8 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype DMAR_DMAB_Field is Interfaces.Bit_Types.Short;

   type DMAR_Register is record
      DMAB           : DMAR_DMAB_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAR_Register use record
      DMAB           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TIM16_OR1_TI1_RMP_Field is Interfaces.Bit_Types.UInt2;

   type TIM16_OR1_Register is record
      TI1_RMP       : TIM16_OR1_TI1_RMP_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : Interfaces.Bit_Types.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIM16_OR1_Register use record
      TI1_RMP       at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TIM17_OR1_TI1_RMP_Field is Interfaces.Bit_Types.UInt2;

   type TIM17_OR1_Register is record
      TI1_RMP       : TIM17_OR1_TI1_RMP_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : Interfaces.Bit_Types.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIM17_OR1_Register use record
      TI1_RMP       at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TIM16_AF1_BKINE_Field is Interfaces.Bit_Types.Bit;
   subtype TIM16_AF1_BKCMP1E_Field is Interfaces.Bit_Types.Bit;
   subtype TIM16_AF1_BKCMP2E_Field is Interfaces.Bit_Types.Bit;
   subtype TIM16_AF1_BKINP_Field is Interfaces.Bit_Types.Bit;
   subtype TIM16_AF1_BKCMP1P_Field is Interfaces.Bit_Types.Bit;
   subtype TIM16_AF1_BKCMP2P_Field is Interfaces.Bit_Types.Bit;

   type TIM16_AF1_Register is record
      BKINE          : TIM16_AF1_BKINE_Field := 16#0#;
      BKCMP1E        : TIM16_AF1_BKCMP1E_Field := 16#0#;
      BKCMP2E        : TIM16_AF1_BKCMP2E_Field := 16#0#;
      --  unspecified
      Reserved_3_8   : Interfaces.Bit_Types.UInt6 := 16#0#;
      BKINP          : TIM16_AF1_BKINP_Field := 16#0#;
      BKCMP1P        : TIM16_AF1_BKCMP1P_Field := 16#0#;
      BKCMP2P        : TIM16_AF1_BKCMP2P_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIM16_AF1_Register use record
      BKINE          at 0 range 0 .. 0;
      BKCMP1E        at 0 range 1 .. 1;
      BKCMP2E        at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      BKINP          at 0 range 9 .. 9;
      BKCMP1P        at 0 range 10 .. 10;
      BKCMP2P        at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype TIM17_AF1_BKINE_Field is Interfaces.Bit_Types.Bit;
   subtype TIM17_AF1_BKCMP1E_Field is Interfaces.Bit_Types.Bit;
   subtype TIM17_AF1_BKCMP2E_Field is Interfaces.Bit_Types.Bit;
   subtype TIM17_AF1_BKINP_Field is Interfaces.Bit_Types.Bit;
   subtype TIM17_AF1_BKCMP1P_Field is Interfaces.Bit_Types.Bit;
   subtype TIM17_AF1_BKCMP2P_Field is Interfaces.Bit_Types.Bit;

   type TIM17_AF1_Register is record
      BKINE          : TIM17_AF1_BKINE_Field := 16#0#;
      BKCMP1E        : TIM17_AF1_BKCMP1E_Field := 16#0#;
      BKCMP2E        : TIM17_AF1_BKCMP2E_Field := 16#0#;
      --  unspecified
      Reserved_3_8   : Interfaces.Bit_Types.UInt6 := 16#0#;
      BKINP          : TIM17_AF1_BKINP_Field := 16#0#;
      BKCMP1P        : TIM17_AF1_BKCMP1P_Field := 16#0#;
      BKCMP2P        : TIM17_AF1_BKCMP2P_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIM17_AF1_Register use record
      BKINE          at 0 range 0 .. 0;
      BKCMP1E        at 0 range 1 .. 1;
      BKCMP2E        at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      BKINP          at 0 range 9 .. 9;
      BKCMP1P        at 0 range 10 .. 10;
      BKCMP2P        at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype TIM16_TISEL_TI1SEL_Field is Interfaces.Bit_Types.UInt4;

   type TIM16_TISEL_Register is record
      TI1SEL        : TIM16_TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIM16_TISEL_Register use record
      TI1SEL        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype TIM17_TISEL_TI1SEL_Field is Interfaces.Bit_Types.UInt4;

   type TIM17_TISEL_Register is record
      TI1SEL        : TIM17_TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIM17_TISEL_Register use record
      TI1SEL        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type TIM17_Disc is
     (
      Output,
      Input,
      TIM17_Disc_6_Or1,
      TIM17_Disc_7_Or1,
      TIM17_Disc_6_Af1,
      TIM17_Disc_7_Af1,
      TIM17_Disc_6_Tisel,
      TIM17_Disc_7_Tisel);

   type TIM17_Peripheral
     (Discriminent : TIM17_Disc := Output)
   is record
      CR1          : aliased CR1_Register;
      CR2          : aliased CR2_Register;
      DIER         : aliased DIER_Register;
      SR           : aliased SR_Register;
      EGR          : aliased EGR_Register;
      CCER         : aliased CCER_Register;
      CNT          : aliased CNT_Register;
      PSC          : aliased PSC_Register;
      ARR          : aliased ARR_Register;
      RCR          : aliased RCR_Register;
      CCR1         : aliased CCR1_Register;
      BDTR         : aliased BDTR_Register;
      DCR          : aliased DCR_Register;
      DMAR         : aliased DMAR_Register;
      case Discriminent is
         when Output =>
            CCMR1_Output : aliased CCMR1_Output_Register;
         when Input =>
            CCMR1_Input : aliased CCMR1_Input_Register;
         when TIM17_Disc_6_Or1 =>
            TIM16_OR1 : aliased TIM16_OR1_Register;
         when TIM17_Disc_7_Or1 =>
            TIM17_OR1 : aliased TIM17_OR1_Register;
         when TIM17_Disc_6_Af1 =>
            TIM16_AF1 : aliased TIM16_AF1_Register;
         when TIM17_Disc_7_Af1 =>
            TIM17_AF1 : aliased TIM17_AF1_Register;
         when TIM17_Disc_6_Tisel =>
            TIM16_TISEL : aliased TIM16_TISEL_Register;
         when TIM17_Disc_7_Tisel =>
            TIM17_TISEL : aliased TIM17_TISEL_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM17_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      DCR          at 16#48# range 0 .. 31;
      DMAR         at 16#4C# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
      TIM16_OR1    at 16#50# range 0 .. 31;
      TIM17_OR1    at 16#50# range 0 .. 31;
      TIM16_AF1    at 16#60# range 0 .. 31;
      TIM17_AF1    at 16#60# range 0 .. 31;
      TIM16_TISEL  at 16#68# range 0 .. 31;
      TIM17_TISEL  at 16#68# range 0 .. 31;
   end record;

   TIM17_Periph : aliased TIM17_Peripheral
     with Import, Address => System'To_Address (16#40014800#);

end Interfaces.STM32.TIM17;
