#DIR=Production
DIR=Debug
default:
	rm -f obj/$(DIR)/lps22hb_l443
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/$(DIR); arm-eabi-objdump -d lps22hb_l443 >lps22hb_l443.lst; arm-eabi-objdump -s lps22hb_l443 >lps22hb_l443.dmp; arm-eabi-gcc-nm -an lps22hb_l443 >lps22hb_l443.nm; arm-eabi-objcopy -Obinary lps22hb_l443 lps22hb_l443.bin)
