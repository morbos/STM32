default:
	rm -f obj/Debug/pms7003
	(export LOADER=ROM_WL5x; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d pms7003 >pms7003.lst; arm-eabi-objdump -s pms7003 >pms7003.dmp; arm-eabi-gcc-nm -an pms7003 >pms7003.nm; arm-eabi-objcopy -Obinary pms7003 pms7003.bin)
