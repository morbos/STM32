	.syntax unified
@/**************************************************************************/ 
@/*                                                                        */ 
@/*            Copyright (c) 1996-2008 by Express Logic Inc.               */ 
@/*                                                                        */ 
@/*  This software is copyrighted by and is the sole property of Express   */ 
@/*  Logic, Inc.  All rights, title, ownership, or other interests         */ 
@/*  in the software remain the property of Express Logic, Inc.  This      */ 
@/*  software may only be used in accordance with the corresponding        */ 
@/*  license agreement.  Any unauthorized use, duplication, transmission,  */ 
@/*  distribution, or disclosure of this software is expressly forbidden.  */ 
@/*                                                                        */
@/*  This Copyright notice may not be removed or modified without prior    */ 
@/*  written consent of Express Logic, Inc.                                */ 
@/*                                                                        */ 
@/*  Express Logic, Inc. reserves the right to modify this software        */ 
@/*  without notice.                                                       */ 
@/*                                                                        */ 
@/*  Express Logic, Inc.                     info@expresslogic.com         */
@/*  11423 West Bernardo Court               http://www.expresslogic.com   */
@/*  San Diego, CA  92127                                                  */
@/*                                                                        */
@/**************************************************************************/
@
@
@/**************************************************************************/
@/**************************************************************************/
@/**                                                                       */ 
@/** ThreadX Component                                                     */ 
@/**                                                                       */
@/**   Thread                                                              */
@/**                                                                       */
@/**************************************************************************/
@/**************************************************************************/
@
@
@#define TX_SOURCE_CODE
@
@
@/* Include necessary system files.  */
@
@#include "tx_api.h"
@#include "tx_thread.h"
@#include "tx_timer.h"
@
@
        .global  _tx_thread_system_state
@
@
	.text
@/**************************************************************************/ 
@/*                                                                        */ 
@/*  FUNCTION                                               RELEASE        */ 
@/*                                                                        */ 
@/*    _tx_thread_context_save                           Cortex-M3/RVDS    */ 
@/*                                                           5.2          */ 
@/*  AUTHOR                                                                */ 
@/*                                                                        */ 
@/*    William E. Lamie, Express Logic, Inc.                               */ 
@/*                                                                        */ 
@/*  DESCRIPTION                                                           */ 
@/*                                                                        */ 
@/*    This function saves the context of an executing thread in the       */ 
@/*    beginning of interrupt processing.  The function also ensures that  */ 
@/*    the system stack is used upon return to the calling ISR.            */ 
@/*                                                                        */ 
@/*  INPUT                                                                 */ 
@/*                                                                        */ 
@/*    None                                                                */ 
@/*                                                                        */ 
@/*  OUTPUT                                                                */ 
@/*                                                                        */ 
@/*    None                                                                */ 
@/*                                                                        */ 
@/*  CALLS                                                                 */ 
@/*                                                                        */ 
@/*    None                                                                */ 
@/*                                                                        */ 
@/*  CALLED BY                                                             */ 
@/*                                                                        */ 
@/*    ISRs                                                                */ 
@/*                                                                        */ 
@/*  RELEASE HISTORY                                                       */ 
@/*                                                                        */ 
@/*    DATE              NAME                      DESCRIPTION             */ 
@/*                                                                        */ 
@/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
@/*  12-02-2007     William E. Lamie         Modified comment(s),          */ 
@/*                                            resulting in version 5.1    */ 
@/*  12-12-2008     William E. Lamie         Modified comment(s),          */ 
@/*                                            resulting in version 5.2    */ 
@/*                                                                        */ 
@/**************************************************************************/ 
@VOID   _tx_thread_context_save(VOID)
@{
        .global  _tx_thread_context_save
_tx_thread_context_save:	
@
@    /* Cortex-M3 is implicitly safe, so just increment system state.  */
@
        LDR r0, =_tx_thread_system_state        @ Pickup address of system state
        LDR r1, [r0]                            @ Pickup system state
        ADD r1, r1, #1                          @ Increment
        STR r1, [r0]                            @ Store new system state
@
@    /* Push stack limit, then clear it.  */
@     
        PUSH    {r10}                           @ Save stack limit
        MOV     r10, #0                         @ Clear it
@
@    /* Return to interrupt processing.  */
@     
        BX  lr                                  @ Return to interrupt processing caller
@}
        .end
