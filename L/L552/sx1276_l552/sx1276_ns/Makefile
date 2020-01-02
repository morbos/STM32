default:
	rm -f obj/Debug/sx1276_ns
	(export LOADER=RAM_NS_L522; gprbuild sx1276_ns.gpr)
	(cd obj/Debug; arm-eabi-objdump -d sx1276_ns >sx1276_ns.lst; arm-eabi-objdump -s sx1276_ns >sx1276_ns.dmp; arm-eabi-gcc-nm -an sx1276_ns >sx1276_ns.nm; arm-eabi-objcopy -Obinary sx1276_ns sx1276_ns.bin)
