#include "arm_cmse.h"
/* typedef for non-secure callback functions */
typedef unsigned int    u32;
//#define NON_SECURE_START (0x20020000)
#define NON_SECURE_START (0x08020000)
#define REG32(x) ((*(volatile u32 *)(x)))
typedef void (*funcptr_ns) (void) __attribute__((cmse_nonsecure_call));
void __TZ_set_MSP_NS(u32 topOfProcStack)
{
  __asm volatile ("MSR msp_ns, %0" : : "r" (topOfProcStack) : );
}
void s_to_ns(void)
{
    extern u32 is_secure(u32);
    funcptr_ns ResetHandler_ns;
    /* Set non-secure main stack (MSP_NS) */
    __TZ_set_MSP_NS(*((u32 *)(NON_SECURE_START)));

    REG32(0xe000ed8c) = 0xcff; // W/o this.... you get a usage fault..(!)

    REG32(0xe002ed08) = NON_SECURE_START; // Set the VECTORS

    is_secure(NON_SECURE_START);

    /* Get non-secure reset handler */
    ResetHandler_ns = (funcptr_ns)(*((u32 *)((NON_SECURE_START) + 4U)));

    ResetHandler_ns();

}
