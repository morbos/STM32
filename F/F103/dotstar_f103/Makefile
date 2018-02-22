default:
	rm -f obj/Debug/dotstar_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d dotstar_f103 >dotstar_f103.lst; arm-eabi-objdump -s dotstar_f103 >dotstar_f103.dmp; arm-eabi-gcc-nm -an dotstar_f103 >dotstar_f103.nm; arm-eabi-objcopy -Obinary dotstar_f103 dotstar_f103.bin)
