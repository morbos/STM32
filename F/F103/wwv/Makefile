default:
	rm -f obj/Debug/wwv
	(export LOADER=ROM_F103; gprbuild)
#	(cd obj/Debug; arm-eabi-objdump -d vl53l0x_f103 >vl53l0x_f103.lst; arm-eabi-objdump -s vl53l0x_f103 >vl53l0x_f103.dmp; arm-eabi-gcc-nm -an wwv_f103 >wwv_f103.nm; arm-eabi-objcopy -Obinary wwv_f103 wwv_f103.bin)
	(cd obj/Debug; arm-eabi-objdump -d wwv >wwv.lst; arm-eabi-objdump -s wwv >wwv.dmp; arm-eabi-gcc-nm -an wwv >wwv.nm; arm-eabi-objcopy -Obinary wwv wwv.bin)
