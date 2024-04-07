default:
	rm -f obj/Debug/i2c_1306
	(export LOADER=ROM_WL5x; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d i2c_1306 >i2c_1306.lst; arm-eabi-objdump -s i2c_1306 >i2c_1306.dmp; arm-eabi-gcc-nm -an i2c_1306 >i2c_1306.nm; arm-eabi-objcopy -Obinary i2c_1306 i2c_1306.bin)
