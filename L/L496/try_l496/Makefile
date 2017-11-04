default:
	rm -f obj/Debug/try_l496
	(export LOADER=ROM_L496; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d try_l496 >try_l496.lst; arm-eabi-objdump -s try_l496 >try_l496.dmp; arm-eabi-gcc-nm -an try_l496 >try_l496.nm; arm-eabi-objcopy -Obinary try_l496 try_l496.bin)
