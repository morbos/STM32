default:
	rm -f obj/Debug/sx1276_s
	(export LOADER=RAM_S_L522; gprbuild sx1276_s.gpr)
	(cd obj/Debug; arm-eabi-objdump -d sx1276_s >sx1276_s.lst; arm-eabi-objdump -s sx1276_s >sx1276_s.dmp; arm-eabi-gcc-nm -an sx1276_s >sx1276_s.nm; arm-eabi-objcopy -Obinary sx1276_s sx1276_s.bin)
