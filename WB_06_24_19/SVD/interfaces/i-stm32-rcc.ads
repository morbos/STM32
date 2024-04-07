--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.RCC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR_MSION_Field is Interfaces.Bit_Types.Bit;
   subtype CR_MSIRDY_Field is Interfaces.Bit_Types.Bit;
   subtype CR_MSIPLLEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR_MSIRANGE_Field is Interfaces.Bit_Types.UInt4;
   subtype CR_HSION_Field is Interfaces.Bit_Types.Bit;
   subtype CR_HSIKERON_Field is Interfaces.Bit_Types.Bit;
   subtype CR_HSIRDY_Field is Interfaces.Bit_Types.Bit;
   subtype CR_HSIASFS_Field is Interfaces.Bit_Types.Bit;
   subtype CR_HSIKERDY_Field is Interfaces.Bit_Types.Bit;
   subtype CR_HSEON_Field is Interfaces.Bit_Types.Bit;
   subtype CR_HSERDY_Field is Interfaces.Bit_Types.Bit;
   subtype CR_HSEBYP_Field is Interfaces.Bit_Types.Bit;
   subtype CR_CSSON_Field is Interfaces.Bit_Types.Bit;
   subtype CR_HSEPRE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_PLLON_Field is Interfaces.Bit_Types.Bit;
   subtype CR_PLLRDY_Field is Interfaces.Bit_Types.Bit;
   subtype CR_PLLSAI1ON_Field is Interfaces.Bit_Types.Bit;
   subtype CR_PLLSAI1RDY_Field is Interfaces.Bit_Types.Bit;

   type CR_Register is record
      MSION          : CR_MSION_Field := 16#0#;
      MSIRDY         : CR_MSIRDY_Field := 16#0#;
      MSIPLLEN       : CR_MSIPLLEN_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Interfaces.Bit_Types.Bit := 16#0#;
      MSIRANGE       : CR_MSIRANGE_Field := 16#0#;
      HSION          : CR_HSION_Field := 16#0#;
      HSIKERON       : CR_HSIKERON_Field := 16#0#;
      HSIRDY         : CR_HSIRDY_Field := 16#0#;
      HSIASFS        : CR_HSIASFS_Field := 16#0#;
      HSIKERDY       : CR_HSIKERDY_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : Interfaces.Bit_Types.UInt3 := 16#0#;
      HSEON          : CR_HSEON_Field := 16#0#;
      HSERDY         : CR_HSERDY_Field := 16#0#;
      HSEBYP         : CR_HSEBYP_Field := 16#0#;
      CSSON          : CR_CSSON_Field := 16#0#;
      HSEPRE         : CR_HSEPRE_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : Interfaces.Bit_Types.UInt3 := 16#0#;
      PLLON          : CR_PLLON_Field := 16#0#;
      PLLRDY         : CR_PLLRDY_Field := 16#0#;
      PLLSAI1ON      : CR_PLLSAI1ON_Field := 16#0#;
      PLLSAI1RDY     : CR_PLLSAI1RDY_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.Bit_Types.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      MSION          at 0 range 0 .. 0;
      MSIRDY         at 0 range 1 .. 1;
      MSIPLLEN       at 0 range 2 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      MSIRANGE       at 0 range 4 .. 7;
      HSION          at 0 range 8 .. 8;
      HSIKERON       at 0 range 9 .. 9;
      HSIRDY         at 0 range 10 .. 10;
      HSIASFS        at 0 range 11 .. 11;
      HSIKERDY       at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      HSEON          at 0 range 16 .. 16;
      HSERDY         at 0 range 17 .. 17;
      HSEBYP         at 0 range 18 .. 18;
      CSSON          at 0 range 19 .. 19;
      HSEPRE         at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      PLLON          at 0 range 24 .. 24;
      PLLRDY         at 0 range 25 .. 25;
      PLLSAI1ON      at 0 range 26 .. 26;
      PLLSAI1RDY     at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ICSCR_MSICAL_Field is Interfaces.Bit_Types.Byte;
   subtype ICSCR_MSITRIM_Field is Interfaces.Bit_Types.Byte;
   subtype ICSCR_HSICAL_Field is Interfaces.Bit_Types.Byte;
   subtype ICSCR_HSITRIM_Field is Interfaces.Bit_Types.UInt7;

   type ICSCR_Register is record
      MSICAL         : ICSCR_MSICAL_Field := 16#0#;
      MSITRIM        : ICSCR_MSITRIM_Field := 16#0#;
      HSICAL         : ICSCR_HSICAL_Field := 16#0#;
      HSITRIM        : ICSCR_HSITRIM_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : Interfaces.Bit_Types.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICSCR_Register use record
      MSICAL         at 0 range 0 .. 7;
      MSITRIM        at 0 range 8 .. 15;
      HSICAL         at 0 range 16 .. 23;
      HSITRIM        at 0 range 24 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype CFGR_SW_Field is Interfaces.Bit_Types.UInt2;
   subtype CFGR_SWS_Field is Interfaces.Bit_Types.UInt2;
   subtype CFGR_HPRE_Field is Interfaces.Bit_Types.UInt4;
   --  CFGR_PPRE array element
   subtype CFGR_PPRE_Element is Interfaces.Bit_Types.UInt3;

   --  CFGR_PPRE array
   type CFGR_PPRE_Field_Array is array (1 .. 2) of CFGR_PPRE_Element
     with Component_Size => 3, Size => 6;

   --  Type definition for CFGR_PPRE
   type CFGR_PPRE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PPRE as a value
            Val : Interfaces.Bit_Types.UInt6;
         when True =>
            --  PPRE as an array
            Arr : CFGR_PPRE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for CFGR_PPRE_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   subtype CFGR_STOPWUCK_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_HPREF_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_PPRE1F_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_PPRE2F_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR_MCOSEL_Field is Interfaces.Bit_Types.UInt4;
   subtype CFGR_MCOPRE_Field is Interfaces.Bit_Types.UInt3;

   type CFGR_Register is record
      SW             : CFGR_SW_Field := 16#0#;
      SWS            : CFGR_SWS_Field := 16#0#;
      HPRE           : CFGR_HPRE_Field := 16#0#;
      PPRE           : CFGR_PPRE_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_14 : Interfaces.Bit_Types.Bit := 16#0#;
      STOPWUCK       : CFGR_STOPWUCK_Field := 16#0#;
      HPREF          : CFGR_HPREF_Field := 16#0#;
      PPRE1F         : CFGR_PPRE1F_Field := 16#0#;
      PPRE2F         : CFGR_PPRE2F_Field := 16#0#;
      --  unspecified
      Reserved_19_23 : Interfaces.Bit_Types.UInt5 := 16#0#;
      MCOSEL         : CFGR_MCOSEL_Field := 16#0#;
      MCOPRE         : CFGR_MCOPRE_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : Interfaces.Bit_Types.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR_Register use record
      SW             at 0 range 0 .. 1;
      SWS            at 0 range 2 .. 3;
      HPRE           at 0 range 4 .. 7;
      PPRE           at 0 range 8 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      STOPWUCK       at 0 range 15 .. 15;
      HPREF          at 0 range 16 .. 16;
      PPRE1F         at 0 range 17 .. 17;
      PPRE2F         at 0 range 18 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      MCOSEL         at 0 range 24 .. 27;
      MCOPRE         at 0 range 28 .. 30;
      Reserved_31_31 at 0 range 31 .. 31;
   end record;

   subtype PLLCFGR_PLLSRC_Field is Interfaces.Bit_Types.UInt2;
   subtype PLLCFGR_PLLM_Field is Interfaces.Bit_Types.UInt3;
   subtype PLLCFGR_PLLN_Field is Interfaces.Bit_Types.UInt7;
   subtype PLLCFGR_PLLPEN_Field is Interfaces.Bit_Types.Bit;
   subtype PLLCFGR_PLLP_Field is Interfaces.Bit_Types.UInt5;
   subtype PLLCFGR_PLLQEN_Field is Interfaces.Bit_Types.Bit;
   subtype PLLCFGR_PLLQ_Field is Interfaces.Bit_Types.UInt3;
   subtype PLLCFGR_PLLREN_Field is Interfaces.Bit_Types.Bit;
   subtype PLLCFGR_PLLR_Field is Interfaces.Bit_Types.UInt3;

   type PLLCFGR_Register is record
      PLLSRC         : PLLCFGR_PLLSRC_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.Bit_Types.UInt2 := 16#0#;
      PLLM           : PLLCFGR_PLLM_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      PLLN           : PLLCFGR_PLLN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      PLLPEN         : PLLCFGR_PLLPEN_Field := 16#0#;
      PLLP           : PLLCFGR_PLLP_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.Bit_Types.UInt2 := 16#0#;
      PLLQEN         : PLLCFGR_PLLQEN_Field := 16#0#;
      PLLQ           : PLLCFGR_PLLQ_Field := 16#0#;
      PLLREN         : PLLCFGR_PLLREN_Field := 16#0#;
      PLLR           : PLLCFGR_PLLR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLLCFGR_Register use record
      PLLSRC         at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      PLLM           at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      PLLN           at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      PLLPEN         at 0 range 16 .. 16;
      PLLP           at 0 range 17 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      PLLQEN         at 0 range 24 .. 24;
      PLLQ           at 0 range 25 .. 27;
      PLLREN         at 0 range 28 .. 28;
      PLLR           at 0 range 29 .. 31;
   end record;

   subtype PLL_SAI1CFGR_PLLN_Field is Interfaces.Bit_Types.UInt7;
   subtype PLL_SAI1CFGR_PLLPEN_Field is Interfaces.Bit_Types.Bit;
   subtype PLL_SAI1CFGR_PLLP_Field is Interfaces.Bit_Types.UInt5;
   subtype PLL_SAI1CFGR_PLLQEN_Field is Interfaces.Bit_Types.Bit;
   subtype PLL_SAI1CFGR_PLLQ_Field is Interfaces.Bit_Types.UInt3;
   subtype PLL_SAI1CFGR_PLLREN_Field is Interfaces.Bit_Types.Bit;
   subtype PLL_SAI1CFGR_PLLR_Field is Interfaces.Bit_Types.UInt3;

   type PLL_SAI1CFGR_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.Bit_Types.Byte := 16#0#;
      PLLN           : PLL_SAI1CFGR_PLLN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      PLLPEN         : PLL_SAI1CFGR_PLLPEN_Field := 16#0#;
      PLLP           : PLL_SAI1CFGR_PLLP_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.Bit_Types.UInt2 := 16#0#;
      PLLQEN         : PLL_SAI1CFGR_PLLQEN_Field := 16#0#;
      PLLQ           : PLL_SAI1CFGR_PLLQ_Field := 16#0#;
      PLLREN         : PLL_SAI1CFGR_PLLREN_Field := 16#0#;
      PLLR           : PLL_SAI1CFGR_PLLR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL_SAI1CFGR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      PLLN           at 0 range 8 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      PLLPEN         at 0 range 16 .. 16;
      PLLP           at 0 range 17 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      PLLQEN         at 0 range 24 .. 24;
      PLLQ           at 0 range 25 .. 27;
      PLLREN         at 0 range 28 .. 28;
      PLLR           at 0 range 29 .. 31;
   end record;

   subtype CIER_LSI1RDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype CIER_LSERDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype CIER_MSIRDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype CIER_HSIRDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype CIER_HSERDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype CIER_PLLRDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype CIER_PLLSAI1RDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype CIER_LSECSSIE_Field is Interfaces.Bit_Types.Bit;
   subtype CIER_HSI48RDYIE_Field is Interfaces.Bit_Types.Bit;
   subtype CIER_LSI2RDYIE_Field is Interfaces.Bit_Types.Bit;

   type CIER_Register is record
      LSI1RDYIE      : CIER_LSI1RDYIE_Field := 16#0#;
      LSERDYIE       : CIER_LSERDYIE_Field := 16#0#;
      MSIRDYIE       : CIER_MSIRDYIE_Field := 16#0#;
      HSIRDYIE       : CIER_HSIRDYIE_Field := 16#0#;
      HSERDYIE       : CIER_HSERDYIE_Field := 16#0#;
      PLLRDYIE       : CIER_PLLRDYIE_Field := 16#0#;
      PLLSAI1RDYIE   : CIER_PLLSAI1RDYIE_Field := 16#0#;
      --  unspecified
      Reserved_7_8   : Interfaces.Bit_Types.UInt2 := 16#0#;
      LSECSSIE       : CIER_LSECSSIE_Field := 16#0#;
      HSI48RDYIE     : CIER_HSI48RDYIE_Field := 16#0#;
      LSI2RDYIE      : CIER_LSI2RDYIE_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIER_Register use record
      LSI1RDYIE      at 0 range 0 .. 0;
      LSERDYIE       at 0 range 1 .. 1;
      MSIRDYIE       at 0 range 2 .. 2;
      HSIRDYIE       at 0 range 3 .. 3;
      HSERDYIE       at 0 range 4 .. 4;
      PLLRDYIE       at 0 range 5 .. 5;
      PLLSAI1RDYIE   at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      LSECSSIE       at 0 range 9 .. 9;
      HSI48RDYIE     at 0 range 10 .. 10;
      LSI2RDYIE      at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CIFR_LSI1RDYF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_LSERDYF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_MSIRDYF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_HSIRDYF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_HSERDYF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_PLLRDYF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_PLLSAI1RDYF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_CSSF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_LSECSSF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_HSI48RDYF_Field is Interfaces.Bit_Types.Bit;
   subtype CIFR_LSI2RDYF_Field is Interfaces.Bit_Types.Bit;

   type CIFR_Register is record
      LSI1RDYF       : CIFR_LSI1RDYF_Field := 16#0#;
      LSERDYF        : CIFR_LSERDYF_Field := 16#0#;
      MSIRDYF        : CIFR_MSIRDYF_Field := 16#0#;
      HSIRDYF        : CIFR_HSIRDYF_Field := 16#0#;
      HSERDYF        : CIFR_HSERDYF_Field := 16#0#;
      PLLRDYF        : CIFR_PLLRDYF_Field := 16#0#;
      PLLSAI1RDYF    : CIFR_PLLSAI1RDYF_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      CSSF           : CIFR_CSSF_Field := 16#0#;
      LSECSSF        : CIFR_LSECSSF_Field := 16#0#;
      HSI48RDYF      : CIFR_HSI48RDYF_Field := 16#0#;
      LSI2RDYF       : CIFR_LSI2RDYF_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIFR_Register use record
      LSI1RDYF       at 0 range 0 .. 0;
      LSERDYF        at 0 range 1 .. 1;
      MSIRDYF        at 0 range 2 .. 2;
      HSIRDYF        at 0 range 3 .. 3;
      HSERDYF        at 0 range 4 .. 4;
      PLLRDYF        at 0 range 5 .. 5;
      PLLSAI1RDYF    at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      CSSF           at 0 range 8 .. 8;
      LSECSSF        at 0 range 9 .. 9;
      HSI48RDYF      at 0 range 10 .. 10;
      LSI2RDYF       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype CICR_LSI1RDYC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_LSERDYC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_MSIRDYC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_HSIRDYC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_HSERDYC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_PLLRDYC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_PLLSAI1RDYC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_CSSC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_LSECSSC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_HSI48RDYC_Field is Interfaces.Bit_Types.Bit;
   subtype CICR_LSI2RDYC_Field is Interfaces.Bit_Types.Bit;

   type CICR_Register is record
      LSI1RDYC       : CICR_LSI1RDYC_Field := 16#0#;
      LSERDYC        : CICR_LSERDYC_Field := 16#0#;
      MSIRDYC        : CICR_MSIRDYC_Field := 16#0#;
      HSIRDYC        : CICR_HSIRDYC_Field := 16#0#;
      HSERDYC        : CICR_HSERDYC_Field := 16#0#;
      PLLRDYC        : CICR_PLLRDYC_Field := 16#0#;
      PLLSAI1RDYC    : CICR_PLLSAI1RDYC_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      CSSC           : CICR_CSSC_Field := 16#0#;
      LSECSSC        : CICR_LSECSSC_Field := 16#0#;
      HSI48RDYC      : CICR_HSI48RDYC_Field := 16#0#;
      LSI2RDYC       : CICR_LSI2RDYC_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CICR_Register use record
      LSI1RDYC       at 0 range 0 .. 0;
      LSERDYC        at 0 range 1 .. 1;
      MSIRDYC        at 0 range 2 .. 2;
      HSIRDYC        at 0 range 3 .. 3;
      HSERDYC        at 0 range 4 .. 4;
      PLLRDYC        at 0 range 5 .. 5;
      PLLSAI1RDYC    at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      CSSC           at 0 range 8 .. 8;
      LSECSSC        at 0 range 9 .. 9;
      HSI48RDYC      at 0 range 10 .. 10;
      LSI2RDYC       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype SMPSCR_SMPSSEL_Field is Interfaces.Bit_Types.UInt2;
   subtype SMPSCR_SMPSDIV_Field is Interfaces.Bit_Types.UInt2;
   subtype SMPSCR_SMPSSWS_Field is Interfaces.Bit_Types.UInt2;

   type SMPSCR_Register is record
      SMPSSEL        : SMPSCR_SMPSSEL_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SMPSDIV        : SMPSCR_SMPSDIV_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      SMPSSWS        : SMPSCR_SMPSSWS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMPSCR_Register use record
      SMPSSEL        at 0 range 0 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      SMPSDIV        at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SMPSSWS        at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype AHB1RSTR_DMA1RST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1RSTR_DMA2RST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1RSTR_DMAMUX1RST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1RSTR_CRCRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1RSTR_TSCRST_Field is Interfaces.Bit_Types.Bit;

   type AHB1RSTR_Register is record
      DMA1RST        : AHB1RSTR_DMA1RST_Field := 16#0#;
      DMA2RST        : AHB1RSTR_DMA2RST_Field := 16#0#;
      DMAMUX1RST     : AHB1RSTR_DMAMUX1RST_Field := 16#0#;
      --  unspecified
      Reserved_3_11  : Interfaces.Bit_Types.UInt9 := 16#0#;
      CRCRST         : AHB1RSTR_CRCRST_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : Interfaces.Bit_Types.UInt3 := 16#0#;
      TSCRST         : AHB1RSTR_TSCRST_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB1RSTR_Register use record
      DMA1RST        at 0 range 0 .. 0;
      DMA2RST        at 0 range 1 .. 1;
      DMAMUX1RST     at 0 range 2 .. 2;
      Reserved_3_11  at 0 range 3 .. 11;
      CRCRST         at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TSCRST         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype AHB2RSTR_GPIOARST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2RSTR_GPIOBRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2RSTR_GPIOCRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2RSTR_GPIODRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2RSTR_GPIOERST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2RSTR_GPIOHRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2RSTR_ADCRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2RSTR_AES1RST_Field is Interfaces.Bit_Types.Bit;

   type AHB2RSTR_Register is record
      GPIOARST       : AHB2RSTR_GPIOARST_Field := 16#0#;
      GPIOBRST       : AHB2RSTR_GPIOBRST_Field := 16#0#;
      GPIOCRST       : AHB2RSTR_GPIOCRST_Field := 16#0#;
      GPIODRST       : AHB2RSTR_GPIODRST_Field := 16#0#;
      GPIOERST       : AHB2RSTR_GPIOERST_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : Interfaces.Bit_Types.UInt2 := 16#0#;
      GPIOHRST       : AHB2RSTR_GPIOHRST_Field := 16#0#;
      --  unspecified
      Reserved_8_12  : Interfaces.Bit_Types.UInt5 := 16#0#;
      ADCRST         : AHB2RSTR_ADCRST_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.Bit_Types.UInt2 := 16#0#;
      AES1RST        : AHB2RSTR_AES1RST_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB2RSTR_Register use record
      GPIOARST       at 0 range 0 .. 0;
      GPIOBRST       at 0 range 1 .. 1;
      GPIOCRST       at 0 range 2 .. 2;
      GPIODRST       at 0 range 3 .. 3;
      GPIOERST       at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      GPIOHRST       at 0 range 7 .. 7;
      Reserved_8_12  at 0 range 8 .. 12;
      ADCRST         at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      AES1RST        at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype AHB3RSTR_QUADSPIRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3RSTR_PKARST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3RSTR_AES2RST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3RSTR_RNGRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3RSTR_HSEMRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3RSTR_IPCCRST_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3RSTR_FLASHRST_Field is Interfaces.Bit_Types.Bit;

   type AHB3RSTR_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.Bit_Types.Byte := 16#0#;
      QUADSPIRST     : AHB3RSTR_QUADSPIRST_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : Interfaces.Bit_Types.UInt7 := 16#0#;
      PKARST         : AHB3RSTR_PKARST_Field := 16#0#;
      AES2RST        : AHB3RSTR_AES2RST_Field := 16#0#;
      RNGRST         : AHB3RSTR_RNGRST_Field := 16#0#;
      HSEMRST        : AHB3RSTR_HSEMRST_Field := 16#0#;
      IPCCRST        : AHB3RSTR_IPCCRST_Field := 16#0#;
      --  unspecified
      Reserved_21_24 : Interfaces.Bit_Types.UInt4 := 16#0#;
      FLASHRST       : AHB3RSTR_FLASHRST_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.Bit_Types.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB3RSTR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      QUADSPIRST     at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      PKARST         at 0 range 16 .. 16;
      AES2RST        at 0 range 17 .. 17;
      RNGRST         at 0 range 18 .. 18;
      HSEMRST        at 0 range 19 .. 19;
      IPCCRST        at 0 range 20 .. 20;
      Reserved_21_24 at 0 range 21 .. 24;
      FLASHRST       at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype APB1RSTR1_TIM2RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB1RSTR1_LCDRST_Field is Interfaces.Bit_Types.Bit;
   subtype APB1RSTR1_SPI2RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB1RSTR1_I2C1RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB1RSTR1_I2C3RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB1RSTR1_CRSRST_Field is Interfaces.Bit_Types.Bit;
   subtype APB1RSTR1_USBRST_Field is Interfaces.Bit_Types.Bit;
   subtype APB1RSTR1_LPTIM1RST_Field is Interfaces.Bit_Types.Bit;

   type APB1RSTR1_Register is record
      TIM2RST        : APB1RSTR1_TIM2RST_Field := 16#0#;
      --  unspecified
      Reserved_1_8   : Interfaces.Bit_Types.Byte := 16#0#;
      LCDRST         : APB1RSTR1_LCDRST_Field := 16#0#;
      --  unspecified
      Reserved_10_13 : Interfaces.Bit_Types.UInt4 := 16#0#;
      SPI2RST        : APB1RSTR1_SPI2RST_Field := 16#0#;
      --  unspecified
      Reserved_15_20 : Interfaces.Bit_Types.UInt6 := 16#0#;
      I2C1RST        : APB1RSTR1_I2C1RST_Field := 16#0#;
      --  unspecified
      Reserved_22_22 : Interfaces.Bit_Types.Bit := 16#0#;
      I2C3RST        : APB1RSTR1_I2C3RST_Field := 16#0#;
      CRSRST         : APB1RSTR1_CRSRST_Field := 16#0#;
      --  unspecified
      Reserved_25_25 : Interfaces.Bit_Types.Bit := 16#0#;
      USBRST         : APB1RSTR1_USBRST_Field := 16#0#;
      --  unspecified
      Reserved_27_30 : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM1RST      : APB1RSTR1_LPTIM1RST_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1RSTR1_Register use record
      TIM2RST        at 0 range 0 .. 0;
      Reserved_1_8   at 0 range 1 .. 8;
      LCDRST         at 0 range 9 .. 9;
      Reserved_10_13 at 0 range 10 .. 13;
      SPI2RST        at 0 range 14 .. 14;
      Reserved_15_20 at 0 range 15 .. 20;
      I2C1RST        at 0 range 21 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      I2C3RST        at 0 range 23 .. 23;
      CRSRST         at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      USBRST         at 0 range 26 .. 26;
      Reserved_27_30 at 0 range 27 .. 30;
      LPTIM1RST      at 0 range 31 .. 31;
   end record;

   subtype APB1RSTR2_LPUART1RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB1RSTR2_LPTIM2RST_Field is Interfaces.Bit_Types.Bit;

   type APB1RSTR2_Register is record
      LPUART1RST    : APB1RSTR2_LPUART1RST_Field := 16#0#;
      --  unspecified
      Reserved_1_4  : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM2RST     : APB1RSTR2_LPTIM2RST_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.Bit_Types.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1RSTR2_Register use record
      LPUART1RST    at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2RST     at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype APB2RSTR_TIM1RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB2RSTR_SPI1RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB2RSTR_USART1RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB2RSTR_TIM16RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB2RSTR_TIM17RST_Field is Interfaces.Bit_Types.Bit;
   subtype APB2RSTR_SAI1RST_Field is Interfaces.Bit_Types.Bit;

   type APB2RSTR_Register is record
      --  unspecified
      Reserved_0_10  : Interfaces.Bit_Types.UInt11 := 16#0#;
      TIM1RST        : APB2RSTR_TIM1RST_Field := 16#0#;
      SPI1RST        : APB2RSTR_SPI1RST_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.Bit_Types.Bit := 16#0#;
      USART1RST      : APB2RSTR_USART1RST_Field := 16#0#;
      --  unspecified
      Reserved_15_16 : Interfaces.Bit_Types.UInt2 := 16#0#;
      TIM16RST       : APB2RSTR_TIM16RST_Field := 16#0#;
      TIM17RST       : APB2RSTR_TIM17RST_Field := 16#0#;
      --  unspecified
      Reserved_19_20 : Interfaces.Bit_Types.UInt2 := 16#0#;
      SAI1RST        : APB2RSTR_SAI1RST_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2RSTR_Register use record
      Reserved_0_10  at 0 range 0 .. 10;
      TIM1RST        at 0 range 11 .. 11;
      SPI1RST        at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1RST      at 0 range 14 .. 14;
      Reserved_15_16 at 0 range 15 .. 16;
      TIM16RST       at 0 range 17 .. 17;
      TIM17RST       at 0 range 18 .. 18;
      Reserved_19_20 at 0 range 19 .. 20;
      SAI1RST        at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype APB3RSTR_RFRST_Field is Interfaces.Bit_Types.Bit;

   type APB3RSTR_Register is record
      RFRST         : APB3RSTR_RFRST_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : Interfaces.Bit_Types.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB3RSTR_Register use record
      RFRST         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype AHB1ENR_DMA1EN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1ENR_DMA2EN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1ENR_DMAMUX1EN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1ENR_CRCEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1ENR_TSCEN_Field is Interfaces.Bit_Types.Bit;

   type AHB1ENR_Register is record
      DMA1EN         : AHB1ENR_DMA1EN_Field := 16#0#;
      DMA2EN         : AHB1ENR_DMA2EN_Field := 16#0#;
      DMAMUX1EN      : AHB1ENR_DMAMUX1EN_Field := 16#0#;
      --  unspecified
      Reserved_3_11  : Interfaces.Bit_Types.UInt9 := 16#0#;
      CRCEN          : AHB1ENR_CRCEN_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : Interfaces.Bit_Types.UInt3 := 16#0#;
      TSCEN          : AHB1ENR_TSCEN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB1ENR_Register use record
      DMA1EN         at 0 range 0 .. 0;
      DMA2EN         at 0 range 1 .. 1;
      DMAMUX1EN      at 0 range 2 .. 2;
      Reserved_3_11  at 0 range 3 .. 11;
      CRCEN          at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TSCEN          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype AHB2ENR_GPIOAEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2ENR_GPIOBEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2ENR_GPIOCEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2ENR_GPIODEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2ENR_GPIOEEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2ENR_GPIOHEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2ENR_ADCEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2ENR_AES1EN_Field is Interfaces.Bit_Types.Bit;

   type AHB2ENR_Register is record
      GPIOAEN        : AHB2ENR_GPIOAEN_Field := 16#0#;
      GPIOBEN        : AHB2ENR_GPIOBEN_Field := 16#0#;
      GPIOCEN        : AHB2ENR_GPIOCEN_Field := 16#0#;
      GPIODEN        : AHB2ENR_GPIODEN_Field := 16#0#;
      GPIOEEN        : AHB2ENR_GPIOEEN_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : Interfaces.Bit_Types.UInt2 := 16#0#;
      GPIOHEN        : AHB2ENR_GPIOHEN_Field := 16#0#;
      --  unspecified
      Reserved_8_12  : Interfaces.Bit_Types.UInt5 := 16#0#;
      ADCEN          : AHB2ENR_ADCEN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.Bit_Types.UInt2 := 16#0#;
      AES1EN         : AHB2ENR_AES1EN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB2ENR_Register use record
      GPIOAEN        at 0 range 0 .. 0;
      GPIOBEN        at 0 range 1 .. 1;
      GPIOCEN        at 0 range 2 .. 2;
      GPIODEN        at 0 range 3 .. 3;
      GPIOEEN        at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      GPIOHEN        at 0 range 7 .. 7;
      Reserved_8_12  at 0 range 8 .. 12;
      ADCEN          at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      AES1EN         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype AHB3ENR_QUADSPIEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3ENR_PKAEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3ENR_AES2EN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3ENR_RNGEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3ENR_HSEMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3ENR_IPCCEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3ENR_FLASHEN_Field is Interfaces.Bit_Types.Bit;

   type AHB3ENR_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.Bit_Types.Byte := 16#0#;
      QUADSPIEN      : AHB3ENR_QUADSPIEN_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : Interfaces.Bit_Types.UInt7 := 16#0#;
      PKAEN          : AHB3ENR_PKAEN_Field := 16#0#;
      AES2EN         : AHB3ENR_AES2EN_Field := 16#0#;
      RNGEN          : AHB3ENR_RNGEN_Field := 16#0#;
      HSEMEN         : AHB3ENR_HSEMEN_Field := 16#0#;
      IPCCEN         : AHB3ENR_IPCCEN_Field := 16#0#;
      --  unspecified
      Reserved_21_24 : Interfaces.Bit_Types.UInt4 := 16#0#;
      FLASHEN        : AHB3ENR_FLASHEN_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.Bit_Types.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB3ENR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      QUADSPIEN      at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      PKAEN          at 0 range 16 .. 16;
      AES2EN         at 0 range 17 .. 17;
      RNGEN          at 0 range 18 .. 18;
      HSEMEN         at 0 range 19 .. 19;
      IPCCEN         at 0 range 20 .. 20;
      Reserved_21_24 at 0 range 21 .. 24;
      FLASHEN        at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype APB1ENR1_TIM2EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR1_LCDEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR1_RTCAPBEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR1_WWDGEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR1_SPI2EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR1_I2C1EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR1_I2C3EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR1_CRSEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR1_USBEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR1_LPTIM1EN_Field is Interfaces.Bit_Types.Bit;

   type APB1ENR1_Register is record
      TIM2EN         : APB1ENR1_TIM2EN_Field := 16#0#;
      --  unspecified
      Reserved_1_8   : Interfaces.Bit_Types.Byte := 16#0#;
      LCDEN          : APB1ENR1_LCDEN_Field := 16#0#;
      RTCAPBEN       : APB1ENR1_RTCAPBEN_Field := 16#0#;
      WWDGEN         : APB1ENR1_WWDGEN_Field := 16#0#;
      --  unspecified
      Reserved_12_13 : Interfaces.Bit_Types.UInt2 := 16#0#;
      SPI2EN         : APB1ENR1_SPI2EN_Field := 16#0#;
      --  unspecified
      Reserved_15_20 : Interfaces.Bit_Types.UInt6 := 16#0#;
      I2C1EN         : APB1ENR1_I2C1EN_Field := 16#0#;
      --  unspecified
      Reserved_22_22 : Interfaces.Bit_Types.Bit := 16#0#;
      I2C3EN         : APB1ENR1_I2C3EN_Field := 16#0#;
      CRSEN          : APB1ENR1_CRSEN_Field := 16#0#;
      --  unspecified
      Reserved_25_25 : Interfaces.Bit_Types.Bit := 16#0#;
      USBEN          : APB1ENR1_USBEN_Field := 16#0#;
      --  unspecified
      Reserved_27_30 : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM1EN       : APB1ENR1_LPTIM1EN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1ENR1_Register use record
      TIM2EN         at 0 range 0 .. 0;
      Reserved_1_8   at 0 range 1 .. 8;
      LCDEN          at 0 range 9 .. 9;
      RTCAPBEN       at 0 range 10 .. 10;
      WWDGEN         at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      SPI2EN         at 0 range 14 .. 14;
      Reserved_15_20 at 0 range 15 .. 20;
      I2C1EN         at 0 range 21 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      I2C3EN         at 0 range 23 .. 23;
      CRSEN          at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      USBEN          at 0 range 26 .. 26;
      Reserved_27_30 at 0 range 27 .. 30;
      LPTIM1EN       at 0 range 31 .. 31;
   end record;

   subtype APB1ENR2_LPUART1EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1ENR2_LPTIM2EN_Field is Interfaces.Bit_Types.Bit;

   type APB1ENR2_Register is record
      LPUART1EN     : APB1ENR2_LPUART1EN_Field := 16#0#;
      --  unspecified
      Reserved_1_4  : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM2EN      : APB1ENR2_LPTIM2EN_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.Bit_Types.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1ENR2_Register use record
      LPUART1EN     at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2EN      at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype APB2ENR_TIM1EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2ENR_SPI1EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2ENR_USART1EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2ENR_TIM16EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2ENR_TIM17EN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2ENR_SAI1EN_Field is Interfaces.Bit_Types.Bit;

   type APB2ENR_Register is record
      --  unspecified
      Reserved_0_10  : Interfaces.Bit_Types.UInt11 := 16#0#;
      TIM1EN         : APB2ENR_TIM1EN_Field := 16#0#;
      SPI1EN         : APB2ENR_SPI1EN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.Bit_Types.Bit := 16#0#;
      USART1EN       : APB2ENR_USART1EN_Field := 16#0#;
      --  unspecified
      Reserved_15_16 : Interfaces.Bit_Types.UInt2 := 16#0#;
      TIM16EN        : APB2ENR_TIM16EN_Field := 16#0#;
      TIM17EN        : APB2ENR_TIM17EN_Field := 16#0#;
      --  unspecified
      Reserved_19_20 : Interfaces.Bit_Types.UInt2 := 16#0#;
      SAI1EN         : APB2ENR_SAI1EN_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2ENR_Register use record
      Reserved_0_10  at 0 range 0 .. 10;
      TIM1EN         at 0 range 11 .. 11;
      SPI1EN         at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1EN       at 0 range 14 .. 14;
      Reserved_15_16 at 0 range 15 .. 16;
      TIM16EN        at 0 range 17 .. 17;
      TIM17EN        at 0 range 18 .. 18;
      Reserved_19_20 at 0 range 19 .. 20;
      SAI1EN         at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype AHB1SMENR_DMA1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1SMENR_DMA2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1SMENR_DMAMUX1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1SMENR_SRAM1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1SMENR_CRCSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB1SMENR_TSCSMEN_Field is Interfaces.Bit_Types.Bit;

   type AHB1SMENR_Register is record
      DMA1SMEN       : AHB1SMENR_DMA1SMEN_Field := 16#0#;
      DMA2SMEN       : AHB1SMENR_DMA2SMEN_Field := 16#0#;
      DMAMUX1SMEN    : AHB1SMENR_DMAMUX1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_3_8   : Interfaces.Bit_Types.UInt6 := 16#0#;
      SRAM1SMEN      : AHB1SMENR_SRAM1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : Interfaces.Bit_Types.UInt2 := 16#0#;
      CRCSMEN        : AHB1SMENR_CRCSMEN_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : Interfaces.Bit_Types.UInt3 := 16#0#;
      TSCSMEN        : AHB1SMENR_TSCSMEN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB1SMENR_Register use record
      DMA1SMEN       at 0 range 0 .. 0;
      DMA2SMEN       at 0 range 1 .. 1;
      DMAMUX1SMEN    at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      SRAM1SMEN      at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      CRCSMEN        at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TSCSMEN        at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype AHB2SMENR_GPIOASMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2SMENR_GPIOBSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2SMENR_GPIOCSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2SMENR_GPIODSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2SMENR_GPIOESMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2SMENR_GPIOHSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2SMENR_ADCFSSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB2SMENR_AES1SMEN_Field is Interfaces.Bit_Types.Bit;

   type AHB2SMENR_Register is record
      GPIOASMEN      : AHB2SMENR_GPIOASMEN_Field := 16#0#;
      GPIOBSMEN      : AHB2SMENR_GPIOBSMEN_Field := 16#0#;
      GPIOCSMEN      : AHB2SMENR_GPIOCSMEN_Field := 16#0#;
      GPIODSMEN      : AHB2SMENR_GPIODSMEN_Field := 16#0#;
      GPIOESMEN      : AHB2SMENR_GPIOESMEN_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : Interfaces.Bit_Types.UInt2 := 16#0#;
      GPIOHSMEN      : AHB2SMENR_GPIOHSMEN_Field := 16#0#;
      --  unspecified
      Reserved_8_12  : Interfaces.Bit_Types.UInt5 := 16#0#;
      ADCFSSMEN      : AHB2SMENR_ADCFSSMEN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.Bit_Types.UInt2 := 16#0#;
      AES1SMEN       : AHB2SMENR_AES1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB2SMENR_Register use record
      GPIOASMEN      at 0 range 0 .. 0;
      GPIOBSMEN      at 0 range 1 .. 1;
      GPIOCSMEN      at 0 range 2 .. 2;
      GPIODSMEN      at 0 range 3 .. 3;
      GPIOESMEN      at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      GPIOHSMEN      at 0 range 7 .. 7;
      Reserved_8_12  at 0 range 8 .. 12;
      ADCFSSMEN      at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      AES1SMEN       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype AHB3SMENR_QUADSPISMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3SMENR_PKASMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3SMENR_AES2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3SMENR_RNGSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3SMENR_SRAM2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype AHB3SMENR_FLASHSMEN_Field is Interfaces.Bit_Types.Bit;

   type AHB3SMENR_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.Bit_Types.Byte := 16#0#;
      QUADSPISMEN    : AHB3SMENR_QUADSPISMEN_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : Interfaces.Bit_Types.UInt7 := 16#0#;
      PKASMEN        : AHB3SMENR_PKASMEN_Field := 16#0#;
      AES2SMEN       : AHB3SMENR_AES2SMEN_Field := 16#0#;
      RNGSMEN        : AHB3SMENR_RNGSMEN_Field := 16#0#;
      --  unspecified
      Reserved_19_23 : Interfaces.Bit_Types.UInt5 := 16#0#;
      SRAM2SMEN      : AHB3SMENR_SRAM2SMEN_Field := 16#0#;
      FLASHSMEN      : AHB3SMENR_FLASHSMEN_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.Bit_Types.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AHB3SMENR_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      QUADSPISMEN    at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      PKASMEN        at 0 range 16 .. 16;
      AES2SMEN       at 0 range 17 .. 17;
      RNGSMEN        at 0 range 18 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      SRAM2SMEN      at 0 range 24 .. 24;
      FLASHSMEN      at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype APB1SMENR1_TIM2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR1_LCDSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR1_RTCAPBSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR1_WWDGSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR1_SPI2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR1_I2C1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR1_I2C3SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR1_CRSSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR1_USBSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR1_LPTIM1SMEN_Field is Interfaces.Bit_Types.Bit;

   type APB1SMENR1_Register is record
      TIM2SMEN       : APB1SMENR1_TIM2SMEN_Field := 16#0#;
      --  unspecified
      Reserved_1_8   : Interfaces.Bit_Types.Byte := 16#0#;
      LCDSMEN        : APB1SMENR1_LCDSMEN_Field := 16#0#;
      RTCAPBSMEN     : APB1SMENR1_RTCAPBSMEN_Field := 16#0#;
      WWDGSMEN       : APB1SMENR1_WWDGSMEN_Field := 16#0#;
      --  unspecified
      Reserved_12_13 : Interfaces.Bit_Types.UInt2 := 16#0#;
      SPI2SMEN       : APB1SMENR1_SPI2SMEN_Field := 16#0#;
      --  unspecified
      Reserved_15_20 : Interfaces.Bit_Types.UInt6 := 16#0#;
      I2C1SMEN       : APB1SMENR1_I2C1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_22_22 : Interfaces.Bit_Types.Bit := 16#0#;
      I2C3SMEN       : APB1SMENR1_I2C3SMEN_Field := 16#0#;
      CRSSMEN        : APB1SMENR1_CRSSMEN_Field := 16#0#;
      --  unspecified
      Reserved_25_25 : Interfaces.Bit_Types.Bit := 16#0#;
      USBSMEN        : APB1SMENR1_USBSMEN_Field := 16#0#;
      --  unspecified
      Reserved_27_30 : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM1SMEN     : APB1SMENR1_LPTIM1SMEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1SMENR1_Register use record
      TIM2SMEN       at 0 range 0 .. 0;
      Reserved_1_8   at 0 range 1 .. 8;
      LCDSMEN        at 0 range 9 .. 9;
      RTCAPBSMEN     at 0 range 10 .. 10;
      WWDGSMEN       at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      SPI2SMEN       at 0 range 14 .. 14;
      Reserved_15_20 at 0 range 15 .. 20;
      I2C1SMEN       at 0 range 21 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      I2C3SMEN       at 0 range 23 .. 23;
      CRSSMEN        at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      USBSMEN        at 0 range 26 .. 26;
      Reserved_27_30 at 0 range 27 .. 30;
      LPTIM1SMEN     at 0 range 31 .. 31;
   end record;

   subtype APB1SMENR2_LPUART1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB1SMENR2_LPTIM2SMEN_Field is Interfaces.Bit_Types.Bit;

   type APB1SMENR2_Register is record
      LPUART1SMEN   : APB1SMENR2_LPUART1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_1_4  : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM2SMEN    : APB1SMENR2_LPTIM2SMEN_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.Bit_Types.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1SMENR2_Register use record
      LPUART1SMEN   at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2SMEN    at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype APB2SMENR_TIM1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2SMENR_SPI1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2SMENR_USART1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2SMENR_TIM16SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2SMENR_TIM17SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype APB2SMENR_SAI1SMEN_Field is Interfaces.Bit_Types.Bit;

   type APB2SMENR_Register is record
      --  unspecified
      Reserved_0_10  : Interfaces.Bit_Types.UInt11 := 16#0#;
      TIM1SMEN       : APB2SMENR_TIM1SMEN_Field := 16#0#;
      SPI1SMEN       : APB2SMENR_SPI1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.Bit_Types.Bit := 16#0#;
      USART1SMEN     : APB2SMENR_USART1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_15_16 : Interfaces.Bit_Types.UInt2 := 16#0#;
      TIM16SMEN      : APB2SMENR_TIM16SMEN_Field := 16#0#;
      TIM17SMEN      : APB2SMENR_TIM17SMEN_Field := 16#0#;
      --  unspecified
      Reserved_19_20 : Interfaces.Bit_Types.UInt2 := 16#0#;
      SAI1SMEN       : APB2SMENR_SAI1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2SMENR_Register use record
      Reserved_0_10  at 0 range 0 .. 10;
      TIM1SMEN       at 0 range 11 .. 11;
      SPI1SMEN       at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1SMEN     at 0 range 14 .. 14;
      Reserved_15_16 at 0 range 15 .. 16;
      TIM16SMEN      at 0 range 17 .. 17;
      TIM17SMEN      at 0 range 18 .. 18;
      Reserved_19_20 at 0 range 19 .. 20;
      SAI1SMEN       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype CCIPR_USART1SEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CCIPR_LPUART1SEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CCIPR_I2C1SEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CCIPR_I2C3SEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CCIPR_LPTIM1SEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CCIPR_LPTIM2SEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CCIPR_SAI1SEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CCIPR_CLK48SEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CCIPR_ADCSEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CCIPR_RNGSEL_Field is Interfaces.Bit_Types.UInt2;

   type CCIPR_Register is record
      USART1SEL      : CCIPR_USART1SEL_Field := 16#0#;
      --  unspecified
      Reserved_2_9   : Interfaces.Bit_Types.Byte := 16#0#;
      LPUART1SEL     : CCIPR_LPUART1SEL_Field := 16#0#;
      I2C1SEL        : CCIPR_I2C1SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.Bit_Types.UInt2 := 16#0#;
      I2C3SEL        : CCIPR_I2C3SEL_Field := 16#0#;
      LPTIM1SEL      : CCIPR_LPTIM1SEL_Field := 16#0#;
      LPTIM2SEL      : CCIPR_LPTIM2SEL_Field := 16#0#;
      SAI1SEL        : CCIPR_SAI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_24_25 : Interfaces.Bit_Types.UInt2 := 16#0#;
      CLK48SEL       : CCIPR_CLK48SEL_Field := 16#0#;
      ADCSEL         : CCIPR_ADCSEL_Field := 16#0#;
      RNGSEL         : CCIPR_RNGSEL_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCIPR_Register use record
      USART1SEL      at 0 range 0 .. 1;
      Reserved_2_9   at 0 range 2 .. 9;
      LPUART1SEL     at 0 range 10 .. 11;
      I2C1SEL        at 0 range 12 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      I2C3SEL        at 0 range 16 .. 17;
      LPTIM1SEL      at 0 range 18 .. 19;
      LPTIM2SEL      at 0 range 20 .. 21;
      SAI1SEL        at 0 range 22 .. 23;
      Reserved_24_25 at 0 range 24 .. 25;
      CLK48SEL       at 0 range 26 .. 27;
      ADCSEL         at 0 range 28 .. 29;
      RNGSEL         at 0 range 30 .. 31;
   end record;

   subtype BDCR_LSEON_Field is Interfaces.Bit_Types.Bit;
   subtype BDCR_LSERDY_Field is Interfaces.Bit_Types.Bit;
   subtype BDCR_LSEBYP_Field is Interfaces.Bit_Types.Bit;
   subtype BDCR_LSE_DRV_Field is Interfaces.Bit_Types.UInt2;
   subtype BDCR_LSECSSON_Field is Interfaces.Bit_Types.Bit;
   subtype BDCR_LSECSSD_Field is Interfaces.Bit_Types.Bit;
   subtype BDCR_RTC_SEL_Field is Interfaces.Bit_Types.UInt2;
   subtype BDCR_RTCEN_Field is Interfaces.Bit_Types.Bit;
   subtype BDCR_BDRST_Field is Interfaces.Bit_Types.Bit;
   subtype BDCR_LSCOEN_Field is Interfaces.Bit_Types.Bit;
   subtype BDCR_LSCOSEL_Field is Interfaces.Bit_Types.Bit;

   type BDCR_Register is record
      LSEON          : BDCR_LSEON_Field := 16#0#;
      LSERDY         : BDCR_LSERDY_Field := 16#0#;
      LSEBYP         : BDCR_LSEBYP_Field := 16#0#;
      LSE_DRV        : BDCR_LSE_DRV_Field := 16#0#;
      LSECSSON       : BDCR_LSECSSON_Field := 16#0#;
      LSECSSD        : BDCR_LSECSSD_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      RTC_SEL        : BDCR_RTC_SEL_Field := 16#0#;
      --  unspecified
      Reserved_10_14 : Interfaces.Bit_Types.UInt5 := 16#0#;
      RTCEN          : BDCR_RTCEN_Field := 16#0#;
      BDRST          : BDCR_BDRST_Field := 16#0#;
      --  unspecified
      Reserved_17_23 : Interfaces.Bit_Types.UInt7 := 16#0#;
      LSCOEN         : BDCR_LSCOEN_Field := 16#0#;
      LSCOSEL        : BDCR_LSCOSEL_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.Bit_Types.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BDCR_Register use record
      LSEON          at 0 range 0 .. 0;
      LSERDY         at 0 range 1 .. 1;
      LSEBYP         at 0 range 2 .. 2;
      LSE_DRV        at 0 range 3 .. 4;
      LSECSSON       at 0 range 5 .. 5;
      LSECSSD        at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      RTC_SEL        at 0 range 8 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      RTCEN          at 0 range 15 .. 15;
      BDRST          at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      LSCOEN         at 0 range 24 .. 24;
      LSCOSEL        at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype CSR_LSI1ON_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_LSI1RDY_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_LSI2ON_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_LSI2RDY_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_LSI2TRIM_Field is Interfaces.Bit_Types.UInt4;
   subtype CSR_RFWKPSEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CSR_RFRSTS_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_RMVF_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_OBLRSTF_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_PINRSTF_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_BORRSTF_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_SFTRSTF_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_IWDGRSTF_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_WWDGRSTF_Field is Interfaces.Bit_Types.Bit;
   subtype CSR_LPWRRSTF_Field is Interfaces.Bit_Types.Bit;

   type CSR_Register is record
      LSI1ON         : CSR_LSI1ON_Field := 16#0#;
      LSI1RDY        : CSR_LSI1RDY_Field := 16#0#;
      LSI2ON         : CSR_LSI2ON_Field := 16#0#;
      LSI2RDY        : CSR_LSI2RDY_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : Interfaces.Bit_Types.UInt4 := 16#0#;
      LSI2TRIM       : CSR_LSI2TRIM_Field := 16#0#;
      --  unspecified
      Reserved_12_13 : Interfaces.Bit_Types.UInt2 := 16#0#;
      RFWKPSEL       : CSR_RFWKPSEL_Field := 16#0#;
      RFRSTS         : CSR_RFRSTS_Field := 16#0#;
      --  unspecified
      Reserved_17_22 : Interfaces.Bit_Types.UInt6 := 16#0#;
      RMVF           : CSR_RMVF_Field := 16#0#;
      --  unspecified
      Reserved_24_24 : Interfaces.Bit_Types.Bit := 16#0#;
      OBLRSTF        : CSR_OBLRSTF_Field := 16#0#;
      PINRSTF        : CSR_PINRSTF_Field := 16#0#;
      BORRSTF        : CSR_BORRSTF_Field := 16#0#;
      SFTRSTF        : CSR_SFTRSTF_Field := 16#0#;
      IWDGRSTF       : CSR_IWDGRSTF_Field := 16#0#;
      WWDGRSTF       : CSR_WWDGRSTF_Field := 16#0#;
      LPWRRSTF       : CSR_LPWRRSTF_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CSR_Register use record
      LSI1ON         at 0 range 0 .. 0;
      LSI1RDY        at 0 range 1 .. 1;
      LSI2ON         at 0 range 2 .. 2;
      LSI2RDY        at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      LSI2TRIM       at 0 range 8 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      RFWKPSEL       at 0 range 14 .. 15;
      RFRSTS         at 0 range 16 .. 16;
      Reserved_17_22 at 0 range 17 .. 22;
      RMVF           at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      OBLRSTF        at 0 range 25 .. 25;
      PINRSTF        at 0 range 26 .. 26;
      BORRSTF        at 0 range 27 .. 27;
      SFTRSTF        at 0 range 28 .. 28;
      IWDGRSTF       at 0 range 29 .. 29;
      WWDGRSTF       at 0 range 30 .. 30;
      LPWRRSTF       at 0 range 31 .. 31;
   end record;

   subtype CRRCR_HSI48ON_Field is Interfaces.Bit_Types.Bit;
   subtype CRRCR_HSI48RDY_Field is Interfaces.Bit_Types.Bit;
   subtype CRRCR_HSI48CAL_Field is Interfaces.Bit_Types.UInt9;

   type CRRCR_Register is record
      HSI48ON        : CRRCR_HSI48ON_Field := 16#0#;
      HSI48RDY       : CRRCR_HSI48RDY_Field := 16#0#;
      --  unspecified
      Reserved_2_6   : Interfaces.Bit_Types.UInt5 := 16#0#;
      HSI48CAL       : CRRCR_HSI48CAL_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRRCR_Register use record
      HSI48ON        at 0 range 0 .. 0;
      HSI48RDY       at 0 range 1 .. 1;
      Reserved_2_6   at 0 range 2 .. 6;
      HSI48CAL       at 0 range 7 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype HSECR_UNLOCKED_Field is Interfaces.Bit_Types.Bit;
   subtype HSECR_HSES_Field is Interfaces.Bit_Types.Bit;
   subtype HSECR_HSEGMC_Field is Interfaces.Bit_Types.UInt3;
   subtype HSECR_HSETUNE_Field is Interfaces.Bit_Types.UInt6;

   type HSECR_Register is record
      UNLOCKED       : HSECR_UNLOCKED_Field := 16#0#;
      --  unspecified
      Reserved_1_2   : Interfaces.Bit_Types.UInt2 := 16#0#;
      HSES           : HSECR_HSES_Field := 16#0#;
      HSEGMC         : HSECR_HSEGMC_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      HSETUNE        : HSECR_HSETUNE_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : Interfaces.Bit_Types.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for HSECR_Register use record
      UNLOCKED       at 0 range 0 .. 0;
      Reserved_1_2   at 0 range 1 .. 2;
      HSES           at 0 range 3 .. 3;
      HSEGMC         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      HSETUNE        at 0 range 8 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype EXTCFGR_SHDHPRE_Field is Interfaces.Bit_Types.UInt4;
   subtype EXTCFGR_C2HPRE_Field is Interfaces.Bit_Types.UInt4;
   subtype EXTCFGR_SHDHPREF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTCFGR_C2HPREF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTCFGR_RFCSS_Field is Interfaces.Bit_Types.Bit;

   type EXTCFGR_Register is record
      SHDHPRE        : EXTCFGR_SHDHPRE_Field := 16#0#;
      C2HPRE         : EXTCFGR_C2HPRE_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : Interfaces.Bit_Types.Byte := 16#0#;
      SHDHPREF       : EXTCFGR_SHDHPREF_Field := 16#0#;
      C2HPREF        : EXTCFGR_C2HPREF_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : Interfaces.Bit_Types.UInt2 := 16#0#;
      RFCSS          : EXTCFGR_RFCSS_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : Interfaces.Bit_Types.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTCFGR_Register use record
      SHDHPRE        at 0 range 0 .. 3;
      C2HPRE         at 0 range 4 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      SHDHPREF       at 0 range 16 .. 16;
      C2HPREF        at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      RFCSS          at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype C2AHB1ENR_DMA1EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1ENR_DMA2EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1ENR_DMAMUX1EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1ENR_SRAM1EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1ENR_CRCEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1ENR_TSCEN_Field is Interfaces.Bit_Types.Bit;

   type C2AHB1ENR_Register is record
      DMA1EN         : C2AHB1ENR_DMA1EN_Field := 16#0#;
      DMA2EN         : C2AHB1ENR_DMA2EN_Field := 16#0#;
      DMAMUX1EN      : C2AHB1ENR_DMAMUX1EN_Field := 16#0#;
      --  unspecified
      Reserved_3_8   : Interfaces.Bit_Types.UInt6 := 16#0#;
      SRAM1EN        : C2AHB1ENR_SRAM1EN_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : Interfaces.Bit_Types.UInt2 := 16#0#;
      CRCEN          : C2AHB1ENR_CRCEN_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : Interfaces.Bit_Types.UInt3 := 16#0#;
      TSCEN          : C2AHB1ENR_TSCEN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2AHB1ENR_Register use record
      DMA1EN         at 0 range 0 .. 0;
      DMA2EN         at 0 range 1 .. 1;
      DMAMUX1EN      at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      SRAM1EN        at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      CRCEN          at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TSCEN          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype C2AHB2ENR_GPIOAEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2ENR_GPIOBEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2ENR_GPIOCEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2ENR_GPIODEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2ENR_GPIOEEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2ENR_GPIOHEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2ENR_ADCEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2ENR_AES1EN_Field is Interfaces.Bit_Types.Bit;

   type C2AHB2ENR_Register is record
      GPIOAEN        : C2AHB2ENR_GPIOAEN_Field := 16#0#;
      GPIOBEN        : C2AHB2ENR_GPIOBEN_Field := 16#0#;
      GPIOCEN        : C2AHB2ENR_GPIOCEN_Field := 16#0#;
      GPIODEN        : C2AHB2ENR_GPIODEN_Field := 16#0#;
      GPIOEEN        : C2AHB2ENR_GPIOEEN_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : Interfaces.Bit_Types.UInt2 := 16#0#;
      GPIOHEN        : C2AHB2ENR_GPIOHEN_Field := 16#0#;
      --  unspecified
      Reserved_8_12  : Interfaces.Bit_Types.UInt5 := 16#0#;
      ADCEN          : C2AHB2ENR_ADCEN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.Bit_Types.UInt2 := 16#0#;
      AES1EN         : C2AHB2ENR_AES1EN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2AHB2ENR_Register use record
      GPIOAEN        at 0 range 0 .. 0;
      GPIOBEN        at 0 range 1 .. 1;
      GPIOCEN        at 0 range 2 .. 2;
      GPIODEN        at 0 range 3 .. 3;
      GPIOEEN        at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      GPIOHEN        at 0 range 7 .. 7;
      Reserved_8_12  at 0 range 8 .. 12;
      ADCEN          at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      AES1EN         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype C2AHB3ENR_PKAEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB3ENR_AES2EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB3ENR_RNGEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB3ENR_HSEMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB3ENR_IPCCEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB3ENR_FLASHEN_Field is Interfaces.Bit_Types.Bit;

   type C2AHB3ENR_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.Bit_Types.Short := 16#0#;
      PKAEN          : C2AHB3ENR_PKAEN_Field := 16#0#;
      AES2EN         : C2AHB3ENR_AES2EN_Field := 16#0#;
      RNGEN          : C2AHB3ENR_RNGEN_Field := 16#0#;
      HSEMEN         : C2AHB3ENR_HSEMEN_Field := 16#0#;
      IPCCEN         : C2AHB3ENR_IPCCEN_Field := 16#0#;
      --  unspecified
      Reserved_21_24 : Interfaces.Bit_Types.UInt4 := 16#0#;
      FLASHEN        : C2AHB3ENR_FLASHEN_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.Bit_Types.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2AHB3ENR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      PKAEN          at 0 range 16 .. 16;
      AES2EN         at 0 range 17 .. 17;
      RNGEN          at 0 range 18 .. 18;
      HSEMEN         at 0 range 19 .. 19;
      IPCCEN         at 0 range 20 .. 20;
      Reserved_21_24 at 0 range 21 .. 24;
      FLASHEN        at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype C2APB1ENR1_TIM2EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB1ENR1_LCDEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB1ENR1_RTCAPBEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB1ENR1_SPI2EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB1ENR1_I2C1EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB1ENR1_I2C3EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB1ENR1_CRSEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB1ENR1_USBEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB1ENR1_LPTIM1EN_Field is Interfaces.Bit_Types.Bit;

   type C2APB1ENR1_Register is record
      TIM2EN         : C2APB1ENR1_TIM2EN_Field := 16#0#;
      --  unspecified
      Reserved_1_8   : Interfaces.Bit_Types.Byte := 16#0#;
      LCDEN          : C2APB1ENR1_LCDEN_Field := 16#0#;
      RTCAPBEN       : C2APB1ENR1_RTCAPBEN_Field := 16#0#;
      --  unspecified
      Reserved_11_13 : Interfaces.Bit_Types.UInt3 := 16#0#;
      SPI2EN         : C2APB1ENR1_SPI2EN_Field := 16#0#;
      --  unspecified
      Reserved_15_20 : Interfaces.Bit_Types.UInt6 := 16#0#;
      I2C1EN         : C2APB1ENR1_I2C1EN_Field := 16#0#;
      --  unspecified
      Reserved_22_22 : Interfaces.Bit_Types.Bit := 16#0#;
      I2C3EN         : C2APB1ENR1_I2C3EN_Field := 16#0#;
      CRSEN          : C2APB1ENR1_CRSEN_Field := 16#0#;
      --  unspecified
      Reserved_25_25 : Interfaces.Bit_Types.Bit := 16#0#;
      USBEN          : C2APB1ENR1_USBEN_Field := 16#0#;
      --  unspecified
      Reserved_27_30 : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM1EN       : C2APB1ENR1_LPTIM1EN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2APB1ENR1_Register use record
      TIM2EN         at 0 range 0 .. 0;
      Reserved_1_8   at 0 range 1 .. 8;
      LCDEN          at 0 range 9 .. 9;
      RTCAPBEN       at 0 range 10 .. 10;
      Reserved_11_13 at 0 range 11 .. 13;
      SPI2EN         at 0 range 14 .. 14;
      Reserved_15_20 at 0 range 15 .. 20;
      I2C1EN         at 0 range 21 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      I2C3EN         at 0 range 23 .. 23;
      CRSEN          at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      USBEN          at 0 range 26 .. 26;
      Reserved_27_30 at 0 range 27 .. 30;
      LPTIM1EN       at 0 range 31 .. 31;
   end record;

   subtype C2APB1ENR2_LPUART1EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB1ENR2_LPTIM2EN_Field is Interfaces.Bit_Types.Bit;

   type C2APB1ENR2_Register is record
      LPUART1EN     : C2APB1ENR2_LPUART1EN_Field := 16#0#;
      --  unspecified
      Reserved_1_4  : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM2EN      : C2APB1ENR2_LPTIM2EN_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.Bit_Types.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2APB1ENR2_Register use record
      LPUART1EN     at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2EN      at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype C2APB2ENR_TIM1EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB2ENR_SPI1EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB2ENR_USART1EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB2ENR_TIM16EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB2ENR_TIM17EN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB2ENR_SAI1EN_Field is Interfaces.Bit_Types.Bit;

   type C2APB2ENR_Register is record
      --  unspecified
      Reserved_0_10  : Interfaces.Bit_Types.UInt11 := 16#0#;
      TIM1EN         : C2APB2ENR_TIM1EN_Field := 16#0#;
      SPI1EN         : C2APB2ENR_SPI1EN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.Bit_Types.Bit := 16#0#;
      USART1EN       : C2APB2ENR_USART1EN_Field := 16#0#;
      --  unspecified
      Reserved_15_16 : Interfaces.Bit_Types.UInt2 := 16#0#;
      TIM16EN        : C2APB2ENR_TIM16EN_Field := 16#0#;
      TIM17EN        : C2APB2ENR_TIM17EN_Field := 16#0#;
      --  unspecified
      Reserved_19_20 : Interfaces.Bit_Types.UInt2 := 16#0#;
      SAI1EN         : C2APB2ENR_SAI1EN_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2APB2ENR_Register use record
      Reserved_0_10  at 0 range 0 .. 10;
      TIM1EN         at 0 range 11 .. 11;
      SPI1EN         at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1EN       at 0 range 14 .. 14;
      Reserved_15_16 at 0 range 15 .. 16;
      TIM16EN        at 0 range 17 .. 17;
      TIM17EN        at 0 range 18 .. 18;
      Reserved_19_20 at 0 range 19 .. 20;
      SAI1EN         at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype C2APB3ENR_BLEEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2APB3ENR_802EN_Field is Interfaces.Bit_Types.Bit;

   type C2APB3ENR_Register is record
      BLEEN                    : C2APB3ENR_BLEEN_Field := 16#0#;
      C2APB3ENR_Register_802EN : C2APB3ENR_802EN_Field := 16#0#;
      --  unspecified
      Reserved_2_31            : Interfaces.Bit_Types.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2APB3ENR_Register use record
      BLEEN                    at 0 range 0 .. 0;
      C2APB3ENR_Register_802EN at 0 range 1 .. 1;
      Reserved_2_31            at 0 range 2 .. 31;
   end record;

   subtype C2AHB1SMENR_DMA1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1SMENR_DMA2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1SMENR_DMAMUX1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1SMENR_SRAM1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1SMENR_CRCSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB1SMENR_TSCSMEN_Field is Interfaces.Bit_Types.Bit;

   type C2AHB1SMENR_Register is record
      DMA1SMEN       : C2AHB1SMENR_DMA1SMEN_Field := 16#0#;
      DMA2SMEN       : C2AHB1SMENR_DMA2SMEN_Field := 16#0#;
      DMAMUX1SMEN    : C2AHB1SMENR_DMAMUX1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_3_8   : Interfaces.Bit_Types.UInt6 := 16#0#;
      SRAM1SMEN      : C2AHB1SMENR_SRAM1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_10_11 : Interfaces.Bit_Types.UInt2 := 16#0#;
      CRCSMEN        : C2AHB1SMENR_CRCSMEN_Field := 16#0#;
      --  unspecified
      Reserved_13_15 : Interfaces.Bit_Types.UInt3 := 16#0#;
      TSCSMEN        : C2AHB1SMENR_TSCSMEN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2AHB1SMENR_Register use record
      DMA1SMEN       at 0 range 0 .. 0;
      DMA2SMEN       at 0 range 1 .. 1;
      DMAMUX1SMEN    at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      SRAM1SMEN      at 0 range 9 .. 9;
      Reserved_10_11 at 0 range 10 .. 11;
      CRCSMEN        at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      TSCSMEN        at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype C2AHB2SMENR_GPIOASMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2SMENR_GPIOBSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2SMENR_GPIOCSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2SMENR_GPIODSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2SMENR_GPIOESMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2SMENR_GPIOHSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2SMENR_ADCFSSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB2SMENR_AES1SMEN_Field is Interfaces.Bit_Types.Bit;

   type C2AHB2SMENR_Register is record
      GPIOASMEN      : C2AHB2SMENR_GPIOASMEN_Field := 16#0#;
      GPIOBSMEN      : C2AHB2SMENR_GPIOBSMEN_Field := 16#0#;
      GPIOCSMEN      : C2AHB2SMENR_GPIOCSMEN_Field := 16#0#;
      GPIODSMEN      : C2AHB2SMENR_GPIODSMEN_Field := 16#0#;
      GPIOESMEN      : C2AHB2SMENR_GPIOESMEN_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : Interfaces.Bit_Types.UInt2 := 16#0#;
      GPIOHSMEN      : C2AHB2SMENR_GPIOHSMEN_Field := 16#0#;
      --  unspecified
      Reserved_8_12  : Interfaces.Bit_Types.UInt5 := 16#0#;
      ADCFSSMEN      : C2AHB2SMENR_ADCFSSMEN_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : Interfaces.Bit_Types.UInt2 := 16#0#;
      AES1SMEN       : C2AHB2SMENR_AES1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2AHB2SMENR_Register use record
      GPIOASMEN      at 0 range 0 .. 0;
      GPIOBSMEN      at 0 range 1 .. 1;
      GPIOCSMEN      at 0 range 2 .. 2;
      GPIODSMEN      at 0 range 3 .. 3;
      GPIOESMEN      at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      GPIOHSMEN      at 0 range 7 .. 7;
      Reserved_8_12  at 0 range 8 .. 12;
      ADCFSSMEN      at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      AES1SMEN       at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype C2AHB3SMENR_PKASMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB3SMENR_AES2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB3SMENR_RNGSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB3SMENR_SRAM2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2AHB3SMENR_FLASHSMEN_Field is Interfaces.Bit_Types.Bit;

   type C2AHB3SMENR_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.Bit_Types.Short := 16#0#;
      PKASMEN        : C2AHB3SMENR_PKASMEN_Field := 16#0#;
      AES2SMEN       : C2AHB3SMENR_AES2SMEN_Field := 16#0#;
      RNGSMEN        : C2AHB3SMENR_RNGSMEN_Field := 16#0#;
      --  unspecified
      Reserved_19_23 : Interfaces.Bit_Types.UInt5 := 16#0#;
      SRAM2SMEN      : C2AHB3SMENR_SRAM2SMEN_Field := 16#0#;
      FLASHSMEN      : C2AHB3SMENR_FLASHSMEN_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.Bit_Types.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2AHB3SMENR_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      PKASMEN        at 0 range 16 .. 16;
      AES2SMEN       at 0 range 17 .. 17;
      RNGSMEN        at 0 range 18 .. 18;
      Reserved_19_23 at 0 range 19 .. 23;
      SRAM2SMEN      at 0 range 24 .. 24;
      FLASHSMEN      at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype C2_APB1SMENR1_TIM2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB1SMENR1_LCDSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB1SMENR1_RTCAPBSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB1SMENR1_SPI2SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB1SMENR1_I2C1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB1SMENR1_I2C3SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB1SMENR1_CRSSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB1SMENR1_USBSMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB1SMENR1_LPTIM1SMEN_Field is Interfaces.Bit_Types.Bit;

   type C2_APB1SMENR1_Register is record
      TIM2SMEN       : C2_APB1SMENR1_TIM2SMEN_Field := 16#0#;
      --  unspecified
      Reserved_1_8   : Interfaces.Bit_Types.Byte := 16#0#;
      LCDSMEN        : C2_APB1SMENR1_LCDSMEN_Field := 16#0#;
      RTCAPBSMEN     : C2_APB1SMENR1_RTCAPBSMEN_Field := 16#0#;
      --  unspecified
      Reserved_11_13 : Interfaces.Bit_Types.UInt3 := 16#0#;
      SPI2SMEN       : C2_APB1SMENR1_SPI2SMEN_Field := 16#0#;
      --  unspecified
      Reserved_15_20 : Interfaces.Bit_Types.UInt6 := 16#0#;
      I2C1SMEN       : C2_APB1SMENR1_I2C1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_22_22 : Interfaces.Bit_Types.Bit := 16#0#;
      I2C3SMEN       : C2_APB1SMENR1_I2C3SMEN_Field := 16#0#;
      CRSSMEN        : C2_APB1SMENR1_CRSSMEN_Field := 16#0#;
      --  unspecified
      Reserved_25_25 : Interfaces.Bit_Types.Bit := 16#0#;
      USBSMEN        : C2_APB1SMENR1_USBSMEN_Field := 16#0#;
      --  unspecified
      Reserved_27_30 : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM1SMEN     : C2_APB1SMENR1_LPTIM1SMEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2_APB1SMENR1_Register use record
      TIM2SMEN       at 0 range 0 .. 0;
      Reserved_1_8   at 0 range 1 .. 8;
      LCDSMEN        at 0 range 9 .. 9;
      RTCAPBSMEN     at 0 range 10 .. 10;
      Reserved_11_13 at 0 range 11 .. 13;
      SPI2SMEN       at 0 range 14 .. 14;
      Reserved_15_20 at 0 range 15 .. 20;
      I2C1SMEN       at 0 range 21 .. 21;
      Reserved_22_22 at 0 range 22 .. 22;
      I2C3SMEN       at 0 range 23 .. 23;
      CRSSMEN        at 0 range 24 .. 24;
      Reserved_25_25 at 0 range 25 .. 25;
      USBSMEN        at 0 range 26 .. 26;
      Reserved_27_30 at 0 range 27 .. 30;
      LPTIM1SMEN     at 0 range 31 .. 31;
   end record;

   subtype C2_APB1SMENR2_LPUART1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB1SMENR2_LPTIM2SMEN_Field is Interfaces.Bit_Types.Bit;

   type C2_APB1SMENR2_Register is record
      LPUART1SMEN   : C2_APB1SMENR2_LPUART1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_1_4  : Interfaces.Bit_Types.UInt4 := 16#0#;
      LPTIM2SMEN    : C2_APB1SMENR2_LPTIM2SMEN_Field := 16#0#;
      --  unspecified
      Reserved_6_31 : Interfaces.Bit_Types.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2_APB1SMENR2_Register use record
      LPUART1SMEN   at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2SMEN    at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype C2_APB2SMENR_TIM1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB2SMENR_SPI1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB2SMENR_USART1SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB2SMENR_TIM16SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB2SMENR_TIM17SMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB2SMENR_SAI1SMEN_Field is Interfaces.Bit_Types.Bit;

   type C2_APB2SMENR_Register is record
      --  unspecified
      Reserved_0_10  : Interfaces.Bit_Types.UInt11 := 16#0#;
      TIM1SMEN       : C2_APB2SMENR_TIM1SMEN_Field := 16#0#;
      SPI1SMEN       : C2_APB2SMENR_SPI1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.Bit_Types.Bit := 16#0#;
      USART1SMEN     : C2_APB2SMENR_USART1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_15_16 : Interfaces.Bit_Types.UInt2 := 16#0#;
      TIM16SMEN      : C2_APB2SMENR_TIM16SMEN_Field := 16#0#;
      TIM17SMEN      : C2_APB2SMENR_TIM17SMEN_Field := 16#0#;
      --  unspecified
      Reserved_19_20 : Interfaces.Bit_Types.UInt2 := 16#0#;
      SAI1SMEN       : C2_APB2SMENR_SAI1SMEN_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2_APB2SMENR_Register use record
      Reserved_0_10  at 0 range 0 .. 10;
      TIM1SMEN       at 0 range 11 .. 11;
      SPI1SMEN       at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      USART1SMEN     at 0 range 14 .. 14;
      Reserved_15_16 at 0 range 15 .. 16;
      TIM16SMEN      at 0 range 17 .. 17;
      TIM17SMEN      at 0 range 18 .. 18;
      Reserved_19_20 at 0 range 19 .. 20;
      SAI1SMEN       at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype C2_APB3SMENR_BLESMEN_Field is Interfaces.Bit_Types.Bit;
   subtype C2_APB3SMENR_802SMEN_Field is Interfaces.Bit_Types.Bit;

   type C2_APB3SMENR_Register is record
      BLESMEN                       : C2_APB3SMENR_BLESMEN_Field := 16#0#;
      C2_APB3SMENR_Register_802SMEN : C2_APB3SMENR_802SMEN_Field := 16#0#;
      --  unspecified
      Reserved_2_31                 : Interfaces.Bit_Types.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2_APB3SMENR_Register use record
      BLESMEN                       at 0 range 0 .. 0;
      C2_APB3SMENR_Register_802SMEN at 0 range 1 .. 1;
      Reserved_2_31                 at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type RCC_Peripheral is record
      CR            : aliased CR_Register;
      ICSCR         : aliased ICSCR_Register;
      CFGR          : aliased CFGR_Register;
      PLLCFGR       : aliased PLLCFGR_Register;
      PLL_SAI1CFGR  : aliased PLL_SAI1CFGR_Register;
      CIER          : aliased CIER_Register;
      CIFR          : aliased CIFR_Register;
      CICR          : aliased CICR_Register;
      SMPSCR        : aliased SMPSCR_Register;
      AHB1RSTR      : aliased AHB1RSTR_Register;
      AHB2RSTR      : aliased AHB2RSTR_Register;
      AHB3RSTR      : aliased AHB3RSTR_Register;
      APB1RSTR1     : aliased APB1RSTR1_Register;
      APB1RSTR2     : aliased APB1RSTR2_Register;
      APB2RSTR      : aliased APB2RSTR_Register;
      APB3RSTR      : aliased APB3RSTR_Register;
      AHB1ENR       : aliased AHB1ENR_Register;
      AHB2ENR       : aliased AHB2ENR_Register;
      AHB3ENR       : aliased AHB3ENR_Register;
      APB1ENR1      : aliased APB1ENR1_Register;
      APB1ENR2      : aliased APB1ENR2_Register;
      APB2ENR       : aliased APB2ENR_Register;
      AHB1SMENR     : aliased AHB1SMENR_Register;
      AHB2SMENR     : aliased AHB2SMENR_Register;
      AHB3SMENR     : aliased AHB3SMENR_Register;
      APB1SMENR1    : aliased APB1SMENR1_Register;
      APB1SMENR2    : aliased APB1SMENR2_Register;
      APB2SMENR     : aliased APB2SMENR_Register;
      CCIPR         : aliased CCIPR_Register;
      BDCR          : aliased BDCR_Register;
      CSR           : aliased CSR_Register;
      CRRCR         : aliased CRRCR_Register;
      HSECR         : aliased HSECR_Register;
      EXTCFGR       : aliased EXTCFGR_Register;
      C2AHB1ENR     : aliased C2AHB1ENR_Register;
      C2AHB2ENR     : aliased C2AHB2ENR_Register;
      C2AHB3ENR     : aliased C2AHB3ENR_Register;
      C2APB1ENR1    : aliased C2APB1ENR1_Register;
      C2APB1ENR2    : aliased C2APB1ENR2_Register;
      C2APB2ENR     : aliased C2APB2ENR_Register;
      C2APB3ENR     : aliased C2APB3ENR_Register;
      C2AHB1SMENR   : aliased C2AHB1SMENR_Register;
      C2AHB2SMENR   : aliased C2AHB2SMENR_Register;
      C2AHB3SMENR   : aliased C2AHB3SMENR_Register;
      C2_APB1SMENR1 : aliased C2_APB1SMENR1_Register;
      C2_APB1SMENR2 : aliased C2_APB1SMENR2_Register;
      C2_APB2SMENR  : aliased C2_APB2SMENR_Register;
      C2_APB3SMENR  : aliased C2_APB3SMENR_Register;
   end record
     with Volatile;

   for RCC_Peripheral use record
      CR            at 16#0# range 0 .. 31;
      ICSCR         at 16#4# range 0 .. 31;
      CFGR          at 16#8# range 0 .. 31;
      PLLCFGR       at 16#C# range 0 .. 31;
      PLL_SAI1CFGR  at 16#10# range 0 .. 31;
      CIER          at 16#18# range 0 .. 31;
      CIFR          at 16#1C# range 0 .. 31;
      CICR          at 16#20# range 0 .. 31;
      SMPSCR        at 16#24# range 0 .. 31;
      AHB1RSTR      at 16#28# range 0 .. 31;
      AHB2RSTR      at 16#2C# range 0 .. 31;
      AHB3RSTR      at 16#30# range 0 .. 31;
      APB1RSTR1     at 16#38# range 0 .. 31;
      APB1RSTR2     at 16#3C# range 0 .. 31;
      APB2RSTR      at 16#40# range 0 .. 31;
      APB3RSTR      at 16#44# range 0 .. 31;
      AHB1ENR       at 16#48# range 0 .. 31;
      AHB2ENR       at 16#4C# range 0 .. 31;
      AHB3ENR       at 16#50# range 0 .. 31;
      APB1ENR1      at 16#58# range 0 .. 31;
      APB1ENR2      at 16#5C# range 0 .. 31;
      APB2ENR       at 16#60# range 0 .. 31;
      AHB1SMENR     at 16#68# range 0 .. 31;
      AHB2SMENR     at 16#6C# range 0 .. 31;
      AHB3SMENR     at 16#70# range 0 .. 31;
      APB1SMENR1    at 16#78# range 0 .. 31;
      APB1SMENR2    at 16#7C# range 0 .. 31;
      APB2SMENR     at 16#80# range 0 .. 31;
      CCIPR         at 16#88# range 0 .. 31;
      BDCR          at 16#90# range 0 .. 31;
      CSR           at 16#94# range 0 .. 31;
      CRRCR         at 16#98# range 0 .. 31;
      HSECR         at 16#9C# range 0 .. 31;
      EXTCFGR       at 16#108# range 0 .. 31;
      C2AHB1ENR     at 16#148# range 0 .. 31;
      C2AHB2ENR     at 16#14C# range 0 .. 31;
      C2AHB3ENR     at 16#150# range 0 .. 31;
      C2APB1ENR1    at 16#158# range 0 .. 31;
      C2APB1ENR2    at 16#15C# range 0 .. 31;
      C2APB2ENR     at 16#160# range 0 .. 31;
      C2APB3ENR     at 16#164# range 0 .. 31;
      C2AHB1SMENR   at 16#168# range 0 .. 31;
      C2AHB2SMENR   at 16#16C# range 0 .. 31;
      C2AHB3SMENR   at 16#170# range 0 .. 31;
      C2_APB1SMENR1 at 16#178# range 0 .. 31;
      C2_APB1SMENR2 at 16#17C# range 0 .. 31;
      C2_APB2SMENR  at 16#180# range 0 .. 31;
      C2_APB3SMENR  at 16#184# range 0 .. 31;
   end record;

   RCC_Periph : aliased RCC_Peripheral
     with Import, Address => System'To_Address (16#58000000#);

end Interfaces.STM32.RCC;
