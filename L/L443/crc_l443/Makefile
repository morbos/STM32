default:
#	rm -f obj/Debug/crc_l443
#	(export LOADER=ROM_L443; gprbuild)
	(export LOADER=ROM_L443; gprbuild -vh)
	(cd obj/Debug; arm-eabi-objdump -d crc_l443 >crc_l443.lst; arm-eabi-objdump -s crc_l443 >crc_l443.dmp; arm-eabi-gcc-nm -an crc_l443 >crc_l443.nm; arm-eabi-objcopy -Obinary crc_l443 crc_l443.bin)
