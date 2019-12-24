default:
	rm -f obj/Debug/lsm_font_l443
#	rm -f obj/Production/lsm_font_l443
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d lsm_font_l443 >lsm_font_l443.lst; arm-eabi-objdump -s lsm_font_l443 >lsm_font_l443.dmp; arm-eabi-gcc-nm -an lsm_font_l443 >lsm_font_l443.nm; arm-eabi-objcopy -Obinary lsm_font_l443 lsm_font_l443.bin)
