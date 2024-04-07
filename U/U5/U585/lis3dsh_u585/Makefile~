#DIR=Production
DIR=Debug
default:
	rm -f obj/$(DIR)/lis3dsh_u585
	(export LOADER=RAM_NS_U5xx; gprbuild)
	(cd obj/$(DIR); arm-eabi-objdump -d lis3dsh_u585 >lis3dsh_u585.lst; arm-eabi-objdump -s lis3dsh_u585 >lis3dsh_u585.dmp; arm-eabi-gcc-nm -an lis3dsh_u585 >lis3dsh_u585.nm; arm-eabi-objcopy -Obinary lis3dsh_u585 lis3dsh_u585.bin)
