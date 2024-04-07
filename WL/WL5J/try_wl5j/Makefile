default:
	rm -f obj/Debug/try_wl5j
	(export LOADER=ROM_WL5x; gprbuild -j24)
	(cd obj/Debug; arm-eabi-objdump -d try_wl5j >try_wl5j.lst; arm-eabi-objdump -s try_wl5j >try_wl5j.dmp; arm-eabi-gcc-nm -an try_wl5j >try_wl5j.nm; arm-eabi-objcopy -Obinary try_wl5j try_wl5j.bin)
