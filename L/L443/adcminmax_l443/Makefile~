default:
	rm -f obj/Debug/adcgpio_l443
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d adcgpio_l443 >adcgpio_l443.lst; arm-eabi-objdump -s adcgpio_l443 >adcgpio_l443.dmp; arm-eabi-gcc-nm -an adcgpio_l443 >adcgpio_l443.nm; arm-eabi-objcopy -Obinary adcgpio_l443 adcgpio_l443.bin)
