# Ada on the STM32WB55 Nucleo & Dongle

The MB1355C runs the server (as the as shipped ST nucleo board does)
The MB1293C runs the client.

## Prerequisites
- gnat2019

## Building on Linux
- git clone https://github.com/morbos/Ada_Drivers_Library.git
- git clone https://github.com/morbos/embedded-runtimes.git
- git clone https://github.com/morbos/STM32.git
- mv ../embedded-runtimes Ada_Drivers_Library
- cd STM32/WB/WB55/cli_serv_wb55
- make
