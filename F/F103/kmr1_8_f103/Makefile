default:
	rm -f obj/Debug/kmr1_8_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d kmr1_8_f103 >kmr1_8_f103.lst; arm-eabi-objdump -s kmr1_8_f103 >kmr1_8_f103.dmp; arm-eabi-gcc-nm -an kmr1_8_f103 >kmr1_8_f103.nm; arm-eabi-objcopy -Obinary kmr1_8_f103 kmr1_8_f103.bin)
