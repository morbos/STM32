default:
	rm -f obj/Debug/try
	(export LOADER=RAM_NS_U5xx; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d try >try.lst; arm-eabi-objdump -s try >try.dmp; arm-eabi-gcc-nm -an try >try.nm; arm-eabi-objcopy -Obinary try try.bin)
