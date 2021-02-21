default:
	rm -f obj/Debug/adc_i2c
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d adc_i2c >adc_i2c.lst; arm-eabi-objdump -s adc_i2c >adc_i2c.dmp; arm-eabi-gcc-nm -an adc_i2c >adc_i2c.nm; arm-eabi-objcopy -Obinary adc_i2c adc_i2c.bin)
