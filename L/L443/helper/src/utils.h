#ifndef __UTILS_H__
#define __UTILS_H__

#define NUB_MAG 0xFA019D2C
typedef struct {
    u32 magic;
    u32 len;
    u32 entry1;
    u32 entry2;
} nubbin;

void rmw(u32 addr, u32 hi, u32 lo, u32 val);
u32 clock_bump_start(void);
void clock_bump_end(u32 old_clock);
void clock_drop(void);
void cpu2_in_reset(void);
void PciePhy_rmw(u32 offset, u32 hi, u32 lo, u32 val);
u32 process_comm(u32 addr);
void poke(u32 address, u32 value);

#endif // __UTILS_H__


