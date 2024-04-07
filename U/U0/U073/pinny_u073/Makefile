default:
	rm -f obj/Debug/pinny_u073
	(export LOADER=ROM_U073; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d pinny_u073 >pinny_u073.lst; arm-eabi-objdump -s pinny_u073 >pinny_u073.dmp; arm-eabi-gcc-nm -an pinny_u073 >pinny_u073.nm; arm-eabi-objcopy -Obinary pinny_u073 pinny_u073.bin)
