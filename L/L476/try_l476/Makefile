default:
	rm -f obj/Debug/try_l476
	(export LOADER=ROM_L476; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d try_l476 >try_l476.lst; arm-eabi-objdump -s try_l476 >try_l476.dmp; arm-eabi-gcc-nm -an try_l476 >try_l476.nm; arm-eabi-objcopy -Obinary try_l476 try_l476.bin)
