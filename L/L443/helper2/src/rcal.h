#ifndef __RCAL_H__
#define __RCAL_H__

void do_RCAL(void);
u32 init_CAU(void);
u8 read_CAU(u32 addr);
void write_CAU(u32 addr, u32 data);
void set_CAU(u32 addr, u32 mask);
void clr_CAU(u32 addr, u32 mask);

#endif // __RCAL_H__

