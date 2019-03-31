--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.SYSCFG2 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   type IMR1_Register is record
      --  unspecified
      Reserved_0_12  : HAL.UInt13 := 16#0#;
      TIM1IM         : Boolean := False;
      TIM16IM        : Boolean := False;
      TIM17IM        : Boolean := False;
      --  unspecified
      Reserved_16_20 : HAL.UInt5 := 16#0#;
      EXTI5IM        : Boolean := False;
      EXTI6IM        : Boolean := False;
      EXTI7IM        : Boolean := False;
      EXTI8IM        : Boolean := False;
      EXTI9IM        : Boolean := False;
      EXTI10IM       : Boolean := False;
      EXTI11IM       : Boolean := False;
      EXTI12IM       : Boolean := False;
      EXTI13IM       : Boolean := False;
      EXTI14IM       : Boolean := False;
      EXTI15IM       : Boolean := False;
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

   type IMR2_Register is record
      --  unspecified
      Reserved_0_15  : HAL.UInt16 := 16#0#;
      PVM1IM         : Boolean := False;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      PVM3IM         : Boolean := False;
      --  unspecified
      Reserved_19_19 : HAL.Bit := 16#0#;
      PVDIM          : Boolean := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
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

   type C2IMR1_Register is record
      RTCSTAMPTAMPLSECSSIM : Boolean := False;
      --  unspecified
      Reserved_1_2         : HAL.UInt2 := 16#0#;
      RTCWKUPIM            : Boolean := False;
      RTCALARMIM           : Boolean := False;
      RCCIM                : Boolean := False;
      FLASHIM              : Boolean := False;
      --  unspecified
      Reserved_7_7         : HAL.Bit := 16#0#;
      PKAIM                : Boolean := False;
      RNGIM                : Boolean := False;
      AES1IM               : Boolean := False;
      COMPIM               : Boolean := False;
      ADCIM                : Boolean := False;
      --  unspecified
      Reserved_13_15       : HAL.UInt3 := 16#0#;
      EXTI0IM              : Boolean := False;
      EXTI1IM              : Boolean := False;
      EXTI2IM              : Boolean := False;
      EXTI3IM              : Boolean := False;
      EXTI4IM              : Boolean := False;
      EXTI5IM              : Boolean := False;
      EXTI6IM              : Boolean := False;
      EXTI7IM              : Boolean := False;
      EXTI8IM              : Boolean := False;
      EXTI9IM              : Boolean := False;
      EXTI10IM             : Boolean := False;
      EXTI11IM             : Boolean := False;
      EXTI12IM             : Boolean := False;
      EXTI13IM             : Boolean := False;
      EXTI14IM             : Boolean := False;
      EXTI15IM             : Boolean := False;
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

   type C2IMR2_Register is record
      DMA1CH1IM      : Boolean := False;
      DMA1CH2IM      : Boolean := False;
      DMA1CH3IM      : Boolean := False;
      DMA1CH4IM      : Boolean := False;
      DMA1CH5IM      : Boolean := False;
      DMA1CH6IM      : Boolean := False;
      DMA1CH7IM      : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      DMA2CH1IM      : Boolean := False;
      DMA2CH2IM      : Boolean := False;
      DMA2CH3IM      : Boolean := False;
      DMA2CH4IM      : Boolean := False;
      DMA2CH5IM      : Boolean := False;
      DMA2CH6IM      : Boolean := False;
      DMA2CH7IM      : Boolean := False;
      DMAMUX1IM      : Boolean := False;
      PVM1IM         : Boolean := False;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      PVM3IM         : Boolean := False;
      --  unspecified
      Reserved_19_19 : HAL.Bit := 16#0#;
      PVDIM          : Boolean := False;
      TSCIM          : Boolean := False;
      LCDIM          : Boolean := False;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
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

   --  SIPCR_SAES array
   type SIPCR_SAES_Field_Array is array (1 .. 2) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for SIPCR_SAES
   type SIPCR_SAES_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SAES as a value
            Val : HAL.UInt2;
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

   type SIPCR_Register is record
      SAES          : SIPCR_SAES_Field := (As_Array => False, Val => 16#0#);
      SPKA          : Boolean := False;
      SRNG          : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
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

end STM32_SVD.SYSCFG2;
