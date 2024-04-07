/******************** (c) Marvell Semiconductor, Inc., 2002 *******************
 *
 * $Header: /mp/matar4_2/condor/mrvl/matar4/condor/condorh/sos_dir/condor.rep/TEMP/hrainnie_1344895167/top_cardiac0#boot_CPU2_A1#sim#test#src#boot.h,v 1.1 2013-11-15 18:13:41-08 hrainnie Exp $
 *
 * Purpose:
 *    Proto's into the boot assembly code.
 *
 * Public Procedures:
 *    Thumb2ARM               Transfer control to arg1's code ptr
 *
 * Notes:
 *    None.
 *
 *****************************************************************************/

#ifndef _BOOT_H_
#define _BOOT_H_

/******************************************************************************
 *
 * Name: Thumb2ARM
 *
 * Description:
 *   Transfer control to ARG1's value as interpreted as a code
 *    address. Also performs a state switch (thumb -> ARM)
 *
 * Conditions For Use:
 *   None.
 *
 * Arguments:
 *   Arg1( u32 ): 32bit pointer to a code address
 *
 * Return Value:
 *   Never returns.
 *
 * Notes:
 *   None.
 *
 *****************************************************************************/

extern void Thumb2ARM( u32 u32CodePtr );
extern void blkcpy( u32 dest, u32 src, u32 len);
extern void DisableInt(void);
extern void low_vectors(void);

#endif // _BOOT_H_
