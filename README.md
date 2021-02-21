This is a work in progress for STM32 projects

The structure of this dir is based around ST Microelectronics part
naming conventions. A typical ST part might look like:


STM32L443CC

STM32 - indicates ST Microelectronics and a 32bit microprocessor.

L - Stands for the Low power line
443 - is the # of the part in that line
CC - helps to clarify the package used.

So here we have subdirs:

L & F & WB & WL

F handles the first generation STM32 parts. Not too much here other
than some work I do on the BluePill STM32F103C8 its in STM32/F/F103.

WB is the Bluetooth controller.

WL is the new subghz controller (LoRa etc)
