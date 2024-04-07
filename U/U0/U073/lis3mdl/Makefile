default:
	(export LOADER=ROM_U073; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d lis3mdl_u073 >lis3mdl_u073.lst; arm-eabi-objdump -s lis3mdl_u073 >lis3mdl_u073.dmp; arm-eabi-gcc-nm -an lis3mdl_u073 >lis3mdl_u073.nm; arm-eabi-objcopy -Obinary lis3mdl_u073 lis3mdl_u073.bin)
