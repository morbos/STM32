default:
	rm -f obj/Debug/dac_dma
	gprbuild
	(cd obj/Debug; arm-eabi-objdump -d dac_dma >dac_dma.lst; arm-eabi-objdump -s dac_dma >dac_dma.dmp; arm-eabi-gcc-nm -an dac_dma >dac_dma.nm; arm-eabi-objcopy -Obinary dac_dma dac_dma.bin)
