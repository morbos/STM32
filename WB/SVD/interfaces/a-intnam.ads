--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

--  This is a version for the STM32WB55x MCU
package Ada.Interrupts.Names is

   --  All identifiers in this unit are implementation defined

   pragma Implementation_Defined;

   ----------------
   -- Interrupts --
   ----------------

   --  System tick
   Sys_Tick_Interrupt                        : constant Interrupt_ID := -1;
   WWDG_Interrupt                            : constant Interrupt_ID := 0;
   PVD_Interrupt                             : constant Interrupt_ID := 1;
   TAMP_Interrupt                            : constant Interrupt_ID := 2;
   RTC_WKUP_Interrupt                        : constant Interrupt_ID := 3;
   FLASH_Interrupt                           : constant Interrupt_ID := 4;
   RCC_Interrupt                             : constant Interrupt_ID := 5;
   EXTI0_Interrupt                           : constant Interrupt_ID := 6;
   EXTI1_Interrupt                           : constant Interrupt_ID := 7;
   EXTI2_Interrupt                           : constant Interrupt_ID := 8;
   EXTI3_Interrupt                           : constant Interrupt_ID := 9;
   EXTI4_Interrupt                           : constant Interrupt_ID := 10;
   DMA1_CH1_Interrupt                        : constant Interrupt_ID := 11;
   DMA1_CH2_Interrupt                        : constant Interrupt_ID := 12;
   DMA1_CH3_Interrupt                        : constant Interrupt_ID := 13;
   DMA1_CH4_Interrupt                        : constant Interrupt_ID := 14;
   DMA1_CH5_Interrupt                        : constant Interrupt_ID := 15;
   DMA1_CH6_Interrupt                        : constant Interrupt_ID := 16;
   DMA1_CH7_Interrupt                        : constant Interrupt_ID := 17;
   ADC_Interrupt                             : constant Interrupt_ID := 18;
   USB_HP_Interrupt                          : constant Interrupt_ID := 19;
   USB_LP_Interrupt                          : constant Interrupt_ID := 20;
   C2SEV_PWR_C2H_Interrupt                   : constant Interrupt_ID := 21;
   COMP_Interrupt                            : constant Interrupt_ID := 22;
   EXTI9_5_Interrupt                         : constant Interrupt_ID := 23;
   TIM1_BRK_Interrupt                        : constant Interrupt_ID := 24;
   TIM1_UP_TIM16_Interrupt                   : constant Interrupt_ID := 25;
   TIM1_TRG_COM_TIM17_Interrupt              : constant Interrupt_ID := 26;
   TIM1_CC_Interrupt                         : constant Interrupt_ID := 27;
   TIM2_Interrupt                            : constant Interrupt_ID := 28;
   I2C1_EV_Interrupt                         : constant Interrupt_ID := 30;
   I2C1_ER_Interrupt                         : constant Interrupt_ID := 31;
   I2C3_EV_Interrupt                         : constant Interrupt_ID := 32;
   I2C3_ER_Interrupt                         : constant Interrupt_ID := 33;
   SPI1_Interrupt                            : constant Interrupt_ID := 34;
   SPI2_Interrupt                            : constant Interrupt_ID := 35;
   USART1_Interrupt                          : constant Interrupt_ID := 36;
   SAI_Interrupt                             : constant Interrupt_ID := 38;
   TSC_Interrupt                             : constant Interrupt_ID := 39;
   EXTI15_10_Interrupt                       : constant Interrupt_ID := 40;
   RTC_ALARM_Interrupt                       : constant Interrupt_ID := 41;
   CRS_Interrupt                             : constant Interrupt_ID := 42;
   PWR_SOTF_BLEACT_802ACT_RFPHASE_Interrupt  : constant Interrupt_ID := 43;
   IPCC_C1_RX_Interrupt                      : constant Interrupt_ID := 44;
   IPCC_C1_TX_Interrupt                      : constant Interrupt_ID := 45;
   HSEM_Interrupt                            : constant Interrupt_ID := 46;
   LPTIM1_Interrupt                          : constant Interrupt_ID := 47;
   LPTIM2_Interrupt                          : constant Interrupt_ID := 48;
   LCD_Interrupt                             : constant Interrupt_ID := 49;
   QUADSPI_Interrupt                         : constant Interrupt_ID := 50;
   AES1_Interrupt                            : constant Interrupt_ID := 51;
   AES2_Interrupt                            : constant Interrupt_ID := 52;
   RNG_Interrupt                             : constant Interrupt_ID := 53;
   DMA2_CH1_Interrupt                        : constant Interrupt_ID := 55;
   DMA2_CH2_Interrupt                        : constant Interrupt_ID := 56;
   DMA2_CH3_Interrupt                        : constant Interrupt_ID := 57;
   DMA2_CH4_Interrupt                        : constant Interrupt_ID := 58;
   DMA2_CH5_Interrupt                        : constant Interrupt_ID := 59;
   DMA2_CH6_Interrupt                        : constant Interrupt_ID := 60;
   DMA2_CH7_Interrupt                        : constant Interrupt_ID := 61;
   DMAMUX_OVR_Interrupt                      : constant Interrupt_ID := 62;

   --  FPU global interrupt
   FPU_Interrupt                             : constant Interrupt_ID := 81;

end Ada.Interrupts.Names;
