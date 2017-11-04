default:
#	rm -f obj/Debug/crc_f103
#	(export LOADER=ROM_F103; gprbuild -vh -vP2)
#	(export LOADER=ROM_F103; gprbuild -vP2)
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d crc_f103 >crc_f103.lst; arm-eabi-objdump -s crc_f103 >crc_f103.dmp; arm-eabi-gcc-nm -an crc_f103 >crc_f103.nm; arm-eabi-objcopy -Obinary crc_f103 crc_f103.bin)
