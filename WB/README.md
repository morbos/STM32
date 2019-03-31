Ada work for the STM32WB

First dir is SVD which ST has not provided yet. This one was crudely scraped from the pdf reference manaul. Note to ST... Please fix the RM. There are loads of bugs in those reg tables. Thigs like where it should be size[1:0] I see size1:0] or size[1:0} or size on its own (no range!). Or the wrong range size. Too many bits in some reset values etc.

This is a hack I have not backpatched the reset values yet.

# Ada on the ST WB55x

First steps for Ada on the new STM32WB55x

## Building on Linux
- git clone https://github.com/morbos/Ada_Drivers_Library.git
- git clone https://github.com/morbos/embedded-runtimes.git
- git clone https://github.com/morbos/STM32.git
- cd Ada_Drivers_Library
- mv ../embedded-runtimes .
- cd ..
- cd STM32/WB/WB55/try_wb55x
- make
