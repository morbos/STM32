--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.SYSCFG2 is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype IMR1_TIM1IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_TIM16IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_TIM17IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI5IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI6IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI7IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI8IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI9IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI10IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI11IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI12IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI13IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI14IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR1_EXTI15IM_Field is Interfaces.Bit_Types.Bit;

   type IMR1_Register is record
      --  unspecified
      Reserved_0_12  : Interfaces.Bit_Types.UInt13 := 16#0#;
      TIM1IM         : IMR1_TIM1IM_Field := 16#0#;
      TIM16IM        : IMR1_TIM16IM_Field := 16#0#;
      TIM17IM        : IMR1_TIM17IM_Field := 16#0#;
      --  unspecified
      Reserved_16_20 : Interfaces.Bit_Types.UInt5 := 16#0#;
      EXTI5IM        : IMR1_EXTI5IM_Field := 16#0#;
      EXTI6IM        : IMR1_EXTI6IM_Field := 16#0#;
      EXTI7IM        : IMR1_EXTI7IM_Field := 16#0#;
      EXTI8IM        : IMR1_EXTI8IM_Field := 16#0#;
      EXTI9IM        : IMR1_EXTI9IM_Field := 16#0#;
      EXTI10IM       : IMR1_EXTI10IM_Field := 16#0#;
      EXTI11IM       : IMR1_EXTI11IM_Field := 16#0#;
      EXTI12IM       : IMR1_EXTI12IM_Field := 16#0#;
      EXTI13IM       : IMR1_EXTI13IM_Field := 16#0#;
      EXTI14IM       : IMR1_EXTI14IM_Field := 16#0#;
      EXTI15IM       : IMR1_EXTI15IM_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IMR1_Register use record
      Reserved_0_12  at 0 range 0 .. 12;
      TIM1IM         at 0 range 13 .. 13;
      TIM16IM        at 0 range 14 .. 14;
      TIM17IM        at 0 range 15 .. 15;
      Reserved_16_20 at 0 range 16 .. 20;
      EXTI5IM        at 0 range 21 .. 21;
      EXTI6IM        at 0 range 22 .. 22;
      EXTI7IM        at 0 range 23 .. 23;
      EXTI8IM        at 0 range 24 .. 24;
      EXTI9IM        at 0 range 25 .. 25;
      EXTI10IM       at 0 range 26 .. 26;
      EXTI11IM       at 0 range 27 .. 27;
      EXTI12IM       at 0 range 28 .. 28;
      EXTI13IM       at 0 range 29 .. 29;
      EXTI14IM       at 0 range 30 .. 30;
      EXTI15IM       at 0 range 31 .. 31;
   end record;

   subtype IMR2_PVM1IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR2_PVM3IM_Field is Interfaces.Bit_Types.Bit;
   subtype IMR2_PVDIM_Field is Interfaces.Bit_Types.Bit;

   type IMR2_Register is record
      --  unspecified
      Reserved_0_15  : Interfaces.Bit_Types.Short := 16#0#;
      PVM1IM         : IMR2_PVM1IM_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : Interfaces.Bit_Types.Bit := 16#0#;
      PVM3IM         : IMR2_PVM3IM_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.Bit_Types.Bit := 16#0#;
      PVDIM          : IMR2_PVDIM_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : Interfaces.Bit_Types.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IMR2_Register use record
      Reserved_0_15  at 0 range 0 .. 15;
      PVM1IM         at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      PVM3IM         at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      PVDIM          at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype C2IMR1_RTCSTAMPTAMPLSECSSIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_RTCWKUPIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_RTCALARMIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_RCCIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_FLASHIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_PKAIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_RNGIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_AES1IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_COMPIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_ADCIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI0IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI1IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI2IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI3IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI4IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI5IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI6IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI7IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI8IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI9IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI10IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI11IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI12IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI13IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI14IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR1_EXTI15IM_Field is Interfaces.Bit_Types.Bit;

   type C2IMR1_Register is record
      RTCSTAMPTAMPLSECSSIM : C2IMR1_RTCSTAMPTAMPLSECSSIM_Field := 16#0#;
      --  unspecified
      Reserved_1_2         : Interfaces.Bit_Types.UInt2 := 16#0#;
      RTCWKUPIM            : C2IMR1_RTCWKUPIM_Field := 16#0#;
      RTCALARMIM           : C2IMR1_RTCALARMIM_Field := 16#0#;
      RCCIM                : C2IMR1_RCCIM_Field := 16#0#;
      FLASHIM              : C2IMR1_FLASHIM_Field := 16#0#;
      --  unspecified
      Reserved_7_7         : Interfaces.Bit_Types.Bit := 16#0#;
      PKAIM                : C2IMR1_PKAIM_Field := 16#0#;
      RNGIM                : C2IMR1_RNGIM_Field := 16#0#;
      AES1IM               : C2IMR1_AES1IM_Field := 16#0#;
      COMPIM               : C2IMR1_COMPIM_Field := 16#0#;
      ADCIM                : C2IMR1_ADCIM_Field := 16#0#;
      --  unspecified
      Reserved_13_15       : Interfaces.Bit_Types.UInt3 := 16#0#;
      EXTI0IM              : C2IMR1_EXTI0IM_Field := 16#0#;
      EXTI1IM              : C2IMR1_EXTI1IM_Field := 16#0#;
      EXTI2IM              : C2IMR1_EXTI2IM_Field := 16#0#;
      EXTI3IM              : C2IMR1_EXTI3IM_Field := 16#0#;
      EXTI4IM              : C2IMR1_EXTI4IM_Field := 16#0#;
      EXTI5IM              : C2IMR1_EXTI5IM_Field := 16#0#;
      EXTI6IM              : C2IMR1_EXTI6IM_Field := 16#0#;
      EXTI7IM              : C2IMR1_EXTI7IM_Field := 16#0#;
      EXTI8IM              : C2IMR1_EXTI8IM_Field := 16#0#;
      EXTI9IM              : C2IMR1_EXTI9IM_Field := 16#0#;
      EXTI10IM             : C2IMR1_EXTI10IM_Field := 16#0#;
      EXTI11IM             : C2IMR1_EXTI11IM_Field := 16#0#;
      EXTI12IM             : C2IMR1_EXTI12IM_Field := 16#0#;
      EXTI13IM             : C2IMR1_EXTI13IM_Field := 16#0#;
      EXTI14IM             : C2IMR1_EXTI14IM_Field := 16#0#;
      EXTI15IM             : C2IMR1_EXTI15IM_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2IMR1_Register use record
      RTCSTAMPTAMPLSECSSIM at 0 range 0 .. 0;
      Reserved_1_2         at 0 range 1 .. 2;
      RTCWKUPIM            at 0 range 3 .. 3;
      RTCALARMIM           at 0 range 4 .. 4;
      RCCIM                at 0 range 5 .. 5;
      FLASHIM              at 0 range 6 .. 6;
      Reserved_7_7         at 0 range 7 .. 7;
      PKAIM                at 0 range 8 .. 8;
      RNGIM                at 0 range 9 .. 9;
      AES1IM               at 0 range 10 .. 10;
      COMPIM               at 0 range 11 .. 11;
      ADCIM                at 0 range 12 .. 12;
      Reserved_13_15       at 0 range 13 .. 15;
      EXTI0IM              at 0 range 16 .. 16;
      EXTI1IM              at 0 range 17 .. 17;
      EXTI2IM              at 0 range 18 .. 18;
      EXTI3IM              at 0 range 19 .. 19;
      EXTI4IM              at 0 range 20 .. 20;
      EXTI5IM              at 0 range 21 .. 21;
      EXTI6IM              at 0 range 22 .. 22;
      EXTI7IM              at 0 range 23 .. 23;
      EXTI8IM              at 0 range 24 .. 24;
      EXTI9IM              at 0 range 25 .. 25;
      EXTI10IM             at 0 range 26 .. 26;
      EXTI11IM             at 0 range 27 .. 27;
      EXTI12IM             at 0 range 28 .. 28;
      EXTI13IM             at 0 range 29 .. 29;
      EXTI14IM             at 0 range 30 .. 30;
      EXTI15IM             at 0 range 31 .. 31;
   end record;

   subtype C2IMR2_DMA1CH1IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA1CH2IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA1CH3IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA1CH4IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA1CH5IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA1CH6IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA1CH7IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA2CH1IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA2CH2IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA2CH3IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA2CH4IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA2CH5IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA2CH6IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMA2CH7IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_DMAMUX1IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_PVM1IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_PVM3IM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_PVDIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_TSCIM_Field is Interfaces.Bit_Types.Bit;
   subtype C2IMR2_LCDIM_Field is Interfaces.Bit_Types.Bit;

   type C2IMR2_Register is record
      DMA1CH1IM      : C2IMR2_DMA1CH1IM_Field := 16#0#;
      DMA1CH2IM      : C2IMR2_DMA1CH2IM_Field := 16#0#;
      DMA1CH3IM      : C2IMR2_DMA1CH3IM_Field := 16#0#;
      DMA1CH4IM      : C2IMR2_DMA1CH4IM_Field := 16#0#;
      DMA1CH5IM      : C2IMR2_DMA1CH5IM_Field := 16#0#;
      DMA1CH6IM      : C2IMR2_DMA1CH6IM_Field := 16#0#;
      DMA1CH7IM      : C2IMR2_DMA1CH7IM_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      DMA2CH1IM      : C2IMR2_DMA2CH1IM_Field := 16#0#;
      DMA2CH2IM      : C2IMR2_DMA2CH2IM_Field := 16#0#;
      DMA2CH3IM      : C2IMR2_DMA2CH3IM_Field := 16#0#;
      DMA2CH4IM      : C2IMR2_DMA2CH4IM_Field := 16#0#;
      DMA2CH5IM      : C2IMR2_DMA2CH5IM_Field := 16#0#;
      DMA2CH6IM      : C2IMR2_DMA2CH6IM_Field := 16#0#;
      DMA2CH7IM      : C2IMR2_DMA2CH7IM_Field := 16#0#;
      DMAMUX1IM      : C2IMR2_DMAMUX1IM_Field := 16#0#;
      PVM1IM         : C2IMR2_PVM1IM_Field := 16#0#;
      --  unspecified
      Reserved_17_17 : Interfaces.Bit_Types.Bit := 16#0#;
      PVM3IM         : C2IMR2_PVM3IM_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.Bit_Types.Bit := 16#0#;
      PVDIM          : C2IMR2_PVDIM_Field := 16#0#;
      TSCIM          : C2IMR2_TSCIM_Field := 16#0#;
      LCDIM          : C2IMR2_LCDIM_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : Interfaces.Bit_Types.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2IMR2_Register use record
      DMA1CH1IM      at 0 range 0 .. 0;
      DMA1CH2IM      at 0 range 1 .. 1;
      DMA1CH3IM      at 0 range 2 .. 2;
      DMA1CH4IM      at 0 range 3 .. 3;
      DMA1CH5IM      at 0 range 4 .. 4;
      DMA1CH6IM      at 0 range 5 .. 5;
      DMA1CH7IM      at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      DMA2CH1IM      at 0 range 8 .. 8;
      DMA2CH2IM      at 0 range 9 .. 9;
      DMA2CH3IM      at 0 range 10 .. 10;
      DMA2CH4IM      at 0 range 11 .. 11;
      DMA2CH5IM      at 0 range 12 .. 12;
      DMA2CH6IM      at 0 range 13 .. 13;
      DMA2CH7IM      at 0 range 14 .. 14;
      DMAMUX1IM      at 0 range 15 .. 15;
      PVM1IM         at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      PVM3IM         at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      PVDIM          at 0 range 20 .. 20;
      TSCIM          at 0 range 21 .. 21;
      LCDIM          at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   --  SIPCR_SAES array element
   subtype SIPCR_SAES_Element is Interfaces.Bit_Types.Bit;

   --  SIPCR_SAES array
   type SIPCR_SAES_Field_Array is array (1 .. 2) of SIPCR_SAES_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SIPCR_SAES
   type SIPCR_SAES_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SAES as a value
            Val : Interfaces.Bit_Types.UInt2;
         when True =>
            --  SAES as an array
            Arr : SIPCR_SAES_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SIPCR_SAES_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SIPCR_SPKA_Field is Interfaces.Bit_Types.Bit;
   subtype SIPCR_SRNG_Field is Interfaces.Bit_Types.Bit;

   type SIPCR_Register is record
      SAES          : SIPCR_SAES_Field := (As_Array => False, Val => 16#0#);
      SPKA          : SIPCR_SPKA_Field := 16#0#;
      SRNG          : SIPCR_SRNG_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SIPCR_Register use record
      SAES          at 0 range 0 .. 1;
      SPKA          at 0 range 2 .. 2;
      SRNG          at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SYSCFG2_Peripheral is record
      IMR1   : aliased IMR1_Register;
      IMR2   : aliased IMR2_Register;
      C2IMR1 : aliased C2IMR1_Register;
      C2IMR2 : aliased C2IMR2_Register;
      SIPCR  : aliased SIPCR_Register;
   end record
     with Volatile;

   for SYSCFG2_Peripheral use record
      IMR1   at 16#100# range 0 .. 31;
      IMR2   at 16#104# range 0 .. 31;
      C2IMR1 at 16#108# range 0 .. 31;
      C2IMR2 at 16#10C# range 0 .. 31;
      SIPCR  at 16#110# range 0 .. 31;
   end record;

   SYSCFG2_Periph : aliased SYSCFG2_Peripheral
     with Import, Address => System'To_Address (16#40010000#);

end Interfaces.STM32.SYSCFG2;
