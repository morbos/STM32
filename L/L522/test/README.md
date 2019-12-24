# Ada on the STM32L522

This project shows how to get a simple secure&non-secure program going
on the STM32L522 nucleo board.

## Prerequisites
- gnat2019

## Building on Linux
- git clone https://github.com/morbos/Ada_Drivers_Library.git
- git clone https://github.com/morbos/embedded-runtimes.git
- git clone https://github.com/morbos/STM32.git
- mv ../embedded-runtimes Ada_Drivers_Library
- cd STM32/L/L522/test
- make
