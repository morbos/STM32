#ifndef _HELPER_H_
#define _HELPER_H_

// Define the helper header and associated cmds.

typedef struct HEADER_s
{
    u32  cmd;
    u32  base_addr;
    u32  length;
    u32  crc;
} HEADER;

#define ROM_BLOCK_COPY      1
#define ROM_LZH_COMPRESSION 2
#define ROM_ZIP_COMPRESSION 3
#define ROM_ENTRY           4
#define ROM_CMD5            5
#define ROM_ENTRY_CPU2      6
#define ROM_FLAGS           7
#define   ROM_FLAG_CRC32       bit(0)
#define   ROM_FLAG_COMBO       bit(1)
#define ROM_BLOCK_COPY_BYTE 8

#endif /* _HELPER_H_ */
