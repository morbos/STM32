default:
	rm -f obj/Debug/ex4
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d ex4 >ex4.lst; arm-eabi-objdump -s ex4 >ex4.dmp; arm-eabi-gcc-nm -an ex4 >ex4.nm; arm-eabi-objcopy -Obinary ex4 ex4.bin)
