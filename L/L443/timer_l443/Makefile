default:
#	rm -f obj/Debug/timer_f103
#	(export LOADER=ROM_L443; gprbuild -vh -vP2)
#	(export LOADER=ROM_L443; gprbuild -vP2)
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d timer_l443 >timer_l443.lst; arm-eabi-objdump -s timer_l443 >timer_l443.dmp; arm-eabi-gcc-nm -an timer_l443 >timer_l443.nm; arm-eabi-objcopy -Obinary timer_l443 timer_l443.bin)
