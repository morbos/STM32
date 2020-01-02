#include "arm_cmse.h"
typedef unsigned int    u32;
#define REG32(x) ((*(volatile u32 *)(x)))

__attribute__ ((cmse_nonsecure_entry))
unsigned s_from_ns_veneer(unsigned x)
{
    extern unsigned s_from_ns(unsigned);
    return s_from_ns(x);
}
