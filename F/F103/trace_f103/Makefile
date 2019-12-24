default:
#	rm -f obj/Debug/trace_f103
#	(export LOADER=ROM_F103; gprbuild -vh -vP2)
#	(export LOADER=ROM_F103; gprbuild -vP2)
	(export LOADER=ROM_F103; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d trace_f103 >trace_f103.lst; arm-eabi-objdump -s trace_f103 >trace_f103.dmp; arm-eabi-gcc-nm -an trace_f103 >trace_f103.nm; arm-eabi-objcopy -Obinary trace_f103 trace_f103.bin)
