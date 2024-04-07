default:
	rm -f obj/Debug/list_l476
	(export LOADER=ROM_L476; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d list_l476 >list_l476.lst; arm-eabi-objdump -s list_l476 >list_l476.dmp; arm-eabi-gcc-nm -an list_l476 >list_l476.nm; arm-eabi-objcopy -Obinary list_l476 list_l476.bin)
