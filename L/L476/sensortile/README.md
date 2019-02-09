# Ada on the ST SensorTile

## Videos

[Full video](https://www.youtube.com/watch?v=E290oAYr0f8)

[AdaTheremin](https://youtu.be/E290oAYr0f8?t=404)

## Status
- Project is released for #MakeWithAda

## Prerequisites
- gnat2018

## Dependencies
- from [Ada_Drivers_Lib](https://github.com/morbos/Ada_Drivers_Library)
- from [embedded-runtimes](https://github.com/morbos/embedded-runtimes)
- Place the embedded-runtimes folder in the Ada_Drivers_Lib folder

## Building on Linux
- git clone https://github.com/morbos/Ada_Drivers_Library.git
- git clone https://github.com/morbos/embedded-runtimes.git
- git clone https://github.com/morbos/STM32.git
- cd Ada_Drivers_Library
- mv ../embedded-runtimes .
- cd ..
- cd STM32/L/L476/sensortile
- make

