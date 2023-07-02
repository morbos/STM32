default:
	rm -f obj/Debug/pingpong
	(export LOADER=ROM_WL5x; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d pingpong >pingpong.lst; arm-eabi-objdump -s pingpong >pingpong.dmp; arm-eabi-gcc-nm -an pingpong >pingpong.nm; arm-eabi-objcopy -Obinary pingpong pingpong.bin)
