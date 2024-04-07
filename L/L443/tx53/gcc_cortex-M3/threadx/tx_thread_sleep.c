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
#include "tx_trace.h"
#include "tx_thread.h"
#include "tx_timer.h"

/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_thread_sleep                                    PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function handles application thread sleep requests.  If the    */ 
/*    sleep request was called from a non-thread, an error is returned.   */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    timer_ticks                           Number of timer ticks to sleep*/ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    status                                Return completion status      */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_suspend         Actual thread suspension          */ 
/*    _tx_thread_system_ni_suspend      Non-interruptable suspend thread  */ 
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    Application code                                                    */ 
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            filter option to trace      */ 
/*                                            insert, added optional      */ 
/*                                            logic for non-interruptable */ 
/*                                            operation, and added macro  */ 
/*                                            to get current thread,      */ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_thread_sleep(ULONG timer_ticks)
{

TX_INTERRUPT_SAVE_AREA

TX_THREAD       *thread_ptr;


    /* Lockout interrupts while the thread is being resumed.  */
    TX_DISABLE

    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(thread_ptr)

    /* Determine if this is a legal request.  */
#ifndef TX_TIMER_PROCESS_IN_ISR
    if ((!thread_ptr) || (thread_ptr == &_tx_timer_thread) || (_tx_thread_system_state))
#else
    if ((!thread_ptr) || (_tx_thread_system_state))
#endif
    {

        /* Restore interrupts.  */
        TX_RESTORE
        
        /* Illegal caller of this service.  */
        return(TX_CALLER_ERROR);
    }

    /* Determine if the requested number of ticks is zero.  */
    if (timer_ticks == 0)
    { 

        /* Restore interrupts.  */
        TX_RESTORE
      
        /* Just return with a successful status.  */
        return(TX_SUCCESS);
    }

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_THREAD_SLEEP, timer_ticks, thread_ptr -> tx_thread_state, &thread_ptr, 0, TX_TRACE_THREAD_EVENTS)

    /* Suspend the current thread.  */

    /* Set the state to suspended.  */
    thread_ptr -> tx_thread_state =    TX_SLEEP;

#ifdef TX_NOT_INTERRUPTABLE

    /* Call actual non-interruptable thread suspension routine.  */
    _tx_thread_system_ni_suspend(thread_ptr, timer_ticks);

    /* Restore interrupts.  */
    TX_RESTORE
#else

    /* Set the suspending flag. */
    thread_ptr -> tx_thread_suspending =  TX_TRUE;

    /* Initialize the status to successful.  */
    thread_ptr -> tx_thread_suspend_status =  TX_SUCCESS;

    /* Setup the timeout period.  */
    thread_ptr -> tx_thread_timer.tx_timer_internal_remaining_ticks =  timer_ticks;

    /* Temporarily disable preemption.  */
    _tx_thread_preempt_disable++;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Call actual thread suspension routine.  */
    _tx_thread_system_suspend(thread_ptr);
#endif

    /* Return status to the caller.  */
    return(thread_ptr -> tx_thread_suspend_status);
}

