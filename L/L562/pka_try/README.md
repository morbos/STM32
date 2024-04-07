# Ada on the STM32L552

This project shows how to get a simple secure&non-secure program going
on the STM32L552 nucleo board.

## Prerequisites
- gnat2019

## Building on Linux
- git clone https://github.com/morbos/Ada_Drivers_Library.git
- git clone https://github.com/morbos/embedded-runtimes.git
- git clone https://github.com/morbos/STM32.git
- mv ../embedded-runtimes Ada_Drivers_Library
- cd STM32/L/L552/test
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

Writing to ram can be done with some .gdbinit macros:

The first one allows symbol debug of the S side, the other of the NS side.
```
define st_s_ns
  set pagination off
  target extended-remote 10.0.1.241:3333
  monitor reset halt
  load test_s/obj/Debug/test_s
  load test_ns/obj/Debug/test_ns
  file test_s/obj/Debug/test_s
  set $sp:=*16#30000000#
  set $pc:=*16#30000004#
end
define st_s_ns2
  set pagination off
  target extended-remote 10.0.1.241:3333
  monitor reset halt
  load test_s/obj/Debug/test_s
  load test_ns/obj/Debug/test_ns
  file test_ns/obj/Debug/test_ns
  set $sp:=*16#30000000#
  set $pc:=*16#30000004#
end
```
Then start the debugger:

```
admin@ubuntu_1604:/.share/CACHEDEV1_DATA/Ada/STM32/L/L552/test$ arm-eabi-gdb
...
(gdb) st_s_ns
warning: No executable has been specified and target does not support
determining executable automatically.  Try using the "file" command.
0x2002009c in ?? ()
target halted due to debug-request, current mode: Thread
xPSR: 0xf9000000 pc: 0x08002f0c msp: 0x20009d58
Loading section .text, size 0x3d96 lma 0x30000000
Loading section .rodata, size 0x530 lma 0x30003d98
Loading section .data, size 0x84 lma 0x300042c8
Loading section .gnu.sgstubs, size 0x20 lma 0x3001f000
Start address 0x300039a0, load size 17258
Transfer rate: 37 KB/sec, 4314 bytes/write.
Loading section .text, size 0x7388 lma 0x20020000
Loading section .ARM.extab, size 0x4c4 lma 0x20027388
Loading section .ARM.exidx, size 0x718 lma 0x2002784c
Loading section .rodata, size 0x13a0 lma 0x20027f68
Loading section .data, size 0x210 lma 0x20029308
Start address 0x20025bc0, load size 38164
Transfer rate: 39 KB/sec, 6360 bytes/write.
(gdb) c
```
