--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.TIM17 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_CKD_Field is HAL.UInt2;

   type CR1_Register is record
      CEN            : Boolean := False;
      UDIS           : Boolean := False;
      URS            : Boolean := False;
      OPM            : Boolean := False;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
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
      Reserved_4_6   at 0 range 4 .. 6;
      ARPE           at 0 range 7 .. 7;
      CKD            at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   type CR2_Register is record
      CCPC           : Boolean := False;
      --  unspecified
      Reserved_1_1   : HAL.Bit := 16#0#;
      CCUS           : Boolean := False;
      CCDS           : Boolean := False;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      OIS1           : Boolean := False;
      OIS1N          : Boolean := False;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
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

   type DIER_Register is record
      UIE            : Boolean := False;
      CC1IE          : Boolean := False;
      --  unspecified
      Reserved_2_4   : HAL.UInt3 := 16#0#;
      COMIE          : Boolean := False;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      BIE            : Boolean := False;
      UDE            : Boolean := False;
      CC1DE          : Boolean := False;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
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

   type SR_Register is record
      UIF            : Boolean := False;
      CC1IF          : Boolean := False;
      --  unspecified
      Reserved_2_4   : HAL.UInt3 := 16#0#;
      COMIF          : Boolean := False;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      BIF            : Boolean := False;
      --  unspecified
      Reserved_8_8   : HAL.Bit := 16#0#;
      CC1OF          : Boolean := False;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
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

   type EGR_Register is record
      UG            : Boolean := False;
      CC1G          : Boolean := False;
      --  unspecified
      Reserved_2_4  : HAL.UInt3 := 16#0#;
      COMG          : Boolean := False;
      --  unspecified
      Reserved_6_6  : HAL.Bit := 16#0#;
      BG            : Boolean := False;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
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

   subtype CCMR1_Output_CC1S_Field is HAL.UInt2;
   subtype CCMR1_Output_OC1M_Field is HAL.UInt3;

   type CCMR1_Output_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      CC1S           : CCMR1_Output_CC1S_Field := 16#0#;
      OC1FE          : Boolean := False;
      OC1PE          : Boolean := False;
      OC1M           : CCMR1_Output_OC1M_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      OC1M_1         : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   subtype CCMR1_Input_CC1S_Field is HAL.UInt2;
   subtype CCMR1_Input_IC1PSC_Field is HAL.UInt2;
   subtype CCMR1_Input_IC1F_Field is HAL.UInt4;

   type CCMR1_Input_Register is record
      CC1S          : CCMR1_Input_CC1S_Field := 16#0#;
      IC1PSC        : CCMR1_Input_IC1PSC_Field := 16#0#;
      IC1F          : CCMR1_Input_IC1F_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Input_Register use record
      CC1S          at 0 range 0 .. 1;
      IC1PSC        at 0 range 2 .. 3;
      IC1F          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   type CCER_Register is record
      CC1E          : Boolean := False;
      CC1P          : Boolean := False;
      CC1NE         : Boolean := False;
      CC1NP         : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
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

   subtype RCR_REP_Field is HAL.UInt8;

   type RCR_Register is record
      REP           : RCR_REP_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      REP           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
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

   subtype BDTR_DT_Field is HAL.UInt8;
   subtype BDTR_LOCK_Field is HAL.UInt2;

   type BDTR_Register is record
      DT             : BDTR_DT_Field := 16#0#;
      LOCK           : BDTR_LOCK_Field := 16#0#;
      OSSI           : Boolean := False;
      OSSR           : Boolean := False;
      BKE            : Boolean := False;
      BKP            : Boolean := False;
      AOE            : Boolean := False;
      MOE            : Boolean := False;
      --  unspecified
      Reserved_16_25 : HAL.UInt10 := 16#0#;
      BKDSRM         : Boolean := False;
      --  unspecified
      Reserved_27_27 : HAL.Bit := 16#0#;
      BKBID          : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
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

   subtype DMAR_DMAB_Field is HAL.UInt16;

   type DMAR_Register is record
      DMAB           : DMAR_DMAB_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMAR_Register use record
      DMAB           at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TIM16_OR1_TI1_RMP_Field is HAL.UInt2;

   type TIM16_OR1_Register is record
      TI1_RMP       : TIM16_OR1_TI1_RMP_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIM16_OR1_Register use record
      TI1_RMP       at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TIM17_OR1_TI1_RMP_Field is HAL.UInt2;

   type TIM17_OR1_Register is record
      TI1_RMP       : TIM17_OR1_TI1_RMP_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIM17_OR1_Register use record
      TI1_RMP       at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   type TIM16_AF1_Register is record
      BKINE          : Boolean := False;
      BKCMP1E        : Boolean := False;
      BKCMP2E        : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      BKINP          : Boolean := False;
      BKCMP1P        : Boolean := False;
      BKCMP2P        : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
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

   type TIM17_AF1_Register is record
      BKINE          : Boolean := False;
      BKCMP1E        : Boolean := False;
      BKCMP2E        : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      BKINP          : Boolean := False;
      BKCMP1P        : Boolean := False;
      BKCMP2P        : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
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

   subtype TIM16_TISEL_TI1SEL_Field is HAL.UInt4;

   type TIM16_TISEL_Register is record
      TI1SEL        : TIM16_TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIM16_TISEL_Register use record
      TI1SEL        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype TIM17_TISEL_TI1SEL_Field is HAL.UInt4;

   type TIM17_TISEL_Register is record
      TI1SEL        : TIM17_TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
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

end STM32_SVD.TIM17;
