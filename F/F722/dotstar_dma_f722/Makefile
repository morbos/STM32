default:
	rm -f obj/Debug/dotstar_dma_f722
	gprbuild
	(cd obj/Debug; arm-eabi-objdump -d dotstar_dma_f722 >dotstar_dma_f722.lst; arm-eabi-objdump -s dotstar_dma_f722 >dotstar_dma_f722.dmp; arm-eabi-gcc-nm -an dotstar_dma_f722 >dotstar_dma_f722.nm; arm-eabi-objcopy -Obinary dotstar_dma_f722 dotstar_dma_f722.bin)
