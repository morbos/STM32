default:
	rm -f obj/Debug/try_wb55x
	(export LOADER=ROM_WB55x; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d try_wb55x >try_wb55x.lst; arm-eabi-objdump -s try_wb55x >try_wb55x.dmp; arm-eabi-gcc-nm -an try_wb55x >try_wb55x.nm; arm-eabi-objcopy -Obinary try_wb55x try_wb55x.bin)
