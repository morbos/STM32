default:
	rm -f obj/Debug/adc_test
	(export LOADER=ROM_WL5x; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d adc_test >adc_test.lst; arm-eabi-objdump -s adc_test >adc_test.dmp; arm-eabi-gcc-nm -an adc_test >adc_test.nm; arm-eabi-objcopy -Obinary adc_test adc_test.bin)
