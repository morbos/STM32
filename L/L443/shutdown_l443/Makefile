default:
	rm -f obj/Debug/shutdown_l443
	(export LOADER=ROM_L443; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d shutdown_l443 >shutdown_l443.lst; arm-eabi-objdump -s shutdown_l443 >shutdown_l443.dmp; arm-eabi-gcc-nm -an shutdown_l443 >shutdown_l443.nm; arm-eabi-objcopy -Obinary shutdown_l443 shutdown_l443.bin)
