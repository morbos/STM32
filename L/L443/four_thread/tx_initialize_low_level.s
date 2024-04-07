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

	.extern	_stack_top
	.extern	rst_handler
	.data
@
	.section .nvic_table
        .global  __tx_vectors
__tx_vectors:	
        .word _stack_top                          @ Reset and system stack ptr
        .word rst_handler                         @ Reset goes to startup function
        .word __tx_NMIHandler                     @ NMI
        .word __tx_HardFault                      @ HardFault
        .word 0                                   @ MemManage
        .word 0                                   @ BusFault
        .word __tx_UsageFault                     @ UsageFault
        .word 0                                   @ 7
        .word 0                                   @ 8
        .word 0                                   @ 9
        .word 0                                   @ 10
        .word __tx_SVCallHandler                  @ SVCall
        .word __tx_DBGHandler                     @ Monitor
        .word 0                                   @ 13
        .word __tx_PendSVHandler                  @ PendSV
        .word __tx_SysTickHandler                 @ SysTick
    @ Peripherial interrupts start here.
    .word	__tx_BadHandler                      @ GPIO Port A			16
    .word	__tx_BadHandler                      @ GPIO Port B			17
    .word	__tx_BadHandler                      @ GPIO Port C			18
    .word	__tx_BadHandler                      @ GPIO Port D			19
    .word	__tx_BadHandler                      @ GPIO Port E			20
    .word	__tx_BadHandler                      @ UART0 Rx and Tx			21
    .word	__tx_BadHandler                      @ UART1 Rx and Tx			22
    .word	__tx_BadHandler                      @ SSI0 Rx and Tx			23
    .word	__tx_BadHandler                      @ I2C0 Master and Slave		24
    .word	__tx_BadHandler                      @ PWM Fault			25
    .word	__tx_BadHandler                      @ PWM Generator 0			26
    .word	__tx_BadHandler                      @ PWM Generator 1			27
    .word	__tx_BadHandler                      @ PWM Generator 2			28
    .word	__tx_BadHandler                      @ Quadrature Encoder 0		29
    .word	__tx_BadHandler                      @ ADC Sequence 0			30
    .word	__tx_BadHandler                      @ ADC Sequence 1			31
    .word	__tx_BadHandler                      @ ADC Sequence 2			32
    .word	__tx_BadHandler                      @ ADC Sequence 3			33
    .word	__tx_BadHandler                      @ Watchdog timer			34
    .word	__tx_BadHandler                      @ Timer 0 subtimer A		35
    .word	__tx_BadHandler                      @ Timer 0 subtimer B		36
    .word	__tx_BadHandler                      @ Timer 1 subtimer A		37
    .word	__tx_BadHandler                      @ Timer 1 subtimer B		38
    .word	__tx_BadHandler                      @ Timer 2 subtimer A		39
    .word	__tx_BadHandler                      @ Timer 2 subtimer B		40
    .word	__tx_BadHandler                      @ Analog Comparator 0		41
    .word	__tx_BadHandler                      @ Analog Comparator 1		42
    .word	__tx_BadHandler                      @ Analog Comparator 2		43
    .word	__tx_BadHandler                      @ System Control (PLL, OSC, BO)	44
    .word	__tx_BadHandler                      @ FLASH Control			45
    .word	__tx_BadHandler                      @ GPIO Port F			46
    .word	__tx_BadHandler                      @ GPIO Port G			47
    .word	__tx_BadHandler                      @ GPIO Port H			48
    .word	__tx_BadHandler                      @ UART2 Rx and Tx			49
    .word	__tx_BadHandler                      @ SSI1 Rx and Tx			50
    .word	__tx_BadHandler                      @ Timer 3 subtimer A		51
    .word	__tx_BadHandler                      @ Timer 3 subtimer B		52
    .word	__tx_BadHandler                      @ I2C1 Master and Slave		53
    .word	__tx_BadHandler                      @ Quadrature Encoder 1		54
    .word	__tx_BadHandler                      @ CAN0				55
    .word	__tx_BadHandler                      @ CAN1				56
    .word	__tx_BadHandler                      @ CAN2				57
    .word	__tx_BadHandler                      @ Ethernet				58
    .word	__tx_BadHandler                      @ Hibernate			59
    .word       __tx_BadHandler                      @ USB0				60
    .word	__tx_BadHandler                      @ PWM Generator 3			61
    .word	__tx_BadHandler                      @ uDMA Software Transfer		62
    .word	__tx_BadHandler                      @ uDMA Error			63
    .word	__tx_BadHandler                      @ ADC1 Sequence 0			64
    .word	__tx_BadHandler                      @ ADC1 Sequence 1			65
    .word	__tx_BadHandler                      @ ADC1 Sequence 2			66
    .word	__tx_BadHandler                      @ ADC1 Sequence 3			67
    .word	__tx_BadHandler                      @ I2S0				68
    .word	__tx_BadHandler                      @ External Bus Interface 0		69
    .word	__tx_BadHandler                      @ GPIO Port J			70
    .word	__tx_BadHandler                      @ GPIO Port K			71
    .word	__tx_BadHandler                      @ GPIO Port L			72
    .word	__tx_BadHandler                      @ SSI2 Rx and Tx			73
    .word	__tx_BadHandler                      @ SSI3 Rx and Tx			74
    .word	__tx_BadHandler                      @ UART3 Rx and Tx			75
    .word	__tx_BadHandler                      @ UART4 Rx and Tx			76
    .word	__tx_BadHandler                      @ UART5 Rx and Tx			77
    .word	__tx_BadHandler                      @ UART6 Rx and Tx			78
    .word	__tx_BadHandler                      @ UART7 Rx and Tx			79
    .word	0				     @ Reserved				80
    .word	0				     @ Reserved				81
    .word	0				     @ Reserved				82
    .word	0				     @ Reserved				83
    .word	__tx_BadHandler                      @ I2C2 Master and Slave		84
    .word	__tx_BadHandler                      @ I2C3 Master and Slave		85
    .word	__tx_BadHandler                      @ Timer 4 subtimer A		86
    .word	__tx_BadHandler                      @ Timer 4 subtimer B		87
    .word	0				     @ Reserved				88
    .word	0				     @ Reserved				89
    .word	0				     @ Reserved				90
    .word	0				     @ Reserved				91
    .word	0				     @ Reserved				92
    .word	0				     @ Reserved				93
    .word	0				     @ Reserved				94
    .word	0				     @ Reserved				95
    .word	0				     @ Reserved				96
    .word	0				     @ Reserved				97
    .word	0				     @ Reserved				98
    .word	0				     @ Reserved				99
    .word	0				     @ Reserved				100
    .word	0				     @ Reserved				101
    .word	0				     @ Reserved				102
    .word	0				     @ Reserved				103
    .word	0				     @ Reserved				104
    .word	0				     @ Reserved				105
    .word	0				     @ Reserved				106
    .word	0				     @ Reserved				107
    .word	__tx_BadHandler                      @ Timer 5 subtimer A		108
    .word	__tx_BadHandler                      @ Timer 5 subtimer B		109
    .word	__tx_BadHandler                      @ Wide Timer 0 subtimer A		110
    .word	__tx_BadHandler                      @ Wide Timer 0 subtimer B		111
    .word	__tx_BadHandler                      @ Wide Timer 1 subtimer A		112
    .word	__tx_BadHandler                      @ Wide Timer 1 subtimer B		113
    .word	__tx_BadHandler                      @ Wide Timer 2 subtimer A		114
    .word	__tx_BadHandler                      @ Wide Timer 2 subtimer B		115
    .word	__tx_BadHandler                      @ Wide Timer 3 subtimer A		116
    .word	__tx_BadHandler                      @ Wide Timer 3 subtimer B		117
    .word	__tx_BadHandler                      @ Wide Timer 4 subtimer A		118
    .word	__tx_BadHandler                      @ Wide Timer 4 subtimer B		119
    .word	__tx_BadHandler                      @ Wide Timer 5 subtimer A		120
    .word	__tx_BadHandler                      @ Wide Timer 5 subtimer B		121
    .word	__tx_BadHandler                      @ FPU				122
    .word	__tx_BadHandler                      @ PECI 0				123
    .word	__tx_BadHandler                      @ LPC 0				124
    .word	__tx_BadHandler                      @ I2C4 Master and Slave		125
    .word	__tx_BadHandler                      @ I2C5 Master and Slave		126
    .word	__tx_BadHandler                      @ GPIO Port M			127
    .word	__tx_BadHandler                      @ GPIO Port N			128
    .word	__tx_BadHandler                      @ Quadrature Encoder 2		129
    .word	__tx_BadHandler                      @ Fan 0				130
    .word	0				     @ Reserved				131
    .word	__tx_BadHandler                      @ GPIO Port P (Summary or P0)	132
    .word	__tx_BadHandler                      @ GPIO Port P1			133
    .word	__tx_BadHandler                      @ GPIO Port P2			134
    .word	__tx_BadHandler                      @ GPIO Port P3			135
    .word	__tx_BadHandler                      @ GPIO Port P4			136
    .word	__tx_BadHandler                      @ GPIO Port P5			137
    .word	__tx_BadHandler                      @ GPIO Port P6			138
    .word	__tx_BadHandler                      @ GPIO Port P7			139
    .word	__tx_BadHandler                      @ GPIO Port Q (Summary or Q0)	140
    .word	__tx_BadHandler                      @ GPIO Port Q1			141
    .word	__tx_BadHandler                      @ GPIO Port Q2			142
    .word	__tx_BadHandler                      @ GPIO Port Q3			143
    .word	__tx_BadHandler                      @ GPIO Port Q4			144
    .word	__tx_BadHandler                      @ GPIO Port Q5			145
    .word	__tx_BadHandler                      @ GPIO Port Q6			146
    .word	__tx_BadHandler                      @ GPIO Port Q7			147
    .word	__tx_BadHandler                      @ GPIO Port R			148
    .word	__tx_BadHandler                      @ GPIO Port S			149
    .word	__tx_BadHandler                      @ PWM 1 Generator 0		150
    .word	__tx_BadHandler                      @ PWM 1 Generator 1		151
    .word	__tx_BadHandler                      @ PWM 1 Generator 2		152
    .word	__tx_BadHandler                      @ PWM 1 Generator 3		153
    .word	__tx_BadHandler                      @ PWM 1 Fault			154

	.section .text
	.thumb
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
	.extern  _end_bss
	.thumb_func
        .global  _tx_initialize_low_level
_tx_initialize_low_level:

@
@    /* Set base of available memory to end of non-initialised RAM area.  */
@     
        LDR r0, =_tx_initialize_unused_memory   @ Build address of unused memory pointer
        LDR r1, =_end_bss		        @ Build first free address (!!!!!)
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

@        LDR r1, =0xbF000000                     @ SVCl, Rsrv, Rsrv, Rsrv
        LDR r1, =0xFF000000                     @ SVCl, Rsrv, Rsrv, Rsrv
        STR r1, [r0, #0xD1C]                    @ Setup System Handlers 8-11 Priority Registers
                                                @ Note: SVC must be lowest priority, which is 0xFF

        LDR r1, =0x40FF0000                     @ SysT, PnSV, Rsrv, DbgM
        STR r1, [r0, #0xD20]                    @ Setup System Handlers 12-15 Priority Registers


@	LDR r1, =(7 << 16)
@        STR r1, [r0, #0xD24]

@	ldr	r0,=0xff
@	msr	basepri,r0
@	mrs	r0,basepri
	

@
@    /* Return to caller.  */
@    
        BX  lr 
@}
@
@       
@/* Define shells for each of the unused vectors.  */
@
	.thumb_func
        .global  __tx_BadHandler
__tx_BadHandler:	
        B   __tx_BadHandler

	.thumb_func
        .global  __tx_HardFault
__tx_HardFault:	
        B   __tx_HardFault

	.thumb_func
        .global  __tx_UsageFault
__tx_UsageFault:	
        B   __tx_UsageFault
		
	.thumb_func
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

	.thumb_func
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

	.thumb_func
        .global  __tx_NMIHandler 
__tx_NMIHandler:	
        B   __tx_NMIHandler

	.thumb_func
        .global  __tx_DBGHandler
__tx_DBGHandler:	
        B   __tx_DBGHandler

	.thumb_func
	.global _tx_v7m_get_int
_tx_v7m_get_int:
	MRS r0, PRIMASK
	BX  lr

	.thumb_func
	.global _tx_v7m_disable_int
_tx_v7m_disable_int:	
	NOP
	CPSID i
	BX lr

	.thumb_func
	.global _tx_v7m_set_int
_tx_v7m_set_int:	
	MSR PRIMASK, r0
	BX lr
	.thumb_func
	.global _tx_clz
_tx_clz:	
	CLZ   R0, R0
	BX    lr
	
@        ALIGN
@        LTORG

        .end
