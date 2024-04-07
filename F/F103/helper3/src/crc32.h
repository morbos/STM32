#ifndef _CRC32_H_
#define _CRC32_H_

void gen_crc_table(void);
u32 update_crc(u32 crc_accum, char *data_blk_ptr, int data_blk_size);

#endif
