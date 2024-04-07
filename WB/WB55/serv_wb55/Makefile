default: server

server:
	rm -f obj/Debug/server_wb55x
	(export LOADER=ROM_WB55x; gprbuild server_wb55x.gpr)
	(cd obj/Debug; arm-eabi-objdump -d server_wb55x >server_wb55x.lst; arm-eabi-objdump -s server_wb55x >server_wb55x.dmp; arm-eabi-gcc-nm -an server_wb55x >server_wb55x.nm; arm-eabi-objcopy -Obinary server_wb55x server_wb55x.bin)
