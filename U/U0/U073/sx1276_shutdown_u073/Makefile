default:
	rm -f obj/Debug/sx1276_shutdown_u073
	(export LOADER=ROM_U073; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d sx1276_shutdown_u073 >sx1276_shutdown_u073.lst; arm-eabi-objdump -s sx1276_shutdown_u073 >sx1276_shutdown_u073.dmp; arm-eabi-gcc-nm -an sx1276_shutdown_u073 >sx1276_shutdown_u073.nm; arm-eabi-objcopy -Obinary sx1276_shutdown_u073 sx1276_shutdown_u073.bin)
