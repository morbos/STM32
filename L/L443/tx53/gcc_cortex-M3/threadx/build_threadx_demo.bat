armasm -g --cpu=cortex-m3 --apcs=interwork tx_initialize_low_level.s
armcc -c -g --cpu=cortex-m3 -O2 demo_threadx.c
armlink -d -o demo_threadx.axf --elf --map --ro-base=0x00000000 --rw-base=0x20000000 --first __tx_vectors --datacompressor=off --inline --info=inline --callgraph --list demo_threadx.map tx_initialize_low_level.o demo_threadx.o tx.a

