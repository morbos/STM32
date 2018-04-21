default:
	rm -f obj/Debug/vl53l0x_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d vl53l0x_f103 >vl53l0x_f103.lst; arm-eabi-objdump -s vl53l0x_f103 >vl53l0x_f103.dmp; arm-eabi-gcc-nm -an vl53l0x_f103 >vl53l0x_f103.nm; arm-eabi-objcopy -Obinary vl53l0x_f103 vl53l0x_f103.bin)
