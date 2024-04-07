default:
	(export LOADER=ROM_F103; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d lis3mdl_f103 >lis3mdl_f103.lst; arm-eabi-objdump -s lis3mdl_f103 >lis3mdl_f103.dmp; arm-eabi-gcc-nm -an lis3mdl_f103 >lis3mdl_f103.nm; arm-eabi-objcopy -Obinary lis3mdl_f103 lis3mdl_f103.bin)
