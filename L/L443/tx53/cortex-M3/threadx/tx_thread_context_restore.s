;/**************************************************************************/ 
;/*                                                                        */ 
;/*            Copyright (c) 1996-2008 by Express Logic Inc.               */ 
;/*                                                                        */ 
;/*  This software is copyrighted by and is the sole property of Express   */ 
;/*  Logic, Inc.  All rights, title, ownership, or other interests         */ 
;/*  in the software remain the property of Express Logic, Inc.  This      */ 
;/*  software may only be used in accordance with the corresponding        */ 
;/*  license agreement.  Any unauthorized use, duplication, transmission,  */ 
;/*  distribution, or disclosure of this software is expressly forbidden.  */ 
;/*                                                                        */
;/*  This Copyright notice may not be removed or modified without prior    */ 
;/*  written consent of Express Logic, Inc.                                */ 
;/*                                                                        */ 
;/*  Express Logic, Inc. reserves the right to modify this software        */ 
;/*  without notice.                                                       */ 
;/*                                                                        */ 
;/*  Express Logic, Inc.                     info@expresslogic.com         */
;/*  11423 West Bernardo Court               http://www.expresslogic.com   */
;/*  San Diego, CA  92127                                                  */
;/*                                                                        */
;/**************************************************************************/
;
;
;/**************************************************************************/
;/**************************************************************************/
;/**                                                                       */ 
;/** ThreadX Component                                                     */ 
;/**                                                                       */
;/**   Thread                                                              */
;/**                                                                       */
;/**************************************************************************/
;/**************************************************************************/
;
;
;#define TX_SOURCE_CODE
;
;
;/* Include necessary system files.  */
;
;#include "tx_api.h"
;#include "tx_thread.h"
;#include "tx_timer.h"
;
;
        IMPORT  _tx_thread_system_state
        IMPORT  _tx_thread_current_ptr
        IMPORT  _tx_thread_system_stack_ptr
        IMPORT  _tx_thread_execute_ptr
        IMPORT  _tx_timer_time_slice
        IMPORT  _tx_thread_schedule
        IMPORT  _tx_thread_preempt_disable
;
;
        AREA    ||.text||, CODE, READONLY
;/**************************************************************************/ 
;/*                                                                        */ 
;/*  FUNCTION                                               RELEASE        */ 
;/*                                                                        */ 
;/*    _tx_thread_context_restore                        Cortex-M3/RVDS    */ 
;/*                                                           5.2          */ 
;/*  AUTHOR                                                                */ 
;/*                                                                        */ 
;/*    William E. Lamie, Express Logic, Inc.                               */ 
;/*                                                                        */ 
;/*  DESCRIPTION                                                           */ 
;/*                                                                        */ 
;/*    This function restores the interrupt context if it is processing a  */ 
;/*    nested interrupt.  If not, it returns to the interrupt thread if no */ 
;/*    preemption is necessary.  Otherwise, if preemption is necessary or  */ 
;/*    if no thread was running, the function returns to the scheduler.    */ 
;/*                                                                        */ 
;/*  INPUT                                                                 */ 
;/*                                                                        */ 
;/*    None                                                                */ 
;/*                                                                        */ 
;/*  OUTPUT                                                                */ 
;/*                                                                        */ 
;/*    None                                                                */ 
;/*                                                                        */ 
;/*  CALLS                                                                 */ 
;/*                                                                        */ 
;/*    _tx_thread_schedule                   Thread scheduling routine     */ 
;/*                                                                        */ 
;/*  CALLED BY                                                             */ 
;/*                                                                        */ 
;/*    ISRs                                  Interrupt Service Routines    */ 
;/*                                                                        */ 
;/*  RELEASE HISTORY                                                       */ 
;/*                                                                        */ 
;/*    DATE              NAME                      DESCRIPTION             */ 
;/*                                                                        */ 
;/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
;/*  12-02-2007     William E. Lamie         Modified comment(s),          */ 
;/*                                            resulting in version 5.1    */ 
;/*  12-12-2008     William E. Lamie         Modified comment(s),          */ 
;/*                                            resulting in version 5.2    */ 
;/*                                                                        */ 
;/**************************************************************************/
;VOID   _tx_thread_context_restore(VOID)
;{
        EXPORT  _tx_thread_context_restore
_tx_thread_context_restore
;
;    /* Cortex-M3 is implicitly safe, so simply decrement system state.  */
;
        LDR r0, =_tx_thread_system_state        ; Pickup system state address
        LDR r1, [r0]                            ; Pickup system state
        SUB r1, r1, #1                          ; Decrement
        STR r1, [r0]                            ; Store system state
;
;    /* Recover the stack limit and lr.  */
;
        POP {r10, lr}                           ; Recover stack limit and lr
;
;    /* Determine if scheduler must be pended.  */
;    /*   if ((_tx_thread_execute_ptr) &&
;             (_tx_thread_current_ptr != _tx_thread_execute_ptr) &&
;             (!_tx_thread_preeempt_disable))
;        PENDSVSET  */
;
        LDR r0, =_tx_thread_execute_ptr         ; Pickup the next thread execute pointer address
        LDR r0, [r0]                            ; Pickup the next thread to execute
        CMP r0, #0                              ; Is it NULL?
        
        ITTTE   NE                              ; 
         LDRNE  r1, =_tx_thread_current_ptr     ; Pickup the current thread pointer address
         LDRNE  r1, [r1]                        ; Pickup the current thread pointer
         CMPNE  r1, r0                          ; Is it the same as the execute pointer?
         BXEQ   lr                              ; Yes, simply return from this exception

        LDR r0, =_tx_thread_preempt_disable     ; Pickup the preempt disable flag address
        LDR r0, [r0]                            ; Pickup the preempt disable flag
        CMP r0, #0                              ; Is it set?

        ITTT    EQ                              ; 
         MOVEQ  r0, #0x10000000                 ; 
         MOVEQ  r1, #0xE000E000                 ; 
         STREQ  r0, [r1, #0xD04]                ; 

;    /* else  */
;    /* Return from this exception!  */  

        BX  lr
;}
        ALIGN
        LTORG
        END
