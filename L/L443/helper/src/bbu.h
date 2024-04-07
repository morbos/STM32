#ifndef __BBU_H__
#define __BBU_H__

void init_BaseBand(void);
void wait_Serial(void);
void write_BaseBand(u32 addr, u8 data);
u8   read_BaseBand(u32 addr);
int  bbu_Bit6Wait(void);
void bbu_RamBist(void);

#endif // __BBU_H__
