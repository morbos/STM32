#DIR=Production
DIR=Debug
default:
	rm -f obj/$(DIR)/test_s
	(export LOADER=RAM_NS_U5xx; gprbuild -j24)
#	(export LOADER=ROM_NS_U5xx; gprbuild)
	(cd obj/$(DIR); arm-eabi-objdump -d test_s >test_s.lst; arm-eabi-objdump -s test_s >test_s.dmp; arm-eabi-gcc-nm -an test_s >test_s.nm; arm-eabi-objcopy -Obinary test_s test_s.bin)
