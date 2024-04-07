default:
#	rm -f obj/Debug/try_f103
#	(export LOADER=ROM_F103; gprbuild -vh -vP2)
#	(export LOADER=ROM_F103; gprbuild -vP2)
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d try_f103 >try_f103.lst; arm-eabi-objdump -s try_f103 >try_f103.dmp; arm-eabi-gcc-nm -an try_f103 >try_f103.nm; arm-eabi-objcopy -Obinary try_f103 try_f103.bin)
