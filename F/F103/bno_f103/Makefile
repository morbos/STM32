default:
#	rm -f obj/Debug/bno_f103
#	(export LOADER=ROM_F103; gprbuild -vh -vP2)
#	(export LOADER=ROM_F103; gprbuild -vP2)
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d bno_f103 >bno_f103.lst; arm-eabi-objdump -s bno_f103 >bno_f103.dmp; arm-eabi-gcc-nm -an bno_f103 >bno_f103.nm; arm-eabi-objcopy -Obinary bno_f103 bno_f103.bin)
