This is a work in progress for STM32 projects

Currently the L432 is being worked on. This was for the MakeWithAda
project. My project was to use the VL6180X range sensor to tip a
see-saw back and forth. To do that needed the range sensor
working. There is a working program for the board I am using in
STM32/L432/sensors/vl6180x_l432.

The L432 SoC is realized for this project on the 32pin Nucleo board.

Nucleo-L432KC

The sensor demo will alternately flash the green led on the board when
an object is in range of the sensor and off otherwise.

