/******************** (c) Marvell Semiconductor, Inc., 2002 *******************
 *
 * $Header: /mp/matar4_2/condor/mrvl/matar4/condor/condorh/sos_dir/condor.rep/TEMP/hrainnie_1344895167/top_cardiac0#boot_CPU2_A1#sim#test#src#access.h,v 1.1 2013-11-15 18:14:53-08 hrainnie Exp $
 *
 * Purpose:
 *    Macro's used to access the internal config registers in Eagle
 *    GPIO setup code.
 *
 * Public Procedures:
 *    None.
 *
 * Notes:
 *    None.
 *
 *****************************************************************************/

#ifndef _ACCESS_H_
#define _ACCESS_H_

//=============================================================================
//                               INCLUDE FILES
//=============================================================================
#include "defs.h"

//=============================================================================
//                                DEFINITIONS
//=============================================================================

#define REG8(x) ((*(volatile u8 *)(x)))
#define REG16(x) ((*(volatile u16 *)(x)))
#define REG32(x) ((*(volatile u32 *)(x)))

void idx_write(u32 index, u32 value);
u32 idx_read(u32 index);

#endif /* _ACCESS_H_ */
