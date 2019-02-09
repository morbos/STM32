# Ada on the ST SensorTile

This project shows how to initialize a SensorTile and how to send
sensor data over BLE from a SensorTile to a suitable host (that host
might be another SensorTile). There are two roles, a server and a
client. Servers accept connections and can send back sensor data when
prompted. Clients can scan for a server and prod the server to send
sensor data.

## Videos

[Full video](https://www.youtube.com/watch?v=E290oAYr0f8)

[AdaTheremin](https://youtu.be/E290oAYr0f8?t=404)

## Status
- Project is released for #MakeWithAda

## Prerequisites
- gnat2018

## Building on Linux
- git clone https://github.com/morbos/Ada_Drivers_Library.git
- git clone https://github.com/morbos/embedded-runtimes.git
- git clone https://github.com/morbos/STM32.git
- cd Ada_Drivers_Library
- mv ../embedded-runtimes .
- cd ..
- cd STM32/L/L476/sensortile
- make

