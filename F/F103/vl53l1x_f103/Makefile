#DIR=Production
DIR=Debug
default:
	rm -f obj/$(DIR)/vl53l1x_f103
	(export LOADER=ROM_F103; gprbuild -j24)
	(cd obj/$(DIR); arm-eabi-objdump -d vl53l1x_f103 >vl53l1x_f103.lst; arm-eabi-objdump -s vl53l1x_f103 >vl53l1x_f103.dmp; arm-eabi-gcc-nm -an vl53l1x_f103 >vl53l1x_f103.nm; arm-eabi-objcopy -Obinary vl53l1x_f103 vl53l1x_f103.bin)
