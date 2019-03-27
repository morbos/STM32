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
	tim17

XMLs := $(patsubst %, %.xml, $(TARGETS))

default: $(TARGETS)
	cat hdr \
	$(XMLs) \
	nvic.xml \
	tail >STM32WB55x.svd
#	/backup/ada/svd2ada/svd2ada STM32WB55x.svd --boolean -o xyz -p STM32_SVD --base-types-package HAL --gen-uint-always

rcc:
	./txt2svd.rb --base 0x58000000 --name RCC rcc.txt >rcc.xml
adc:
	./txt2svd.rb --base 0x50040000 --name ADC adc.txt >adc.xml
dma1:
	./txt2svd.rb --base 0x40020000 --name DMA1 --trim DMA_ dma.txt >dma1.xml
dma2:
	./txt2svd.rb --base 0x40020400 --name DMA2 --trim DMA_ dma.txt >dma2.xml
spi1:
	./txt2svd.rb --base 0x40013000 --name SPI1 --trim SPIx_ spi.txt >spi1.xml
spi2:
	./txt2svd.rb --base 0x40003800 --name SPI1 --trim SPIx_ spi.txt >spi2.xml
i2c1:
	./txt2svd.rb --base 0x40005400 --name I2C1 --trim I2C_ i2c.txt >i2c1.xml
i2c3:
	./txt2svd.rb --base 0x40005c00 --name I2C3 --trim I2C_ i2c.txt >i2c3.xml
lcd:
	./txt2svd.rb --base 0x40002400 --name LCD lcd.txt >lcd.xml
aes1:
	./txt2svd.rb --base 0x50050400 --name AES1 --trim AES_ aes.txt >aes1.xml
aes2:
	./txt2svd.rb --base 0x58001800 --name AES2 --trim AES_ aes.txt >aes2.xml
crc:
	./txt2svd.rb --base 0x40023000 --name CRC  crc.txt >crc.xml
dmamux:
	./txt2svd.rb --base 0x40020800 --name DMAMUX  dmamux.txt >dmamux.xml
exti:
	./txt2svd.rb --base 0x58000800 --name EXTI  exti.txt >exti.xml
flash:
	./txt2svd.rb --base 0x58004000 --name FLASH  flash.txt >flash.xml
pka:
	./txt2svd.rb --base 0x58002000 --name PKA  pka.txt >pka.xml
hsem:
	./txt2svd.rb --base 0x58001400 --name HSEM  hsem.txt >hsem.xml
pwr:
	./txt2svd.rb --base 0x58000400 --name PWR  pwr.txt >pwr.xml
sai1:
	./txt2svd.rb --base 0x40015400 --name SAI  sai.txt >sai1.xml
quadspi:
	./txt2svd.rb --base 0xa0001000 --name QUADSPI  quadspi.txt >quadspi.xml
syscfg:
	./txt2svd.rb --base 0x40010000 --name SYSCFG --size=0x30 syscfg.txt >syscfg.xml
syscfg2:
	./txt2svd.rb --base 0x40010000 --name SYSCFG2 --trim=SYSCFG_ --size=0x200 syscfg2.txt >syscfg2.xml
vrefbuf:
	./txt2svd.rb --base 0x40010030 --name VREFBUF --size=0xd0 vrefbuf.txt >vrefbuf.xml
comp:
	./txt2svd.rb --base 0x40010200 --name COMP --size=0x200 comp.txt >comp.xml
ipcc:
	./txt2svd.rb --base 0x58000c00 --name IPCC ipcc.txt >ipcc.xml
iwdg:
	./txt2svd.rb --base 0x40003000 --name IWDG iwdg.txt >iwdg.xml
wwdg:
	./txt2svd.rb --base 0x40002c00 --name WWDG wwdg.txt >wwdg.xml
usb_fs:
	./txt2svd.rb --base 0x40006800 --name USB_FS usb_fs.txt >usb_fs.xml
usart1:
	./txt2svd.rb --base 0x40013800 --name USART1 --trim=USART_ usart.txt >usart1.xml
tsc:
	./txt2svd.rb --base 0x40024000 --name TSC tsc.txt >tsc.xml
rng:
	./txt2svd.rb --base 0x58001000 --name RNG rng.txt >rng.xml
crs:
	./txt2svd.rb --base 0x40006000 --name CRS crs.txt >crs.xml
rtc:
	./txt2svd.rb --base 0x40002800 --name RTC rtc.txt >rtc.xml
gpioa:
	./txt2svd.rb --base 0x48000000 --name GPIOA gpioa.txt >gpioa.xml
gpiob:
	./txt2svd.rb --base 0x48000400 --name GPIOB gpiob.txt >gpiob.xml
gpioc:
	./txt2svd.rb --base 0x48000800 --name GPIOC --trim=GPIOx_ gpiox.txt >gpioc.xml
gpiod:
	./txt2svd.rb --base 0x48000c00 --name GPIOD --trim=GPIOx_ gpiox.txt >gpiod.xml
gpioe:
	./txt2svd.rb --base 0x48001000 --name GPIOE gpioe.txt >gpioe.xml
gpioh:
	./txt2svd.rb --base 0x48001c00 --name GPIOH gpioh.txt >gpioh.xml
tim1:
	./txt2svd.rb --base 0x40012c00 --name TIM1 tim1.txt >tim1.xml
tim2:
	./txt2svd.rb --base 0x40000000 --name TIM2 tim2.txt >tim2.xml
tim16:
	./txt2svd.rb --base 0x40014400 --name TIM16 --trim=TIMx_ tim16_17.txt >tim16.xml
tim17:
	./txt2svd.rb --base 0x40014800 --name TIM17 --trim=TIMx_ tim16_17.txt >tim17.xml
