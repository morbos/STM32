.SUFFIXES:
.SUFFIXES: .s .c .o

VPATH = ../threadx
CC=arm-elf-gcc
AS=arm-elf-as
ASFLAGS= -mthumb -mthumb-interwork -mcpu=cortex-m4
LD=arm-elf-ld
AR=arm-elf-ar
CFLAGS=-I../threadx -O2 -mthumb -mthumb-interwork -mcpu=cortex-m4

.c.o:
	$(CC) $(CFLAGS) -c $<
.s.o:
	$(AS) $(ASFLAGS) $< -o $*.o

OBJS= demo_threadx.o
default: demo_threadx
demo_threadx: $(OBJS)
	$(CC) $(OBJS) -o demo_threadx ../linux/tx.a -T lscript


