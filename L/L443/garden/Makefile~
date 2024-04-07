default:
	rm -f obj/Debug/sx1276_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d sx1276_f103 >sx1276_f103.lst; arm-eabi-objdump -s sx1276_f103 >sx1276_f103.dmp; arm-eabi-gcc-nm -an sx1276_f103 >sx1276_f103.nm; arm-eabi-objcopy -Obinary sx1276_f103 sx1276_f103.bin)
