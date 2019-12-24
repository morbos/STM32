default:
	rm -f obj/Debug/font1306_l443
#	rm -f obj/Production/font1306_l443
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d font1306_l443 >font1306_l443.lst; arm-eabi-objdump -s font1306_l443 >font1306_l443.dmp; arm-eabi-gcc-nm -an font1306_l443 >font1306_l443.nm; arm-eabi-objcopy -Obinary font1306_l443 font1306_l443.bin)
