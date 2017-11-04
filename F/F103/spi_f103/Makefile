default:
	rm -f obj/Debug/spi_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d spi_f103 >spi_f103.lst; arm-eabi-objdump -s spi_f103 >spi_f103.dmp; arm-eabi-gcc-nm -an spi_f103 >spi_f103.nm; arm-eabi-objcopy -Obinary spi_f103 spi_f103.bin)
