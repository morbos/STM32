/**************************************************************************/ 
/*                                                                        */ 
/*            Copyright (c) 1996-2009 by Express Logic Inc.               */ 
/*                                                                        */ 
/*  This software is copyrighted by and is the sole property of Express   */ 
/*  Logic, Inc.  All rights, title, ownership, or other interests         */ 
/*  in the software remain the property of Express Logic, Inc.  This      */ 
/*  software may only be used in accordance with the corresponding        */ 
/*  license agreement.  Any unauthorized use, duplication, transmission,  */ 
/*  distribution, or disclosure of this software is expressly forbidden.  */ 
/*                                                                        */
/*  This Copyright notice may not be removed or modified without prior    */ 
/*  written consent of Express Logic, Inc.                                */ 
/*                                                                        */ 
/*  Express Logic, Inc. reserves the right to modify this software        */ 
/*  without notice.                                                       */ 
/*                                                                        */ 
/*  Express Logic, Inc.                     info@expresslogic.com         */
/*  11423 West Bernardo Court               http://www.expresslogic.com   */
/*  San Diego, CA  92127                                                  */
/*                                                                        */
/**************************************************************************/


/**************************************************************************/
/**************************************************************************/
/**                                                                       */ 
/** ThreadX Component                                                     */ 
/**                                                                       */
/**   Thread                                                              */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Locate thread control component data in this file.  */

#define TX_THREAD_INIT


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_initialize.h"
#include "tx_thread.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_thread_initialize                               PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function initializes the various control data structures for   */ 
/*    the thread control component.                                       */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    None                                                                */
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    None                                                                */
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    None                                                                */
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    _tx_initialize_high_level         High level initialization         */ 
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s), and      */ 
/*                                            added logic to use preset   */ 
/*                                            global C data, resulting    */ 
/*                                            in version 5.1              */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            macro to set current thread,*/ 
/*                                            added new bit assignments   */ 
/*                                            for _tx_build_options, and  */ 
/*                                            removed logic to setup the  */ 
/*                                            lowest bit set table since  */ 
/*                                            it is no longer required,   */ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
VOID  _tx_thread_initialize(VOID)
{

    /* Note: the system stack pointer and the system state variables are 
       initialized by the low and high-level initialization functions,
       respectively.  */

#ifndef TX_DISABLE_REDUNDANT_CLEARING

    /* Set current thread pointer to NULL.  */
    TX_THREAD_SET_CURRENT(TX_NULL)

    /* Initialize the execute thread pointer to NULL.  */
    _tx_thread_execute_ptr =  TX_NULL;

    /* Initialize the priority information.  */
    memset(&_tx_thread_priority_maps[0], 0, sizeof(_tx_thread_priority_maps));

#ifndef TX_DISABLE_PREEMPTION_THRESHOLD
    memset(&_tx_thread_preempted_maps[0], 0, sizeof(_tx_thread_preempted_maps));
#endif
#endif

    /* Setup the highest priority variable to the max, indicating no thread is currently
       ready.  */
    _tx_thread_highest_priority =  TX_MAX_PRIORITIES;


#ifndef TX_DISABLE_REDUNDANT_CLEARING

    /* Initialize the array of priority head pointers.  */
    memset(&_tx_thread_priority_list[0], 0, sizeof(_tx_thread_priority_list));

    /* Initialize the head pointer of the created threads list and the
       number of threads created.  */
    _tx_thread_created_ptr =        TX_NULL;
    _tx_thread_created_count =      0;

    /* Clear the global preempt disable variable.  */
    _tx_thread_preempt_disable =  0;

#ifdef TX_ENABLE_STACK_CHECKING

    /* Clear application registered stack error handler.  */
    _tx_thread_application_stack_error_handler =  TX_NULL;
#endif

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

    /* Clear performance counters.  */
    _tx_thread_performance_resume_count =                0;
    _tx_thread_performance_suspend_count =               0;
    _tx_thread_performance_solicited_preemption_count =  0;
    _tx_thread_performance_interrupt_preemption_count =  0;
    _tx_thread_performance_priority_inversion_count =    0;
    _tx_thread_performance_time_slice_count =            0;
    _tx_thread_performance_relinquish_count =            0;
    _tx_thread_performance_timeout_count =               0;
    _tx_thread_performance_wait_abort_count =            0;
    _tx_thread_performance_idle_return_count =           0;
    _tx_thread_performance_non_idle_return_count =       0;

    /* Initialize the execute thread log.  */
    memset(&_tx_thread_performance_execute_log[0], 0, sizeof(_tx_thread_performance_execute_log));
#endif
#endif

    /* Setup the build options flag. This is used to identify how the ThreadX library was constructed.  */
    _tx_build_options =  _tx_build_options 
                            | (((ULONG) (TX_MAX_PRIORITIES/32)) << 24) 
#ifdef TX_NOT_INTERRUPTABLE
                            | (((ULONG) 1) << 31)
#endif
#ifdef TX_INLINE_THREAD_RESUME_SUSPEND
                            | (((ULONG) 1) << 30)
#endif
#ifdef TX_TIMER_PROCESS_IN_ISR
                            | (((ULONG) 1) << 23)
#endif
#ifdef TX_REACTIVATE_INLINE
                            | (((ULONG) 1) << 22)
#endif
#ifdef TX_DISABLE_STACK_FILLING
                            | (((ULONG) 1) << 21)
#endif
#ifdef TX_ENABLE_STACK_CHECKING
                            | (((ULONG) 1) << 20)
#endif
#ifdef TX_DISABLE_PREEMPTION_THRESHOLD
                            | (((ULONG) 1) << 19)
#endif
#ifdef TX_DISABLE_REDUNDANT_CLEARING
                            | (((ULONG) 1) << 18)
#endif
#ifdef TX_DISABLE_NOTIFY_CALLBACKS
                            | (((ULONG) 1) << 17)
#endif
#ifdef TX_BLOCK_POOL_ENABLE_PERFORMANCE_INFO
                            | (((ULONG) 1) << 16)
#endif
#ifdef TX_BYTE_POOL_ENABLE_PERFORMANCE_INFO
                            | (((ULONG) 1) << 15)
#endif
#ifdef TX_EVENT_FLAGS_ENABLE_PERFORMANCE_INFO
                            | (((ULONG) 1) << 14)
#endif
#ifdef TX_MUTEX_ENABLE_PERFORMANCE_INFO
                            | (((ULONG) 1) << 13)
#endif
#ifdef TX_QUEUE_ENABLE_PERFORMANCE_INFO
                            | (((ULONG) 1) << 12)
#endif
#ifdef TX_SEMAPHORE_ENABLE_PERFORMANCE_INFO
                            | (((ULONG) 1) << 11)
#endif
#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO
                            | (((ULONG) 1) << 10)
#endif
#ifdef TX_TIMER_ENABLE_PERFORMANCE_INFO
                            | (((ULONG) 1) << 9)
#endif
#ifdef TX_ENABLE_EVENT_TRACE 
                            | (((ULONG) 1) << 8)
#endif
                            | TX_PORT_SPECIFIC_BUILD_OPTIONS ;
}

