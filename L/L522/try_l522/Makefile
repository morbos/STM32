default:
	rm -f obj/Debug/try_l522
	(export LOADER=RAM_L522; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d try_l522 >try_l522.lst; arm-eabi-objdump -s try_l522 >try_l522.dmp; arm-eabi-gcc-nm -an try_l522 >try_l522.nm; arm-eabi-objcopy -Obinary try_l522 try_l522.bin)
