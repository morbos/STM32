default:
	rm -f obj/Debug/try_l073
	(export LOADER=ROM_L073; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d try_l073 >try_l073.lst; arm-eabi-objdump -s try_l073 >try_l073.dmp; arm-eabi-gcc-nm -an try_l073 >try_l073.nm; arm-eabi-objcopy -Obinary try_l073 try_l073.bin)
