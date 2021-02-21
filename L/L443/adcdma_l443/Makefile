default:
	rm -f obj/Debug/adcdma_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d adcdma_f103 >adcdma_f103.lst; arm-eabi-objdump -s adcdma_f103 >adcdma_f103.dmp; arm-eabi-gcc-nm -an adcdma_f103 >adcdma_f103.nm; arm-eabi-objcopy -Obinary adcdma_f103 adcdma_f103.bin)
