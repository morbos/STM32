default:
	rm -f obj/Debug/stop2_l443
	(export LOADER=ROM_L443; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d stop2_l443 >stop2_l443.lst; arm-eabi-objdump -s stop2_l443 >stop2_l443.dmp; arm-eabi-gcc-nm -an stop2_l443 >stop2_l443.nm; arm-eabi-objcopy -Obinary stop2_l443 stop2_l443.bin)
