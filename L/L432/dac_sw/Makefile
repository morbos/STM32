default:
	rm -f obj/Debug/dac_sw
#	(export LOADER=ROM_L496; gprbuild -vh -vP2)
	(export LOADER=ROM_L432; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d dac_sw >dac_sw.lst; arm-eabi-objdump -s dac_sw >dac_sw.dmp; arm-eabi-gcc-nm -an dac_sw >dac_sw.nm; arm-eabi-objcopy -Obinary dac_sw dac_sw.bin)
