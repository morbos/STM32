default:
	rm -f obj/Debug/sx1276_l073
	(export LOADER=ROM_L073; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d sx1276_l073 >sx1276_l073.lst; arm-eabi-objdump -s sx1276_l073 >sx1276_l073.dmp; arm-eabi-gcc-nm -an sx1276_l073 >sx1276_l073.nm; arm-eabi-objcopy -Obinary sx1276_l073 sx1276_l073.bin)
