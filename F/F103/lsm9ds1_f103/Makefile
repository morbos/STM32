default:
	rm -f obj/Debug/lsm9ds1_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d lsm9ds1_f103 >lsm9ds1_f103.lst; arm-eabi-objdump -s lsm9ds1_f103 >lsm9ds1_f103.dmp; arm-eabi-gcc-nm -an lsm9ds1_f103 >lsm9ds1_f103.nm; arm-eabi-objcopy -Obinary lsm9ds1_f103 lsm9ds1_f103.bin)
