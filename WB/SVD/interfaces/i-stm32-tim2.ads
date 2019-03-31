--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.TIM2 is
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

   subtype CR2_CCDS_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_MMS_Field is Interfaces.Bit_Types.UInt3;
   subtype CR2_TI1S_Field is Interfaces.Bit_Types.Bit;

   type CR2_Register is record
      --  unspecified
      Reserved_0_2  : Interfaces.Bit_Types.UInt3 := 16#0#;
      CCDS          : CR2_CCDS_Field := 16#0#;
      MMS           : CR2_MMS_Field := 16#0#;
      TI1S          : CR2_TI1S_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      Reserved_0_2  at 0 range 0 .. 2;
      CCDS          at 0 range 3 .. 3;
      MMS           at 0 range 4 .. 6;
      TI1S          at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SMCR_SMS_Field is Interfaces.Bit_Types.UInt3;
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
      --  unspecified
      Reserved_3_3   : Interfaces.Bit_Types.Bit := 16#0#;
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
      Reserved_3_3   at 0 range 3 .. 3;
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
   subtype DIER_TIE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_UDE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC1DE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC2DE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC3DE_Field is Interfaces.Bit_Types.Bit;
   subtype DIER_CC4DE_Field is Interfaces.Bit_Types.Bit;

   type DIER_Register is record
      UIE            : DIER_UIE_Field := 16#0#;
      CC1IE          : DIER_CC1IE_Field := 16#0#;
      CC2IE          : DIER_CC2IE_Field := 16#0#;
      CC3IE          : DIER_CC3IE_Field := 16#0#;
      CC4IE          : DIER_CC4IE_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : Interfaces.Bit_Types.Bit := 16#0#;
      TIE            : DIER_TIE_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      UDE            : DIER_UDE_Field := 16#0#;
      CC1DE          : DIER_CC1DE_Field := 16#0#;
      CC2DE          : DIER_CC2DE_Field := 16#0#;
      CC3DE          : DIER_CC3DE_Field := 16#0#;
      CC4DE          : DIER_CC4DE_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : Interfaces.Bit_Types.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIER_Register use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      CC3IE          at 0 range 3 .. 3;
      CC4IE          at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      CC2DE          at 0 range 10 .. 10;
      CC3DE          at 0 range 11 .. 11;
      CC4DE          at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype SR_UIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC1IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC2IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC3IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC4IF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_TIF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC1OF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC2OF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC3OF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CC4OF_Field is Interfaces.Bit_Types.Bit;

   type SR_Register is record
      UIF            : SR_UIF_Field := 16#0#;
      CC1IF          : SR_CC1IF_Field := 16#0#;
      CC2IF          : SR_CC2IF_Field := 16#0#;
      CC3IF          : SR_CC3IF_Field := 16#0#;
      CC4IF          : SR_CC4IF_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : Interfaces.Bit_Types.Bit := 16#0#;
      TIF            : SR_TIF_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : Interfaces.Bit_Types.UInt2 := 16#0#;
      CC1OF          : SR_CC1OF_Field := 16#0#;
      CC2OF          : SR_CC2OF_Field := 16#0#;
      CC3OF          : SR_CC3OF_Field := 16#0#;
      CC4OF          : SR_CC4OF_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : Interfaces.Bit_Types.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      CC3IF          at 0 range 3 .. 3;
      CC4IF          at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      CC3OF          at 0 range 11 .. 11;
      CC4OF          at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype EGR_UG_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_CC1G_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_CC2G_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_CC3G_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_CC4G_Field is Interfaces.Bit_Types.Bit;
   subtype EGR_TG_Field is Interfaces.Bit_Types.Bit;

   type EGR_Register is record
      UG            : EGR_UG_Field := 16#0#;
      CC1G          : EGR_CC1G_Field := 16#0#;
      CC2G          : EGR_CC2G_Field := 16#0#;
      CC3G          : EGR_CC3G_Field := 16#0#;
      CC4G          : EGR_CC4G_Field := 16#0#;
      --  unspecified
      Reserved_5_5  : Interfaces.Bit_Types.Bit := 16#0#;
      TG            : EGR_TG_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : Interfaces.Bit_Types.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EGR_Register use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      CC3G          at 0 range 3 .. 3;
      CC4G          at 0 range 4 .. 4;
      Reserved_5_5  at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
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
   subtype CCMR2_Output_O24CE_Field is Interfaces.Bit_Types.Bit;
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
      O24CE          : CCMR2_Output_O24CE_Field := 16#0#;
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
      O24CE          at 0 range 15 .. 15;
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
   subtype CCER_CC1NP_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC2E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC2P_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC2NP_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC3E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC3P_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC3NP_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC4E_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC4P_Field is Interfaces.Bit_Types.Bit;
   subtype CCER_CC4NP_Field is Interfaces.Bit_Types.Bit;

   type CCER_Register is record
      CC1E           : CCER_CC1E_Field := 16#0#;
      CC1P           : CCER_CC1P_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.Bit_Types.Bit := 16#0#;
      CC1NP          : CCER_CC1NP_Field := 16#0#;
      CC2E           : CCER_CC2E_Field := 16#0#;
      CC2P           : CCER_CC2P_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.Bit_Types.Bit := 16#0#;
      CC2NP          : CCER_CC2NP_Field := 16#0#;
      CC3E           : CCER_CC3E_Field := 16#0#;
      CC3P           : CCER_CC3P_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : Interfaces.Bit_Types.Bit := 16#0#;
      CC3NP          : CCER_CC3NP_Field := 16#0#;
      CC4E           : CCER_CC4E_Field := 16#0#;
      CC4P           : CCER_CC4P_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : Interfaces.Bit_Types.Bit := 16#0#;
      CC4NP          : CCER_CC4NP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register use record
      CC1E           at 0 range 0 .. 0;
      CC1P           at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      CC1NP          at 0 range 3 .. 3;
      CC2E           at 0 range 4 .. 4;
      CC2P           at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      CC2NP          at 0 range 7 .. 7;
      CC3E           at 0 range 8 .. 8;
      CC3P           at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      CC3NP          at 0 range 11 .. 11;
      CC4E           at 0 range 12 .. 12;
      CC4P           at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      CC4NP          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
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

   subtype OR1_ITR_RMP_Field is Interfaces.Bit_Types.Bit;
   subtype OR1_ETR1_RMP_Field is Interfaces.Bit_Types.Bit;
   subtype OR1_TI4_RMP_Field is Interfaces.Bit_Types.UInt2;

   type OR1_Register is record
      ITR_RMP       : OR1_ITR_RMP_Field := 16#0#;
      ETR1_RMP      : OR1_ETR1_RMP_Field := 16#0#;
      TI4_RMP       : OR1_TI4_RMP_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR1_Register use record
      ITR_RMP       at 0 range 0 .. 0;
      ETR1_RMP      at 0 range 1 .. 1;
      TI4_RMP       at 0 range 2 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype AF1_ETRSEL_Field is Interfaces.Bit_Types.UInt4;

   type AF1_Register is record
      --  unspecified
      Reserved_0_13  : Interfaces.Bit_Types.UInt14 := 16#0#;
      ETRSEL         : AF1_ETRSEL_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : Interfaces.Bit_Types.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF1_Register use record
      Reserved_0_13  at 0 range 0 .. 13;
      ETRSEL         at 0 range 14 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype TISEL_TI1SEL_Field is Interfaces.Bit_Types.UInt4;
   subtype TISEL_TI2SEL_Field is Interfaces.Bit_Types.UInt4;

   type TISEL_Register is record
      TI1SEL         : TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : Interfaces.Bit_Types.UInt4 := 16#0#;
      TI2SEL         : TISEL_TI2SEL_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TISEL_Register use record
      TI1SEL         at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      TI2SEL         at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type TIM2_Disc is
     (
      Output,
      Input);

   type TIM2_Peripheral
     (Discriminent : TIM2_Disc := Output)
   is record
      CR1          : aliased CR1_Register;
      CR2          : aliased CR2_Register;
      SMCR         : aliased SMCR_Register;
      DIER         : aliased DIER_Register;
      SR           : aliased SR_Register;
      EGR          : aliased EGR_Register;
      CCER         : aliased CCER_Register;
      CNT          : aliased Interfaces.Bit_Types.Word;
      PSC          : aliased PSC_Register;
      ARR          : aliased Interfaces.Bit_Types.Word;
      CCR1         : aliased Interfaces.Bit_Types.Word;
      CCR2         : aliased Interfaces.Bit_Types.Word;
      CCR3         : aliased Interfaces.Bit_Types.Word;
      CCR4         : aliased Interfaces.Bit_Types.Word;
      DCR          : aliased DCR_Register;
      DMAR         : aliased DMAR_Register;
      OR1          : aliased OR1_Register;
      AF1          : aliased AF1_Register;
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

   for TIM2_Peripheral use record
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
      CCR1         at 16#34# range 0 .. 31;
      CCR2         at 16#38# range 0 .. 31;
      CCR3         at 16#3C# range 0 .. 31;
      CCR4         at 16#40# range 0 .. 31;
      DCR          at 16#48# range 0 .. 31;
      DMAR         at 16#4C# range 0 .. 31;
      OR1          at 16#50# range 0 .. 31;
      AF1          at 16#60# range 0 .. 31;
      TISEL        at 16#68# range 0 .. 31;
      CCMR1_Output at 16#18# range 0 .. 31;
      CCMR2_Output at 16#1C# range 0 .. 31;
      CCMR1_Input  at 16#18# range 0 .. 31;
      CCMR2_Input  at 16#1C# range 0 .. 31;
   end record;

   TIM2_Periph : aliased TIM2_Peripheral
     with Import, Address => System'To_Address (16#40000000#);

end Interfaces.STM32.TIM2;
