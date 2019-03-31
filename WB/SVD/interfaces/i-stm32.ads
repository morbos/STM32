--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with System;

--  STM32WB55x
package Interfaces.STM32 is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   --------------------
   -- Base addresses --
   --------------------

   RCC_Base : constant System.Address :=
     System'To_Address (16#58000000#);
   ADC_Base : constant System.Address :=
     System'To_Address (16#50040000#);
   DMA1_Base : constant System.Address :=
     System'To_Address (16#40020000#);
   DMA2_Base : constant System.Address :=
     System'To_Address (16#40020400#);
   SPI1_Base : constant System.Address :=
     System'To_Address (16#40013000#);
   SPI2_Base : constant System.Address :=
     System'To_Address (16#40003800#);
   I2C1_Base : constant System.Address :=
     System'To_Address (16#40005400#);
   I2C3_Base : constant System.Address :=
     System'To_Address (16#40005C00#);
   COMP_Base : constant System.Address :=
     System'To_Address (16#40010200#);
   LCD_Base : constant System.Address :=
     System'To_Address (16#40002400#);
   AES1_Base : constant System.Address :=
     System'To_Address (16#50050400#);
   AES2_Base : constant System.Address :=
     System'To_Address (16#58001800#);
   CRC_Base : constant System.Address :=
     System'To_Address (16#40023000#);
   DMAMUX_Base : constant System.Address :=
     System'To_Address (16#40020800#);
   EXTI_Base : constant System.Address :=
     System'To_Address (16#58000800#);
   FLASH_Base : constant System.Address :=
     System'To_Address (16#58004000#);
   PKA_Base : constant System.Address :=
     System'To_Address (16#58002000#);
   HSEM_Base : constant System.Address :=
     System'To_Address (16#58001400#);
   PWR_Base : constant System.Address :=
     System'To_Address (16#58000400#);
   SAI_Base : constant System.Address :=
     System'To_Address (16#40015400#);
   QUADSPI_Base : constant System.Address :=
     System'To_Address (16#A0001000#);
   SYSCFG_Base : constant System.Address :=
     System'To_Address (16#40010000#);
   SYSCFG2_Base : constant System.Address :=
     System'To_Address (16#40010000#);
   VREFBUF_Base : constant System.Address :=
     System'To_Address (16#40010030#);
   IPCC_Base : constant System.Address :=
     System'To_Address (16#58000C00#);
   IWDG_Base : constant System.Address :=
     System'To_Address (16#40003000#);
   WWDG_Base : constant System.Address :=
     System'To_Address (16#40002C00#);
   USB_FS_Base : constant System.Address :=
     System'To_Address (16#40006800#);
   USART1_Base : constant System.Address :=
     System'To_Address (16#40013800#);
   TSC_Base : constant System.Address :=
     System'To_Address (16#40024000#);
   RNG_Base : constant System.Address :=
     System'To_Address (16#58001000#);
   CRS_Base : constant System.Address :=
     System'To_Address (16#40006000#);
   RTC_Base : constant System.Address :=
     System'To_Address (16#40002800#);
   GPIOA_Base : constant System.Address :=
     System'To_Address (16#48000000#);
   GPIOB_Base : constant System.Address :=
     System'To_Address (16#48000400#);
   GPIOC_Base : constant System.Address :=
     System'To_Address (16#48000800#);
   GPIOD_Base : constant System.Address :=
     System'To_Address (16#48000C00#);
   GPIOE_Base : constant System.Address :=
     System'To_Address (16#48001000#);
   GPIOH_Base : constant System.Address :=
     System'To_Address (16#48001C00#);
   TIM1_Base : constant System.Address :=
     System'To_Address (16#40012C00#);
   TIM2_Base : constant System.Address :=
     System'To_Address (16#40000000#);
   TIM16_Base : constant System.Address :=
     System'To_Address (16#40014400#);
   TIM17_Base : constant System.Address :=
     System'To_Address (16#40014800#);
   LPTIM1_Base : constant System.Address :=
     System'To_Address (16#40007C00#);
   LPTIM2_Base : constant System.Address :=
     System'To_Address (16#40008000#);
   NVIC_Base : constant System.Address :=
     System'To_Address (16#E000E000#);
   DBGMCU_Base : constant System.Address :=
     System'To_Address (16#E0042000#);

end Interfaces.STM32;
