--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.TIM1 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_CMS_Field is HAL.UInt2;
   subtype CR1_CKD_Field is HAL.UInt2;

   type CR1_Register is record
      CEN            : Boolean := False;
      UDIS           : Boolean := False;
      URS            : Boolean := False;
      OPM            : Boolean := False;
      DIR            : Boolean := False;
      CMS            : CR1_CMS_Field := 16#0#;
      ARPE           : Boolean := False;
      CKD            : CR1_CKD_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      UIFREMAP       : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
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

   subtype CR2_MMS_Field is HAL.UInt3;
   subtype CR2_MMS2_Field is HAL.UInt4;

   type CR2_Register is record
      CCPC           : Boolean := False;
      --  unspecified
      Reserved_1_1   : HAL.Bit := 16#0#;
      CCUS           : Boolean := False;
      CCDS           : Boolean := False;
      MMS            : CR2_MMS_Field := 16#0#;
      TI1S           : Boolean := False;
      OIS1           : Boolean := False;
      OIS1N          : Boolean := False;
      OIS2           : Boolean := False;
      OIS2N          : Boolean := False;
      OIS3           : Boolean := False;
      OIS3N          : Boolean := False;
      OIS4           : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      OIS5           : Boolean := False;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      OIS6           : Boolean := False;
      --  unspecified
      Reserved_19_19 : HAL.Bit := 16#0#;
      MMS2           : CR2_MMS2_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
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

   subtype SMCR_SMS_Field is HAL.UInt3;
   subtype SMCR_TS_Field is HAL.UInt3;
   subtype SMCR_ETF_Field is HAL.UInt4;
   subtype SMCR_ETPS_Field is HAL.UInt2;
   subtype SMCR_TS_Field_1 is HAL.UInt2;

   type SMCR_Register is record
      SMS            : SMCR_SMS_Field := 16#0#;
      OCCS           : Boolean := False;
      TS             : SMCR_TS_Field := 16#0#;
      MSM            : Boolean := False;
      ETF            : SMCR_ETF_Field := 16#0#;
      ETPS           : SMCR_ETPS_Field := 16#0#;
      ECE            : Boolean := False;
      ETP            : Boolean := False;
      SMS_1          : Boolean := False;
      --  unspecified
      Reserved_17_19 : HAL.UInt3 := 16#0#;
      TS_1           : SMCR_TS_Field_1 := 16#0#;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
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

   type DIER_Register is record
      UIE            : Boolean := False;
      CC1IE          : Boolean := False;
      CC2IE          : Boolean := False;
      CC3IE          : Boolean := False;
      CC4IE          : Boolean := False;
      COMIE          : Boolean := False;
      TIE            : Boolean := False;
      BIE            : Boolean := False;
      UDE            : Boolean := False;
      CC1DE          : Boolean := False;
      CC2DE          : Boolean := False;
      CC3DE          : Boolean := False;
      CC4DE          : Boolean := False;
      COMDE          : Boolean := False;
      TDE            : Boolean := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
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

   type SR_Register is record
      UIF            : Boolean := False;
      CC1IF          : Boolean := False;
      CC2IF          : Boolean := False;
      CC3IF          : Boolean := False;
      CC4IF          : Boolean := False;
      COMIF          : Boolean := False;
      TIF            : Boolean := False;
      BIF            : Boolean := False;
      B2IF           : Boolean := False;
      CC1OF          : Boolean := False;
      CC2OF          : Boolean := False;
      CC3OF          : Boolean := False;
      CC4OF          : Boolean := False;
      SBIF           : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      CC5IF          : Boolean := False;
      CC6IF          : Boolean := False;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
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

   type EGR_Register is record
      UG            : Boolean := False;
      CC1G          : Boolean := False;
      CC2G          : Boolean := False;
      CC3G          : Boolean := False;
      CC4G          : Boolean := False;
      COM           : Boolean := False;
      TG            : Boolean := False;
      BG            : Boolean := False;
      B2G           : Boolean := False;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
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

   subtype CCMR1_Output_CC1S_Field is HAL.UInt2;
   subtype CCMR1_Output_OC1M_Field is HAL.UInt3;
   subtype CCMR1_Output_CC2S_Field is HAL.UInt2;
   subtype CCMR1_Output_OC2M_Field is HAL.UInt3;

   type CCMR1_Output_Register is record
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      OC1FE          : Boolean := False;
      OC1PE          : Boolean := False;
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      OC1CE          : Boolean := False;
      CC2S           : CCMR1_Output_CC2S_Field := 16#0#;
      OC2FE          : Boolean := False;
      OC2PE          : Boolean := False;
      OC2M           : CCMR1_Output_OC2M_Field := 16#0#;
      OC2CE          : Boolean := False;
      OC1M_1         : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      OC2M_1         : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
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

   subtype CCMR1_Input_CC1S_Field is HAL.UInt2;
   subtype CCMR1_Input_IC1PSC_Field is HAL.UInt2;
   subtype CCMR1_Input_IC1F_Field is HAL.UInt4;
   subtype CCMR1_Input_CC2S_Field is HAL.UInt2;
   subtype CCMR1_Input_IC2PSC_Field is HAL.UInt2;
   subtype CCMR1_Input_IC2F_Field is HAL.UInt4;

   type CCMR1_Input_Register is record
      CC1S           : CCMR1_Input_CC1S_Field := 16#0#;
      IC1PSC         : CCMR1_Input_IC1PSC_Field := 16#0#;
      IC1F           : CCMR1_Input_IC1F_Field := 16#0#;
      CC2S           : CCMR1_Input_CC2S_Field := 16#0#;
      IC2PSC         : CCMR1_Input_IC2PSC_Field := 16#0#;
      IC2F           : CCMR1_Input_IC2F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

   subtype CCMR2_Output_CC3S_Field is HAL.UInt2;
   subtype CCMR2_Output_OC3M_Field is HAL.UInt3;
   subtype CCMR2_Output_CC4S_Field is HAL.UInt2;
   subtype CCMR2_Output_OC4M_Field is HAL.UInt3;

   type CCMR2_Output_Register is record
      CC3S           : CCMR2_Output_CC3S_Field := 16#0#;
      OC3FE          : Boolean := False;
      OC3PE          : Boolean := False;
      OC3M           : CCMR2_Output_OC3M_Field := 16#0#;
      OC3CE          : Boolean := False;
      CC4S           : CCMR2_Output_CC4S_Field := 16#0#;
      OC4FE          : Boolean := False;
      OC4PE          : Boolean := False;
      OC4M           : CCMR2_Output_OC4M_Field := 16#0#;
      OC4CE          : Boolean := False;
      OC3M_1         : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      OC4M_1         : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
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

   subtype CCMR2_Input_CC3S_Field is HAL.UInt2;
   subtype CCMR2_Input_IC3PSC_Field is HAL.UInt2;
   subtype CCMR2_Input_IC3F_Field is HAL.UInt4;
   subtype CCMR2_Input_CC4S_Field is HAL.UInt2;
   subtype CCMR2_Input_IC4PSC_Field is HAL.UInt2;
   subtype CCMR2_Input_IC4F_Field is HAL.UInt4;

   type CCMR2_Input_Register is record
      CC3S           : CCMR2_Input_CC3S_Field := 16#0#;
      IC3PSC         : CCMR2_Input_IC3PSC_Field := 16#0#;
      IC3F           : CCMR2_Input_IC3F_Field := 16#0#;
      CC4S           : CCMR2_Input_CC4S_Field := 16#0#;
      IC4PSC         : CCMR2_Input_IC4PSC_Field := 16#0#;
      IC4F           : CCMR2_Input_IC4F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

   type CCER_Register is record
      CC1E           : Boolean := False;
      CC1P           : Boolean := False;
      CC1NE          : Boolean := False;
      CC1NP          : Boolean := False;
      CC2E           : Boolean := False;
      CC2P           : Boolean := False;
      CC2NE          : Boolean := False;
      CC2NP          : Boolean := False;
      CC3E           : Boolean := False;
      CC3P           : Boolean := False;
      CC3NE          : Boolean := False;
      CC3NP          : Boolean := False;
      CC4E           : Boolean := False;
      CC4P           : Boolean := False;
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      CC4NP          : Boolean := False;
      CC5E           : Boolean := False;
      CC5P           : Boolean := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      CC6E           : Boolean := False;
      CC6P           : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
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

   subtype CNT_CNT_Field is HAL.UInt16;

   type CNT_Register is record
      CNT            : CNT_CNT_Field := 16#0#;
      --  unspecified
      Reserved_16_30 : HAL.UInt15 := 16#0#;
      UIFCPY         : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_30 at 0 range 16 .. 30;
      UIFCPY         at 0 range 31 .. 31;
   end record;

   subtype PSC_PSC_Field is HAL.UInt16;

   type PSC_Register is record
      PSC            : PSC_PSC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PSC_Register use record
      PSC            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ARR_ARR_Field is HAL.UInt16;

   type ARR_Register is record
      ARR            : ARR_ARR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ARR_Register use record
      ARR            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RCR_REP_Field is HAL.UInt16;

   type RCR_Register is record
      REP            : RCR_REP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      REP            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR1_CCR1_Field is HAL.UInt16;

   type CCR1_Register is record
      CCR1           : CCR1_CCR1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR1_Register use record
      CCR1           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR2_CCR2_Field is HAL.UInt16;

   type CCR2_Register is record
      CCR2           : CCR2_CCR2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR2_Register use record
      CCR2           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR3_CCR3_Field is HAL.UInt16;

   type CCR3_Register is record
      CCR3           : CCR3_CCR3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR3_Register use record
      CCR3           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CCR4_CCR4_Field is HAL.UInt16;

   type CCR4_Register is record
      CCR4           : CCR4_CCR4_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR4_Register use record
      CCR4           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype BDTR_DT_Field is HAL.UInt8;
   subtype BDTR_LOCK_Field is HAL.UInt2;
   subtype BDTR_BKF_Field is HAL.UInt4;
   subtype BDTR_BK2F_Field is HAL.UInt4;

   type BDTR_Register is record
      DT             : BDTR_DT_Field := 16#0#;
      LOCK           : BDTR_LOCK_Field := 16#0#;
      OSSI           : Boolean := False;
      OSSR           : Boolean := False;
      BKE            : Boolean := False;
      BKP            : Boolean := False;
      AOE            : Boolean := False;
      MOE            : Boolean := False;
      BKF            : BDTR_BKF_Field := 16#0#;
      BK2F           : BDTR_BK2F_Field := 16#0#;
      BK2E           : Boolean := False;
      BK2P           : Boolean := False;
      BKDSRM         : Boolean := False;
      BK2DSRM        : Boolean := False;
      BKBID          : Boolean := False;
      BK2BID         : Boolean := False;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
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

   subtype DCR_DBA_Field is HAL.UInt5;
   subtype DCR_DBL_Field is HAL.UInt5;

   type DCR_Register is record
      DBA            : DCR_DBA_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      DBL            : DCR_DBL_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCR_Register use record
      DBA            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DBL            at 0 range 8 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype OR1_TIM1_ETR_ADC1_RMP_Field is HAL.UInt2;

   type OR1_Register is record
      TIM1_ETR_ADC1_RMP : OR1_TIM1_ETR_ADC1_RMP_Field := 16#0#;
      --  unspecified
      Reserved_2_3      : HAL.UInt2 := 16#0#;
      TI1_RMP           : Boolean := False;
      --  unspecified
      Reserved_5_31     : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR1_Register use record
      TIM1_ETR_ADC1_RMP at 0 range 0 .. 1;
      Reserved_2_3      at 0 range 2 .. 3;
      TI1_RMP           at 0 range 4 .. 4;
      Reserved_5_31     at 0 range 5 .. 31;
   end record;

   subtype CCMR3_Output_OC5M_Field is HAL.UInt3;
   subtype CCMR3_Output_OC6M_Field is HAL.UInt3;

   type CCMR3_Output_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      OC5FE          : Boolean := False;
      OC5PE          : Boolean := False;
      OC5M           : CCMR3_Output_OC5M_Field := 16#0#;
      OC5CE          : Boolean := False;
      --  unspecified
      Reserved_8_9   : HAL.UInt2 := 16#0#;
      OC6FE          : Boolean := False;
      OC6PE          : Boolean := False;
      OC6M           : CCMR3_Output_OC6M_Field := 16#0#;
      OC6CE          : Boolean := False;
      OC5M_1         : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      OC6M_1         : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
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

   subtype CCR5_CCR5_Field is HAL.UInt16;

   --  CCR5_GC5C array
   type CCR5_GC5C_Field_Array is array (1 .. 3) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for CCR5_GC5C
   type CCR5_GC5C_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  GC5C as a value
            Val : HAL.UInt3;
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
      Reserved_16_28 : HAL.UInt13 := 16#0#;
      GC5C           : CCR5_GC5C_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR5_Register use record
      CCR5           at 0 range 0 .. 15;
      Reserved_16_28 at 0 range 16 .. 28;
      GC5C           at 0 range 29 .. 31;
   end record;

   subtype CCR6_CCR6_Field is HAL.UInt16;

   type CCR6_Register is record
      CCR6           : CCR6_CCR6_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR6_Register use record
      CCR6           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype AF_ETRSEL_Field is HAL.UInt4;

   type AF_Register is record
      BKINE          : Boolean := False;
      BKCMP1E        : Boolean := False;
      BKCMP2E        : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      BKINP          : Boolean := False;
      BKCMP1P        : Boolean := False;
      BKCMP2P        : Boolean := False;
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      ETRSEL         : AF_ETRSEL_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
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

   type AF2_Register is record
      BK2INE         : Boolean := False;
      BK2CMP1E       : Boolean := False;
      BK2CMP2E       : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      BK2INP         : Boolean := False;
      BK2CMP1P       : Boolean := False;
      BK2CMP2P       : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
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

   subtype TISEL_TI1SEL_Field is HAL.UInt4;
   subtype TISEL_TI2SEL_Field is HAL.UInt4;
   subtype TISEL_TI3SEL_Field is HAL.UInt4;
   subtype TISEL_TI4SEL_Field is HAL.UInt4;

   type TISEL_Register is record
      TI1SEL         : TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      TI2SEL         : TISEL_TI2SEL_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      TI3SEL         : TISEL_TI3SEL_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      TI4SEL         : TISEL_TI4SEL_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
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
      DMAR         : aliased HAL.UInt32;
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

end STM32_SVD.TIM1;
