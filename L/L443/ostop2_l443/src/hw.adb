with HAL;                  use HAL;
with STM32.Board;          use STM32.Board;
with STM32.Device;         use STM32.Device;
with STM32.GPIO;           use STM32.GPIO;
with STM32.EXTI;           use STM32.EXTI;
with STM32_SVD.EXTI;       use STM32_SVD.EXTI;
with STM32_SVD.PWR;        use STM32_SVD.PWR;
with STM32_SVD.RCC;        use STM32_SVD.RCC;
with STM32_SVD.Flash;      use STM32_SVD.Flash;
with Cortex_M_SVD.SCB;     use Cortex_M_SVD.SCB;
with Cortex_M_SVD.SysTick; use Cortex_M_SVD.SysTick;
with System.Machine_Code;  use System.Machine_Code;

package body Hw is

   procedure Enable_EXTI20
   is
      Line : constant External_Line_Number := EXTI_Line_20;
      Index : constant Natural := External_Line_Number'Pos (Line);
   begin
      Enable_External_Interrupt (Line, Interrupt_Rising_Edge);
--      EXTI_Periph.IMR1.Arr (Index) := True;
   end Enable_EXTI20;

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

   procedure Switch_On_PLL
   is
   begin
      RCC_Periph.CR.HSEON := True;
      loop
         exit when RCC_Periph.CR.HSERDY;
      end loop;
      RCC_Periph.CFGR.SW := 3;
      loop
         exit when RCC_Periph.CFGR.SWS = 3;
      end loop;
   end Switch_On_PLL;

   procedure SysTick_Stance (On : Boolean)
   is
   begin
      SysTick_Periph.CSR.TICKINT := (if On then Disable else Enable);
   end SysTick_Stance;

   procedure Stop2
   is
   begin
      --      RCC_Periph.CFGR.STOPWUCK := True;
      RCC_Periph.CFGR.STOPWUCK := False;

      SysTick_Stance (False);

--      Switch_On_HSI;

      PWR_Periph.CR1.LPMS := 2;

      SCB_Periph.SCR.SLEEPDEEP := True;

      Asm ("wfi", Volatile => True);

      SCB_Periph.SCR.SLEEPDEEP := False;

      Internal_Clocks;

      Switch_On_PLL;

      Initialize_LEDs;

      Turn_On (Green_LED);

      --      STM32.GPIO.Toggle (Green_LED);

      SysTick_Stance (True);

   end Stop2;

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

   procedure Gate_Off
   is
   begin
      --  Periphs off
      RCC_Periph.AHB1SMENR.DMA1SMEN := False;
      RCC_Periph.AHB1SMENR.DMA2SMEN := False;
      RCC_Periph.AHB1SMENR.FLASHSMEN := False;
      RCC_Periph.AHB1SMENR.SRAM1SMEN := False;
      RCC_Periph.AHB1SMENR.CRCSMEN   := False;
      RCC_Periph.AHB1SMENR.TSCSMEN   := False;

      RCC_Periph.AHB2SMENR.GPIOASMEN := False;
      RCC_Periph.AHB2SMENR.GPIOBSMEN  := False;
      RCC_Periph.AHB2SMENR.GPIOCSMEN  := False;
      RCC_Periph.AHB2SMENR.GPIODSMEN  := False;
      RCC_Periph.AHB2SMENR.GPIOESMEN  := False;
      RCC_Periph.AHB2SMENR.GPIOHSMEN  := False;
      RCC_Periph.AHB2SMENR.SRAM2SMEN  := False;
      RCC_Periph.AHB2SMENR.ADCFSSMEN  := False;
      RCC_Periph.AHB2SMENR.AESSMEN    := False;
      RCC_Periph.AHB2SMENR.RNGSMEN    := False;

      RCC_Periph.AHB3SMENR.QSPISMEN    := False;

      RCC_Periph.APB1SMENR1.TIM2SMEN := False;
      RCC_Periph.APB1SMENR1.TIM6SMEN := False;
      RCC_Periph.APB1SMENR1.TIM7SMEN := False;
      RCC_Periph.APB1SMENR1.LCDSMEN := False;
      RCC_Periph.APB1SMENR1.RTCAPBSMEN := True;
      RCC_Periph.APB1SMENR1.WWDGSMEN := False;
      RCC_Periph.APB1SMENR1.SPI2SMEN := False;
      RCC_Periph.APB1SMENR1.SP3SMEN := False;
      RCC_Periph.APB1SMENR1.USART2SMEN := False;
      RCC_Periph.APB1SMENR1.USART3SMEN := False;
      RCC_Periph.APB1SMENR1.I2C1SMEN := False;
      RCC_Periph.APB1SMENR1.I2C2SMEN := False;
      RCC_Periph.APB1SMENR1.I2C3SMEN := False;
      RCC_Periph.APB1SMENR1.CAN1SMEN := False;
      RCC_Periph.APB1SMENR1.USBFSSMEN := False;
      RCC_Periph.APB1SMENR1.PWRSMEN := False;
      RCC_Periph.APB1SMENR1.DAC1SMEN := False;
      RCC_Periph.APB1SMENR1.OPAMPSMEN := False;
      RCC_Periph.APB1SMENR1.LPTIM1SMEN := False;

      RCC_Periph.APB1SMENR2.LPUART1SMEN := False;
      RCC_Periph.APB1SMENR2.SWPMI1SMEN  := False;
      RCC_Periph.APB1SMENR2.LPTIM2SMEN  := False;

      RCC_Periph.APB2SMENR.SYSCFGSMEN := False;
      RCC_Periph.APB2SMENR.SDMMCSMEN  := False;
      RCC_Periph.APB2SMENR.TIM1SMEN   := False;
      RCC_Periph.APB2SMENR.SPI1SMEN   := False;
      RCC_Periph.APB2SMENR.USART1SMEN := False;
      RCC_Periph.APB2SMENR.TIM15SMEN  := False;
      RCC_Periph.APB2SMENR.TIM16SMEN  := False;
      RCC_Periph.APB2SMENR.SAI1SMEN   := False;
   end Gate_Off;

   procedure GPIO_Off
   is
      Points     : GPIO_Points := (PA0, PA1, PA2, PA3, PA4, PA5, PA6, PA7,
                                   PA8, PA9, PA10, PA11, PA12, PA13, PA14, PA15,
                                   PB0, PB1, PB2, PB3, PB4, PB5, PB6, PB7,
                                   PB8, PB9, PB10, PB11, PB12, PB13, PB14, PB15,
                                   PC0, PC1, PC2, PC3, PC4, PC5, PC6, PC7,
                                   PC8, PC9, PC10, PC11, PC12, PC13, PC14, PC15,
                                   PD0, PD1, PD2, PD3, PD4, PD5, PD6, PD7,
                                   PD8, PD9, PD10, PD11, PD12, PD13, PD14, PD15,
                                   PE0, PE1, PE2, PE3, PE4, PE5, PE6, PE7,
                                   PE8, PE9, PE10, PE11, PE12, PE13, PE14, PE15);
      GPIO_Conf  : GPIO_Port_Configuration;
   begin
      Enable_Clock (Points);
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Mode        := Mode_Analog;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;

      Configure_IO (Points, GPIO_Conf);

      Disable_Clock (Points);

   end GPIO_Off;

   procedure Internal_Clocks
   is
   begin
      Switch_On_HSI;
      FLASH_Periph.ACR.LATENCY := 4;
      FLASH_Periph.ACR.ICEN := False;
      FLASH_Periph.ACR.DCEN := False;

      RCC_Periph.CR.HSEON := False;
      RCC_Periph.CR.MSIRANGE := 6;
      RCC_Periph.CR.PLLON := False;
      RCC_Periph.PLLCFGR.PLLN := 40;
      RCC_Periph.PLLCFGR.PLLSRC := 1;
      RCC_Periph.CR.PLLON := True;
      loop
         exit when RCC_Periph.CR.PLLRDY;
      end loop;

      RCC_Periph.CFGR.SW := 3;
      loop
         exit when RCC_Periph.CFGR.SWS = 3;
      end loop;
   end Internal_Clocks;
end Hw;
