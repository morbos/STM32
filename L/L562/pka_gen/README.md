# Ada on the STM32L562

ECDSA using the PKA on the STM32L562

This program tests the currently supported curves.

## Prerequisites
- gnat2019

## Building on Linux
- git clone https://github.com/morbos/Ada_Drivers_Library.git
- git clone https://github.com/morbos/embedded-runtimes.git
- git clone https://github.com/morbos/STM32.git
- mv embedded-runtimes Ada_Drivers_Library
- cd STM32/L/L562/pka_gen/
- make

## Openocd

openocd can be found here:
https://github.com/morbos/openocd

once built:
```
root@ubuntu:~/openocd/tcl# ../src/openocd -f board/bluepillL562.cfg
Open On-Chip Debugger 0.10.0+dev-01058-g853a052 (2020-02-13-09:20)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
Info : The selected transport took over low-level target control. The results might differ compared to plain JTAG/SWD
none separate

Info : Listening on port 6666 for tcl connections
Info : Listening on port 4444 for telnet connections
Info : clock speed 1000 kHz
Info : STLINK V2J17S4 (API v2) VID:PID 0483:3748
Info : Target voltage: 3.243243
Info : security extensions detected
Info : stm32l5x.mX3: hardware has 8 breakpoints, 4 watchpoints
Info : Listening on port 3333 for gdb connections
```

## GDB

Writing to ram can be done with some .gdbinit macros:

The first one allows symbol debug of the S side, the other of the NS side.
```
define ram_s_ns
  set pagination off
  target extended-remote 127.0.0.1:3333
  monitor reset halt
  load '$arg0'_s/obj/Debug/'$arg0'_s
  load '$arg0'_ns/obj/Debug/'$arg0'_ns
  file '$arg0'_s/obj/Debug/'$arg0'_s
  b __gnat_last_chance_handler
  set $sp:=*16#30000000#
  set $pc:=*16#30000004#
end
```
Then start the debugger:

```
hedley@ubuntu:~/ada/STM32/L/L562/pka_gen$ arm-eabi-gdb
GNU gdb (GDB) 8.3 for GNAT Community 2019 [rev=gdb-8.3-ref-194-g3fc1095]
Copyright (C) 2019 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
See your support agreement for details of warranty and support.
If you do not have a current support agreement, then there is absolutely
no warranty for this version of GDB.
Type "show copying" and "show warranty" for details.
This GDB was configured as "--host=x86_64-pc-linux-gnu --target=arm-eabi".
Type "show configuration" for configuration details.
For help, type "help".
Type "apropos word" to search for commands related to "word".
(gdb) ram_s_ns test
warning: No executable has been specified and target does not support
determining executable automatically.  Try using the "file" command.
0x30000f70 in ?? ()
JTAG API jtag_execute_queue() called on non JTAG interface
target halted due to debug-request, current mode: Thread 
xPSR: 0xf9000000 pc: 0x0c005d98 msp: 0x30009ca0
Loading section .text, size 0x9bc8 lma 0x30000000
Loading section .rodata, size 0x20d8 lma 0x30009bc8
Loading section .data, size 0x8c lma 0x3000bca0
Start address 0x30009a00, load size 48428
Transfer rate: 45 KB/sec, 9685 bytes/write.
Loading section .text, size 0x91fc lma 0x20020000
Loading section .ARM.extab, size 0x664 lma 0x200291fc
Loading section .ARM.exidx, size 0x7f8 lma 0x20029860
Loading section .rodata, size 0x15e8 lma 0x2002a058
Loading section .data, size 0x230 lma 0x2002b640
Start address 0x20027db0, load size 47216
Transfer rate: 44 KB/sec, 6745 bytes/write.
Breakpoint 1 at 0x30009390: file /home/hedley/ada/STM32/L/L562/pka_gen/Ada_Drivers_Library/embedded-runtimes/base_runtimes/ravenscar-sfp/common/a-elchha.adb, line 43.
(gdb) c
Continuing.
^C
Program received signal SIGINT, Interrupt.
test_s () at /home/hedley/ada/STM32/L/L562/pka_gen/test_s/src/test_s.adb:126
126	      null;
(gdb) 
```
