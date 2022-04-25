default:
	rm -f obj/Debug/clkreq_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d clkreq_f103 >clkreq_f103.lst; arm-eabi-objdump -s clkreq_f103 >clkreq_f103.dmp; arm-eabi-gcc-nm -an clkreq_f103 >clkreq_f103.nm; arm-eabi-objcopy -Obinary clkreq_f103 clkreq_f103.bin)
