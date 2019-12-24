default:
#	rm -f obj/Debug/fonts_f103
	rm -f obj/Production/fonts_f103
	(export LOADER=ROM_F103; gprbuild)
#	(cd obj/Debug; arm-eabi-objdump -d fonts_f103 >fonts_f103.lst; arm-eabi-objdump -s fonts_f103 >fonts_f103.dmp; arm-eabi-gcc-nm -an fonts_f103 >fonts_f103.nm; arm-eabi-objcopy -Obinary fonts_f103 fonts_f103.bin)
	(cd obj/Production; arm-eabi-objdump -d fonts_f103 >fonts_f103.lst; arm-eabi-objdump -s fonts_f103 >fonts_f103.dmp; arm-eabi-gcc-nm -an fonts_f103 >fonts_f103.nm; arm-eabi-objcopy -Obinary fonts_f103 fonts_f103.bin)
