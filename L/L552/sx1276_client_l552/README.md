# LoRaDa on the STM32L552

A LoRa node that can send and receive messages when connected to a server.

Secure boot & secure LoRa radio + non-secure client LoRa node.

## Prerequisites
- gnat2019
- An STM32L552 nucleo board. TZ=1 enabled (flash option byte)
- A Blkbox 915Mhz LoRa module

## Building on Linux
- git clone https://github.com/morbos/Ada_Drivers_Library.git
- git clone https://github.com/morbos/embedded-runtimes.git
- git clone https://github.com/morbos/STM32.git
- vvv needed for the nodeID# patcher.rb script
- git clone https://github.com/morbos/ruby.git
- mv ../embedded-runtimes Ada_Drivers_Library
- cd STM32/L/L552/sx1276_client_l552
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
Info : flash size = 512kbytes
undefined debug reason 7 - target needs reset
target halted due to debug-request, current mode: Thread
xPSR: 0xf9000000 pc: 0x08002f0c msp: 0x20009d58
```

## GDB

Writing to ram and flash can be done with some .gdbinit macros:

The first one flashes s/ns.
The others are ram dl's and debug s/ns for the flash.
```
define flash_s_ns
  set pagination off
  target extended-remote 127.0.1.1:3333
  monitor reset halt
  load '$arg0'_s/obj/Debug/'$arg0'_s
  load '$arg0'_ns/obj/Debug/'$arg0'_ns
  file '$arg0'_s/obj/Debug/'$arg0'_s
  b __gnat_last_chance_handler
  set $sp:=*16#0c000000#
  set $pc:=*16#0c000004#
end
define ram_s_ns
  set pagination off
  target extended-remote 127.0.1.1:3333
  monitor reset halt
  load '$arg0'_s/obj/Debug/'$arg0'_s
  load '$arg0'_ns/obj/Debug/'$arg0'_ns
  file '$arg0'_s/obj/Debug/'$arg0'_s
  b __gnat_last_chance_handler
  set $sp:=*16#30000000#
  set $pc:=*16#30000004#
end
define ram_s_ns2
  set pagination off
  target extended-remote 127.0.1.1:3333
  monitor reset halt
  load '$arg0'_s/obj/Debug/'$arg0'_s
  load '$arg0'_ns/obj/Debug/'$arg0'_ns
  file '$arg0'_ns/obj/Debug/'$arg0'_ns
  b __gnat_last_chance_handler
  set $sp:=*16#30000000#
  set $pc:=*16#30000004#
end
define debug_s_ns
  set pagination off
  target extended-remote 127.0.1.1:3333
  monitor reset init
  file '$arg0'_s/obj/Debug/'$arg0'_s
  b __gnat_last_chance_handler
  set $sp:=*16#0c000000#
  set $pc:=*16#0c000004#
end
define debug_s_ns2
  set pagination off
  target extended-remote 127.0.1.1:3333
  monitor reset init
  file '$arg0'_ns/obj/Debug/'$arg0'_ns
  b __gnat_last_chance_handler
  set $sp:=*16#0c000000#
  set $pc:=*16#0c000004#
end
```
Then start the debugger:

```
admin@ubuntu_1604:/.share/CACHEDEV1_DATA/Ada/STM32/L/L552/sx1276_client_l552 $ arm-eabi-gdb
...
(gdb) flash_s_ns sx1276
(gdb) c
```
