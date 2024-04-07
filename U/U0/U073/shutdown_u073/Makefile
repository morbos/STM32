default:
	rm -f obj/Debug/shutdown_u073
	(export LOADER=ROM_U073; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d shutdown_u073 >shutdown_u073.lst; arm-eabi-objdump -s shutdown_u073 >shutdown_u073.dmp; arm-eabi-gcc-nm -an shutdown_u073 >shutdown_u073.nm; arm-eabi-objcopy -Obinary shutdown_u073 shutdown_u073.bin)
