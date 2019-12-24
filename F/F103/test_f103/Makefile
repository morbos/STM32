default:
#	rm -f obj/Debug/test_f103
#	(export LOADER=ROM_F103; gprbuild -vh -vP2)
#	(export LOADER=ROM_F103; gprbuild -vP2)
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d test_f103 >test_f103.lst; arm-eabi-objdump -s test_f103 >test_f103.dmp; arm-eabi-gcc-nm -an test_f103 >test_f103.nm; arm-eabi-objcopy -Obinary test_f103 test_f103.bin)
