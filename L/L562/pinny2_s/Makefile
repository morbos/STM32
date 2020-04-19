default:
	rm -f obj/Debug/pinny2
	(export LOADER=ROM_S_L5x2; gprbuild pinny2.gpr)
	(cd obj/Debug; arm-eabi-objdump -d pinny2 >pinny2.lst; arm-eabi-objdump -s pinny2 >pinny2.dmp; arm-eabi-gcc-nm -an pinny2 >pinny2.nm; arm-eabi-objcopy -Obinary pinny2 pinny2.bin)
