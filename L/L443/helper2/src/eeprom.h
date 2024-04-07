#ifndef __EEPROM_H__
#define __EEPROM_H__

void eeprom_init(void);
u32 eeprom_read4(u32 u32addr);
extern void eeprom_boot(void);
extern u32 PerformEEpromOverrides(u32 offset);
extern void eeprom_init_post_pll(void);
extern u8 otp_rcal(void);

#define SPI_READ_3ADDR_4DATA	0x582	// spi start, len 7, read
#define READ		          0x3   // Command that the eeprom uses for read

#define CON4	              (1 << 4)	// CON[4] strap pin. 1->8bit, 0->16bit flash

#define MAGIC_NUM		0x38333058	// "830X" is the magic #

// EEprom offsets
#define EE_MAC_ADDR_LO	0x0C
#define EE_MAC_ADDR_HI	0x10
#define EE_CIS_LEN	0x14
#define EE_CIS_PTR	0x18
#define EE_CIS_BASE	0x1C
#define EE_PIU_CMD	0x20    

#define EE_RESERVED_1	              0x58    // Offset into the EEprom where overrides start
#define EE_RESERVED_2	              0x5C
#define EE_RESERVED_3	              0x60

#endif // __EEPROM_H__
