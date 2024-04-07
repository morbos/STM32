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
void send_sx1276_from_ns(unsigned x, int len)
{
    extern void send_sx1276(unsigned, int);
    send_sx1276(x, len);
}
__attribute__ ((cmse_nonsecure_entry))
unsigned recv_sx1276_from_ns(unsigned x, unsigned len)
{
    extern unsigned recv_sx1276(unsigned, unsigned);
    return recv_sx1276(x, len);
}
