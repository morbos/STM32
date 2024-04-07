default:
	rm -f obj/Debug/sx1276_shutdown_l443
	(export LOADER=ROM_L443; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d sx1276_shutdown_l443 >sx1276_shutdown_l443.lst; arm-eabi-objdump -s sx1276_shutdown_l443 >sx1276_shutdown_l443.dmp; arm-eabi-gcc-nm -an sx1276_shutdown_l443 >sx1276_shutdown_l443.nm; arm-eabi-objcopy -Obinary sx1276_shutdown_l443 sx1276_shutdown_l443.bin)
