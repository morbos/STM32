default:
	rm -f obj/Debug/as5048a_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d as5048a_f103 >as5048a_f103.lst; arm-eabi-objdump -s as5048a_f103 >as5048a_f103.dmp; arm-eabi-gcc-nm -an as5048a_f103 >as5048a_f103.nm; arm-eabi-objcopy -Obinary as5048a_f103 as5048a_f103.bin)
