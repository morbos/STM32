default:
#	rm -f obj/Debug/fonts_f103
	rm -f obj/Debug/co2
	(export LOADER=ROM_F103; gprbuild)
#	(cd obj/Debug; arm-eabi-objdump -d co2 >co2.lst; arm-eabi-objdump -s co2 >co2.dmp; arm-eabi-gcc-nm -an co2 >co2.nm; arm-eabi-objcopy -Obinary co2 co2.bin)
	(cd obj/Debug; arm-eabi-objdump -d co2 >co2.lst; arm-eabi-objdump -s co2 >co2.dmp; arm-eabi-gcc-nm -an co2 >co2.nm; arm-eabi-objcopy -Obinary co2 co2.bin)
