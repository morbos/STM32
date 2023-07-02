default:
	rm -f obj/Debug/font1306_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d font1306_f103 >font1306_f103.lst; arm-eabi-objdump -s font1306_f103 >font1306_f103.dmp; arm-eabi-gcc-nm -an font1306_f103 >font1306_f103.nm; arm-eabi-objcopy -Obinary font1306_f103 font1306_f103.bin)
