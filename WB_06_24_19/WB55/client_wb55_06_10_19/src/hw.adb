with STM32.IPCC;           use STM32.IPCC;

with STM32_SVD.SYSCFG;     use STM32_SVD.SYSCFG;
with STM32_SVD.SYSCFG2;    use STM32_SVD.SYSCFG2;
with STM32_SVD.RCC;        use STM32_SVD.RCC;
with STM32_SVD.PWR;        use STM32_SVD.PWR;
with STM32_SVD.EXTI;       use STM32_SVD.EXTI;
with STM32_SVD.FLASH;      use STM32_SVD.FLASH;

with System.Machine_Code;  use System.Machine_Code;

package body HW is
   procedure Misc_HW_Init
   is
   begin
      RCC_Periph.CR.MSION := False;
      RCC_Periph.CR.MSIRDY := False;
      RCC_Periph.CFGR.STOPWUCK := True;
      RCC_Periph.APB1ENR1.CRSEN := True;
      RCC_Periph.CCIPR.CLK48SEL := 0;
      RCC_Periph.CRRCR.HSI48RDY := True;
      RCC_Periph.CRRCR.HSI48ON := True;
      RCC_Periph.HSECR.HSETUNE := 16#23#;
      FLASH_Periph.ACR.PRFTEN := False;
      FLASH_Periph.ACR.LATENCY := 1;
      EXTI_Periph.RTSR1.RT := 16#80000#;
      EXTI_Periph.FTSR1.FT := 16#400#;
      EXTI_Periph.IMR1 := 16#80400#;
      EXTI_Periph.IMR2.IM := 16#10050#;
   end Misc_HW_Init;

   procedure SYSCFG_Init
   is
   begin
      SYSCFG_Periph.SCSR.C2RFD := True;
   end SYSCFG_Init;

   procedure SYSCFG2_Init
   is
   begin
      SYSCFG2_Periph.C2IMR1.EXTI15IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI14IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI13IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI12IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI11IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI10IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI9IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI8IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI7IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI6IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI5IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI4IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI3IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI2IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI1IM := True;
      SYSCFG2_Periph.C2IMR1.EXTI0IM := True;
      SYSCFG2_Periph.C2IMR1.ADCIM := True;
      SYSCFG2_Periph.C2IMR1.COMPIM := True;
      SYSCFG2_Periph.C2IMR1.AES1IM := True;
      SYSCFG2_Periph.C2IMR1.RCCIM := True;
      SYSCFG2_Periph.C2IMR1.RTCALARMIM := True;
      SYSCFG2_Periph.C2IMR1.RTCWKUPIM := True;
      SYSCFG2_Periph.C2IMR1.RTCSTAMPTAMPLSECSSIM := True;
      SYSCFG2_Periph.C2IMR2.LCDIM := True;
      SYSCFG2_Periph.C2IMR2.TSCIM := True;
      SYSCFG2_Periph.C2IMR2.PVDIM := True;
      SYSCFG2_Periph.C2IMR2.PVM3IM := True;
      SYSCFG2_Periph.C2IMR2.PVM1IM := True;
      SYSCFG2_Periph.C2IMR2.DMAMUX1IM := True;
      SYSCFG2_Periph.C2IMR2.DMA2CH7IM := True;
      SYSCFG2_Periph.C2IMR2.DMA2CH6IM := True;
      SYSCFG2_Periph.C2IMR2.DMA2CH5IM := True;
      SYSCFG2_Periph.C2IMR2.DMA2CH4IM := True;
      SYSCFG2_Periph.C2IMR2.DMA2CH3IM := True;
      SYSCFG2_Periph.C2IMR2.DMA2CH2IM := True;
      SYSCFG2_Periph.C2IMR2.DMA2CH1IM := True;
      SYSCFG2_Periph.C2IMR2.DMA1CH7IM := True;
      SYSCFG2_Periph.C2IMR2.DMA1CH6IM := True;
      SYSCFG2_Periph.C2IMR2.DMA1CH5IM := True;
      SYSCFG2_Periph.C2IMR2.DMA1CH4IM := True;
      SYSCFG2_Periph.C2IMR2.DMA1CH3IM := True;
      SYSCFG2_Periph.C2IMR2.DMA1CH2IM := True;
      SYSCFG2_Periph.C2IMR2.DMA1CH1IM := True;
   end SYSCFG2_Init;

   procedure CPU2_Init
   is
   begin
      RCC_Periph.C2APB3ENR.BLEEN := True;
      RCC_Periph.CSR.RFWKPSEL := 1;
      PWR_Periph.C2CR1.LPMS := 4;
      Asm ("sev", Volatile => True);
      Asm ("wfe", Volatile => True);
      PWR_Periph.CR4.C2BOOT := True;
   end CPU2_Init;

   procedure Initialize_HW
   is
   begin
      Misc_HW_Init;
      CPU2_Init;
      SYSCFG_Init;
      SYSCFG2_Init;
      IPCC_Enable;
      IPCC_Enable_TX_Interrupt;
      IPCC_Enable_RX_Interrupt;
   end Initialize_HW;

end HW;
