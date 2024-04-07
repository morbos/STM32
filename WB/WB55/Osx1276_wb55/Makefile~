default: server

#client:
#	rm -f obj/Debug/client_wb55x
#	(export LOADER=ROM_WB55x; gprbuild client_wb55x.gpr)
#	(cd obj/Debug; arm-eabi-objdump -d client_wb55x >client_wb55x.lst; arm-eabi-objdump -s client_wb55x >client_wb55x.dmp; arm-eabi-gcc-nm -an client_wb55x >client_wb55x.nm; arm-eabi-objcopy -Obinary client_wb55x client_wb55x.bin)

server:
	rm -f obj/Debug/server_wb55x
	(export LOADER=ROM_WB55x; gprbuild server_wb55x.gpr)
	(cd obj/Debug; arm-eabi-objdump -d server_wb55x >server_wb55x.lst; arm-eabi-objdump -s server_wb55x >server_wb55x.dmp; arm-eabi-gcc-nm -an server_wb55x >server_wb55x.nm; arm-eabi-objcopy -Obinary server_wb55x server_wb55x.bin)
