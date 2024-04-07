default:
	rm -f obj/Debug/try_l443
	(export LOADER=ROM_L443; gprbuild -vh)
	(cd obj/Debug; arm-eabi-objdump -d try_l443 >try_l443.lst; arm-eabi-objdump -s try_l443 >try_l443.dmp; arm-eabi-gcc-nm -an try_l443 >try_l443.nm; arm-eabi-objcopy -Obinary try_l443 try_l443.bin)
