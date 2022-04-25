default:
	rm -f obj/Debug/waveshare_epd_1_54
#	rm -f obj/Production/waveshare_epd_1_54
	(export LOADER=ROM_L5x2; gprbuild waveshare_epd_1_54.gpr)
	(cd obj/Debug; arm-eabi-objdump -d waveshare_epd_1_54 >waveshare_epd_1_54.lst; arm-eabi-objdump -s waveshare_epd_1_54 >waveshare_epd_1_54.dmp; arm-eabi-gcc-nm -an waveshare_epd_1_54 >waveshare_epd_1_54.nm; arm-eabi-objcopy -Obinary waveshare_epd_1_54 waveshare_epd_1_54.bin)
