default:
#	rm -f obj/Debug/fonts_f103
	rm -f obj/Debug/aqi
	(export LOADER=ROM_F103; gprbuild)
#	(cd obj/Debug; arm-eabi-objdump -d aqi >aqi.lst; arm-eabi-objdump -s aqi >aqi.dmp; arm-eabi-gcc-nm -an aqi >aqi.nm; arm-eabi-objcopy -Obinary aqi aqi.bin)
	(cd obj/Debug; arm-eabi-objdump -d aqi >aqi.lst; arm-eabi-objdump -s aqi >aqi.dmp; arm-eabi-gcc-nm -an aqi >aqi.nm; arm-eabi-objcopy -Obinary aqi aqi.bin)
