default:
	rm -f obj/Production/pinny
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Production; arm-eabi-objdump -d pinny >pinny.lst; arm-eabi-objdump -s pinny >pinny.dmp; arm-eabi-gcc-nm -an pinny >pinny.nm; arm-eabi-objcopy -Obinary pinny pinny.bin)
