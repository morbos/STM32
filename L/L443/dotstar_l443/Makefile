default:
	rm -f obj/Debug/dotstar_l443
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d dotstar_l443 >dotstar_l443.lst; arm-eabi-objdump -s dotstar_l443 >dotstar_l443.dmp; arm-eabi-gcc-nm -an dotstar_l443 >dotstar_l443.nm; arm-eabi-objcopy -Obinary dotstar_l443 dotstar_l443.bin)
