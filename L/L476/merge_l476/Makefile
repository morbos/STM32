default:
	rm -f obj/Debug/merge_l476
	(export LOADER=ROM_L476; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d merge_l476 >merge_l476.lst; arm-eabi-objdump -s merge_l476 >merge_l476.dmp; arm-eabi-gcc-nm -an merge_l476 >merge_l476.nm; arm-eabi-objcopy -Obinary merge_l476 merge_l476.bin)
