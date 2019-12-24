VPATH = ./src
default:
	rm -f obj/Debug/c2ada
#	(export LOADER=ROM_L443; gprbuild -bargs:Ada -n)
#	(cd obj/Debug; arm-eabi-objdump -d c2ada >c2ada.lst; arm-eabi-objdump -s c2ada >c2ada.dmp; a#rm-eabi-gcc-nm -an c2ada >c2ada.nm; arm-eabi-objcopy -Obinary c2ada c2ada.bin)
	gnatmake -c src/c2ada
	gnatmake -c src/test
