/******************** (c) Marvell Semiconductor, Inc., 2002 *******************
 *
 * $Header: /mp/matar4_2/condor/mrvl/matar4/condor/condorh/sos_dir/condor.rep/TEMP/hrainnie_1344895167/top_cardiac0#boot_CPU2_A1#sim#test#src#test.h,v 1.1 2013-11-15 18:00:02-08 hrainnie Exp $
 *
 * Purpose:
 *    BIST parse code. Takes ARM bist result and determines if there is an 
 *    error.
 *
 * Public Procedures:
 *    test_boot               routine that does the parse.
 *
 * Notes:
 *    None.
 *
 *****************************************************************************/

#ifndef _TEST_H_
#define _TEST_H_

//=============================================================================
//                                DEFINITIONS
//=============================================================================
#define KB 	*1024
// Memory space defs
#define ISRAM_START	0
#define ISRAM_LEN	64 KB
#define ISRAM_END	(ISRAM_START + ISRAM_LEN)

#define DSRAM_START	0x4000000 /* ...???...*/
#define DSRAM_LEN       8 KB
#define DSRAM_END	(DSRAM_START + DSRAM_LEN)

#define BOOTROM_START   0xffff0000
#define BOOTROM_LEN     2 KB
#define BOOTROM_END     (BOOTROM_START + BOOTROM_LEN)

#define ADDR_ERR_MASK	0x1000
#define DATA_ERR_MASK	0x1100
#define START_TEST	0x2000
#define FAILMASK	0x10
#define DONEMASK	0x20

#define ISRAM_MEM	0x1
#define DSRAM_MEM	0x2

// Coprocessor read values for the BIST
#define IxRAM_BIST_COMPLETE	(1 << 20)
#define IxRAM_BIST_FAIL		(1 << 19)
#define IxRAM_BIST_ENABLE	(1 << 18)
#define IxRAM_BIST_RUNNING	(1 << 16)

#define DxRAM_BIST_COMPLETE	(1 << 4)
#define DxRAM_BIST_FAIL		(1 << 3)
#define DxRAM_BIST_ENABLE	(1 << 2)
#define DxRAM_BIST_RUNNING	(1 << 0)

// Coprocessor write values for the BIST
#define IxRAM_BIST_ENABLE	(1 << 18)
#define IxRAM_BIST_PAUSE	(1 << 17)
#define IxRAM_BIST_START	(1 << 16)

#define DxRAM_BIST_ENABLE	(1 << 2)
#define DxRAM_BIST_PAUSE	(1 << 1)
#define DxRAM_BIST_START	(1 << 0)

//=============================================================================
//                    PUBLIC PROCEDURES (ANSI Prototypes)
//=============================================================================
/******************************************************************************
 *
 * Name: test_boot
 *
 * Description:
 *   Code to handle any testing needed to be performed by the ARM
 *   itself. At the moment it is restricted to bist
 *   interpretation. All other ram blocks in the chip have bist logic
 *   connected through the scan chain.
 *
 * Conditions For Use:
 *
 * Arguments:
 *   None.
 *
 * Return Value:
 *   None.
 *
 * Notes:
 *   None.
 *
 *****************************************************************************/
extern void test_boot(void);

#endif /* _TEST_H_ */

