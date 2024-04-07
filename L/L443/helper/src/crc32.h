#ifndef _CRC32_H_
#define _CRC32_H_

void gen_crc_table(void);
unsigned long update_crc(unsigned long crc_accum, char *data_blk_ptr, int data_blk_size);

#endif
