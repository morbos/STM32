default:
	rm -f obj/Debug/tdc1304
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d tdc1304 >tdc1304.lst; arm-eabi-objdump -s tdc1304 >tdc1304.dmp; arm-eabi-gcc-nm -an tdc1304 >tdc1304.nm; arm-eabi-objcopy -Obinary tdc1304 tdc1304.bin)
