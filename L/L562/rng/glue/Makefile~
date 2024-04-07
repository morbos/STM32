OBJ = veneer_s.o veneer_ns.o s_ns.o led.o

.SUFFIXES:
.SUFFIXES: .s .c .o

AS = arm-eabi-as
CC = arm-eabi-gcc
CFLAGS=-g -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -mcmse
AFLAGS=-g -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard
OSTYPE=linux

.s.o:
	$(AS) $(AFLAGS) $< -o $*.o
.c.o:
	$(CC) $(CFLAGS) -c $<

default: $(OBJ)
