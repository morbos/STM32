# LoRa on the STM32L552

This project shows how to get a secure&non-secure LoRa program going
on the STM32L552 nucleo board. The S side handles the LoRa HW the NS side handles the
packet data. In this way NS cannot interfere with the radio.

## Prerequisites
- gnat2019
- Blkbox 915MHz LoRa SX1276 module

## Building on Linux
- git clone https://github.com/morbos/Ada_Drivers_Library.git
- git clone https://github.com/morbos/embedded-runtimes.git
- git clone https://github.com/morbos/STM32.git
- mv ../embedded-runtimes Ada_Drivers_Library
- cd STM32/L/L552/sx1276_rom_l552
- make

## Openocd

openocd can be found here:
https://github.com/morbos/openocd-0.10.1

once built:
```
root@pi3:~/openocd-0.10.1/tcl# ../src/openocd -f board/st_nucleo_l552.cfg
Open On-Chip Debugger 0.10.0
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
adapter speed: 1000 kHz
Info : The selected transport took over low-level target control. The results might differ compared to plain JTAG/SWD
srst_only separate srst_nogate srst_open_drain connect_deassert_srst
Info : Unable to match requested speed 1000 kHz, using 950 kHz
Info : Unable to match requested speed 1000 kHz, using 950 kHz
Info : clock speed 950 kHz
Info : STLINK v2 JTAG v33 API v2 SWIM v25 VID 0x0483 PID 0x374B
Info : using stlink api v2
Info : Target voltage: 3.254211
Info : security extensions detected
Info : stm32l5x.mX3: hardware has 8 breakpoints, 4 watchpoints
Info : accepting 'gdb' connection on tcp/3333
Info : device id = 0x20006472
Warn : STM32 flash size failed, probe inaccurate - assuming 512k flash
Info : flash size = 512kbytes
undefined debug reason 7 - target needs reset
target halted due to debug-request, current mode: Thread
xPSR: 0xf9000000 pc: 0x08002f0c msp: 0x20009d58
```

## GDB

Writing to rom can be done with some .gdbinit macros:

The first one allows symbol debug of the S side, the other of the NS side.
```
define flash_s_ns
  set pagination off
  target extended-remote 10.0.1.241:3333
  monitor reset halt
  load '$arg0'_s/obj/Debug/'$arg0'_s
  load '$arg0'_ns/obj/Debug/'$arg0'_ns
  file '$arg0'_s/obj/Debug/'$arg0'_s
  b __gnat_last_chance_handler
  set $sp:=*16#0c000000#
  set $pc:=*16#0c000004#
end
```
Then start the debugger:

```
admin@ubuntu_1604:/.share/CACHEDEV1_DATA/Ada/STM32/L/L552/test$ arm-eabi-gdb
...
(gdb) flash_s_ns sx1276
warning: No executable has been specified and target does not support
determining executable automatically.  Try using the "file" command.
0x00000000 in ?? ()
target halted due to debug-request, current mode: Thread 
xPSR: 0xf9000000 pc: 0x0c007b98 msp: 0x3000a060
Loading section .text, size 0x8c68 lma 0xc000000
Loading section .ARM.exidx, size 0x8 lma 0xc008c68
Loading section .gnu.sgstubs, size 0x20 lma 0xc008c80
Loading section .rodata, size 0xbfc lma 0xc008ca0
Loading section .data, size 0x5e0 lma 0xc00989c
Start address 0xc007b98, load size 40556
Transfer rate: 27 KB/sec, 5793 bytes/write.
Loading section .text, size 0x9398 lma 0x8020000
Loading section .ARM.extab, size 0x694 lma 0x8029398
Loading section .ARM.exidx, size 0x838 lma 0x8029a2c
Loading section .rodata, size 0x1618 lma 0x802a268
Loading section .data, size 0x230 lma 0x802b880
Start address 0x8027baa, load size 47788
Transfer rate: 27 KB/sec, 6826 bytes/write.
Breakpoint 1 at 0xc00753c: file /.share/CACHEDEV1_DATA/Ada/STM32/L/L552/sx1276_rom_l552/Ada_Drivers_Library/embedded-runtimes/base_runtimes/ravenscar-sfp/common/a-elchha.adb, line 43.
(gdb) c
Continuing.
Note: automatically using hardware breakpoints for read-only addresses.
```
