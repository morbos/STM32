set pagination off
set logging file rng.log
set logging on
#0x5006 0800 - 0x5006 0BFF 1 KB RNG Section 24.8.4: RNG register map
x/256x 0x50060800
set logging off

set logging file aes.log
set logging on
#0x5006 0000 - 0x5006 03FF 1 KB AES(1) Section 25.14.18: AES register map
x/256x 0x50060000
set logging off


set logging file adc.log
set logging on
#0x5004 0000 - 0x5004 03FF 1 KB ADC Section 16.7.3: ADC register map
x/256x 0x50040000
set logging off

set logging file gpioh.log
set logging on
#0x4800 1C00 - 0x4800 1FFF 1 KB GPIOH Section 8.4.12: GPIO register map
x/256x 0x48001c00
set logging off

set logging file gpioe.log
set logging on
#0x4800 1000 - 0x4800 13FF 1 KB GPIOE(2) Section 8.4.12: GPIO register map
x/256x 0x48001000
set logging off

set logging file gpiod.log
set logging on
#0x4800 0C00 - 0x4800 0FFF 1 KB GPIOD(2) Section 8.4.12: GPIO register map
x/256x 0x48000c00
set logging off

set logging file gpioc.log
set logging on
#0x4800 0800 - 0x4800 0BFF 1 KB GPIOC Section 8.4.12: GPIO register map
x/256x 0x48000800
set logging off

set logging file gpiob.log
set logging on
#0x4800 0400 - 0x4800 07FF 1 KB GPIOB Section 8.4.12: GPIO register map
x/256x 0x48000400
set logging off

set logging file gpioa.log
set logging on
#0x4800 0000 - 0x4800 03FF 1 KB GPIOA Section 8.4.12: GPIO register map
x/256x 0x48000000
set logging off

set logging file tsc.log
set logging on
#0x4002 4000 - 0x4002 43FF 1 KB TSC Section 23.6.11: TSC register map
x/256x 0x40024000
set logging off

set logging file crc.log
set logging on
#0x4002 3000 - 0x4002 33FF 1 KB CRC Section 14.4.6: CRC register map
x/256x 0x40023000
set logging off

set logging file flash.log
set logging on
#0x4002 2000 - 0x4002 23FF 1 KB FLASH
x/256x 0x40022000
set logging off

set logging file rcc.log
set logging on
#0x4002 1000 - 0x4002 13FF 1 KB RCC Section 6.4.32: RCC register map
x/256x 0x40021000
set logging off

set logging file dma2.log
set logging on
#0x4002 0400 - 0x4002 07FF 1 KB DMA2 Section 11.5.9: DMA register map
x/256x 0x40020400
set logging off

set logging file dma1.log
set logging on
#0x4002 0000 - 0x4002 03FF 1 KB DMA1 Section 11.5.9: DMA register map
x/256x 0x40020000
set logging off



0x4001 6000 - 0x4001 63FF 1 KB DFSDM1 Section 21.8.16: DFSDM register map
0x4001 5400 - 0x4001 57FF 1 KB SAI1 Section 39.6.9: SAI register map
0x4001 4400 - 0x4001 47FF 1 KB TIM16 Section 28.6.18: TIM16 register map
0x4001 4000 - 0x4001 43FF 1 KB TIM15 Section 28.5.20: TIM15 register map
0x4001 3800 - 0x4001 3BFF 1 KB USART1 Section 36.8.12: USART register map
0x4001 3000 - 0x4001 33FF 1 KB SPI1 Section 38.6.8: SPI register map
0x4001 2C00 - 0x4001 2FFF 1 KB TIM1 Section 26.4.27: TIM1 register map
0x4001 2800 - 0x4001 2BFF 1 KB SDMMC(2) Section 41.8.16: SDMMC register map
0x4001 1C00 - 0x4001 1FFF 1 KB FIREWALL Section 4.4.8: Firewall register map
0x4001 0400 - 0x4001 07FF 1 KB EXTI Section 13.5.13: EXTI register map

0x4001 0200 - 0x4001 03FF 1 KB COMP Section 19.6.3: COMP register map
0x4001 0030 - 0x4001 01FF 1 KB VREFBUF Section 18.3.3: VREFBUF register map
0x4001 0000 - 0x4001 002F 1 KB SYSCFG Section 9.2.11: SYSCFG register map

0x4000 9400 - 0x4000 97FF 1 KB LPTIM2 Section 30.7.11: LPTIM register map
0x4000 8800 - 0x4000 8BFF 1 KB SWPMI1(3) Section 40.6.10: SWPMI register map and
0x4000 8400 - 0x4000 87FF 1 KB I2C4(4) Section 35.7.12: I2C register map
0x4000 8000 - 0x4000 83FF 1 KB LPUART1 Section 37.7.10: LPUART register map
0x4000 7C00 - 0x4000 7FFF 1 KB LPTIM1 Section 30.7.11: LPTIM register map
0x4000 7800 - 0x4000 7BFF 1 KB OPAMP Section 20.5.4: OPAMP register map
0x4000 7400 - 0x4000 77FF 1 KB DAC1 Section 17.6.21: DAC register map
0x4000 7000 - 0x4000 73FF 1 KB PWR Section 5.4.20: PWR register map and reset
0x4000 6C00 - 0x4000 6FFF 1 KB USB SRAM(5) Section 43.6.3: USB register map
0x4000 6800 - 0x4000 6BFF 1 KB USB FS(5)
0x4000 6400 - 0x4000 67FF 1 KB CAN1 Section 42.9.5: bxCAN register map
0x4000 6000 - 0x4000 63FF 1 KB CRS Section 7.6.5: CRS register map
0x4000 5C00 - 0x4000 5FFF 1 KB I2C3 Section 35.7.12: I2C register map
0x4000 5800 - 0x4000 5BFF 1 KB I2C2 Section 35.7.12: I2C register map
0x4000 5400 - 0x4000 57FF 1 KB I2C1 Section 35.7.12: I2C register map
0x4000 4C00 - 0x4000 4FFF 1 KB USART4 Section 36.8.12: USART register map
0x4000 4800 - 0x4000 4BFF 1 KB USART3 Section 36.8.12: USART register map
0x4000 4400 - 0x4000 47FF 1 KB USART2 Section 36.8.12: USART register map
0x4000 3C00 - 0x4000 3FFF 1 KB SPI3 Section 38.6.8: SPI register map
0x4000 3800 - 0x4000 3BFF 1 KB SPI2 Section 38.6.8: SPI register map
0x4000 3000 - 0x4000 33FF 1 KB IWDG Section 32.4.6: IWDG register map
0x4000 2C00 - 0x4000 2FFF 1 KB WWDG Section 33.4.4: WWDG register map
0x4000 2800 - 0x4000 2BFF 1 KB RTC Section 34.6.21: RTC register map
0x4000 2400 - 0x4000 27FF 1 KB LCD(6) Section 22.6.6: LCD register map
0x4000 1400 - 0x4000 17FF 1 KB TIM7 Section 29.4.9: TIM6/TIM7 register map
0x4000 1000 - 0x4000 13FF 1 KB TIM6 Section 29.4.9: TIM6/TIM7 register map
0x4000 0400 - 0x4000 07FF 1 KB TIM3 Section 27.4.21: TIMx register map
0x4000 0000 - 0x4000 03FF 1 KB TIM2 Section 27.4.21: TIMx register map

quit
