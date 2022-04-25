default:
	rm -f obj/Debug/try_l562
	(export LOADER=ROM_L5x2; gprbuild try_l562.gpr)
	(cd obj/Debug; arm-eabi-objdump -d try_l562 >try_l562.lst; arm-eabi-objdump -s try_l562 >try_l562.dmp; arm-eabi-gcc-nm -an try_l562 >try_l562.nm; arm-eabi-objcopy -Obinary try_l562 try_l562.bin)
