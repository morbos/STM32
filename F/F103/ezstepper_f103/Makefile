default:
	rm -f obj/Debug/ezstepper_f103
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d ezstepper_f103 >ezstepper_f103.lst; arm-eabi-objdump -s ezstepper_f103 >ezstepper_f103.dmp; arm-eabi-gcc-nm -an ezstepper_f103 >ezstepper_f103.nm; arm-eabi-objcopy -Obinary ezstepper_f103 ezstepper_f103.bin)
