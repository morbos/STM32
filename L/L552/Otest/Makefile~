default:
	rm -f obj/Debug/try_5340
	(export LOADER=RAM_5340; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d try_5340 >try_5340.lst; arm-eabi-objdump -s try_5340 >try_5340.dmp; arm-eabi-gcc-nm -an try_5340 >try_5340.nm; arm-eabi-objcopy -Obinary try_5340 try_5340.bin)
