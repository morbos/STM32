default:
	rm -f obj/Debug/flat
	(export LOADER=ROM_L5x2; gprbuild -vh flat.gpr)
	(cd obj/Debug; arm-eabi-objdump -d flat >flat.lst; arm-eabi-objdump -s flat >flat.dmp; arm-eabi-gcc-nm -an flat >flat.nm; arm-eabi-objcopy -Obinary flat flat.bin)
