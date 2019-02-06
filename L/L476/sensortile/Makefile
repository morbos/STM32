default:
	rm -f obj/Debug/sensortile
	(export LOADER=ROM_L476; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d sensortile >sensortile.lst; arm-eabi-objdump -s sensortile >sensortile.dmp; arm-eabi-gcc-nm -an sensortile >sensortile.nm; arm-eabi-objcopy -Obinary sensortile sensortile.bin)
