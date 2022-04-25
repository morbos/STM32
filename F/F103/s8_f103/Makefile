default:
	rm -f obj/Debug/s8
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d s8 >s8.lst; arm-eabi-objdump -s s8 >s8.dmp; arm-eabi-gcc-nm -an s8 >s8.nm; arm-eabi-objcopy -Obinary s8 s8.bin)
