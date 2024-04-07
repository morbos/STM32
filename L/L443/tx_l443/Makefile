default:
	rm -f obj/Debug/tx_l443
	(export LOADER=ROM_L443; gprbuild -vh tx_l443.gpr)
	(cd obj/Debug; arm-eabi-objdump -d tx_l443 >tx_l443.lst; arm-eabi-objdump -s tx_l443 >tx_l443.dmp; arm-eabi-gcc-nm -an tx_l443 >tx_l443.nm; arm-eabi-objcopy -Obinary tx_l443 tx_l443.bin)
