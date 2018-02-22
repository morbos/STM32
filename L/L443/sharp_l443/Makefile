default:
	rm -f obj/Debug/sharp_l443
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d sharp_l443 >sharp_l443.lst; arm-eabi-objdump -s sharp_l443 >sharp_l443.dmp; arm-eabi-gcc-nm -an sharp_l443 >sharp_l443.nm; arm-eabi-objcopy -Obinary sharp_l443 sharp_l443.bin)
