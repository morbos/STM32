default:
	rm -f obj/Debug/helper
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d helper >helper.lst; arm-eabi-objdump -s helper >helper.dmp; arm-eabi-gcc-nm -an helper >helper.nm; arm-eabi-objcopy -Obinary helper helper.bin)
