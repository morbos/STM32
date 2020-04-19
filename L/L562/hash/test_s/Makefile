default:
	rm -f obj/Debug/test_s
	(export LOADER=RAM_S_L5x2; gprbuild test_s.gpr)
	(cd obj/Debug; arm-eabi-objdump -d test_s >test_s.lst; arm-eabi-objdump -s test_s >test_s.dmp; arm-eabi-gcc-nm -an test_s >test_s.nm; arm-eabi-objcopy -Obinary test_s test_s.bin)
