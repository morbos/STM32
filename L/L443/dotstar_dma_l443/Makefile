default:
	rm -f obj/Debug/dotstar_dma_l443
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d dotstar_dma_l443 >dotstar_dma_l443.lst; arm-eabi-objdump -s dotstar_dma_l443 >dotstar_dma_l443.dmp; arm-eabi-gcc-nm -an dotstar_dma_l443 >dotstar_dma_l443.nm; arm-eabi-objcopy -Obinary dotstar_dma_l443 dotstar_dma_l443.bin)
