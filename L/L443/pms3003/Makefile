default:
	rm -f obj/Debug/pms5000
#	(export LOADER=ROM_L443; gprbuild -vh)
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d pms5000 >pms5000.lst; arm-eabi-objdump -s pms5000 >pms5000.dmp; arm-eabi-gcc-nm -an pms5000 >pms5000.nm; arm-eabi-objcopy -Obinary pms5000 pms5000.bin)
