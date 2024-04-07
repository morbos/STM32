default:
	rm -f obj/Debug/uart_u073
	(export LOADER=ROM_U073; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d uart_u073 >uart_u073.lst; arm-eabi-objdump -s uart_u073 >uart_u073.dmp; arm-eabi-gcc-nm -an uart_u073 >uart_u073.nm; arm-eabi-objcopy -Obinary uart_u073 uart_u073.bin)
