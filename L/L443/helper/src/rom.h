/******************** (c) Marvell Semiconductor, Inc., 2002 *******************
 *
 * $Header: /mp/matar4_2/condor/mrvl/matar4/condor/condorh/sos_dir/condor.rep/TEMP/hrainnie_1344895167/top_cardiac0#boot_CPU2_A1#sim#test#src#rom.h,v 1.1 2013-11-15 18:01:02-08 hrainnie Exp $
 *
 * Purpose:
 *    Function prototypes for the bootrom's initial ThumbC boot decision
 *    code.
 *
 * Public Procedures:
 *    boot                    Main entry for the C part of the boot.
 *
 * Private Procedures:
 *    clock_enable            enable Eagle clocks needed to run the boot.
 *
 * Notes:
 *    None.
 *
 *****************************************************************************/

#ifndef _ROM_H_
#define _ROM_H_

//=============================================================================
//                    PUBLIC PROCEDURES (ANSI Prototypes)
//=============================================================================
/******************************************************************************
 *
 * Name: boot
 *
 * Description:
 *   boot.s calls this to get the ThumbC part of the bootrom going. 
 *
 * Conditions For Use:
 *   None.
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
extern void boot(void);

#endif /* _ROM_H_ */
