/******************** (c) Marvell Semiconductor, Inc., 2002 *******************
 *
 * $Header: /mp/matar4_2/condor/mrvl/matar4/condor/condorh/sos_dir/condor.rep/TEMP/hrainnie_1344895167/top_cardiac0#boot_CPU2_A1#sim#test#src#gpio.h,v 1.1 2013-11-15 18:07:39-08 hrainnie Exp $
 *
 * Purpose:
 *    This file contains the function prototypes and definitions for the
 *    GPIO setup code.
 *
 * Public Procedures:
 *    gpio_out_en             Enable the GPIO pins for output.
 *    gpwr                    Write 16 bits of data to the GPIO pins
 *
 * Notes:
 *    None.
 *
 *****************************************************************************/

#ifndef _GPIO_H_
#define _GPIO_H_

//=============================================================================
//                    PUBLIC PROCEDURES (ANSI Prototypes)
//=============================================================================

/******************************************************************************
 *
 * Name: gpwr
 *
 * Description:
 *   Write a u16 to the previously enabled GPIO pins.
 *
 * Conditions For Use:
 *   GPIO Clock should be enabled before attempting to use. (In PAU).
 *
 * Arguments:
 *   Arg1( u16 ): 16 bits of data to appear at the pins.
 *
 * Return Value:
 *   None.
 *
 * Notes:
 *   None.
 *
 *****************************************************************************/
extern void gpwr( u16 u16data );

#endif /* _GPIO_H_ */


