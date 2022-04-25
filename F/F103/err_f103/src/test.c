typedef unsigned int    u32;
#define REG32(x) ((*(volatile u32 *)(x)))
void
test()
{
#if 0
    void (*p)()=0x255;
    p();
#else
    REG32(0x00020000);
#endif
}
