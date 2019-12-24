#DIR=Production
DIR=Debug
default:
	rm -f obj/$(DIR)/lis3dsh_l443
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/$(DIR); arm-eabi-objdump -d lis3dsh_l443 >lis3dsh_l443.lst; arm-eabi-objdump -s lis3dsh_l443 >lis3dsh_l443.dmp; arm-eabi-gcc-nm -an lis3dsh_l443 >lis3dsh_l443.nm; arm-eabi-objcopy -Obinary lis3dsh_l443 lis3dsh_l443.bin)
