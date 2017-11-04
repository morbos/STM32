default:
	rm -f obj/Debug/adcgpio_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d adcgpio_f103 >adcgpio_f103.lst; arm-eabi-objdump -s adcgpio_f103 >adcgpio_f103.dmp; arm-eabi-gcc-nm -an adcgpio_f103 >adcgpio_f103.nm; arm-eabi-objcopy -Obinary adcgpio_f103 adcgpio_f103.bin)
