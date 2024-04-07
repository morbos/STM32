typedef unsigned int    u32;
#define REG32(x) ((*(volatile u32 *)(x)))
void
init_led()
{
    int i;
    for(i=0;i < 4;i++) {
	REG32(0x50842770 + (i * 4)) = 3;
    }
}
void
led_on(u32 x)
{
    int i;
    u32 mask = (1 << 28);
    for(i=0;i < 4;i++) {
	if(x & (1 << i)) {
	    REG32(0x50842504) &= ~mask;
	} else {
	    REG32(0x50842504) |= mask;
	}
	mask <<= 1;
    }
}
