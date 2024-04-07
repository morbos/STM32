default:
	rm -f obj/Debug/helper3
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d helper3 >helper3.lst; arm-eabi-objdump -s helper3 >helper3.dmp; arm-eabi-gcc-nm -an helper3 >helper3.nm; arm-eabi-objcopy -Obinary helper3 helper3.bin)
