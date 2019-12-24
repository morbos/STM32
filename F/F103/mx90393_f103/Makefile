default:
	rm -f obj/Debug/mx90393_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d mx90393_f103 >mx90393_f103.lst; arm-eabi-objdump -s mx90393_f103 >mx90393_f103.dmp; arm-eabi-gcc-nm -an mx90393_f103 >mx90393_f103.nm; arm-eabi-objcopy -Obinary mx90393_f103 mx90393_f103.bin)
