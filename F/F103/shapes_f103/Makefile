default:
	rm -f obj/Debug/shapes_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d shapes_f103 >shapes_f103.lst; arm-eabi-objdump -s shapes_f103 >shapes_f103.dmp; arm-eabi-gcc-nm -an shapes_f103 >shapes_f103.nm; arm-eabi-objcopy -Obinary shapes_f103 shapes_f103.bin)
