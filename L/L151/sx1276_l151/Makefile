default:
	rm -f obj/Debug/sx1276_l151
	(export LOADER=ROM_L151; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d sx1276_l151 >sx1276_l151.lst; arm-eabi-objdump -s sx1276_l151 >sx1276_l151.dmp; arm-eabi-gcc-nm -an sx1276_l151 >sx1276_l151.nm; arm-eabi-objcopy -Obinary sx1276_l151 sx1276_l151.bin)
