default:
	rm -f obj/Debug/try_u073
	(export LOADER=ROM_U073; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d try_u073 >try_u073.lst; arm-eabi-objdump -s try_u073 >try_u073.dmp; arm-eabi-gcc-nm -an try_u073 >try_u073.nm; arm-eabi-objcopy -Obinary try_u073 try_u073.bin)
