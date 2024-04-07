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
@
@
	.text
@/**************************************************************************/ 
@/*                                                                        */ 
@/*  FUNCTION                                               RELEASE        */ 
@/*                                                                        */ 
@/*    _tx_thread_stack_build                            Cortex-M3/RVDS    */ 
@/*                                                           5.2          */ 
@/*  AUTHOR                                                                */ 
@/*                                                                        */ 
@/*    William E. Lamie, Express Logic, Inc.                               */ 
@/*                                                                        */ 
@/*  DESCRIPTION                                                           */ 
@/*                                                                        */ 
@/*    This function builds a stack frame on the supplied thread's stack.  */
@/*    The stack frame results in a fake interrupt return to the supplied  */
@/*    function pointer.                                                   */ 
@/*                                                                        */ 
@/*  INPUT                                                                 */ 
@/*                                                                        */ 
@/*    thread_ptr                            Pointer to thread control blk */
@/*    function_ptr                          Pointer to return function    */
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
@/*    _tx_thread_create                     Create thread service         */
@/*                                                                        */ 
@/*  RELEASE HISTORY                                                       */ 
@/*                                                                        */ 
@/*    DATE              NAME                      DESCRIPTION             */ 
@/*                                                                        */ 
@/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
@/*  12-02-2007     William E. Lamie         Modified comment(s),          */ 
@/*                                            resulting in version 5.1    */ 
@/*  12-12-2008     William E. Lamie         Modified comment(s), and      */ 
@/*                                            added logic for 8-byte      */ 
@/*                                            stack alignment, resulting  */ 
@/*                                            in version 5.2              */ 
@/*                                                                        */ 
@/**************************************************************************/ 
@VOID   _tx_thread_stack_build(TX_THREAD *thread_ptr, VOID (*function_ptr)(VOID))
@{
        .global  _tx_thread_stack_build
_tx_thread_stack_build:	
@
@       
@    /* Build a fake interrupt frame.  The form of the fake interrupt stack
@       on the Cortex-M3 should look like the following after it is built:
@       
@       Stack Top:      
@                       r4          Initial value for r4
@                       r5          Initial value for r5
@                       r6          Initial value for r6
@                       r7          Initial value for r7
@                       r8          Initial value for r8
@                       r9          Initial value for r9
@                       r10 (sl)    Initial value for r10 (sl)
@                       r11         Initial value for r11
@                       r0          Initial value for r0    (Hardware stack starts here!!)
@                       r1          Initial value for r1
@                       r2          Initial value for r2
@                       r3          Initial value for r3
@                       r12         Initial value for r12
@                       lr          Initial value for lr
@                       pc          Initial value for pc
@                       xPSR        Initial value for xPSR
@
@    Stack Bottom: (higher memory address)  */
@
    LDR     r2, [r0, #16]                       @ Pickup end of stack area
    SUB     r2, r2, #64                         @ Subtract frame size
    BIC     r2, r2, #0x7                        @ Align frame
@
@    /* Actually build the stack frame.  */
@
    MOV     r3, #0                              @ Build initial register value
    STR     r3, [r2, #0]                        @ Store initial r4
    STR     r3, [r2, #4]                        @ Store initial r5
    STR     r3, [r2, #8]                        @ Store initial r6
    STR     r3, [r2, #12]                       @ Store initial r7
    STR     r3, [r2, #16]                       @ Store initial r8
    STR     r3, [r2, #20]                       @ Store initial r9
    LDR     r3, [r0, #12]                       @ Pickup stack starting address
    STR     r3, [r2, #24]                       @ Store initial r10 (sl)
    MOV     r3, #0                              @ Build initial register value
    STR     r3, [r2, #28]                       @ Store initial r11
@
@    /* Hardware stack follows.  /
@
    STR     r3, [r2, #32]                       @ Store initial r0
    STR     r3, [r2, #36]                       @ Store initial r1
    STR     r3, [r2, #40]                       @ Store initial r2
    STR     r3, [r2, #44]                       @ Store initial r3
    STR     r3, [r2, #48]                       @ Store initial r12
    MOV     r3, #0xFFFFFFFF                     @ Poison EXC_RETURN value
    STR     r3, [r2, #52]                       @ Store initial lr
    STR     r1, [r2, #56]                       @ Store initial pc
    MOV     r3, #0x01000000                     @ Only T-bit need be set
    STR     r3, [r2, #60]                       @ Store initial xPSR
@
@    /* Setup stack pointer.  */
@    thread_ptr -> tx_thread_stack_ptr =  r2@
@
    STR     r2, [r0, #8]                        @ Save stack pointer in thread's
                                                @   control block
    BX      lr                                  @ Return to caller
@}
    .end

