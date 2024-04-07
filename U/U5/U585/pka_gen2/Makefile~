#DIR=Production
DIR=Debug
default:
	rm -f obj/$(DIR)/test
#	(export LOADER=RAM_NS_U5xx; gprbuild)
	(export LOADER=ROM_NS_U5xx; gprbuild)
	(cd obj/$(DIR); arm-eabi-objdump -d test >test.lst; arm-eabi-objdump -s test >test.dmp; arm-eabi-gcc-nm -an test >test.nm; arm-eabi-objcopy -Obinary test test.bin)
