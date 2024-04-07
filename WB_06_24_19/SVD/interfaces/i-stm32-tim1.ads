--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.TIM1 is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_CEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_UDIS_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_URS_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_OPM_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_DIR_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_CMS_Field is Interfaces.Bit_Types.UInt2;
   subtype CR1_ARPE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_CKD_Field is Interfaces.Bit_Types.UInt2;
   subtype CR1_UIFREMAP_Field is Interfaces.Bit_Types.Bit;

   type CR1_Register is record
      CEN            : CR1_CEN_Field := 16#0#;
      UDIS           : CR1_UDIS_Field := 16#0#;
      URS            : CR1_URS_Field := 16#0#;
      OPM            : CR1_OPM_Field := 16#0#;
      DIR            : CR1_DIR_Field := 16#0#;
      CMS            : CR1_CMS_Field := 16#0#;
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
      DIR            at 0 range 4 .. 4;
      CMS            at 0 range 5 .. 6;
      ARPE           at 0 range 7 .. 7;
      CKD            at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CR2_CCPC_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_CCUS_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_CCDS_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_MMS_Field is Interfaces.Bit_Types.UInt3;
   subtype CR2_TI1S_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS1_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS1N_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS2_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS2N_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS3_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS3N_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS4_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS5_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_OIS6_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_MMS2_Field is Interfaces.Bit_Types.UInt4;

   type CR2_Register is record
      CCPC           : CR2_CCPC_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : Interfaces.Bit_Types.Bit := 16#0#;
      CCUS           : CR2_CCUS_Field := 16#0#;
      CCDS           : CR2_CCDS_Field := 16#0#;
      MMS            : CR2_MMS_Field := 16#0#;
      TI1S           : CR2_TI1S_Field := 16#0#;
      OIS1           : CR2_OIS1_Field := 16#0#;
      OIS1N          : CR2_OIS1N_Field := 16#0#;
      OIS2           : CR2_OIS2_Field := 16#0#;
      OIS2N          : CR2_OIS2N_Field := 16#0#;
      OIS3           : CR2_OIS3_Field := 16#0#;
      OIS3N          : CR2_OIS3N_Field := 16#0#;
      OIS4           : CR2_OIS4_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      OIS5           : CR2_OIS5_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : Interfaces.Bit_Types.Bit := 16#0#;
      OIS6           : CR2_OIS6_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.Bit_Types.Bit := 16#0#;
      MMS2           : CR2_MMS2_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      MMS            at 0 range 4 .. 6;
      TI1S           at 0 range 7 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      OIS2           at 0 range 10 .. 10;
      OIS2N          at 0 range 11 .. 11;
      OIS3           at 0 range 12 .. 12;
      OIS3N          at 0 range 13 .. 13;
      OIS4           at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      OIS5           at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      OIS6           at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      MMS2           at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SMCR_SMS_Field is Interfaces.Bit_Types.UInt3;
   subtype SMCR_OCCS_Field is Interfaces.Bit_Types.Bit;
   subtype SMCR_TS_Field is Interfaces.Bit_Types.UInt3;
   subtype SMCR_MSM_Field is Interfaces.Bit_Types.Bit;
   subtype SMCR_ETF_Field is Interfaces.Bit_Types.UInt4;
   subtype SMCR_ETPS_Field is Interfaces.Bit_Types.UInt2;
   subtype SMCR_ECE_Field is Interfaces.Bit_Types.Bit;
   subtype SMCR_ETP_Field is Interfaces.Bit_Types.Bit;
   subtype SMCR_SMS_Field_1 is Interfaces.Bit_Types.Bit;
   subtype SMCR_TS_Field_1 is Interfaces.Bit_Types.UInt2;

   type SMCR_Register is record
      SMS            : SMCR_SMS_Field := 16#0#;
      OCCS           : SMCR_OCCS_Field := 16#0#;
      TS             : SMCR_TS_Field := 16#0#;
      MSM            : SMCR_MSM_Field := 16#0#;
      ETF            : SMCR_ETF_Field := 16#0#;
      ETPS           : SMCR_ETPS_Field := 16#0#;
      ECE            : SMCR_ECE_Field := 16#0#;
      ETP            : SMCR_ETP_Field := 16#0#;
      SMS_1          : SMCR_SMS_Field_1 := 16#0#;
      --  unspecified
      Reserved_17_19 : Interfaces.Bit_Types.UInt3 := 16#0#;
      TS_1           : SMCR_TS_Field_1 := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register use record
      SMS            at 0 range 0 .. 2;
      OCCS           at 0 range 3 .. 3;
      TS             at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      ETF            at 0 range 8 .. 11;
      ETPS           at 0 range 12 .. 13;
      ECE            at 0 range 14 .. 14;
      ETP            at 0 range 15 .. 15;
      SMS_1          at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      TS_1           at 0 range 20 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype DIER_UIE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC1IE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC2IE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC3IE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC4IE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_COMIE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_TIE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_BIE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_UDE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC1DE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC2DE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC3DE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC4DE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_COMDE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_TDE_Field is Interfaces.Bit_Types.Bit;

   type DIER_Register is record
      UIE            : DIER_UIE_Field := 16#0#;
      CC1IE          : DIER_CC1IE_Field := 16#0#;
      CC2IE          : DIER_CC2IE_Field := 16#0#;
      CC3IE          : DIER_CC3IE_Field := 16#0#;
      CC4IE          : DIER_CC4IE_Field := 16#0#;
      COMIE          : DIER_COMIE_Field := 16#0#;
      TIE            : DIER_TIE_Field := 16#0#;
      BIE            : DIER_BIE_Field := 16#0#;
      UDE            : DIER_UDE_Field := 16#0#;
      CC1DE          : DIER_CC1DE_Field := 16#0#;
      CC2DE          : DIER_CC2DE_Field := 16#0#;
      CC3DE          : DIER_CC3DE_Field := 16#0#;
      CC4DE          : DIER_CC4DE_Field := 16#0#;
      COMDE          : DIER_COMDE_Field := 16#0#;
      TDE            : DIER_TDE_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.Bit_Types.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      CC3IE          at 0 range 3 .. 3;
      CC4IE          at 0 range 4 .. 4;
      COMIE          at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      CC2DE          at 0 range 10 .. 10;
      CC3DE          at 0 range 11 .. 11;
      CC4DE          at 0 range 12 .. 12;
      COMDE          at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype SR_UIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC1IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC2IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC3IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC4IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_COMIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_TIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_BIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_B2IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC1OF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC2OF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC3OF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC4OF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_SBIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC5IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC6IF_Field is Interfaces.Bit_Types.Bit;

   type SR_Register is record
      UIF            : SR_UIF_Field := 16#0#;
      CC1IF          : SR_CC1IF_Field := 16#0#;
      CC2IF          : SR_CC2IF_Field := 16#0#;
      CC3IF          : SR_CC3IF_Field := 16#0#;
      CC4IF          : SR_CC4IF_Field := 16#0#;
      COMIF          : SR_COMIF_Field := 16#0#;
      TIF            : SR_TIF_Field := 16#0#;
      BIF            : SR_BIF_Field := 16#0#;
      B2IF           : SR_B2IF_Field := 16#0#;
      CC1OF          : SR_CC1OF_Field := 16#0#;
      CC2OF          : SR_CC2OF_Field := 16#0#;
      CC3OF          : SR_CC3OF_Field := 16#0#;
      CC4OF          : SR_CC4OF_Field := 16#0#;
      SBIF           : SR_SBIF_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.Bit_Types.UInt2 := 16#0#;
      CC5IF          : SR_CC5IF_Field := 16#0#;
      CC6IF          : SR_CC6IF_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : Interfaces.Bit_Types.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      CC3IF          at 0 range 3 .. 3;
      CC4IF          at 0 range 4 .. 4;
      COMIF          at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      B2IF           at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      CC3OF          at 0 range 11 .. 11;
      CC4OF          at 0 range 12 .. 12;
      SBIF           at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      CC5IF          at 0 range 16 .. 16;
      CC6IF          at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype EGR_UG_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_CC1G_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_CC2G_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_CC3G_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_CC4G_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_COM_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_TG_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_BG_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_B2G_Field is Interfaces.Bit_Types.Bit;

   type EGR_Register is record
      UG            : EGR_UG_Field := 16#0#;
      CC1G          : EGR_CC1G_Field := 16#0#;
      CC2G          : EGR_CC2G_Field := 16#0#;
      CC3G          : EGR_CC3G_Field := 16#0#;
      CC4G          : EGR_CC4G_Field := 16#0#;
      COM           : EGR_COM_Field := 16#0#;
      TG            : EGR_TG_Field := 16#0#;
      BG            : EGR_BG_Field := 16#0#;
      B2G           : EGR_B2G_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.Bit_Types.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      CC3G          at 0 range 3 .. 3;
      CC4G          at 0 range 4 .. 4;
      COM           at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      B2G           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype CCMR1_Output_CC1S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR1_Output_OC1FE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR1_Output_OC1PE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR1_Output_OC1M_Field is Interfaces.Bit_Types.UInt3;
   subtype CCMR1_Output_OC1CE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR1_Output_CC2S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR1_Output_OC2FE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR1_Output_OC2PE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR1_Output_OC2M_Field is Interfaces.Bit_Types.UInt3;
   subtype CCMR1_Output_OC2CE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR1_Output_OC1M_Field_1 is Interfaces.Bit_Types.Bit;
   subtype CCMR1_Output_OC2M_Field_1 is Interfaces.Bit_Types.Bit;

   type CCMR1_Output_Register is record
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      OC1FE          : CCMR1_Output_OC1FE_Field := 16#0#;
      OC1PE          : CCMR1_Output_OC1PE_Field := 16#0#;
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      OC1CE          : CCMR1_Output_OC1CE_Field := 16#0#;
      CC2S           : CCMR1_Output_CC2S_Field := 16#0#;
      OC2FE          : CCMR1_Output_OC2FE_Field := 16#0#;
      OC2PE          : CCMR1_Output_OC2PE_Field := 16#0#;
      OC2M           : CCMR1_Output_OC2M_Field := 16#0#;
      OC2CE          : CCMR1_Output_OC2CE_Field := 16#0#;
      OC1M_1         : CCMR1_Output_OC1M_Field_1 := 16#0#;
      --  unspecified
      Reserved_17_23 : Interfaces.Bit_Types.UInt7 := 16#0#;
      OC2M_1         : CCMR1_Output_OC2M_Field_1 := 16#0#;
      --  unspecified
      Reserved_25_31 : Interfaces.Bit_Types.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Output_Register use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      OC1CE          at 0 range 7 .. 7;
      CC2S           at 0 range 8 .. 9;
      OC2FE          at 0 range 10 .. 10;
      OC2PE          at 0 range 11 .. 11;
      OC2M           at 0 range 12 .. 14;
      OC2CE          at 0 range 15 .. 15;
      OC1M_1         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC2M_1         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCMR1_Input_CC1S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR1_Input_IC1PSC_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR1_Input_IC1F_Field is Interfaces.Bit_Types.UInt4;
   subtype CCMR1_Input_CC2S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR1_Input_IC2PSC_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR1_Input_IC2F_Field is Interfaces.Bit_Types.UInt4;

   type CCMR1_Input_Register is record
      CC1S           : CCMR1_Input_CC1S_Field := 16#0#;
      IC1PSC         : CCMR1_Input_IC1PSC_Field := 16#0#;
      IC1F           : CCMR1_Input_IC1F_Field := 16#0#;
      CC2S           : CCMR1_Input_CC2S_Field := 16#0#;
      IC2PSC         : CCMR1_Input_IC2PSC_Field := 16#0#;
      IC2F           : CCMR1_Input_IC2F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register use record
      CC1S           at 0 range 0 .. 1;
      IC1PSC         at 0 range 2 .. 3;
      IC1F           at 0 range 4 .. 7;
      CC2S           at 0 range 8 .. 9;
      IC2PSC         at 0 range 10 .. 11;
      IC2F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCMR2_Output_CC3S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR2_Output_OC3FE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR2_Output_OC3PE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR2_Output_OC3M_Field is Interfaces.Bit_Types.UInt3;
   subtype CCMR2_Output_OC3CE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR2_Output_CC4S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR2_Output_OC4FE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR2_Output_OC4PE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR2_Output_OC4M_Field is Interfaces.Bit_Types.UInt3;
   subtype CCMR2_Output_OC4CE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR2_Output_OC3M_Field_1 is Interfaces.Bit_Types.Bit;
   subtype CCMR2_Output_OC4M_Field_1 is Interfaces.Bit_Types.Bit;

   type CCMR2_Output_Register is record
      CC3S           : CCMR2_Output_CC3S_Field := 16#0#;
      OC3FE          : CCMR2_Output_OC3FE_Field := 16#0#;
      OC3PE          : CCMR2_Output_OC3PE_Field := 16#0#;
      OC3M           : CCMR2_Output_OC3M_Field := 16#0#;
      OC3CE          : CCMR2_Output_OC3CE_Field := 16#0#;
      CC4S           : CCMR2_Output_CC4S_Field := 16#0#;
      OC4FE          : CCMR2_Output_OC4FE_Field := 16#0#;
      OC4PE          : CCMR2_Output_OC4PE_Field := 16#0#;
      OC4M           : CCMR2_Output_OC4M_Field := 16#0#;
      OC4CE          : CCMR2_Output_OC4CE_Field := 16#0#;
      OC3M_1         : CCMR2_Output_OC3M_Field_1 := 16#0#;
      --  unspecified
      Reserved_17_23 : Interfaces.Bit_Types.UInt7 := 16#0#;
      OC4M_1         : CCMR2_Output_OC4M_Field_1 := 16#0#;
      --  unspecified
      Reserved_25_31 : Interfaces.Bit_Types.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_Output_Register use record
      CC3S           at 0 range 0 .. 1;
      OC3FE          at 0 range 2 .. 2;
      OC3PE          at 0 range 3 .. 3;
      OC3M           at 0 range 4 .. 6;
      OC3CE          at 0 range 7 .. 7;
      CC4S           at 0 range 8 .. 9;
      OC4FE          at 0 range 10 .. 10;
      OC4PE          at 0 range 11 .. 11;
      OC4M           at 0 range 12 .. 14;
      OC4CE          at 0 range 15 .. 15;
      OC3M_1         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC4M_1         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCMR2_Input_CC3S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR2_Input_IC3PSC_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR2_Input_IC3F_Field is Interfaces.Bit_Types.UInt4;
   subtype CCMR2_Input_CC4S_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR2_Input_IC4PSC_Field is Interfaces.Bit_Types.UInt2;
   subtype CCMR2_Input_IC4F_Field is Interfaces.Bit_Types.UInt4;

   type CCMR2_Input_Register is record
      CC3S           : CCMR2_Input_CC3S_Field := 16#0#;
      IC3PSC         : CCMR2_Input_IC3PSC_Field := 16#0#;
      IC3F           : CCMR2_Input_IC3F_Field := 16#0#;
      CC4S           : CCMR2_Input_CC4S_Field := 16#0#;
      IC4PSC         : CCMR2_Input_IC4PSC_Field := 16#0#;
      IC4F           : CCMR2_Input_IC4F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_Input_Register use record
      CC3S           at 0 range 0 .. 1;
      IC3PSC         at 0 range 2 .. 3;
      IC3F           at 0 range 4 .. 7;
      CC4S           at 0 range 8 .. 9;
      IC4PSC         at 0 range 10 .. 11;
      IC4F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCER_CC1E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC1P_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC1NE_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC1NP_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC2E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC2P_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC2NE_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC2NP_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC3E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC3P_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC3NE_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC3NP_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC4E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC4P_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC4NP_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC5E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC5P_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC6E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC6P_Field is Interfaces.Bit_Types.Bit;

   type CCER_Register is record
      CC1E           : CCER_CC1E_Field := 16#0#;
      CC1P           : CCER_CC1P_Field := 16#0#;
      CC1NE          : CCER_CC1NE_Field := 16#0#;
      CC1NP          : CCER_CC1NP_Field := 16#0#;
      CC2E           : CCER_CC2E_Field := 16#0#;
      CC2P           : CCER_CC2P_Field := 16#0#;
      CC2NE          : CCER_CC2NE_Field := 16#0#;
      CC2NP          : CCER_CC2NP_Field := 16#0#;
      CC3E           : CCER_CC3E_Field := 16#0#;
      CC3P           : CCER_CC3P_Field := 16#0#;
      CC3NE          : CCER_CC3NE_Field := 16#0#;
      CC3NP          : CCER_CC3NP_Field := 16#0#;
      CC4E           : CCER_CC4E_Field := 16#0#;
      CC4P           : CCER_CC4P_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : Interfaces.Bit_Types.Bit := 16#0#;
      CC4NP          : CCER_CC4NP_Field := 16#0#;
      CC5E           : CCER_CC5E_Field := 16#0#;
      CC5P           : CCER_CC5P_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : Interfaces.Bit_Types.UInt2 := 16#0#;
      CC6E           : CCER_CC6E_Field := 16#0#;
      CC6P           : CCER_CC6P_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register use record
      CC1E           at 0 range 0 .. 0;
      CC1P           at 0 range 1 .. 1;
      CC1NE          at 0 range 2 .. 2;
      CC1NP          at 0 range 3 .. 3;
      CC2E           at 0 range 4 .. 4;
      CC2P           at 0 range 5 .. 5;
      CC2NE          at 0 range 6 .. 6;
      CC2NP          at 0 range 7 .. 7;
      CC3E           at 0 range 8 .. 8;
      CC3P           at 0 range 9 .. 9;
      CC3NE          at 0 range 10 .. 10;
      CC3NP          at 0 range 11 .. 11;
      CC4E           at 0 range 12 .. 12;
      CC4P           at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      CC4NP          at 0 range 15 .. 15;
      CC5E           at 0 range 16 .. 16;
      CC5P           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      CC6E           at 0 range 20 .. 20;
      CC6P           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
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

   subtype RCR_REP_Field is Interfaces.Bit_Types.Short;

   type RCR_Register is record
      REP            : RCR_REP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      REP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
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

   subtype CCR2_CCR2_Field is Interfaces.Bit_Types.Short;

   type CCR2_Register is record
      CCR2           : CCR2_CCR2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR2_Register use record
      CCR2           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR3_CCR3_Field is Interfaces.Bit_Types.Short;

   type CCR3_Register is record
      CCR3           : CCR3_CCR3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR3_Register use record
      CCR3           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR4_CCR4_Field is Interfaces.Bit_Types.Short;

   type CCR4_Register is record
      CCR4           : CCR4_CCR4_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR4_Register use record
      CCR4           at 0 range 0 .. 15;
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
   subtype BDTR_BKF_Field is Interfaces.Bit_Types.UInt4;
   subtype BDTR_BK2F_Field is Interfaces.Bit_Types.UInt4;
   subtype BDTR_BK2E_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_BK2P_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_BKDSRM_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_BK2DSRM_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_BKBID_Field is Interfaces.Bit_Types.Bit;
   subtype BDTR_BK2BID_Field is Interfaces.Bit_Types.Bit;

   type BDTR_Register is record
      DT             : BDTR_DT_Field := 16#0#;
      LOCK           : BDTR_LOCK_Field := 16#0#;
      OSSI           : BDTR_OSSI_Field := 16#0#;
      OSSR           : BDTR_OSSR_Field := 16#0#;
      BKE            : BDTR_BKE_Field := 16#0#;
      BKP            : BDTR_BKP_Field := 16#0#;
      AOE            : BDTR_AOE_Field := 16#0#;
      MOE            : BDTR_MOE_Field := 16#0#;
      BKF            : BDTR_BKF_Field := 16#0#;
      BK2F           : BDTR_BK2F_Field := 16#0#;
      BK2E           : BDTR_BK2E_Field := 16#0#;
      BK2P           : BDTR_BK2P_Field := 16#0#;
      BKDSRM         : BDTR_BKDSRM_Field := 16#0#;
      BK2DSRM        : BDTR_BK2DSRM_Field := 16#0#;
      BKBID          : BDTR_BKBID_Field := 16#0#;
      BK2BID         : BDTR_BK2BID_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.Bit_Types.UInt2 := 16#0#;
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
      BKF            at 0 range 16 .. 19;
      BK2F           at 0 range 20 .. 23;
      BK2E           at 0 range 24 .. 24;
      BK2P           at 0 range 25 .. 25;
      BKDSRM         at 0 range 26 .. 26;
      BK2DSRM        at 0 range 27 .. 27;
      BKBID          at 0 range 28 .. 28;
      BK2BID         at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
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

   subtype OR1_TIM1_ETR_ADC1_RMP_Field is Interfaces.Bit_Types.UInt2;
   subtype OR1_TI1_RMP_Field is Interfaces.Bit_Types.Bit;

   type OR1_Register is record
      TIM1_ETR_ADC1_RMP : OR1_TIM1_ETR_ADC1_RMP_Field := 16#0#;
      --  unspecified
      Reserved_2_3      : Interfaces.Bit_Types.UInt2 := 16#0#;
      TI1_RMP           : OR1_TI1_RMP_Field := 16#0#;
      --  unspecified
      Reserved_5_31     : Interfaces.Bit_Types.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR1_Register use record
      TIM1_ETR_ADC1_RMP at 0 range 0 .. 1;
      Reserved_2_3      at 0 range 2 .. 3;
      TI1_RMP           at 0 range 4 .. 4;
      Reserved_5_31     at 0 range 5 .. 31;
   end record;

   subtype CCMR3_Output_OC5FE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR3_Output_OC5PE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR3_Output_OC5M_Field is Interfaces.Bit_Types.UInt3;
   subtype CCMR3_Output_OC5CE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR3_Output_OC6FE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR3_Output_OC6PE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR3_Output_OC6M_Field is Interfaces.Bit_Types.UInt3;
   subtype CCMR3_Output_OC6CE_Field is Interfaces.Bit_Types.Bit;
   subtype CCMR3_Output_OC5M_Field_1 is Interfaces.Bit_Types.Bit;
   subtype CCMR3_Output_OC6M_Field_1 is Interfaces.Bit_Types.Bit;

   type CCMR3_Output_Register is record
      --  unspecified
      Reserved_0_1   : Interfaces.Bit_Types.UInt2 := 16#0#;
      OC5FE          : CCMR3_Output_OC5FE_Field := 16#0#;
      OC5PE          : CCMR3_Output_OC5PE_Field := 16#0#;
      OC5M           : CCMR3_Output_OC5M_Field := 16#0#;
      OC5CE          : CCMR3_Output_OC5CE_Field := 16#0#;
      --  unspecified
      Reserved_8_9   : Interfaces.Bit_Types.UInt2 := 16#0#;
      OC6FE          : CCMR3_Output_OC6FE_Field := 16#0#;
      OC6PE          : CCMR3_Output_OC6PE_Field := 16#0#;
      OC6M           : CCMR3_Output_OC6M_Field := 16#0#;
      OC6CE          : CCMR3_Output_OC6CE_Field := 16#0#;
      OC5M_1         : CCMR3_Output_OC5M_Field_1 := 16#0#;
      --  unspecified
      Reserved_17_23 : Interfaces.Bit_Types.UInt7 := 16#0#;
      OC6M_1         : CCMR3_Output_OC6M_Field_1 := 16#0#;
      --  unspecified
      Reserved_25_31 : Interfaces.Bit_Types.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR3_Output_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      OC5FE          at 0 range 2 .. 2;
      OC5PE          at 0 range 3 .. 3;
      OC5M           at 0 range 4 .. 6;
      OC5CE          at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      OC6FE          at 0 range 10 .. 10;
      OC6PE          at 0 range 11 .. 11;
      OC6M           at 0 range 12 .. 14;
      OC6CE          at 0 range 15 .. 15;
      OC5M_1         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC6M_1         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCR5_CCR5_Field is Interfaces.Bit_Types.Short;
   --  CCR5_GC5C array element
   subtype CCR5_GC5C_Element is Interfaces.Bit_Types.Bit;

   --  CCR5_GC5C array
   type CCR5_GC5C_Field_Array is array (1 .. 3) of CCR5_GC5C_Element
     with Component_Size => 1, Size => 3;

   --  Type definition for CCR5_GC5C
   type CCR5_GC5C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GC5C as a value
            Val : Interfaces.Bit_Types.UInt3;
         when True =>
            --  GC5C as an array
            Arr : CCR5_GC5C_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for CCR5_GC5C_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   type CCR5_Register is record
      CCR5           : CCR5_CCR5_Field := 16#0#;
      --  unspecified
      Reserved_16_28 : Interfaces.Bit_Types.UInt13 := 16#0#;
      GC5C           : CCR5_GC5C_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR5_Register use record
      CCR5           at 0 range 0 .. 15;
      Reserved_16_28 at 0 range 16 .. 28;
      GC5C           at 0 range 29 .. 31;
   end record;

   subtype CCR6_CCR6_Field is Interfaces.Bit_Types.Short;

   type CCR6_Register is record
      CCR6           : CCR6_CCR6_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR6_Register use record
      CCR6           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype AF_BKINE_Field is Interfaces.Bit_Types.Bit;
   subtype AF_BKCMP1E_Field is Interfaces.Bit_Types.Bit;
   subtype AF_BKCMP2E_Field is Interfaces.Bit_Types.Bit;
   subtype AF_BKINP_Field is Interfaces.Bit_Types.Bit;
   subtype AF_BKCMP1P_Field is Interfaces.Bit_Types.Bit;
   subtype AF_BKCMP2P_Field is Interfaces.Bit_Types.Bit;
   subtype AF_ETRSEL_Field is Interfaces.Bit_Types.UInt4;

   type AF_Register is record
      BKINE          : AF_BKINE_Field := 16#0#;
      BKCMP1E        : AF_BKCMP1E_Field := 16#0#;
      BKCMP2E        : AF_BKCMP2E_Field := 16#0#;
      --  unspecified
      Reserved_3_8   : Interfaces.Bit_Types.UInt6 := 16#0#;
      BKINP          : AF_BKINP_Field := 16#0#;
      BKCMP1P        : AF_BKCMP1P_Field := 16#0#;
      BKCMP2P        : AF_BKCMP2P_Field := 16#0#;
      --  unspecified
      Reserved_12_13 : Interfaces.Bit_Types.UInt2 := 16#0#;
      ETRSEL         : AF_ETRSEL_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : Interfaces.Bit_Types.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF_Register use record
      BKINE          at 0 range 0 .. 0;
      BKCMP1E        at 0 range 1 .. 1;
      BKCMP2E        at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      BKINP          at 0 range 9 .. 9;
      BKCMP1P        at 0 range 10 .. 10;
      BKCMP2P        at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      ETRSEL         at 0 range 14 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype AF2_BK2INE_Field is Interfaces.Bit_Types.Bit;
   subtype AF2_BK2CMP1E_Field is Interfaces.Bit_Types.Bit;
   subtype AF2_BK2CMP2E_Field is Interfaces.Bit_Types.Bit;
   subtype AF2_BK2INP_Field is Interfaces.Bit_Types.Bit;
   subtype AF2_BK2CMP1P_Field is Interfaces.Bit_Types.Bit;
   subtype AF2_BK2CMP2P_Field is Interfaces.Bit_Types.Bit;

   type AF2_Register is record
      BK2INE         : AF2_BK2INE_Field := 16#0#;
      BK2CMP1E       : AF2_BK2CMP1E_Field := 16#0#;
      BK2CMP2E       : AF2_BK2CMP2E_Field := 16#0#;
      --  unspecified
      Reserved_3_8   : Interfaces.Bit_Types.UInt6 := 16#0#;
      BK2INP         : AF2_BK2INP_Field := 16#0#;
      BK2CMP1P       : AF2_BK2CMP1P_Field := 16#0#;
      BK2CMP2P       : AF2_BK2CMP2P_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF2_Register use record
      BK2INE         at 0 range 0 .. 0;
      BK2CMP1E       at 0 range 1 .. 1;
      BK2CMP2E       at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      BK2INP         at 0 range 9 .. 9;
      BK2CMP1P       at 0 range 10 .. 10;
      BK2CMP2P       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype TISEL_TI1SEL_Field is Interfaces.Bit_Types.UInt4;
   subtype TISEL_TI2SEL_Field is Interfaces.Bit_Types.UInt4;
   subtype TISEL_TI3SEL_Field is Interfaces.Bit_Types.UInt4;
   subtype TISEL_TI4SEL_Field is Interfaces.Bit_Types.UInt4;

   type TISEL_Register is record
      TI1SEL         : TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : Interfaces.Bit_Types.UInt4 := 16#0#;
      TI2SEL         : TISEL_TI2SEL_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : Interfaces.Bit_Types.UInt4 := 16#0#;
      TI3SEL         : TISEL_TI3SEL_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : Interfaces.Bit_Types.UInt4 := 16#0#;
      TI4SEL         : TISEL_TI4SEL_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.Bit_Types.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TISEL_Register use record
      TI1SEL         at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      TI2SEL         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TI3SEL         at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      TI4SEL         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type TIM1_Disc is
     (
      Output,
      Input);

   type TIM1_Peripheral
     (Discriminent : TIM1_Disc := Output)
   is record
      CR1          : aliased CR1_Register;
      CR2          : aliased CR2_Register;
      SMCR         : aliased SMCR_Register;
      DIER         : aliased DIER_Register;
      SR           : aliased SR_Register;
      EGR          : aliased EGR_Register;
      CCER         : aliased CCER_Register;
      CNT          : aliased CNT_Register;
      PSC          : aliased PSC_Register;
      ARR          : aliased ARR_Register;
      RCR          : aliased RCR_Register;
      CCR1         : aliased CCR1_Register;
      CCR2         : aliased CCR2_Register;
      CCR3         : aliased CCR3_Register;
      CCR4         : aliased CCR4_Register;
      BDTR         : aliased BDTR_Register;
      DCR          : aliased DCR_Register;
      DMAR         : aliased Interfaces.Bit_Types.Word;
      OR1          : aliased OR1_Register;
      CCMR3_Output : aliased CCMR3_Output_Register;
      CCR5         : aliased CCR5_Register;
      CCR6         : aliased CCR6_Register;
      AF           : aliased AF_Register;
      AF2          : aliased AF2_Register;
      TISEL        : aliased TISEL_Register;
      case Discriminent is
         when Output =>
            CCMR1_Output : aliased CCMR1_Output_Register;
            CCMR2_Output : aliased CCMR2_Output_Register;
         when Input =>
            CCMR1_Input : aliased CCMR1_Input_Register;
            CCMR2_Input : aliased CCMR2_Input_Register;
      end case;
   end record
     with Unchecked_Union, Volatile;

   for TIM1_Peripheral use record
      CR1          at 16#0# range 0 .. 31;
      CR2          at 16#4# range 0 .. 31;
      SMCR         at 16#8# range 0 .. 31;
      DIER         at 16#C# range 0 .. 31;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 31;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 31;
      ARR          at 16#2C# range 0 .. 31;
      RCR          at 16#30# range 0 .. 31;
      CCR1         at 16#34# range 0 .. 31;
      CCR2         at 16#38# range 0 .. 31;
      CCR3         at 16#3C# range 0 .. 31;
      CCR4         at 16#40# range 0 .. 31;
      BDTR         at 16#44# range 0 .. 31;
      DCR          at 16#48# range 0 .. 31;
      DMAR         at 16#4C# range 0 .. 31;
      OR1          at 16#50# range 0 .. 31;
      CCMR3_Output at 16#54# range 0 .. 31;
      CCR5         at 16#58# range 0 .. 31;
      CCR6         at 16#5C# range 0 .. 31;
      AF           at 16#60# range 0 .. 31;
      AF2          at 16#64# range 0 .. 31;
      TISEL        at 16#68# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR2_Output at 16#1C# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
      CCMR2_Input  at 16#1C# range 0 .. 31;
   end record;

   TIM1_Periph : aliased TIM1_Peripheral
     with Import, Address => System'To_Address (16#40012C00#);

end Interfaces.STM32.TIM1;
