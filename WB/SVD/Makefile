TARGETS := \
	rcc \
	adc \
	dma1 \
	dma2 \
	spi1 \
	spi2 \
	i2c1 \
	i2c3 \
	comp \
	lcd \
	aes1 \
	aes2 \
	crc \
	dmamux \
	exti \
	flash \
	pka \
	hsem \
	pwr \
	sai1 \
	quadspi \
	syscfg \
	syscfg2 \
	vrefbuf \
	ipcc \
	iwdg \
	wwdg \
	usb_fs \
	usart1 \
	tsc \
	rng \
	crs \
	rtc \
	gpioa \
	gpiob \
	gpioc \
	gpiod \
	gpioe \
	gpioh \
	tim1 \
	tim2 \
	tim16 \
	tim17 \
	lptim1 \
	lptim2

#TARGETS := \
#	dma1 \
#	exti

XMLs := $(patsubst %, %.xml, $(TARGETS))
SVD2ADA=/backup/ada/svd2ada/svd2ada
#SVD2ADA=/.share/CACHEDEV1_DATA/Ada/svd2ada/svd2ada
default: $(TARGETS)
	cat hdr \
	$(XMLs) \
	scb.xml \
	mpu.xml \
	stk.xml \
	fpu.xml \
	nvic.xml \
	dbgmcu.xml \
	tail >STM32WB55x.svd
	$(SVD2ADA) STM32WB55x.svd --boolean -o svd -p STM32_SVD --base-types-package HAL --gen-uint-always
	$(SVD2ADA) STM32WB55x.svd -o interfaces -p Interfaces.STM32 --base-types-package Interfaces.Bit_Types
rcc:
	./txt2svd.rb --base 0x58000000 --name RCC \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[5]" \
		rcc.txt >rcc.xml
adc:
	./txt2svd.rb --base 0x50040000 --name ADC  \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[18]" \
		adc.txt >adc.xml
dma1:
	./txt2svd.rb --base 0x40020000 --name DMA1 --root=DMA \
		--trim DMA_ \
		--interrupt="[\"%s_CH%d\"]" \
		--interrupt_range="[1..7]" \
		--interrupt_num="[10]" \
		dma.txt >dma1.xml
dma2:
	./txt2svd.rb --base 0x40020400 --name DMA2 --root=DMA \
		--trim DMA_ \
		--interrupt="[\"%s_CH%d\"]" \
		--interrupt_range="[1..7]" \
		--interrupt_num="[54]" \
		dma.txt >dma2.xml
spi1:
	./txt2svd.rb --base 0x40013000 --name SPI1 --root=SPI \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[34]" \
		--trim SPIx_ spi.txt >spi1.xml
spi2:
	./txt2svd.rb --base 0x40003800 --name SPI2 --root=SPI \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[35]" \
		--trim SPIx_ spi.txt >spi2.xml
i2c1:
	./txt2svd.rb --base 0x40005400 --name I2C1 --root=I2C \
		--interrupt="[\"%s_EV\",\"%s_ER\"]" \
		--interrupt_num="[30,31]" \
		--trim I2C_ i2c.txt >i2c1.xml
i2c3:
	./txt2svd.rb --base 0x40005c00 --name I2C3 --root=I2C \
		--interrupt="[\"%s_EV\",\"%s_ER\"]" \
		--interrupt_num="[32,33]" \
		--trim I2C_ i2c.txt >i2c3.xml
lcd:
	./txt2svd.rb --base 0x40002400 --name LCD \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[49]" \
		lcd.txt >lcd.xml
aes1:
	./txt2svd.rb --base 0x50050400 --name AES1 \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[51]" \
		--root=AES --trim AES_ aes.txt >aes1.xml
aes2:
	./txt2svd.rb --base 0x58001800 --name AES2 \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[52]" \
		--root=AES --trim AES_ aes.txt >aes2.xml
crc:
	./txt2svd.rb --base 0x40023000 --name CRC  crc.txt >crc.xml
dmamux:
	./txt2svd.rb --base 0x40020800 --name DMAMUX \
		--interrupt="[\"%s_OVR\"]" \
		--interrupt_num="[62]" \
		dmamux.txt >dmamux.xml
exti:
	./txt2svd.rb --base 0x58000800 --name EXTI \
		--interrupt="[\"PVD\",\"%s%d\",\"EXTI9_5\",\"EXTI15_10\"]" \
		--interrupt_range="[nil,0..4,nil]" \
		--interrupt_num="[1,6,23,40]" \
		exti.txt >exti.xml
flash:
	./txt2svd.rb --base 0x58004000 --name FLASH \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[4]" \
		 flash.txt >flash.xml
pka:
	./txt2svd.rb --base 0x58002000 --name PKA  pka.txt >pka.xml
hsem:
	./txt2svd.rb --base 0x58001400 --name HSEM  \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[46]" \
		hsem.txt >hsem.xml
pwr:
	./txt2svd.rb --base 0x58000400 --name PWR \
		--interrupt="[\"C2SEV_%s_C2H\",\"%s_SOTF_BLEACT_802ACT_RFPHASE\"]" \
		--interrupt_num="[21,43]" \
		pwr.txt >pwr.xml
sai1:
	./txt2svd.rb --base 0x40015400 --name SAI  \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[38]" \
		sai.txt >sai1.xml
quadspi:
	./txt2svd.rb --base 0xa0001000 --name QUADSPI \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[50]" \
		quadspi.txt >quadspi.xml
syscfg:
	./txt2svd.rb --base 0x40010000 --name SYSCFG --size=0x30 syscfg.txt >syscfg.xml
syscfg2:
	./txt2svd.rb --base 0x40010000 --name SYSCFG2 --trim=SYSCFG_ --size=0x200 syscfg2.txt >syscfg2.xml
vrefbuf:
	./txt2svd.rb --base 0x40010030 --name VREFBUF --size=0xd0 vrefbuf.txt >vrefbuf.xml
comp:
	./txt2svd.rb --base 0x40010200 --name COMP  \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[22]" \
		--size=0x200 comp.txt >comp.xml
ipcc:
	./txt2svd.rb --base 0x58000c00 --name IPCC \
		--interrupt="[\"%s_C1_RX\",\"%s_C1_TX\"]" \
		--interrupt_num="[44,45]" \
		ipcc.txt >ipcc.xml
iwdg:
	./txt2svd.rb --base 0x40003000 --name IWDG iwdg.txt >iwdg.xml
wwdg:
	./txt2svd.rb --base 0x40002c00 --name WWDG \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[0]" \
		wwdg.txt >wwdg.xml
usb_fs:
	./txt2svd.rb --base 0x40006800 --name USB_FS \
		--interrupt="[\"USB_HP\",\"USB_LP\"]" \
		--interrupt_range="[nil,nil]" \
		--interrupt_num="[19,20]" \
		usb_fs.txt >usb_fs.xml
usart1:
	./txt2svd.rb --base 0x40013800 --name USART1 \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[36]" \
		--trim=USART_ usart.txt >usart1.xml
tsc:
	./txt2svd.rb --base 0x40024000 --name TSC \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[39]" \
		tsc.txt >tsc.xml
rng:
	./txt2svd.rb --base 0x58001000 --name RNG  \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[53]" \
		rng.txt >rng.xml
crs:
	./txt2svd.rb --base 0x40006000 --name CRS  \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[42]" \
		crs.txt >crs.xml
rtc:
	./txt2svd.rb --base 0x40002800 --name RTC \
		--interrupt="[\"TAMP\",\"RTC_WKUP\",\"RTC_ALARM\"]" \
		--interrupt_range="[nil,nil,nil]" \
		--interrupt_num="[2,3,41]" \
		rtc.txt >rtc.xml
gpioa:
	./txt2svd.rb --base 0x48000000 --name GPIOA --root=GPIO gpioa.txt >gpioa.xml
gpiob:
	./txt2svd.rb --base 0x48000400 --name GPIOB --trim=GPIOA_ --root=GPIO gpioa.txt >gpiob.xml
gpioc:
	./txt2svd.rb --base 0x48000800 --name GPIOC --trim=GPIOA_ --root=GPIO gpioa.txt >gpioc.xml
gpiod:
	./txt2svd.rb --base 0x48000c00 --name GPIOD --trim=GPIOA_ --root=GPIO gpioa.txt >gpiod.xml
gpioe:
	./txt2svd.rb --base 0x48001000 --name GPIOE --trim=GPIOA_ --root=GPIO gpioa.txt >gpioe.xml
gpioh:
	./txt2svd.rb --base 0x48001c00 --name GPIOH --trim=GPIOA_ --root=GPIO gpioa.txt >gpioh.xml
tim1:
	./txt2svd.rb --base 0x40012c00 --name TIM1  \
		--interrupt="[\"%s_CC\",\"%s_BRK\"]" \
		--interrupt_num="[27,24]" \
		tim1.txt >tim1.xml
tim2:
	./txt2svd.rb --base 0x40000000 --name TIM2  \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[28]" \
		tim2.txt >tim2.xml
tim16:
	./txt2svd.rb --base 0x40014400 --name TIM16  \
		--interrupt="[\"TIM1_UP_%s\"]" \
		--interrupt_num="[25]" \
		--trim=TIMx_ tim16_17.txt >tim16.xml
tim17:
	./txt2svd.rb --base 0x40014800 --name TIM17  \
		--interrupt="[\"TIM1_TRG_COM_%s\"]" \
		--interrupt_num="[26]" \
		--trim=TIMx_ tim16_17.txt >tim17.xml
lptim1:
	./txt2svd.rb --base 0x40007c00 --name LPTIM1  \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[47]" \
		--trim=LPTIM_ \
		lptim.txt >lptim1.xml
lptim2:
	./txt2svd.rb --base 0x40008000 --name LPTIM2  \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[48]" \
		--trim=LPTIM_ \
		lptim.txt >lptim2.xml
