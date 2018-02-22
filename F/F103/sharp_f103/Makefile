default:
	rm -f obj/Debug/sharp_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d sharp_f103 >sharp_f103.lst; arm-eabi-objdump -s sharp_f103 >sharp_f103.dmp; arm-eabi-gcc-nm -an sharp_f103 >sharp_f103.nm; arm-eabi-objcopy -Obinary sharp_f103 sharp_f103.bin)
