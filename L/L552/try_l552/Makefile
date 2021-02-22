default:
	rm -f obj/Debug/try_l552
	(export LOADER=RAM_S_L5x2; gprbuild try_l552.gpr)
	(cd obj/Debug; arm-eabi-objdump -d try_l552 >try_l552.lst; arm-eabi-objdump -s try_l552 >try_l552.dmp; arm-eabi-gcc-nm -an try_l552 >try_l552.nm; arm-eabi-objcopy -Obinary try_l552 try_l552.bin)
