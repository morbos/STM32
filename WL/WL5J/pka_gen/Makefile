default:
	rm -f obj/Debug/pka_gen
	(export LOADER=ROM_WL5x; gprbuild pka_gen.gpr)
	(cd obj/Debug; arm-eabi-objdump -d pka_gen >pka_gen.lst; arm-eabi-objdump -s pka_gen >pka_gen.dmp; arm-eabi-gcc-nm -an pka_gen >pka_gen.nm; arm-eabi-objcopy -Obinary pka_gen pka_gen.bin)
