default:
	rm -f obj/Debug/lis3dh_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d lis3dh_f103 >lis3dh_f103.lst; arm-eabi-objdump -s lis3dh_f103 >lis3dh_f103.dmp; arm-eabi-gcc-nm -an lis3dh_f103 >lis3dh_f103.nm; arm-eabi-objcopy -Obinary lis3dh_f103 lis3dh_f103.bin)
