default:
#	rm -f obj/Debug/timer_f103
#	(export LOADER=ROM_F103; gprbuild -vh -vP2)
#	(export LOADER=ROM_F103; gprbuild -vP2)
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d timer2pin_f103 >timer2pin_f103.lst; arm-eabi-objdump -s timer2pin_f103 >timer2pin_f103.dmp; arm-eabi-gcc-nm -an timer2pin_f103 >timer2pin_f103.nm; arm-eabi-objcopy -Obinary timer2pin_f103 timer2pin_f103.bin)
