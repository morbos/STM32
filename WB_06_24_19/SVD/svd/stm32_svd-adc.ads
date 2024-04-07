--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.ADC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  ISR_AWD array
   type ISR_AWD_Field_Array is array (1 .. 3) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for ISR_AWD
   type ISR_AWD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  AWD as a value
            Val : HAL.UInt3;
         when True =>
            --  AWD as an array
            Arr : ISR_AWD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 3;

   for ISR_AWD_Field use record
      Val at 0 range 0 .. 2;
      Arr at 0 range 0 .. 2;
   end record;

   type ISR_Register is record
      ADRDY          : Boolean := False;
      EOSMP          : Boolean := False;
      EOC            : Boolean := False;
      EOS            : Boolean := False;
      OVR            : Boolean := False;
      JEOC           : Boolean := False;
      JEOS           : Boolean := False;
      AWD            : ISR_AWD_Field := (As_Array => False, Val => 16#0#);
      JQOVF          : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      ADRDY          at 0 range 0 .. 0;
      EOSMP          at 0 range 1 .. 1;
      EOC            at 0 range 2 .. 2;
      EOS            at 0 range 3 .. 3;
      OVR            at 0 range 4 .. 4;
      JEOC           at 0 range 5 .. 5;
      JEOS           at 0 range 6 .. 6;
      AWD            at 0 range 7 .. 9;
      JQOVF          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   type IER_Register is record
      ADRDYIE        : Boolean := False;
      EOSMPIE        : Boolean := False;
      EOCIE          : Boolean := False;
      EOSIE          : Boolean := False;
      OVRIE          : Boolean := False;
      JEOCIE         : Boolean := False;
      JEOSIE         : Boolean := False;
      AWD1IE         : Boolean := False;
      AWD2IE         : Boolean := False;
      AWD3IE         : Boolean := False;
      JQOVFIE        : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IER_Register use record
      ADRDYIE        at 0 range 0 .. 0;
      EOSMPIE        at 0 range 1 .. 1;
      EOCIE          at 0 range 2 .. 2;
      EOSIE          at 0 range 3 .. 3;
      OVRIE          at 0 range 4 .. 4;
      JEOCIE         at 0 range 5 .. 5;
      JEOSIE         at 0 range 6 .. 6;
      AWD1IE         at 0 range 7 .. 7;
      AWD2IE         at 0 range 8 .. 8;
      AWD3IE         at 0 range 9 .. 9;
      JQOVFIE        at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   type CR_Register is record
      ADEN          : Boolean := False;
      ADDIS         : Boolean := False;
      ADSTART       : Boolean := False;
      JADSTART      : Boolean := False;
      ADSTP         : Boolean := False;
      JADSTP        : Boolean := False;
      --  unspecified
      Reserved_6_27 : HAL.UInt22 := 16#0#;
      ADVREGEN      : Boolean := False;
      DEEPPWD       : Boolean := False;
      ADCALDIF      : Boolean := False;
      ADCAL         : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      ADEN          at 0 range 0 .. 0;
      ADDIS         at 0 range 1 .. 1;
      ADSTART       at 0 range 2 .. 2;
      JADSTART      at 0 range 3 .. 3;
      ADSTP         at 0 range 4 .. 4;
      JADSTP        at 0 range 5 .. 5;
      Reserved_6_27 at 0 range 6 .. 27;
      ADVREGEN      at 0 range 28 .. 28;
      DEEPPWD       at 0 range 29 .. 29;
      ADCALDIF      at 0 range 30 .. 30;
      ADCAL         at 0 range 31 .. 31;
   end record;

   subtype CFGR_RES_Field is HAL.UInt2;

   --  CFGR_EXTSEL array
   type CFGR_EXTSEL_Field_Array is array (0 .. 3) of Boolean
     with Component_Size => 1, Size => 4;

   --  Type definition for CFGR_EXTSEL
   type CFGR_EXTSEL_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EXTSEL as a value
            Val : HAL.UInt4;
         when True =>
            --  EXTSEL as an array
            Arr : CFGR_EXTSEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for CFGR_EXTSEL_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   subtype CFGR_EXTEN_Field is HAL.UInt2;
   subtype CFGR_DISCNUM_Field is HAL.UInt3;
   subtype CFGR_AWD1CH_Field is HAL.UInt5;

   type CFGR_Register is record
      DMAEN          : Boolean := False;
      DMACFG         : Boolean := False;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      RES            : CFGR_RES_Field := 16#0#;
      ALIGN          : Boolean := False;
      EXTSEL         : CFGR_EXTSEL_Field := (As_Array => False, Val => 16#0#);
      EXTEN          : CFGR_EXTEN_Field := 16#0#;
      OVRMOD         : Boolean := False;
      CONT           : Boolean := False;
      AUTDLY         : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      DISCEN         : Boolean := False;
      DISCNUM        : CFGR_DISCNUM_Field := 16#0#;
      JDISCEN        : Boolean := False;
      JQM            : Boolean := False;
      AWD1SGL        : Boolean := False;
      AWD1EN         : Boolean := False;
      JAWD1EN        : Boolean := False;
      JAUTO          : Boolean := False;
      AWD1CH         : CFGR_AWD1CH_Field := 16#0#;
      JQDIS          : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      DMAEN          at 0 range 0 .. 0;
      DMACFG         at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      RES            at 0 range 3 .. 4;
      ALIGN          at 0 range 5 .. 5;
      EXTSEL         at 0 range 6 .. 9;
      EXTEN          at 0 range 10 .. 11;
      OVRMOD         at 0 range 12 .. 12;
      CONT           at 0 range 13 .. 13;
      AUTDLY         at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      DISCEN         at 0 range 16 .. 16;
      DISCNUM        at 0 range 17 .. 19;
      JDISCEN        at 0 range 20 .. 20;
      JQM            at 0 range 21 .. 21;
      AWD1SGL        at 0 range 22 .. 22;
      AWD1EN         at 0 range 23 .. 23;
      JAWD1EN        at 0 range 24 .. 24;
      JAUTO          at 0 range 25 .. 25;
      AWD1CH         at 0 range 26 .. 30;
      JQDIS          at 0 range 31 .. 31;
   end record;

   subtype CFGR2_OVSR_Field is HAL.UInt3;
   subtype CFGR2_OVSS_Field is HAL.UInt4;

   type CFGR2_Register is record
      ROVSE          : Boolean := False;
      JOVSE          : Boolean := False;
      OVSR           : CFGR2_OVSR_Field := 16#0#;
      OVSS           : CFGR2_OVSS_Field := 16#0#;
      TROVS          : Boolean := False;
      ROVSM          : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR2_Register use record
      ROVSE          at 0 range 0 .. 0;
      JOVSE          at 0 range 1 .. 1;
      OVSR           at 0 range 2 .. 4;
      OVSS           at 0 range 5 .. 8;
      TROVS          at 0 range 9 .. 9;
      ROVSM          at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  SMPR1_SMP array element
   subtype SMPR1_SMP_Element is HAL.UInt3;

   --  SMPR1_SMP array
   type SMPR1_SMP_Field_Array is array (0 .. 9) of SMPR1_SMP_Element
     with Component_Size => 3, Size => 30;

   --  Type definition for SMPR1_SMP
   type SMPR1_SMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SMP as a value
            Val : HAL.UInt30;
         when True =>
            --  SMP as an array
            Arr : SMPR1_SMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 30;

   for SMPR1_SMP_Field use record
      Val at 0 range 0 .. 29;
      Arr at 0 range 0 .. 29;
   end record;

   type SMPR1_Register is record
      SMP            : SMPR1_SMP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMPR1_Register use record
      SMP            at 0 range 0 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  SMPR2_SMP array element
   subtype SMPR2_SMP_Element is HAL.UInt3;

   --  SMPR2_SMP array
   type SMPR2_SMP_Field_Array is array (10 .. 18) of SMPR2_SMP_Element
     with Component_Size => 3, Size => 27;

   --  Type definition for SMPR2_SMP
   type SMPR2_SMP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SMP as a value
            Val : HAL.UInt27;
         when True =>
            --  SMP as an array
            Arr : SMPR2_SMP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 27;

   for SMPR2_SMP_Field use record
      Val at 0 range 0 .. 26;
      Arr at 0 range 0 .. 26;
   end record;

   type SMPR2_Register is record
      SMP            : SMPR2_SMP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_27_31 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMPR2_Register use record
      SMP            at 0 range 0 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype TR1_LT1_Field is HAL.UInt12;
   subtype TR1_HT1_Field is HAL.UInt12;

   type TR1_Register is record
      LT1            : TR1_LT1_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      HT1            : TR1_HT1_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR1_Register use record
      LT1            at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      HT1            at 0 range 16 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype TR2_LT2_Field is HAL.UInt8;
   subtype TR2_HT2_Field is HAL.UInt8;

   type TR2_Register is record
      LT2            : TR2_LT2_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      HT2            : TR2_HT2_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR2_Register use record
      LT2            at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      HT2            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype TR3_LT3_Field is HAL.UInt8;
   subtype TR3_HT3_Field is HAL.UInt8;

   type TR3_Register is record
      LT3            : TR3_LT3_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      HT3            : TR3_HT3_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR3_Register use record
      LT3            at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      HT3            at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SQR1_L_Field is HAL.UInt4;
   subtype SQR1_SQ1_Field is HAL.UInt5;
   subtype SQR1_SQ2_Field is HAL.UInt5;
   subtype SQR1_SQ3_Field is HAL.UInt5;
   subtype SQR1_SQ4_Field is HAL.UInt5;

   type SQR1_Register is record
      L              : SQR1_L_Field := 16#0#;
      --  unspecified
      Reserved_4_5   : HAL.UInt2 := 16#0#;
      SQ1            : SQR1_SQ1_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      SQ2            : SQR1_SQ2_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      SQ3            : SQR1_SQ3_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      SQ4            : SQR1_SQ4_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SQR1_Register use record
      L              at 0 range 0 .. 3;
      Reserved_4_5   at 0 range 4 .. 5;
      SQ1            at 0 range 6 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      SQ2            at 0 range 12 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      SQ3            at 0 range 18 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      SQ4            at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype SQR2_SQ5_Field is HAL.UInt5;
   subtype SQR2_SQ6_Field is HAL.UInt5;
   subtype SQR2_SQ7_Field is HAL.UInt5;
   subtype SQR2_SQ8_Field is HAL.UInt5;
   subtype SQR2_SQ9_Field is HAL.UInt5;

   type SQR2_Register is record
      SQ5            : SQR2_SQ5_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      SQ6            : SQR2_SQ6_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      SQ7            : SQR2_SQ7_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      SQ8            : SQR2_SQ8_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      SQ9            : SQR2_SQ9_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SQR2_Register use record
      SQ5            at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      SQ6            at 0 range 6 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      SQ7            at 0 range 12 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      SQ8            at 0 range 18 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      SQ9            at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype SQR3_SQ10_Field is HAL.UInt5;
   subtype SQR3_SQ11_Field is HAL.UInt5;
   subtype SQR3_SQ12_Field is HAL.UInt5;
   subtype SQR3_SQ13_Field is HAL.UInt5;
   subtype SQR3_SQ14_Field is HAL.UInt5;

   type SQR3_Register is record
      SQ10           : SQR3_SQ10_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      SQ11           : SQR3_SQ11_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      SQ12           : SQR3_SQ12_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      SQ13           : SQR3_SQ13_Field := 16#0#;
      --  unspecified
      Reserved_23_23 : HAL.Bit := 16#0#;
      SQ14           : SQR3_SQ14_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SQR3_Register use record
      SQ10           at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      SQ11           at 0 range 6 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      SQ12           at 0 range 12 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      SQ13           at 0 range 18 .. 22;
      Reserved_23_23 at 0 range 23 .. 23;
      SQ14           at 0 range 24 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype SQR4_SQ15_Field is HAL.UInt5;
   subtype SQR4_SQ16_Field is HAL.UInt5;

   type SQR4_Register is record
      SQ15           : SQR4_SQ15_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      SQ16           : SQR4_SQ16_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SQR4_Register use record
      SQ15           at 0 range 0 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      SQ16           at 0 range 6 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype DR_RDATA_Field is HAL.UInt16;

   type DR_Register is record
      RDATA          : DR_RDATA_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      RDATA          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype JSQR_JL_Field is HAL.UInt2;
   subtype JSQR_JEXTSEL_Field is HAL.UInt4;
   subtype JSQR_JEXTEN_Field is HAL.UInt2;
   subtype JSQR_JSQ1_Field is HAL.UInt5;
   subtype JSQR_JSQ2_Field is HAL.UInt5;
   subtype JSQR_JSQ3_Field is HAL.UInt5;
   subtype JSQR_JSQ4_Field is HAL.UInt5;

   type JSQR_Register is record
      JL             : JSQR_JL_Field := 16#0#;
      JEXTSEL        : JSQR_JEXTSEL_Field := 16#0#;
      JEXTEN         : JSQR_JEXTEN_Field := 16#0#;
      JSQ1           : JSQR_JSQ1_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      JSQ2           : JSQR_JSQ2_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : HAL.Bit := 16#0#;
      JSQ3           : JSQR_JSQ3_Field := 16#0#;
      --  unspecified
      Reserved_25_25 : HAL.Bit := 16#0#;
      JSQ4           : JSQR_JSQ4_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for JSQR_Register use record
      JL             at 0 range 0 .. 1;
      JEXTSEL        at 0 range 2 .. 5;
      JEXTEN         at 0 range 6 .. 7;
      JSQ1           at 0 range 8 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      JSQ2           at 0 range 14 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      JSQ3           at 0 range 20 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      JSQ4           at 0 range 26 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype OFR1_OFFSET1_Field is HAL.UInt12;
   subtype OFR1_OFFSET1_CH_Field is HAL.UInt5;

   type OFR1_Register is record
      OFFSET1        : OFR1_OFFSET1_Field := 16#0#;
      --  unspecified
      Reserved_12_25 : HAL.UInt14 := 16#0#;
      OFFSET1_CH     : OFR1_OFFSET1_CH_Field := 16#0#;
      OFFSET1_EN     : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OFR1_Register use record
      OFFSET1        at 0 range 0 .. 11;
      Reserved_12_25 at 0 range 12 .. 25;
      OFFSET1_CH     at 0 range 26 .. 30;
      OFFSET1_EN     at 0 range 31 .. 31;
   end record;

   subtype OFR2_OFFSET2_Field is HAL.UInt12;
   subtype OFR2_OFFSET2_CH_Field is HAL.UInt5;

   type OFR2_Register is record
      OFFSET2        : OFR2_OFFSET2_Field := 16#0#;
      --  unspecified
      Reserved_12_25 : HAL.UInt14 := 16#0#;
      OFFSET2_CH     : OFR2_OFFSET2_CH_Field := 16#0#;
      OFFSET2_EN     : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OFR2_Register use record
      OFFSET2        at 0 range 0 .. 11;
      Reserved_12_25 at 0 range 12 .. 25;
      OFFSET2_CH     at 0 range 26 .. 30;
      OFFSET2_EN     at 0 range 31 .. 31;
   end record;

   subtype OFR3_OFFSET3_Field is HAL.UInt12;
   subtype OFR3_OFFSET3_CH_Field is HAL.UInt5;

   type OFR3_Register is record
      OFFSET3        : OFR3_OFFSET3_Field := 16#0#;
      --  unspecified
      Reserved_12_25 : HAL.UInt14 := 16#0#;
      OFFSET3_CH     : OFR3_OFFSET3_CH_Field := 16#0#;
      OFFSET3_EN     : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OFR3_Register use record
      OFFSET3        at 0 range 0 .. 11;
      Reserved_12_25 at 0 range 12 .. 25;
      OFFSET3_CH     at 0 range 26 .. 30;
      OFFSET3_EN     at 0 range 31 .. 31;
   end record;

   subtype OFR4_OFFSET4_Field is HAL.UInt12;
   subtype OFR4_OFFSET4_CH_Field is HAL.UInt5;

   type OFR4_Register is record
      OFFSET4        : OFR4_OFFSET4_Field := 16#0#;
      --  unspecified
      Reserved_12_25 : HAL.UInt14 := 16#0#;
      OFFSET4_CH     : OFR4_OFFSET4_CH_Field := 16#0#;
      OFFSET4_EN     : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OFR4_Register use record
      OFFSET4        at 0 range 0 .. 11;
      Reserved_12_25 at 0 range 12 .. 25;
      OFFSET4_CH     at 0 range 26 .. 30;
      OFFSET4_EN     at 0 range 31 .. 31;
   end record;

   subtype JDR1_JDATA1_Field is HAL.UInt16;

   type JDR1_Register is record
      JDATA1         : JDR1_JDATA1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for JDR1_Register use record
      JDATA1         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype JDR2_JDATA2_Field is HAL.UInt16;

   type JDR2_Register is record
      JDATA2         : JDR2_JDATA2_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for JDR2_Register use record
      JDATA2         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype JDR3_JDATA3_Field is HAL.UInt16;

   type JDR3_Register is record
      JDATA3         : JDR3_JDATA3_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for JDR3_Register use record
      JDATA3         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype JDR4_JDATA4_Field is HAL.UInt16;

   type JDR4_Register is record
      JDATA4         : JDR4_JDATA4_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for JDR4_Register use record
      JDATA4         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype AWD2CR_AWD2CH_Field is HAL.UInt19;

   type AWD2CR_Register is record
      AWD2CH         : AWD2CR_AWD2CH_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AWD2CR_Register use record
      AWD2CH         at 0 range 0 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype AWD3CR_AWD3CH_Field is HAL.UInt19;

   type AWD3CR_Register is record
      AWD3CH         : AWD3CR_AWD3CH_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AWD3CR_Register use record
      AWD3CH         at 0 range 0 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype DIFSEL_DIFSEL_Field is HAL.UInt19;

   type DIFSEL_Register is record
      DIFSEL         : DIFSEL_DIFSEL_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : HAL.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DIFSEL_Register use record
      DIFSEL         at 0 range 0 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype CALFACT_CALFACT_S_Field is HAL.UInt7;
   subtype CALFACT_CALFACT_D_Field is HAL.UInt7;

   type CALFACT_Register is record
      CALFACT_S      : CALFACT_CALFACT_S_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : HAL.UInt9 := 16#0#;
      CALFACT_D      : CALFACT_CALFACT_D_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALFACT_Register use record
      CALFACT_S      at 0 range 0 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      CALFACT_D      at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   type CSR_Register is record
      ADRDY_MST      : Boolean := False;
      EOSMP_MST      : Boolean := False;
      EOC_MST        : Boolean := False;
      EOS_MST        : Boolean := False;
      OVR_MST        : Boolean := False;
      JEOC_MST       : Boolean := False;
      JEOS_MST       : Boolean := False;
      AWD1_MST       : Boolean := False;
      AWD2_MST       : Boolean := False;
      AWD3_MST       : Boolean := False;
      JQOVF_MST      : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      ADRDY_MST      at 0 range 0 .. 0;
      EOSMP_MST      at 0 range 1 .. 1;
      EOC_MST        at 0 range 2 .. 2;
      EOS_MST        at 0 range 3 .. 3;
      OVR_MST        at 0 range 4 .. 4;
      JEOC_MST       at 0 range 5 .. 5;
      JEOS_MST       at 0 range 6 .. 6;
      AWD1_MST       at 0 range 7 .. 7;
      AWD2_MST       at 0 range 8 .. 8;
      AWD3_MST       at 0 range 9 .. 9;
      JQOVF_MST      at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype CCR_CKMODE_Field is HAL.UInt2;
   subtype CCR_PRESC_Field is HAL.UInt4;

   type CCR_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      CKMODE         : CCR_CKMODE_Field := 16#0#;
      PRESC          : CCR_PRESC_Field := 16#0#;
      VREFEN         : Boolean := False;
      CH17SEL        : Boolean := False;
      CH18SEL        : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      CKMODE         at 0 range 16 .. 17;
      PRESC          at 0 range 18 .. 21;
      VREFEN         at 0 range 22 .. 22;
      CH17SEL        at 0 range 23 .. 23;
      CH18SEL        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type ADC_Peripheral is record
      ISR     : aliased ISR_Register;
      IER     : aliased IER_Register;
      CR      : aliased CR_Register;
      CFGR    : aliased CFGR_Register;
      CFGR2   : aliased CFGR2_Register;
      SMPR1   : aliased SMPR1_Register;
      SMPR2   : aliased SMPR2_Register;
      TR1     : aliased TR1_Register;
      TR2     : aliased TR2_Register;
      TR3     : aliased TR3_Register;
      SQR1    : aliased SQR1_Register;
      SQR2    : aliased SQR2_Register;
      SQR3    : aliased SQR3_Register;
      SQR4    : aliased SQR4_Register;
      DR      : aliased DR_Register;
      JSQR    : aliased JSQR_Register;
      OFR1    : aliased OFR1_Register;
      OFR2    : aliased OFR2_Register;
      OFR3    : aliased OFR3_Register;
      OFR4    : aliased OFR4_Register;
      JDR1    : aliased JDR1_Register;
      JDR2    : aliased JDR2_Register;
      JDR3    : aliased JDR3_Register;
      JDR4    : aliased JDR4_Register;
      AWD2CR  : aliased AWD2CR_Register;
      AWD3CR  : aliased AWD3CR_Register;
      DIFSEL  : aliased DIFSEL_Register;
      CALFACT : aliased CALFACT_Register;
      CSR     : aliased CSR_Register;
      CCR     : aliased CCR_Register;
   end record
     with Volatile;

   for ADC_Peripheral use record
      ISR     at 16#0# range 0 .. 31;
      IER     at 16#4# range 0 .. 31;
      CR      at 16#8# range 0 .. 31;
      CFGR    at 16#C# range 0 .. 31;
      CFGR2   at 16#10# range 0 .. 31;
      SMPR1   at 16#14# range 0 .. 31;
      SMPR2   at 16#18# range 0 .. 31;
      TR1     at 16#20# range 0 .. 31;
      TR2     at 16#24# range 0 .. 31;
      TR3     at 16#28# range 0 .. 31;
      SQR1    at 16#30# range 0 .. 31;
      SQR2    at 16#34# range 0 .. 31;
      SQR3    at 16#38# range 0 .. 31;
      SQR4    at 16#3C# range 0 .. 31;
      DR      at 16#40# range 0 .. 31;
      JSQR    at 16#4C# range 0 .. 31;
      OFR1    at 16#60# range 0 .. 31;
      OFR2    at 16#64# range 0 .. 31;
      OFR3    at 16#68# range 0 .. 31;
      OFR4    at 16#6C# range 0 .. 31;
      JDR1    at 16#80# range 0 .. 31;
      JDR2    at 16#84# range 0 .. 31;
      JDR3    at 16#88# range 0 .. 31;
      JDR4    at 16#8C# range 0 .. 31;
      AWD2CR  at 16#A0# range 0 .. 31;
      AWD3CR  at 16#A4# range 0 .. 31;
      DIFSEL  at 16#B0# range 0 .. 31;
      CALFACT at 16#B4# range 0 .. 31;
      CSR     at 16#300# range 0 .. 31;
      CCR     at 16#308# range 0 .. 31;
   end record;

   ADC_Periph : aliased ADC_Peripheral
     with Import, Address => System'To_Address (16#50040000#);

end STM32_SVD.ADC;
