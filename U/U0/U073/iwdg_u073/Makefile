default:
	rm -f obj/Debug/iwdg_u073
	(export LOADER=ROM_U073; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d iwdg_u073 >iwdg_u073.lst; arm-eabi-objdump -s iwdg_u073 >iwdg_u073.dmp; arm-eabi-gcc-nm -an iwdg_u073 >iwdg_u073.nm; arm-eabi-objcopy -Obinary iwdg_u073 iwdg_u073.bin)
