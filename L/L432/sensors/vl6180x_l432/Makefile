default:
	rm -f obj/Debug/vl6180x_l432
	(export LOADER=ROM_L432; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d vl6180x_l432 >vl6180x_l432.lst; arm-eabi-objdump -s vl6180x_l432 >vl6180x_l432.dmp; arm-eabi-gcc-nm -an vl6180x_l432 >vl6180x_l432.nm; arm-eabi-objcopy -Obinary vl6180x_l432 vl6180x_l432.bin)
