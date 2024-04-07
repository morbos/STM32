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
        IMPORT  _tx_thread_current_ptr
        IMPORT  _tx_thread_execute_ptr
        IMPORT  _tx_timer_time_slice
        IMPORT  _tx_thread_system_stack_ptr
;
;
        AREA    ||.text||, CODE, READONLY
;/**************************************************************************/ 
;/*                                                                        */ 
;/*  FUNCTION                                               RELEASE        */ 
;/*                                                                        */ 
;/*    _tx_thread_schedule                               Cortex-M3/RVDS    */ 
;/*                                                           5.2          */ 
;/*  AUTHOR                                                                */ 
;/*                                                                        */ 
;/*    William E. Lamie, Express Logic, Inc.                               */ 
;/*                                                                        */ 
;/*  DESCRIPTION                                                           */ 
;/*                                                                        */ 
;/*    This function waits for a thread control block pointer to appear in */ 
;/*    the _tx_thread_execute_ptr variable.  Once a thread pointer appears */ 
;/*    in the variable, the corresponding thread is resumed.               */ 
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
;/*    None                                                                */
;/*                                                                        */ 
;/*  CALLED BY                                                             */ 
;/*                                                                        */ 
;/*    _tx_initialize_kernel_enter          ThreadX entry function         */ 
;/*    _tx_thread_system_return             Return to system from thread   */ 
;/*    _tx_thread_context_restore           Restore thread's context       */ 
;/*                                                                        */ 
;/*  RELEASE HISTORY                                                       */ 
;/*                                                                        */ 
;/*    DATE              NAME                      DESCRIPTION             */ 
;/*                                                                        */ 
;/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
;/*  12-02-2007     William E. Lamie         Modified comment(s), and      */ 
;/*                                            added setup of time-slice   */ 
;/*                                            variable, resulting in      */ 
;/*                                            version 5.1                 */ 
;/*  12-12-2008     William E. Lamie         Modified comment(s),          */ 
;/*                                            resulting in version 5.2    */ 
;/*                                                                        */ 
;/**************************************************************************/
;VOID   _tx_thread_schedule(VOID)
;{
        EXPORT  _tx_thread_schedule
_tx_thread_schedule
;
;    /* This function should only ever be called on Cortex-M3
;       from the first schedule request. Subsequent scheduling occurs
;       from the SVC handling routines below. */
;
;    /* Disable interrupts, so we can enable the interrupt drivers.  */
;
        CPSID   i
;
;    /* Set the interrupt master enable.  */
;
        MOV r0, #0xE000E000                     ; Build base of NVIC registers
        MOV r1, #1                              ; Build enable value
        STR r1, [r0]                            ; Set master enable
;
;    /* ORR in the enable for SysTick. */
;
        LDR r1, [r0, #0x10]                     ; Pickup SysTick Control register
        ORR r1, r1, #1                          ; Or in the enable bit
        STR r1, [r0, #0x10]                     ; Enable SysTick
;
;    /* Re-enable the interrupts */
;
        CPSIE   i
;       
;    /* Enter the scheduler for the first time.  */
;
        SVC 0                                   ; Request scheduling
;
;    /* We should never get here - ever!  */
;     
        BKPT    0xEF                            ; Setup error conditions
        BX  lr                                  ; 
;}
;
;    /* Generic context switch-out switch-in handler...  Note that this handler is 
;       common for both PendSV and SVCall.  */
;     
        EXPORT  __tx_PendSVHandler
        EXPORT  __tx_SVCallHandler
__tx_PendSVHandler  
__tx_SVCallHandler
;
;    /* Get current thread value and new thread pointer.  */
;       
__tx_ts_handler 
        LDR r0, =_tx_thread_current_ptr         ; Build current thread pointer address
        LDR r1, [r0]                            ; Pickup current thread pointer
        LDR r2, =_tx_thread_execute_ptr         ; Build execute thread pointer address
;
;    /* Determine if there is a current thread to finish preserving.  */
;       
        CBZ r1, __tx_ts_new                     ; If NULL, skip preservation
;
;    /* Recover PSP and preserve current thread context.  */
;
        MRS r12, PSP                            ; Pickup PSP pointer (thread's stack pointer)
        STMDB r12!, {r4-r11}                    ; Save its remaining registers
        STR r12, [r1, #8]                       ; Save its stack pointer
;
;    /* Determine if time-slice is active. If it isn't, skip time handling processing.  */
;
        LDR r12, =_tx_timer_time_slice          ; Build address of time-slice variable
        LDR r5, [r12]                           ; Pickup current time-slice
        CBZ r5, __tx_ts_new                     ; If not active, skip processing
;
;    /* Time-slice is active, save the current thread's time-slice and clear the global time-slice variable.  */
;
        STR r5, [r1, #24]                       ; Save current time-slice
;
;    /* Clear the global time-slice.  */
;
        MOV r5, #0                              ; Build clear value
        STR r5, [r12]                           ; Clear time-slice
;       
;    /* Executing thread is now completely preserved!!!  */
;
__tx_ts_new 
;
;    /* Now we are looking for a new thread to execute!  */
;
        LDR r3, [r2]                            ; Is there another thread ready to execute?
        CBZ r3, __tx_ts_wait                    ; No, skip to the wait processing
;
;    /* Yes, another thread is ready for else, make the current thread the new thread.  */
;
        STR r3, [r0]                            ; Setup the current thread pointer to the new thread
;
;    /* Increment the thread run count.  */
;
__tx_ts_restore 
        LDR r4, [r3, #4]                        ; Pickup the current thread run count
        ADD r4, r4, #1                          ; Increment the thread run count
        STR r4, [r3, #4]                        ; Store the new run count
;
;    /* Setup global time-slice with thread's current time-slice.  */
;
        LDR r12, =_tx_timer_time_slice          ; Build address of time-slice variable
        LDR r5, [r3, #24]                       ; Pickup thread's current time-slice
        STR r5, [r12]                           ; Setup global time-slice
;
;    /* Restore the thread context and PSP.  */
;
        LDR r12, [r3, #8]                       ; Pickup thread's stack pointer
        LDMIA r12!, {r4-r11}                    ; Recover thread's registers
        MSR PSP, r12                            ; Setup the thread's stack pointer
;
;    /* Return to thread on process stack.  */
;
        MOV lr, #0xFFFFFFFD                     ; Return to thread on process stack
;
;    /* Return to thread.  */
;       
        BX  lr                                  ; Return to thread!
;
;    /* The following is the idle wait processing... in this case, no threads are ready for execution and the
;       system will simply be idle until an interrupt occurs that makes a thread ready. Note that interrupts 
;       are disabled to allow use of WFI for waiting for a thread to arrive.  */
;
__tx_ts_wait    
        CPSID   i                               ; Disable interrupts
        LDR r3, [r2]                            ; Pickup the next thread to execute pointer
        STR r3, [r0]                            ; Store it in the current pointer
        CBNZ    r3, __tx_ts_ready               ; If non-NULL, a new thread is ready!
        CPSIE   i                               ; Enable interrupts
		WFI
__tx_ts_ISB 
        ISB                                     ; 
        B   __tx_ts_wait                        ; Loop to continue waiting
;
;    /* At this point, we have a new thread ready to go. Clear any newly pended PendSV - since we are 
;       already in the handler!  */
;
__tx_ts_ready   
        MOV r4, #0x08000000                     ; Build clear PendSV value
        MOV r5, #0xE000E000                     ; Build base NVIC address
        STR r4, [r5, #0xD04]                    ; Clear any PendSV 
;
;    /* Re-enable interrupts and restore new thread.  */
;       
        CPSIE   i                               ; Enable interrupts
        B   __tx_ts_restore                     ; Restore the thread

        ALIGN
        LTORG
        END
