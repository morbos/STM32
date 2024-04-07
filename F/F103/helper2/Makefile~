default:
	rm -f obj/Debug/helper2
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d helper2 >helper2.lst; arm-eabi-objdump -s helper2 >helper2.dmp; arm-eabi-gcc-nm -an helper2 >helper2.nm; arm-eabi-objcopy -Obinary helper2 helper2.bin)
