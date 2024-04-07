default:
	rm -f obj/Debug/ob_u073
	(export LOADER=ROM_U073; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d ob_u073 >ob_u073.lst; arm-eabi-objdump -s ob_u073 >ob_u073.dmp; arm-eabi-gcc-nm -an ob_u073 >ob_u073.nm; arm-eabi-objcopy -Obinary ob_u073 ob_u073.bin)
