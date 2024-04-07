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


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_timer.h"
#include "tx_thread.h"
#include "tx_trace.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_thread_time_slice                               PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function moves the currently executing thread to the end of    */ 
/*    the threads ready at the same priority level as a result of a       */ 
/*    time-slice interrupt.  If no other thread of the same priority is   */ 
/*    ready, this function simply returns.                                */ 
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
/*    [_tx_thread_stack_error_handler]      Handle thread stack errors    */ 
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    _tx_timer_interrupt                   Timer interrupt handling      */ 
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            macro to get current thread,*/ 
/*                                            added event trace call,     */ 
/*                                            added filter option to trace*/ 
/*                                            insert, added stack check   */ 
/*                                            macro, and added thread     */ 
/*                                            pointer check in stack      */ 
/*                                            checking logic, resulting   */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
VOID  _tx_thread_time_slice(VOID)
{

TX_INTERRUPT_SAVE_AREA

TX_THREAD       *thread_ptr;          


    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(thread_ptr)

#ifdef TX_ENABLE_STACK_CHECKING 

    /* Determine if there is a thread. */
    if (thread_ptr)
    {
    
        /* Check this thread's stack.  */
        TX_THREAD_STACK_CHECK(thread_ptr)
    }
#endif

    /* Lockout interrupts while the time-slice is evaluated.  */
    TX_DISABLE

    /* Clear the expired time-slice flag.  */
    _tx_timer_expired_time_slice =  TX_FALSE;

    /* Make sure the thread is still active, i.e. not suspended.  */
    if ((thread_ptr) && (thread_ptr -> tx_thread_state == TX_READY))
    {

        /* Setup a fresh time-slice for the thread.  */
        thread_ptr -> tx_thread_time_slice =  thread_ptr -> tx_thread_new_time_slice;

        /* Determine if there is another thread at the same priority and preemption-threshold
           is not set.  Preemption-threshold overrides time-slicing.  */
        if ((thread_ptr -> tx_thread_ready_next != thread_ptr) &&
                 (thread_ptr -> tx_thread_priority == thread_ptr -> tx_thread_preempt_threshold))
        {
        
            /* There is another thread at this priority, make it the highest at
               this priority level.  */
            _tx_thread_priority_list[thread_ptr -> tx_thread_priority] =  thread_ptr -> tx_thread_ready_next;
    
            /* Designate the highest priority thread as the one to execute.  Don't use this 
               thread's priority as an index just in case a higher priority thread is now 
               ready!  */
            _tx_thread_execute_ptr =  _tx_thread_priority_list[_tx_thread_highest_priority];

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

            /* Increment the thread's time-slice counter.  */
            thread_ptr -> tx_thread_performance_time_slice_count++;

            /* Increment the total number of thread time-slice operations.  */
            _tx_thread_performance_time_slice_count++;
#endif


#ifdef TX_ENABLE_STACK_CHECKING 

            /* Pickup the next execute pointer.  */
            thread_ptr =  _tx_thread_execute_ptr;

            /* Check this thread's stack.  */
            TX_THREAD_STACK_CHECK(thread_ptr)
#endif

        }
        else
        {

            /* Reset the actual time-slice variable.  */
            _tx_timer_time_slice =  thread_ptr -> tx_thread_time_slice;
        }
    }

    /* Insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_TIME_SLICE, _tx_thread_execute_ptr, _tx_thread_system_state, _tx_thread_preempt_disable, &thread_ptr, TX_TRACE_INTERNAL_EVENTS)

    /* Restore previous interrupt posture.  */
    TX_RESTORE
}

