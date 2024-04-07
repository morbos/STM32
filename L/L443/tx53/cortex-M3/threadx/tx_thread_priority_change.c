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


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_thread_priority_change                          PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function changes the priority of the specified thread.  It     */ 
/*    also returns the old priority and handles preemption if the calling */ 
/*    thread is currently executing and the priority change results in a  */ 
/*    higher priority thread ready for execution.                         */ 
/*                                                                        */ 
/*    Note: the preemption threshold is automatically changed to the new  */ 
/*    priority.                                                           */
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    thread_ptr                            Pointer to thread to suspend  */ 
/*    new_priority                          New thread priority           */ 
/*    old_priority                          Old thread priority           */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    status                                Completion status             */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_resume          Resume thread                     */ 
/*    _tx_thread_system_ni_resume       Non-interruptable resume thread   */ 
/*    _tx_thread_system_suspend         Suspend thread                    */ 
/*    _tx_thread_system_ni_suspend      Non-interruptable suspend thread  */ 
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    Application Code                                                    */ 
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s), and      */ 
/*                                            added logic to update and   */ 
/*                                            use the original priority,  */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            filter option to trace      */ 
/*                                            insert, added optional      */ 
/*                                            logic for non-interruptable */ 
/*                                            operation, and made several */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_thread_priority_change(TX_THREAD *thread_ptr, UINT new_priority, UINT *old_priority)
{

TX_INTERRUPT_SAVE_AREA


    /* Lockout interrupts while the thread is being suspended.  */
    TX_DISABLE

    /* Save the previous priority.  */
    *old_priority =  thread_ptr -> tx_thread_original_priority;

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_THREAD_PRIORITY_CHANGE, thread_ptr, new_priority, thread_ptr -> tx_thread_priority, thread_ptr -> tx_thread_state, TX_TRACE_THREAD_EVENTS)

    /* Determine if this thread is currently ready.  */
    if (thread_ptr -> tx_thread_state != TX_READY)
    {

        /* Easy, just setup the priority and threshold in the thread's control
           block.  */
        thread_ptr -> tx_thread_priority =                    new_priority;
        thread_ptr -> tx_thread_preempt_threshold =           new_priority;
        thread_ptr -> tx_thread_original_priority =           new_priority;
        thread_ptr -> tx_thread_original_preempt_threshold =  new_priority;

        /* Restore interrupts.  */
        TX_RESTORE
    }
    else
    {

        /* Set the state to suspended.  */
        thread_ptr -> tx_thread_state =    TX_SUSPENDED;

#ifdef TX_NOT_INTERRUPTABLE

        /* Increment the preempt disable flag.  */
        _tx_thread_preempt_disable++;

        /* Call actual non-interruptable thread suspension routine.  */
        _tx_thread_system_ni_suspend(thread_ptr, 0);

        /* At this point, the preempt disable flag is still set, so we still have 
           protection against all preemption.  */

        /* Setup the new priority for this thread.  */
        thread_ptr -> tx_thread_priority =                    new_priority;
        thread_ptr -> tx_thread_preempt_threshold =           new_priority;
        thread_ptr -> tx_thread_original_priority =           new_priority;
        thread_ptr -> tx_thread_original_preempt_threshold =  new_priority;

        /* Decrement the preempt disable flag.  */
        _tx_thread_preempt_disable--;

        /* Resume the thread with the new priority.  */
        _tx_thread_system_ni_resume(thread_ptr);

        /* Restore interrupts.  */
        TX_RESTORE
#else

        /* Increment the preempt disable flag by 2 to prevent system suspend from 
           returning to the system.  */
        _tx_thread_preempt_disable =  _tx_thread_preempt_disable + 2;

        /* Set the suspending flag. */
        thread_ptr -> tx_thread_suspending =  TX_TRUE;

        /* Setup the timeout period.  */
        thread_ptr -> tx_thread_timer.tx_timer_internal_remaining_ticks =  0;

        /* Restore interrupts.  */
        TX_RESTORE 

        /* The thread is ready and must first be removed from the list.  Call the 
           system suspend function to accomplish this.  */
        _tx_thread_system_suspend(thread_ptr);

        /* At this point, the preempt disable flag is still set, so we still have 
           protection against all preemption.  */

        /* Setup the new priority for this thread.  */
        thread_ptr -> tx_thread_priority =                    new_priority;
        thread_ptr -> tx_thread_preempt_threshold =           new_priority;
        thread_ptr -> tx_thread_original_priority =           new_priority;
        thread_ptr -> tx_thread_original_preempt_threshold =  new_priority;

        /* Resume the thread with the new priority.  */
        _tx_thread_system_resume(thread_ptr);
#endif
    }

    /* Return success if we get here!  */
    return(TX_SUCCESS);
}

