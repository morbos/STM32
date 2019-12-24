default:
#	rm -f obj/Debug/bno_l443
#	(export LOADER=ROM_F103; gprbuild -vh -vP2)
#	(export LOADER=ROM_F103; gprbuild -vP2)
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d bno_l443 >bno_l443.lst; arm-eabi-objdump -s bno_l443 >bno_l443.dmp; arm-eabi-gcc-nm -an bno_l443 >bno_l443.nm; arm-eabi-objcopy -Obinary bno_l443 bno_l443.bin)
