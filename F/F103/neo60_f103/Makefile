default:
	rm -f obj/Debug/neo60_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d neo60_f103 >neo60_f103.lst; arm-eabi-objdump -s neo60_f103 >neo60_f103.dmp; arm-eabi-gcc-nm -an neo60_f103 >neo60_f103.nm; arm-eabi-objcopy -Obinary neo60_f103 neo60_f103.bin)
