default:
	rm -f obj/Debug/spi
	(export LOADER=RAM_NS_U5xx; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d spi >spi.lst; arm-eabi-objdump -s spi >spi.dmp; arm-eabi-gcc-nm -an spi >spi.nm; arm-eabi-objcopy -Obinary spi spi.bin)
