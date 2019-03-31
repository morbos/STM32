--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.RCC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_MSIRANGE_Field is HAL.UInt4;

   type CR_Register is record
      MSION          : Boolean := False;
      MSIRDY         : Boolean := False;
      MSIPLLEN       : Boolean := False;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      MSIRANGE       : CR_MSIRANGE_Field := 16#0#;
      HSION          : Boolean := False;
      HSIKERON       : Boolean := False;
      HSIRDY         : Boolean := False;
      HSIASFS        : Boolean := False;
      HSIKERDY       : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      HSEON          : Boolean := False;
      HSERDY         : Boolean := False;
      HSEBYP         : Boolean := False;
      CSSON          : Boolean := False;
      HSEPRE         : Boolean := False;
      --  unspecified
      Reserved_21_23 : HAL.UInt3 := 16#0#;
      PLLON          : Boolean := False;
      PLLRDY         : Boolean := False;
      PLLSAI1ON      : Boolean := False;
      PLLSAI1RDY     : Boolean := False;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
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

   subtype ICSCR_MSICAL_Field is HAL.UInt8;
   subtype ICSCR_MSITRIM_Field is HAL.UInt8;
   subtype ICSCR_HSICAL_Field is HAL.UInt8;
   subtype ICSCR_HSITRIM_Field is HAL.UInt7;

   type ICSCR_Register is record
      MSICAL         : ICSCR_MSICAL_Field := 16#0#;
      MSITRIM        : ICSCR_MSITRIM_Field := 16#0#;
      HSICAL         : ICSCR_HSICAL_Field := 16#0#;
      HSITRIM        : ICSCR_HSITRIM_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
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

   subtype CFGR_SW_Field is HAL.UInt2;
   subtype CFGR_SWS_Field is HAL.UInt2;
   subtype CFGR_HPRE_Field is HAL.UInt4;
   --  CFGR_PPRE array element
   subtype CFGR_PPRE_Element is HAL.UInt3;

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
            Val : HAL.UInt6;
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

   subtype CFGR_MCOSEL_Field is HAL.UInt4;
   subtype CFGR_MCOPRE_Field is HAL.UInt3;

   type CFGR_Register is record
      SW             : CFGR_SW_Field := 16#0#;
      SWS            : CFGR_SWS_Field := 16#0#;
      HPRE           : CFGR_HPRE_Field := 16#0#;
      PPRE           : CFGR_PPRE_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      STOPWUCK       : Boolean := False;
      HPREF          : Boolean := False;
      PPRE1F         : Boolean := False;
      PPRE2F         : Boolean := False;
      --  unspecified
      Reserved_19_23 : HAL.UInt5 := 16#0#;
      MCOSEL         : CFGR_MCOSEL_Field := 16#0#;
      MCOPRE         : CFGR_MCOPRE_Field := 16#0#;
      --  unspecified
      Reserved_31_31 : HAL.Bit := 16#0#;
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

   subtype PLLCFGR_PLLSRC_Field is HAL.UInt2;
   subtype PLLCFGR_PLLM_Field is HAL.UInt3;
   subtype PLLCFGR_PLLN_Field is HAL.UInt7;
   subtype PLLCFGR_PLLP_Field is HAL.UInt5;
   subtype PLLCFGR_PLLQ_Field is HAL.UInt3;
   subtype PLLCFGR_PLLR_Field is HAL.UInt3;

   type PLLCFGR_Register is record
      PLLSRC         : PLLCFGR_PLLSRC_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      PLLM           : PLLCFGR_PLLM_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      PLLN           : PLLCFGR_PLLN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      PLLPEN         : Boolean := False;
      PLLP           : PLLCFGR_PLLP_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      PLLQEN         : Boolean := False;
      PLLQ           : PLLCFGR_PLLQ_Field := 16#0#;
      PLLREN         : Boolean := False;
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

   subtype PLL_SAI1CFGR_PLLN_Field is HAL.UInt7;
   subtype PLL_SAI1CFGR_PLLP_Field is HAL.UInt5;
   subtype PLL_SAI1CFGR_PLLQ_Field is HAL.UInt3;
   subtype PLL_SAI1CFGR_PLLR_Field is HAL.UInt3;

   type PLL_SAI1CFGR_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8 := 16#0#;
      PLLN           : PLL_SAI1CFGR_PLLN_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      PLLPEN         : Boolean := False;
      PLLP           : PLL_SAI1CFGR_PLLP_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : HAL.UInt2 := 16#0#;
      PLLQEN         : Boolean := False;
      PLLQ           : PLL_SAI1CFGR_PLLQ_Field := 16#0#;
      PLLREN         : Boolean := False;
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

   type CIER_Register is record
      LSI1RDYIE      : Boolean := False;
      LSERDYIE       : Boolean := False;
      MSIRDYIE       : Boolean := False;
      HSIRDYIE       : Boolean := False;
      HSERDYIE       : Boolean := False;
      PLLRDYIE       : Boolean := False;
      PLLSAI1RDYIE   : Boolean := False;
      --  unspecified
      Reserved_7_8   : HAL.UInt2 := 16#0#;
      LSECSSIE       : Boolean := False;
      HSI48RDYIE     : Boolean := False;
      LSI2RDYIE      : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
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

   type CIFR_Register is record
      LSI1RDYF       : Boolean := False;
      LSERDYF        : Boolean := False;
      MSIRDYF        : Boolean := False;
      HSIRDYF        : Boolean := False;
      HSERDYF        : Boolean := False;
      PLLRDYF        : Boolean := False;
      PLLSAI1RDYF    : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      CSSF           : Boolean := False;
      LSECSSF        : Boolean := False;
      HSI48RDYF      : Boolean := False;
      LSI2RDYF       : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
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

   type CICR_Register is record
      LSI1RDYC       : Boolean := False;
      LSERDYC        : Boolean := False;
      MSIRDYC        : Boolean := False;
      HSIRDYC        : Boolean := False;
      HSERDYC        : Boolean := False;
      PLLRDYC        : Boolean := False;
      PLLSAI1RDYC    : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      CSSC           : Boolean := False;
      LSECSSC        : Boolean := False;
      HSI48RDYC      : Boolean := False;
      LSI2RDYC       : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
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

   subtype SMPSCR_SMPSSEL_Field is HAL.UInt2;
   subtype SMPSCR_SMPSDIV_Field is HAL.UInt2;
   subtype SMPSCR_SMPSSWS_Field is HAL.UInt2;

   type SMPSCR_Register is record
      SMPSSEL        : SMPSCR_SMPSSEL_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      SMPSDIV        : SMPSCR_SMPSDIV_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      SMPSSWS        : SMPSCR_SMPSSWS_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
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

   type AHB1RSTR_Register is record
      DMA1RST        : Boolean := False;
      DMA2RST        : Boolean := False;
      DMAMUX1RST     : Boolean := False;
      --  unspecified
      Reserved_3_11  : HAL.UInt9 := 16#0#;
      CRCRST         : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      TSCRST         : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type AHB2RSTR_Register is record
      GPIOARST       : Boolean := False;
      GPIOBRST       : Boolean := False;
      GPIOCRST       : Boolean := False;
      GPIODRST       : Boolean := False;
      GPIOERST       : Boolean := False;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      GPIOHRST       : Boolean := False;
      --  unspecified
      Reserved_8_12  : HAL.UInt5 := 16#0#;
      ADCRST         : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      AES1RST        : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type AHB3RSTR_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8 := 16#0#;
      QUADSPIRST     : Boolean := False;
      --  unspecified
      Reserved_9_15  : HAL.UInt7 := 16#0#;
      PKARST         : Boolean := False;
      AES2RST        : Boolean := False;
      RNGRST         : Boolean := False;
      HSEMRST        : Boolean := False;
      IPCCRST        : Boolean := False;
      --  unspecified
      Reserved_21_24 : HAL.UInt4 := 16#0#;
      FLASHRST       : Boolean := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
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

   type APB1RSTR1_Register is record
      TIM2RST        : Boolean := False;
      --  unspecified
      Reserved_1_8   : HAL.UInt8 := 16#0#;
      LCDRST         : Boolean := False;
      --  unspecified
      Reserved_10_13 : HAL.UInt4 := 16#0#;
      SPI2RST        : Boolean := False;
      --  unspecified
      Reserved_15_20 : HAL.UInt6 := 16#0#;
      I2C1RST        : Boolean := False;
      --  unspecified
      Reserved_22_22 : HAL.Bit := 16#0#;
      I2C3RST        : Boolean := False;
      CRSRST         : Boolean := False;
      --  unspecified
      Reserved_25_25 : HAL.Bit := 16#0#;
      USBRST         : Boolean := False;
      --  unspecified
      Reserved_27_30 : HAL.UInt4 := 16#0#;
      LPTIM1RST      : Boolean := False;
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

   type APB1RSTR2_Register is record
      LPUART1RST    : Boolean := False;
      --  unspecified
      Reserved_1_4  : HAL.UInt4 := 16#0#;
      LPTIM2RST     : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1RSTR2_Register use record
      LPUART1RST    at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2RST     at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   type APB2RSTR_Register is record
      --  unspecified
      Reserved_0_10  : HAL.UInt11 := 16#0#;
      TIM1RST        : Boolean := False;
      SPI1RST        : Boolean := False;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      USART1RST      : Boolean := False;
      --  unspecified
      Reserved_15_16 : HAL.UInt2 := 16#0#;
      TIM16RST       : Boolean := False;
      TIM17RST       : Boolean := False;
      --  unspecified
      Reserved_19_20 : HAL.UInt2 := 16#0#;
      SAI1RST        : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
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

   type APB3RSTR_Register is record
      RFRST         : Boolean := False;
      --  unspecified
      Reserved_1_31 : HAL.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB3RSTR_Register use record
      RFRST         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   type AHB1ENR_Register is record
      DMA1EN         : Boolean := False;
      DMA2EN         : Boolean := False;
      DMAMUX1EN      : Boolean := False;
      --  unspecified
      Reserved_3_11  : HAL.UInt9 := 16#0#;
      CRCEN          : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      TSCEN          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type AHB2ENR_Register is record
      GPIOAEN        : Boolean := False;
      GPIOBEN        : Boolean := False;
      GPIOCEN        : Boolean := False;
      GPIODEN        : Boolean := False;
      GPIOEEN        : Boolean := False;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      GPIOHEN        : Boolean := False;
      --  unspecified
      Reserved_8_12  : HAL.UInt5 := 16#0#;
      ADCEN          : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      AES1EN         : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type AHB3ENR_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8 := 16#0#;
      QUADSPIEN      : Boolean := False;
      --  unspecified
      Reserved_9_15  : HAL.UInt7 := 16#0#;
      PKAEN          : Boolean := False;
      AES2EN         : Boolean := False;
      RNGEN          : Boolean := False;
      HSEMEN         : Boolean := False;
      IPCCEN         : Boolean := False;
      --  unspecified
      Reserved_21_24 : HAL.UInt4 := 16#0#;
      FLASHEN        : Boolean := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
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

   type APB1ENR1_Register is record
      TIM2EN         : Boolean := False;
      --  unspecified
      Reserved_1_8   : HAL.UInt8 := 16#0#;
      LCDEN          : Boolean := False;
      RTCAPBEN       : Boolean := False;
      WWDGEN         : Boolean := False;
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      SPI2EN         : Boolean := False;
      --  unspecified
      Reserved_15_20 : HAL.UInt6 := 16#0#;
      I2C1EN         : Boolean := False;
      --  unspecified
      Reserved_22_22 : HAL.Bit := 16#0#;
      I2C3EN         : Boolean := False;
      CRSEN          : Boolean := False;
      --  unspecified
      Reserved_25_25 : HAL.Bit := 16#0#;
      USBEN          : Boolean := False;
      --  unspecified
      Reserved_27_30 : HAL.UInt4 := 16#0#;
      LPTIM1EN       : Boolean := False;
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

   type APB1ENR2_Register is record
      LPUART1EN     : Boolean := False;
      --  unspecified
      Reserved_1_4  : HAL.UInt4 := 16#0#;
      LPTIM2EN      : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1ENR2_Register use record
      LPUART1EN     at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2EN      at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   type APB2ENR_Register is record
      --  unspecified
      Reserved_0_10  : HAL.UInt11 := 16#0#;
      TIM1EN         : Boolean := False;
      SPI1EN         : Boolean := False;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      USART1EN       : Boolean := False;
      --  unspecified
      Reserved_15_16 : HAL.UInt2 := 16#0#;
      TIM16EN        : Boolean := False;
      TIM17EN        : Boolean := False;
      --  unspecified
      Reserved_19_20 : HAL.UInt2 := 16#0#;
      SAI1EN         : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
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

   type AHB1SMENR_Register is record
      DMA1SMEN       : Boolean := False;
      DMA2SMEN       : Boolean := False;
      DMAMUX1SMEN    : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      SRAM1SMEN      : Boolean := False;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      CRCSMEN        : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      TSCSMEN        : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type AHB2SMENR_Register is record
      GPIOASMEN      : Boolean := False;
      GPIOBSMEN      : Boolean := False;
      GPIOCSMEN      : Boolean := False;
      GPIODSMEN      : Boolean := False;
      GPIOESMEN      : Boolean := False;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      GPIOHSMEN      : Boolean := False;
      --  unspecified
      Reserved_8_12  : HAL.UInt5 := 16#0#;
      ADCFSSMEN      : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      AES1SMEN       : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type AHB3SMENR_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8 := 16#0#;
      QUADSPISMEN    : Boolean := False;
      --  unspecified
      Reserved_9_15  : HAL.UInt7 := 16#0#;
      PKASMEN        : Boolean := False;
      AES2SMEN       : Boolean := False;
      RNGSMEN        : Boolean := False;
      --  unspecified
      Reserved_19_23 : HAL.UInt5 := 16#0#;
      SRAM2SMEN      : Boolean := False;
      FLASHSMEN      : Boolean := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
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

   type APB1SMENR1_Register is record
      TIM2SMEN       : Boolean := False;
      --  unspecified
      Reserved_1_8   : HAL.UInt8 := 16#0#;
      LCDSMEN        : Boolean := False;
      RTCAPBSMEN     : Boolean := False;
      WWDGSMEN       : Boolean := False;
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      SPI2SMEN       : Boolean := False;
      --  unspecified
      Reserved_15_20 : HAL.UInt6 := 16#0#;
      I2C1SMEN       : Boolean := False;
      --  unspecified
      Reserved_22_22 : HAL.Bit := 16#0#;
      I2C3SMEN       : Boolean := False;
      CRSSMEN        : Boolean := False;
      --  unspecified
      Reserved_25_25 : HAL.Bit := 16#0#;
      USBSMEN        : Boolean := False;
      --  unspecified
      Reserved_27_30 : HAL.UInt4 := 16#0#;
      LPTIM1SMEN     : Boolean := False;
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

   type APB1SMENR2_Register is record
      LPUART1SMEN   : Boolean := False;
      --  unspecified
      Reserved_1_4  : HAL.UInt4 := 16#0#;
      LPTIM2SMEN    : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1SMENR2_Register use record
      LPUART1SMEN   at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2SMEN    at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   type APB2SMENR_Register is record
      --  unspecified
      Reserved_0_10  : HAL.UInt11 := 16#0#;
      TIM1SMEN       : Boolean := False;
      SPI1SMEN       : Boolean := False;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      USART1SMEN     : Boolean := False;
      --  unspecified
      Reserved_15_16 : HAL.UInt2 := 16#0#;
      TIM16SMEN      : Boolean := False;
      TIM17SMEN      : Boolean := False;
      --  unspecified
      Reserved_19_20 : HAL.UInt2 := 16#0#;
      SAI1SMEN       : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
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

   subtype CCIPR_USART1SEL_Field is HAL.UInt2;
   subtype CCIPR_LPUART1SEL_Field is HAL.UInt2;
   subtype CCIPR_I2C1SEL_Field is HAL.UInt2;
   subtype CCIPR_I2C3SEL_Field is HAL.UInt2;
   subtype CCIPR_LPTIM1SEL_Field is HAL.UInt2;
   subtype CCIPR_LPTIM2SEL_Field is HAL.UInt2;
   subtype CCIPR_SAI1SEL_Field is HAL.UInt2;
   subtype CCIPR_CLK48SEL_Field is HAL.UInt2;
   subtype CCIPR_ADCSEL_Field is HAL.UInt2;
   subtype CCIPR_RNGSEL_Field is HAL.UInt2;

   type CCIPR_Register is record
      USART1SEL      : CCIPR_USART1SEL_Field := 16#0#;
      --  unspecified
      Reserved_2_9   : HAL.UInt8 := 16#0#;
      LPUART1SEL     : CCIPR_LPUART1SEL_Field := 16#0#;
      I2C1SEL        : CCIPR_I2C1SEL_Field := 16#0#;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      I2C3SEL        : CCIPR_I2C3SEL_Field := 16#0#;
      LPTIM1SEL      : CCIPR_LPTIM1SEL_Field := 16#0#;
      LPTIM2SEL      : CCIPR_LPTIM2SEL_Field := 16#0#;
      SAI1SEL        : CCIPR_SAI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_24_25 : HAL.UInt2 := 16#0#;
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

   subtype BDCR_LSE_DRV_Field is HAL.UInt2;
   subtype BDCR_RTC_SEL_Field is HAL.UInt2;

   type BDCR_Register is record
      LSEON          : Boolean := False;
      LSERDY         : Boolean := False;
      LSEBYP         : Boolean := False;
      LSE_DRV        : BDCR_LSE_DRV_Field := 16#0#;
      LSECSSON       : Boolean := False;
      LSECSSD        : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      RTC_SEL        : BDCR_RTC_SEL_Field := 16#0#;
      --  unspecified
      Reserved_10_14 : HAL.UInt5 := 16#0#;
      RTCEN          : Boolean := False;
      BDRST          : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      LSCOEN         : Boolean := False;
      LSCOSEL        : Boolean := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
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

   subtype CSR_LSI2TRIM_Field is HAL.UInt4;
   subtype CSR_RFWKPSEL_Field is HAL.UInt2;

   type CSR_Register is record
      LSI1ON         : Boolean := False;
      LSI1RDY        : Boolean := False;
      LSI2ON         : Boolean := False;
      LSI2RDY        : Boolean := False;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      LSI2TRIM       : CSR_LSI2TRIM_Field := 16#0#;
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      RFWKPSEL       : CSR_RFWKPSEL_Field := 16#0#;
      RFRSTS         : Boolean := False;
      --  unspecified
      Reserved_17_22 : HAL.UInt6 := 16#0#;
      RMVF           : Boolean := False;
      --  unspecified
      Reserved_24_24 : HAL.Bit := 16#0#;
      OBLRSTF        : Boolean := False;
      PINRSTF        : Boolean := False;
      BORRSTF        : Boolean := False;
      SFTRSTF        : Boolean := False;
      IWDGRSTF       : Boolean := False;
      WWDGRSTF       : Boolean := False;
      LPWRRSTF       : Boolean := False;
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

   subtype CRRCR_HSI48CAL_Field is HAL.UInt9;

   type CRRCR_Register is record
      HSI48ON        : Boolean := False;
      HSI48RDY       : Boolean := False;
      --  unspecified
      Reserved_2_6   : HAL.UInt5 := 16#0#;
      HSI48CAL       : CRRCR_HSI48CAL_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

   subtype HSECR_HSEGMC_Field is HAL.UInt3;
   subtype HSECR_HSETUNE_Field is HAL.UInt6;

   type HSECR_Register is record
      UNLOCKED       : Boolean := False;
      --  unspecified
      Reserved_1_2   : HAL.UInt2 := 16#0#;
      HSES           : Boolean := False;
      HSEGMC         : HSECR_HSEGMC_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      HSETUNE        : HSECR_HSETUNE_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : HAL.UInt18 := 16#0#;
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

   subtype EXTCFGR_SHDHPRE_Field is HAL.UInt4;
   subtype EXTCFGR_C2HPRE_Field is HAL.UInt4;

   type EXTCFGR_Register is record
      SHDHPRE        : EXTCFGR_SHDHPRE_Field := 16#0#;
      C2HPRE         : EXTCFGR_C2HPRE_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      SHDHPREF       : Boolean := False;
      C2HPREF        : Boolean := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      RFCSS          : Boolean := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
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

   type C2AHB1ENR_Register is record
      DMA1EN         : Boolean := False;
      DMA2EN         : Boolean := False;
      DMAMUX1EN      : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      SRAM1EN        : Boolean := False;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      CRCEN          : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      TSCEN          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type C2AHB2ENR_Register is record
      GPIOAEN        : Boolean := False;
      GPIOBEN        : Boolean := False;
      GPIOCEN        : Boolean := False;
      GPIODEN        : Boolean := False;
      GPIOEEN        : Boolean := False;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      GPIOHEN        : Boolean := False;
      --  unspecified
      Reserved_8_12  : HAL.UInt5 := 16#0#;
      ADCEN          : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      AES1EN         : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type C2AHB3ENR_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      PKAEN          : Boolean := False;
      AES2EN         : Boolean := False;
      RNGEN          : Boolean := False;
      HSEMEN         : Boolean := False;
      IPCCEN         : Boolean := False;
      --  unspecified
      Reserved_21_24 : HAL.UInt4 := 16#0#;
      FLASHEN        : Boolean := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
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

   type C2APB1ENR1_Register is record
      TIM2EN         : Boolean := False;
      --  unspecified
      Reserved_1_8   : HAL.UInt8 := 16#0#;
      LCDEN          : Boolean := False;
      RTCAPBEN       : Boolean := False;
      --  unspecified
      Reserved_11_13 : HAL.UInt3 := 16#0#;
      SPI2EN         : Boolean := False;
      --  unspecified
      Reserved_15_20 : HAL.UInt6 := 16#0#;
      I2C1EN         : Boolean := False;
      --  unspecified
      Reserved_22_22 : HAL.Bit := 16#0#;
      I2C3EN         : Boolean := False;
      CRSEN          : Boolean := False;
      --  unspecified
      Reserved_25_25 : HAL.Bit := 16#0#;
      USBEN          : Boolean := False;
      --  unspecified
      Reserved_27_30 : HAL.UInt4 := 16#0#;
      LPTIM1EN       : Boolean := False;
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

   type C2APB1ENR2_Register is record
      LPUART1EN     : Boolean := False;
      --  unspecified
      Reserved_1_4  : HAL.UInt4 := 16#0#;
      LPTIM2EN      : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2APB1ENR2_Register use record
      LPUART1EN     at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2EN      at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   type C2APB2ENR_Register is record
      --  unspecified
      Reserved_0_10  : HAL.UInt11 := 16#0#;
      TIM1EN         : Boolean := False;
      SPI1EN         : Boolean := False;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      USART1EN       : Boolean := False;
      --  unspecified
      Reserved_15_16 : HAL.UInt2 := 16#0#;
      TIM16EN        : Boolean := False;
      TIM17EN        : Boolean := False;
      --  unspecified
      Reserved_19_20 : HAL.UInt2 := 16#0#;
      SAI1EN         : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
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

   type C2APB3ENR_Register is record
      BLEEN                    : Boolean := False;
      C2APB3ENR_Register_802EN : Boolean := False;
      --  unspecified
      Reserved_2_31            : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2APB3ENR_Register use record
      BLEEN                    at 0 range 0 .. 0;
      C2APB3ENR_Register_802EN at 0 range 1 .. 1;
      Reserved_2_31            at 0 range 2 .. 31;
   end record;

   type C2AHB1SMENR_Register is record
      DMA1SMEN       : Boolean := False;
      DMA2SMEN       : Boolean := False;
      DMAMUX1SMEN    : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      SRAM1SMEN      : Boolean := False;
      --  unspecified
      Reserved_10_11 : HAL.UInt2 := 16#0#;
      CRCSMEN        : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
      TSCSMEN        : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type C2AHB2SMENR_Register is record
      GPIOASMEN      : Boolean := False;
      GPIOBSMEN      : Boolean := False;
      GPIOCSMEN      : Boolean := False;
      GPIODSMEN      : Boolean := False;
      GPIOESMEN      : Boolean := False;
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      GPIOHSMEN      : Boolean := False;
      --  unspecified
      Reserved_8_12  : HAL.UInt5 := 16#0#;
      ADCFSSMEN      : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      AES1SMEN       : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
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

   type C2AHB3SMENR_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      PKASMEN        : Boolean := False;
      AES2SMEN       : Boolean := False;
      RNGSMEN        : Boolean := False;
      --  unspecified
      Reserved_19_23 : HAL.UInt5 := 16#0#;
      SRAM2SMEN      : Boolean := False;
      FLASHSMEN      : Boolean := False;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
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

   type C2_APB1SMENR1_Register is record
      TIM2SMEN       : Boolean := False;
      --  unspecified
      Reserved_1_8   : HAL.UInt8 := 16#0#;
      LCDSMEN        : Boolean := False;
      RTCAPBSMEN     : Boolean := False;
      --  unspecified
      Reserved_11_13 : HAL.UInt3 := 16#0#;
      SPI2SMEN       : Boolean := False;
      --  unspecified
      Reserved_15_20 : HAL.UInt6 := 16#0#;
      I2C1SMEN       : Boolean := False;
      --  unspecified
      Reserved_22_22 : HAL.Bit := 16#0#;
      I2C3SMEN       : Boolean := False;
      CRSSMEN        : Boolean := False;
      --  unspecified
      Reserved_25_25 : HAL.Bit := 16#0#;
      USBSMEN        : Boolean := False;
      --  unspecified
      Reserved_27_30 : HAL.UInt4 := 16#0#;
      LPTIM1SMEN     : Boolean := False;
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

   type C2_APB1SMENR2_Register is record
      LPUART1SMEN   : Boolean := False;
      --  unspecified
      Reserved_1_4  : HAL.UInt4 := 16#0#;
      LPTIM2SMEN    : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2_APB1SMENR2_Register use record
      LPUART1SMEN   at 0 range 0 .. 0;
      Reserved_1_4  at 0 range 1 .. 4;
      LPTIM2SMEN    at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   type C2_APB2SMENR_Register is record
      --  unspecified
      Reserved_0_10  : HAL.UInt11 := 16#0#;
      TIM1SMEN       : Boolean := False;
      SPI1SMEN       : Boolean := False;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      USART1SMEN     : Boolean := False;
      --  unspecified
      Reserved_15_16 : HAL.UInt2 := 16#0#;
      TIM16SMEN      : Boolean := False;
      TIM17SMEN      : Boolean := False;
      --  unspecified
      Reserved_19_20 : HAL.UInt2 := 16#0#;
      SAI1SMEN       : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
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

   type C2_APB3SMENR_Register is record
      BLESMEN                       : Boolean := False;
      C2_APB3SMENR_Register_802SMEN : Boolean := False;
      --  unspecified
      Reserved_2_31                 : HAL.UInt30 := 16#0#;
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

end STM32_SVD.RCC;
