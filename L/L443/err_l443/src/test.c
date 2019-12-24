typedef unsigned int    u32;
#define REG32(x) ((*(volatile u32 *)(x)))
void
test()
{
#if 0
    void (*p)()=0x4a5;
    p();
#else
    REG32(0x00000100);
#endif
}
