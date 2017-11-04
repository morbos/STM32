default:
	rm -f obj/Debug/vl53l0x_f722
	gprbuild
	(cd obj/Debug; arm-eabi-objdump -d vl53l0x_f722 >vl53l0x_f722.lst; arm-eabi-objdump -s vl53l0x_f722 >vl53l0x_f722.dmp; arm-eabi-gcc-nm -an vl53l0x_f722 >vl53l0x_f722.nm; arm-eabi-objcopy -Obinary vl53l0x_f722 vl53l0x_f722.bin)
