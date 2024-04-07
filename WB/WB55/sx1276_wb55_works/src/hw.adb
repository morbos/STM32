with Main;                 use Main;
with STM32.Device;         use STM32.Device;
with STM32.IPCC;           use STM32.IPCC;
with STM32.HSEM;           use STM32.HSEM;
with STM32.RTC;            use STM32.RTC;
with STM32.GPIO;           use STM32.GPIO;
with STM32.EXTI;           use STM32.EXTI;

with STM32_SVD.SYSCFG;     use STM32_SVD.SYSCFG;
with STM32_SVD.SYSCFG2;    use STM32_SVD.SYSCFG2;
with STM32_SVD.RCC;        use STM32_SVD.RCC;
with STM32_SVD.PWR;        use STM32_SVD.PWR;
with STM32_SVD.EXTI;       use STM32_SVD.EXTI;
with STM32_SVD.FLASH;      use STM32_SVD.FLASH;
with STM32_SVD.SCB;        use STM32_SVD.SCB;
with STM32_SVD.HSEM;       use STM32_SVD.HSEM;
with STM32_SVD.RTC;        use STM32_SVD.RTC;
with STM32_SVD.STK;        use STM32_SVD.STK;

with Peripherals;          use Peripherals;

with System.Machine_Code;  use System.Machine_Code;

package body HW is
   procedure Misc_HW_Init
   is
   begin
      PWR_Periph.CR1.DBP := True;

      RCC_Periph.CR.MSION := False;
      RCC_Periph.CR.MSIRDY := False;
      RCC_Periph.CFGR.STOPWUCK := True;
      RCC_Periph.APB1ENR1.CRSEN := True;
      RCC_Periph.CCIPR.CLK48SEL := 0;
--      RCC_Periph.CRRCR.HSI48RDY := True;
--      RCC_Periph.CRRCR.HSI48ON := True;
      RCC_Periph.SMPSCR.SMPSSEL := 0;
      RCC_Periph.BDCR.RTC_SEL := 1;
      RCC_Periph.BDCR.RTCEN := True;
      --  vvv Found using the diff tech.
      --  If not set... the radio will be in reset.
      RCC_Periph.BDCR.LSEON := True;
      --  ^^^
      FLASH_Periph.ACR.PRFTEN := True;
      FLASH_Periph.ACR.DCEN := False;
      FLASH_Periph.ACR.ICEN := False;
      FLASH_Periph.ACR.LATENCY := 1;
      EXTI_Periph.RTSR1.RT := 16#80000#;
      EXTI_Periph.IMR2.IM := 16#10050#;

--      PWR_Periph.CR1.DBP := False; This should be true but... match the C code diffs
      PWR_Periph.CR2.USV := True; --  This should be false but... match the C code diffs

      PWR_Periph.C2CR1.LPMS := 2; --  Stop2

      Disable_Write_Protection;
      RTC_Periph.WUTR.WUT := 9;
      loop
         RTC_Periph.CR.WUTIE := True;
         exit when RTC_Periph.CR.WUTIE;
      end loop;
      loop
         RTC_Periph.CR.BYPSHAD := True;
         exit when RTC_Periph.CR.BYPSHAD;
      end loop;
      loop
         RTC_Periph.CR.WUTE := True;
         exit when RTC_Periph.CR.WUTE = True;
      end loop;
      RTC_Periph.ISR.INIT := True;
      loop
         exit when RTC_Periph.ISR.INITF;
      end loop;
      loop
         RTC_Periph.PRER.PREDIV_A := 16#f#;
         exit when RTC_Periph.PRER.PREDIV_A = 16#f#;
      end loop;
      loop
         RTC_Periph.PRER.PREDIV_S := 16#3fff#;
         exit when RTC_Periph.PRER.PREDIV_S = 16#3fff#;
      end loop;
      RTC_Periph.ISR.INIT := False;
      Enable_Write_Protection;

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
      RCC_Periph.C2APB3ENR.BLEEN := False;
   end CPU2_Init;

   --------------------------------
   -- Configure_User_Button_GPIO --
   --------------------------------

   procedure Configure_SW1 is
      Config : GPIO_Port_Configuration;
   begin
      Enable_Clock (SW1_Point);

      Config.Mode      := Mode_In;
      Config.Speed     := Speed_2MHz;
      Config.Resistors := Pull_Up;

      Configure_IO (SW1_Point, Config);

      Configure_Trigger (SW1_Point, Interrupt_Falling_Edge);

   end Configure_SW1;


   procedure Initialize_Blue_LED
   is
      Configuration : GPIO_Port_Configuration;
   begin
      Enable_Clock (Blue_LED);

      Configuration.Mode        := Mode_Out;
      Configuration.Output_Type := Push_Pull;
      Configuration.Speed       := Speed_2MHz;
      Configuration.Resistors   := Floating;
      Configure_IO (Blue_LED,
                    Config => Configuration);

   end Initialize_Blue_LED;

   function GetSysClkSource return UInt2
   is
   begin
      return RCC_Periph.CFGR.SWS;
   end GetSysClkSource;

   function IsActive_C1Stop return Boolean
   is
   begin
      return PWR_Periph.EXTSCR.C1STOPF;
   end IsActive_C1Stop;

   procedure Switch_On_HSI
   is
   begin
      RCC_Periph.CR.HSION := True;
      loop
         exit when RCC_Periph.CR.HSIRDY;
      end loop;
      RCC_Periph.CFGR.SW := 1;

      loop
         exit when RCC_Periph.CFGR.SWS = 1;
      end loop;
   end Switch_On_HSI;

   procedure Switch_On_HSE
   is
   begin
      RCC_Periph.CR.HSEON := True;
      loop
         exit when RCC_Periph.CR.HSERDY;
      end loop;
      RCC_Periph.CFGR.SW := 2;
      loop
         exit when RCC_Periph.CFGR.SWS = 2;
      end loop;
   end Switch_On_HSE;

   procedure SysTick_Stance (On : Boolean)
   is
   begin
      STK_Periph.CTRL.TICKINT := On;
   end SysTick_Stance;

   procedure Stop2
   is
   begin
      RCC_Periph.CRRCR.HSI48RDY := False;
      RCC_Periph.CRRCR.HSI48ON := False;
      SysTick_Stance (False);
      PWR_Periph.CR1.LPMS := 2;
      SCB_Periph.SCR.SLEEPDEEP := True;
      Asm ("dsb", Volatile => True); --  Flush any outstanding xact's
      Asm ("wfi", Volatile => True);
      SysTick_Stance (True);
   end Stop2;

   procedure EnterStopMode
   is
   begin
      loop
         exit when not OneStepLock (HW_RCC_SEMID);
      end loop;

      loop
         exit when not AnyLock (HW_STOP_MODE_SEMID);
      end loop;

      if not OneStepLock (HW_STOP_MODE_SEMID) then
         if PWR_Periph.EXTSCR.C2DS then
            ReleaseLock (HW_STOP_MODE_SEMID, 0);
            Switch_On_HSI;
         end if;
      else
         Switch_On_HSI;
      end if;
      ReleaseLock (HW_RCC_SEMID, 0);
   end EnterStopMode;

   procedure ExitStopMode
   is
   begin
      ReleaseLock (HW_STOP_MODE_SEMID, 0);

      if GetSysClkSource = 1 or IsActive_C1Stop then
         PWR_Periph.EXTSCR.C1CSSF := False;
         loop
            exit when not OneStepLock (HW_RCC_SEMID);
         end loop;
         if GetSysClkSource = 1 then
            Switch_On_HSE;
         end if;
         ReleaseLock (HW_RCC_SEMID, 0);
      end if;
   end ExitStopMode;
   procedure Disable_Interrupts
   is
   begin
      Asm ("cpsid i", Volatile => True);
   end Disable_Interrupts;
   procedure Enable_Interrupts
   is
      NL : constant String := ASCII.LF & ASCII.HT;
   begin
      Asm ("cpsie i" & NL
         & "dsb"     & NL
         & "isb",
           Clobber => "memory", Volatile => True);
   end Enable_Interrupts;
   procedure Sleep
   is
   begin
      EnterStopMode;
      Stop2;
      ExitStopMode;
   end Sleep;

   procedure Enable_MCO
   is
      GPIO_Conf       : GPIO_Port_Configuration;
   begin
      Enable_Clock (PA8);

      GPIO_Conf.Speed       := Speed_100MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;

      Configure_IO (PA8, GPIO_Conf);

      Configure_Alternate_Function (PA8, GPIO_AF_MCO_0);

      RCC_Periph.CFGR.MCOPRE := 3;
      RCC_Periph.CFGR.MCOSEL := 1; --  SYSCLK

   end Enable_MCO;

   procedure Initialize_HW
   is
   begin
--      Enable_MCO;
      Initialize_Blue_LED;
      Configure_SW1;
      Misc_HW_Init;
      CPU2_Init;
      SYSCFG_Init;
      SYSCFG2_Init;
      IPCC_Enable;
      IPCC_Enable_TX_Interrupt;
      IPCC_Enable_RX_Interrupt;
   end Initialize_HW;

end HW;
