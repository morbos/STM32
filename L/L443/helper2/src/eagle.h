/******************** (c) Marvell Semiconductor, Inc., 2002 *******************
 *
 * $Header: /mp/matar4_2/condor/mrvl/matar4/condor/condorh/sos_dir/condor.rep/TEMP/hrainnie_1344895167/top_cardiac0#boot_CPU2_A1#sim#test#src#eagle.h,v 1.1 2013-11-15 18:11:11-08 hrainnie Exp $
 *
 * Purpose:
 *    This file contains definitions used by the bootrom firmware in
 *    Eagle 
 *
 * Notes:
 *    None.
 *
 *****************************************************************************/

#ifndef _EAGLE_H_
#define _EAGLE_H_
//=============================================================================
//                                DEFINITIONS
//=============================================================================
#define bit(x)			(0x0001<<x)

// Clock enable register
#define SCLKEN			0x8000200C
#define  CLK_GPIO		bit(12)
#define  CLK_SIU		bit(11)

// GPIO Interface
#define GPIO_CONTROL		0x8000d000
#define GPIO_CONTROL2		0x8000d004
#define GPIO_OE			0x8000d008
#define GPIO_OUT_DATA		0x8000d00c
#define GPIO_IN_DATA		0x8000d010

// Strap pins. Define what we need.
#define BOOTSTRAP		0x80002000
#if 0
#define  ROM_BOOT_MASK   	(bit(7)|bit(6)|bit(5))
#define  UART_BOOT	 	0
#define  HOST_BOOT	 	bit(5)
#define  TEST_BOOT	 	bit(6)
#define  I2C_EEPROM_BOOT	bit(7)
#define  HOST_BOOT_NO_SPI 	(bit(7)|bit(5))
#define  SPI_EEPROM_BOOT	(bit(7)|bit(6))
#define  uWire_EEPROM_BOOT	(bit(7)|bit(6)|bit(5))
#endif
#define SI_DIV			0x8000c008

#define PI_PAD_CTRL		0x80006050

#endif /* _EAGLE_H_ */

