default:
	rm -f obj/Debug/stepper
	(export LOADER=ROM_L443; gprbuild)
	(cd obj/Debug; arm-eabi-objdump -d stepper >stepper.lst; arm-eabi-objdump -s stepper >stepper.dmp; arm-eabi-gcc-nm -an stepper >stepper.nm; arm-eabi-objcopy -Obinary stepper stepper.bin)
