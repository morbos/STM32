default: server

server:
	rm -f obj/Debug/feather_serv
	(export LOADER=ROM_WB55x; gprbuild feather_serv.gpr)
	(cd obj/Debug; arm-eabi-objdump -d feather_serv >feather_serv.lst; arm-eabi-objdump -s feather_serv >feather_serv.dmp; arm-eabi-gcc-nm -an feather_serv >feather_serv.nm; arm-eabi-objcopy -Obinary feather_serv feather_serv.bin)
