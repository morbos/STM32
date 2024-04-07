#include "arm_cmse.h"
typedef unsigned int    u32;
#define REG32(x) ((*(volatile u32 *)(x)))

__attribute__ ((cmse_nonsecure_entry))
void initialize_sx1276_from_ns(void)
{
    extern void initialize_sx1276(void);
    initialize_sx1276();
}

__attribute__ ((cmse_nonsecure_entry))
void send_sx1276_from_ns(char x[], int len)
{
    extern void send_sx1276(char x[], int);
    send_sx1276(x, len);
}
__attribute__ ((cmse_nonsecure_entry))
unsigned recv_sx1276_from_ns(char *x, unsigned len, unsigned rssi)
{
    extern unsigned recv_sx1276(char *, unsigned, unsigned);
    return recv_sx1276(x, len, rssi);
}
__attribute__ ((cmse_nonsecure_entry))
unsigned who_am_i_SX1276_from_ns(void)
{
    return who_am_i_SX1276();
}
