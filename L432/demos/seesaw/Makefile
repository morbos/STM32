default:
	rm -f obj/Debug/seesaw
	gprbuild
	(cd obj/Debug; arm-eabi-objdump -d seesaw >seesaw.lst; arm-eabi-objdump -s seesaw >seesaw.dmp; arm-eabi-gcc-nm -an seesaw >seesaw.nm; arm-eabi-objcopy -Obinary seesaw seesaw.bin)
