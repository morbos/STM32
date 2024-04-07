/******************** (c) Marvell Semiconductor, Inc., 2002 *******************
 *
 * $Header: /mp/matar4_2/condor/mrvl/matar4/condor/condorh/sos_dir/condor.rep/TEMP/hrainnie_1344895167/top_cardiac0#boot_CPU2_A1#sim#test#src#xmodem.h,v 1.1 2013-11-15 17:57:52-08 hrainnie Exp $
 *
 * Purpose:
 *    This file contains the function prototypes and definitions for the
 *    XMODEM protocol code.
 *
 * Public Procedures:
 *    uart_boot               Perform XMODEM download of boot code.
 *
 * Notes:
 *    None.
 *
 *****************************************************************************/

#ifndef _XMODEM_H_
#define _XMODEM_H_

//=============================================================================
//                                DEFINITIONS
//=============================================================================
#define FAIL	       0
#define OK	       1

#define SOH            1 // Start Of Header
#define EOT            4 // End Of Transmission
#define ACK            6 // Acknowledge (positive)
#define DLE           16 // Data Link Escape
#define NAK           21 // Negative Acknowledge
#define SYN           22 // Synchronous idle
#define CAN           24 // Cancel
#define DL_LOC       0x0 // Where is the image going to?

#define BLK_MISMATCH  0x21
#define CSUM_ERR      0x22

//=============================================================================
//                    PUBLIC PROCEDURES (ANSI Prototypes)
//=============================================================================
/******************************************************************************
 *
 * Name: uart_boot
 *
 * Description:
 *   This function reads data from the UART in the XMODEM protocol and
 *   copies the packets into ISRAM. Finally when the EOT signal
 *   arrives it vectors the processor to location 0, the first location in
 *   the ISRAM. This boots the downloaded UART data.
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
extern void uart_boot( void );

#endif /* _XMODEM_H_ */


