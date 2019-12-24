#include "arm_cmse.h"
/* typedef for non-secure callback functions */
typedef unsigned int    u32;
#define NON_SECURE_START (0x20020000)
#define REG32(x) ((*(volatile u32 *)(x)))
typedef void (*funcptr_ns) (void) __attribute__((cmse_nonsecure_call));
void __TZ_set_MSP_NS(u32 topOfProcStack)
{
  __asm volatile ("MSR msp_ns, %0" : : "r" (topOfProcStack) : );
}
void s_to_ns(void)
{
    funcptr_ns ResetHandler_ns;
    /* Set non-secure main stack (MSP_NS) */
    __TZ_set_MSP_NS(*((u32 *)(NON_SECURE_START)));

    REG32(0xe000ed8c) = 0xcff; // W/o this.... you get a usage fault..(!)

    REG32(0xe002ed08) = NON_SECURE_START; // Set the VECTORS
    /* Set non-secure vector table */
//    SCB_NS->VTOR = NON_SECURE_START;

    /* Get non-secure reset handler */
    ResetHandler_ns = (funcptr_ns)(*((u32 *)((NON_SECURE_START) + 4U)));

    ResetHandler_ns();

}
void init_idau(void)
{
    int i;
    u32 is_secure(u32);
    for(i=0;i < 8;i++) {
	REG32(0x50003700 + (i * 4)) = 0x17;
    }
    for(;i < 16;i++) {
	REG32(0x50003700 + (i * 4)) = 0x17;
    }
    for(;i < 24;i++) {
	REG32(0x50003700 + (i * 4)) = 0x7;
    }

    // Now need to add the NS veneer
    REG32(0x50003540) = 15; // last 8k region of 0x2001e000
    REG32(0x50003544) = 8; // A 4k region
    REG32(0x50003548) = 15; // last 8k region of 0x2001e000
    REG32(0x5000354c) = 8; // A 4k region

    is_secure(0x2001e000);

    REG32(0xe000edd0) = 2; // <<<<< Magic to mark all RAM as NS (bit1 = 1)
}
