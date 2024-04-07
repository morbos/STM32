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
@/**   Initialize                                                          */
@/**                                                                       */
@/**************************************************************************/
@/**************************************************************************/
@
@#define TX_SOURCE_CODE
@
@
@/* Include necessary system files.  */
@
@#include "tx_api.h"
@#include "tx_initialize.h"
@#include "tx_thread.h"
@#include "tx_timer.h"
@
@
        .global  _tx_thread_system_stack_ptr
        .global  _tx_initialize_unused_memory
        .global  _tx_thread_context_save
        .global  _tx_thread_context_restore
        .global  _tx_timer_interrupt
        .global  __main
        .global  __tx_SVCallHandler
        .global  __tx_PendSVHandler
@
@
SYSTEM_CLOCK      =   6000000
SYSTICK_CYCLES    =   ((SYSTEM_CLOCK / 100) -1)
@
@
@/* Setup the stack and heap areas.  */
@
STACK_SIZE          =     0x00000400
HEAP_SIZE           =     0x00000000

@	.data
@StackMem
@        SPACE   STACK_SIZE
@__initial_sp


@        AREA    HEAP, NOINIT, READWRITE, ALIGN=3
@__heap_base
@HeapMem
@        SPACE   HEAP_SIZE
@__heap_limit

	.thumb
@
        .global  __tx_vectors
__tx_vectors:	
        .word __initial_sp                        @ Reset and system stack ptr
        .word __main                              @ Reset goes to startup function
        .word __tx_NMIHandler                     @ NMI
        .word __tx_BadHandler                     @ HardFault
        .word 0                                   @ MemManage
        .word 0                                   @ BusFault
        .word 0                                   @ UsageFault
        .word 0                                   @ 7
        .word 0                                   @ 8
        .word 0                                   @ 9
        .word 0                                   @ 10
        .word __tx_SVCallHandler                  @ SVCall
        .word __tx_DBGHandler                     @ Monitor
        .word 0                                   @ 13
        .word __tx_PendSVHandler                  @ PendSV
        .word __tx_SysTickHandler                 @ SysTick
        .word __tx_IntHandler                     @ Int 0
        .word __tx_IntHandler                     @ Int 1
        .word __tx_IntHandler                     @ Int 2
        .word __tx_IntHandler                     @ Int 3
        
@
@
@        AREA ||.text||, CODE, READONLY
@/**************************************************************************/ 
@/*                                                                        */ 
@/*  FUNCTION                                               RELEASE        */ 
@/*                                                                        */ 
@/*    _tx_initialize_low_level                          Cortex-M3/RVDS    */ 
@/*                                                           5.2          */ 
@/*  AUTHOR                                                                */ 
@/*                                                                        */ 
@/*    William E. Lamie, Express Logic, Inc.                               */ 
@/*                                                                        */ 
@/*  DESCRIPTION                                                           */ 
@/*                                                                        */ 
@/*    This function is responsible for any low-level processor            */ 
@/*    initialization, including setting up interrupt vectors, setting     */ 
@/*    up a periodic timer interrupt source, saving the system stack       */ 
@/*    pointer for use in ISR processing later, and finding the first      */ 
@/*    available RAM memory address for tx_application_define.             */ 
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
@/*    _tx_initialize_kernel_enter           ThreadX entry function        */ 
@/*                                                                        */ 
@/*  RELEASE HISTORY                                                       */ 
@/*                                                                        */ 
@/*    DATE              NAME                      DESCRIPTION             */ 
@/*                                                                        */ 
@/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
@/*  12-02-2007     William E. Lamie         Modified comment(s), added    */ 
@/*                                            setup for interrupt vector  */ 
@/*                                            table assignment, and       */ 
@/*                                            changed SVC/PENDSV priority */ 
@/*                                            to default to the lowest,   */ 
@/*                                            resulting in version 5.1    */ 
@/*  12-12-2008     William E. Lamie         Modified comment(s), and      */ 
@/*                                            changed setup for stack     */ 
@/*                                            and heap areas, resulting   */ 
@/*                                            in version 5.2              */ 
@/*                                                                        */ 
@/**************************************************************************/
@VOID   _tx_initialize_low_level(VOID)
@{
        .global  _tx_initialize_low_level
_tx_initialize_low_level:

@
@    /* Set base of available memory to end of non-initialised RAM area.  */
@     
        LDR r0, =_tx_initialize_unused_memory   @ Build address of unused memory pointer
        LDR r1, =0x20000             @ Build first free address (!!!!!)
        ADD r1, r1, #4                          @ 
        STR r1, [r0]                            @ Setup first unused memory pointer
@
@    /* Setup Vector Table Offset Register.  */
@    
        MOV r0, #0xE000E000                     @ Build address of NVIC registers
        LDR r1, =__tx_vectors                   @ Pickup address of vector table
        STR r1, [r0, #0xD08]                    @ Set vector table address   
@
@    /* Set system stack pointer from vector value.  */
@
        LDR r0, =_tx_thread_system_stack_ptr    @ Build address of system stack pointer
        LDR r1, =__tx_vectors                   @ Pickup address of vector table
        LDR r1, [r1]                            @ Pickup reset stack pointer
        STR r1, [r0]                            @ Save system stack pointer
@
@    /* Configure SysTick for 100Hz clock, or 16384 cycles if no reference.  */
@
        MOV r0, #0xE000E000                     @ Build address of NVIC registers
        LDR r1, =SYSTICK_CYCLES
        STR r1, [r0, #0x14]                     @ Setup SysTick Reload Value
        MOV r1, #0x7                            @ Build SysTick Control Enable Value
        STR r1, [r0, #0x10]                     @ Setup SysTick Control
@
@    /* Configure handler priorities.  */
@
        LDR r1, =0x00000000                     @ Rsrv, UsgF, BusF, MemM
        STR r1, [r0, #0xD18]                    @ Setup System Handlers 4-7 Priority Registers

        LDR r1, =0xFF000000                     @ SVCl, Rsrv, Rsrv, Rsrv
        STR r1, [r0, #0xD1C]                    @ Setup System Handlers 8-11 Priority Registers
                                                @ Note: SVC must be lowest priority, which is 0xFF

        LDR r1, =0x40FF0000                     @ SysT, PnSV, Rsrv, DbgM
        STR r1, [r0, #0xD20]                    @ Setup System Handlers 12-15 Priority Registers
                                                @ Note: PnSV must be lowest priority, which is 0xFF
@
@    /* Return to caller.  */
@    
        BX  lr 
@}
@
@       
@/* Define initial heap/stack routine for the ARM RVCT startup code.
@   This routine will set the initial stack and heap locations */
@
        .global  __user_initial_stackheap
__user_initial_stackheap:	
        LDR     R0, =HeapMem
        LDR     R1, =(StackMem + STACK_SIZE)
        LDR     R2, =(HeapMem + HEAP_SIZE)
        LDR     R3, =StackMem
        BX      LR
@
@
@/* Define shells for each of the unused vectors.  */
@
        .global  __tx_BadHandler
__tx_BadHandler:	
        B   __tx_BadHandler


        .global  __tx_IntHandler
__tx_IntHandler:
@ VOID InterruptHandler (VOID)
@ {
        PUSH    {lr}
        BL  _tx_thread_context_save
        
@    /* Do interrupt handler work here */
@    /* .... */

        B       _tx_thread_context_restore
@ }

        .global  __tx_SysTickHandler
__tx_SysTickHandler:	
@ VOID TimerInterruptHandler (VOID)
@ {
@
        PUSH    {lr}
        BL      _tx_thread_context_save
        BL      _tx_timer_interrupt
        B       _tx_thread_context_restore
@ }

        .global  __tx_NMIHandler 
__tx_NMIHandler:	
        B   __tx_NMIHandler

        .global  __tx_DBGHandler
__tx_DBGHandler:	
        B   __tx_DBGHandler

	.global _tx_v7m_get_int
_tx_v7m_get_int:
	MRS r0, PRIMASK
	BX  lr

	.global _tx_v7m_disable_int
_tx_v7m_disable_int:	
	NOP
	CPSID i
	BX lr

	.global _tx_v7m_set_int
_tx_v7m_set_int:	
	MSR PRIMASK, r0
	BX lr
	.global _tx_clz
_tx_clz:	
	CLZ   R0, R0
	BX    lr
	
@        ALIGN
@        LTORG

        .end
