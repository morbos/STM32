default:
	rm -f obj/Debug/try_l151
	(export LOADER=ROM_L151; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d try_l151 >try_l151.lst; arm-eabi-objdump -s try_l151 >try_l151.dmp; arm-eabi-gcc-nm -an try_l151 >try_l151.nm; arm-eabi-objcopy -Obinary try_l151 try_l151.bin)
