default:
	rm -f obj/Debug/test_ns
	(export LOADER=RAM_NS_5340; gprbuild test_ns.gpr)
	(cd obj/Debug; arm-eabi-objdump -d test_ns >test_ns.lst; arm-eabi-objdump -s test_ns >test_ns.dmp; arm-eabi-gcc-nm -an test_ns >test_ns.nm; arm-eabi-objcopy -Obinary test_ns test_ns.bin)
