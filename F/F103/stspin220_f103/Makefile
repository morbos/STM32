default:
	rm -f obj/Debug/stspin220_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d stspin220_f103 >stspin220_f103.lst; arm-eabi-objdump -s stspin220_f103 >stspin220_f103.dmp; arm-eabi-gcc-nm -an stspin220_f103 >stspin220_f103.nm; arm-eabi-objcopy -Obinary stspin220_f103 stspin220_f103.bin)
