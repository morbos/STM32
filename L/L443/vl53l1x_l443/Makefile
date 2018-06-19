#DIR=Production
DIR=Debug
default:
	rm -f obj/$(DIR)/vl53l1x_l443
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/$(DIR); arm-eabi-objdump -d vl53l1x_l443 >vl53l1x_l443.lst; arm-eabi-objdump -s vl53l1x_l443 >vl53l1x_l443.dmp; arm-eabi-gcc-nm -an vl53l1x_l443 >vl53l1x_l443.nm; arm-eabi-objcopy -Obinary vl53l1x_l443 vl53l1x_l443.bin)
