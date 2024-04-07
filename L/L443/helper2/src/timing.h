/******************** (c) Marvell Semiconductor, Inc., 2002 *******************
 *
 * $Header: /mp/matar4_2/condor/mrvl/matar4/condor/condorh/sos_dir/condor.rep/TEMP/hrainnie_1344895167/top_cardiac0#boot_CPU2_A1#sim#test#src#timing.h,v 1.1 2013-11-15 17:59:29-08 hrainnie Exp $
 *
 * Purpose:
 *    This file contains the function prototypes and definitions for using the internal
 *    timers for timing intervals.
 *
 * Public Procedures:
 *
 * Notes:
 *    None.
 *
 *****************************************************************************/

#ifndef _TIMING_H_
#define _TIMING_H_

#define  TIMER0_RELOAD		0x0
#define  TIMER1_RELOAD		0x4
#define  TIMER2_RELOAD		0x8
#define  TIMER3_RELOAD		0xc
#define  TIMER_CONTROL          0x10
#define  TIMER0_LENGTH	        0x14
#define  TIMER1_LENGTH	        0x18
#define  TIMER2_LENGTH	        0x1c
#define  TIMER3_LENGTH	        0x20
#define  TIMER_PERIOD_1khz      0x2c
#define  TIMER_PERIOD_1mhz      0x30

int wait_n_microseconds(u32 microseconds, int (*funcp)(void));
int wait_n_milliseconds(u32 milliseconds, int (*funcp)(void));
void start_microsecond_timer(void);
void start_millisecond_timer(void);
s16 curr_millisecond_time(void);
s16 millisecond_gap(s16);
#endif // _TIMING_H_
