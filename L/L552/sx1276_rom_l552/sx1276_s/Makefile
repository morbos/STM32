default:
	rm -f obj/Debug/sx1276_s
	(export LOADER=ROM_S_L552; gprbuild sx1276_s.gpr)
	/.share/CACHEDEV1_DATA/hacking/Marvell/hrainnie/p4work/MRVL/main/utils/tools/bpatch/linux/bpatch 0x10014 32 0xfacefeed 6 ./obj/Debug/sx1276_s
	(cd obj/Debug; arm-eabi-objdump -d sx1276_s >sx1276_s.lst; arm-eabi-objdump -s sx1276_s >sx1276_s.dmp; arm-eabi-gcc-nm -an sx1276_s >sx1276_s.nm; arm-eabi-objcopy -Obinary sx1276_s sx1276_s.bin;arm-eabi-objcopy -Osrec sx1276_s sx1276_s.srec)
