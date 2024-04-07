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
/**   Mutex                                                               */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_thread.h"
#include "tx_mutex.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_mutex_get                                       PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function gets the specified mutex.  If the calling thread      */ 
/*    already owns the mutex, an ownership count is simply increased.     */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    mutex_ptr                         Pointer to mutex control block    */ 
/*    wait_option                       Suspension option                 */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    status                            Completion status                 */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_suspend         Suspend thread service            */ 
/*    _tx_thread_system_ni_suspend      Non-interruptable suspend thread  */ 
/*    _tx_mutex_priority_change         Inherit thread priority           */ 
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
/*  04-02-2007     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            macro to get current thread,*/ 
/*                                            added filter option to trace*/ 
/*                                            insert, added optional      */ 
/*                                            logic for non-interruptable */ 
/*                                            operation, and made several */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_mutex_get(TX_MUTEX *mutex_ptr, ULONG wait_option)
{

TX_INTERRUPT_SAVE_AREA

TX_THREAD       *thread_ptr;            
TX_MUTEX        *next_mutex;
TX_MUTEX        *previous_mutex;
TX_THREAD       *mutex_owner;
ULONG           suspended_count;
TX_THREAD       *next_thread;
TX_THREAD       *previous_thread;


    /* Disable interrupts to get an instance from the mutex.  */
    TX_MUTEX_DISABLE

#ifdef TX_MUTEX_ENABLE_PERFORMANCE_INFO

    /* Increment the total mutex get counter.  */
    _tx_mutex_performance_get_count++;

    /* Increment the number of attempts to get this mutex.  */
    mutex_ptr -> tx_mutex_performance_get_count++;
#endif

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_MUTEX_GET, mutex_ptr, wait_option, mutex_ptr -> tx_mutex_owner, mutex_ptr -> tx_mutex_ownership_count, TX_TRACE_MUTEX_EVENTS)

    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(thread_ptr)

    /* Determine if there is an instance of the mutex.  */
    if (mutex_ptr -> tx_mutex_ownership_count == 0)
    {

        /* Set the ownership count to 1.  */
        mutex_ptr -> tx_mutex_ownership_count =  1;

        /* Remember that the calling thread owns the mutex.  */
        mutex_ptr -> tx_mutex_owner =  thread_ptr;

        /* Determine if priority inheritance is required.  */
        if ((mutex_ptr -> tx_mutex_inherit) && (thread_ptr))
        {

            /* Remember the current priority and threshold of thread.  */
            mutex_ptr -> tx_mutex_original_priority =   thread_ptr -> tx_thread_priority;
            mutex_ptr -> tx_mutex_original_threshold =  thread_ptr -> tx_thread_preempt_threshold;

            /* Pickup next mutex poitner, which is the head of the list.  */
            next_mutex =  thread_ptr -> tx_thread_owned_mutex_list;

            /* Determine if this thread owns any other mutexes that have priority inheritance.  */
            if (next_mutex)
            {

                /* Non-empty list. Link up the mutex.  */

                /* Pickup the next and previous mutex pointer.  */
                previous_mutex =  next_mutex -> tx_mutex_owned_previous;

                /* Place the owned mutex in the list.  */
                next_mutex -> tx_mutex_owned_previous =  mutex_ptr;
                previous_mutex -> tx_mutex_owned_next =  mutex_ptr;

                /* Setup this mutex's next and previous created links.  */
                mutex_ptr -> tx_mutex_owned_previous =  previous_mutex;
                mutex_ptr -> tx_mutex_owned_next =      next_mutex;
            }
            else
            {

                /* The owned mutex list is empty.  Add mutex to empty list.  */
                thread_ptr -> tx_thread_owned_mutex_list =     mutex_ptr;
                mutex_ptr -> tx_mutex_owned_next =             mutex_ptr;
                mutex_ptr -> tx_mutex_owned_previous =         mutex_ptr;

                /* Save the priority and preemption-threshold when the first mutex with 
                   priority inheritance is owned.  */
                thread_ptr -> tx_thread_original_priority =           thread_ptr -> tx_thread_priority;            
                thread_ptr -> tx_thread_original_preempt_threshold =  thread_ptr -> tx_thread_preempt_threshold;   
            }

            /* Increment the number of mutexes owned counter.  */
            thread_ptr -> tx_thread_owned_mutex_count++;

            /* Setup the highest priority waiting thread.  */
            mutex_ptr -> tx_mutex_highest_priority_waiting =  TX_MAX_PRIORITIES;
        }

        /* Restore interrupts.  */
        TX_RESTORE

        /* Return success.  */
        return(TX_SUCCESS);
    }
    else if (mutex_ptr -> tx_mutex_owner == thread_ptr)
    {

        /* The owning thread is requesting the mutex again, just 
           increment the ownership count.  */
        mutex_ptr -> tx_mutex_ownership_count++;

        /* Restore interrupts.  */
        TX_RESTORE

        /* Return success.  */
        return(TX_SUCCESS);
    }
    else
    {

        /* Determine if the request specifies suspension.  */
        if (wait_option)
        {

            /* Prepare for suspension of this thread.  */

            /* Pickup the mutex owner.  */
            mutex_owner =  mutex_ptr -> tx_mutex_owner;

#ifdef TX_MUTEX_ENABLE_PERFORMANCE_INFO

            /* Increment the total mutex suspension counter.  */
            _tx_mutex_performance_suspension_count++;

            /* Increment the number of suspensions on this mutex.  */
            mutex_ptr -> tx_mutex_performance_suspension_count++;

            /* Determine if a priority inversion is present.  */
            if (thread_ptr -> tx_thread_priority < mutex_owner -> tx_thread_priority)
            {

                /* Yes, priority inversion is present!  */

                /* Increment the total mutex priority inversions counter.  */
                _tx_mutex_performance_priority_inversion_count++;

                /* Increment the number of priority inversions on this mutex.  */
                mutex_ptr -> tx_mutex_performance_priority_inversion_count++;

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

                /* Increment the number of total thread priority inversions.  */
                _tx_thread_performance_priority_inversion_count++;

                /* Incremetn the number of priority inversions for this thread.  */
                thread_ptr -> tx_thread_performance_priority_inversion_count++;
#endif
            }
#endif

            /* Setup cleanup routine pointer.  */
            thread_ptr -> tx_thread_suspend_cleanup =  _tx_mutex_cleanup;

            /* Setup cleanup information, i.e. this mutex control
               block.  */
            thread_ptr -> tx_thread_suspend_control_block =  (VOID *) mutex_ptr;

            /* Pickup the number of suspended threads.  */
            suspended_count =  (mutex_ptr -> tx_mutex_suspended_count)++;

            /* Setup suspension list.  */
            if (suspended_count == 0)
            {

                /* No other threads are suspended.  Setup the head pointer and
                   just setup this threads pointers to itself.  */
                mutex_ptr -> tx_mutex_suspension_list =         thread_ptr;
                thread_ptr -> tx_thread_suspended_next =        thread_ptr;
                thread_ptr -> tx_thread_suspended_previous =    thread_ptr;
            }
            else
            {

                /* This list is not NULL, add current thread to the end. */
                next_thread =                                   mutex_ptr -> tx_mutex_suspension_list;
                thread_ptr -> tx_thread_suspended_next =        next_thread;
                previous_thread =                               next_thread -> tx_thread_suspended_previous;
                thread_ptr -> tx_thread_suspended_previous =    previous_thread;
                previous_thread -> tx_thread_suspended_next =   thread_ptr;
                next_thread -> tx_thread_suspended_previous =   thread_ptr;
            }

            /* Set the state to suspended.  */
            thread_ptr -> tx_thread_state =    TX_MUTEX_SUSP;

#ifdef TX_NOT_INTERRUPTABLE

            /* Determine if we need to raise the priority of the thread 
               owning the mutex.  */
            if (mutex_ptr -> tx_mutex_inherit)
            {

                /* Determine if this is the highest priority to raise for this mutex.  */
                if (mutex_ptr -> tx_mutex_highest_priority_waiting > thread_ptr -> tx_thread_priority)
                {

                    /* Remember this priority.  */
                    mutex_ptr -> tx_mutex_highest_priority_waiting =  thread_ptr -> tx_thread_priority;
                }

                /* Priority inheritance is requested, check to see if the thread that owns the mutex is lower priority.  */
                if (mutex_owner -> tx_thread_priority > thread_ptr -> tx_thread_priority)
                {

                    /* Yes, raise the suspended, owning thread's priority to that
                       of the current thread.  */
                    _tx_mutex_priority_change(mutex_owner, thread_ptr -> tx_thread_priority, thread_ptr -> tx_thread_priority);

#ifdef TX_MUTEX_ENABLE_PERFORMANCE_INFO

                    /* Increment the total mutex priority inheritance counter.  */
                    _tx_mutex_performance_priority_inheritance_count++;

                    /* Increment the number of priority inheritance situations on this mutex.  */
                    mutex_ptr -> tx_mutex_performance_priority_inheritance_count++;
#endif
                }
            }

            /* Call actual non-interruptable thread suspension routine.  */
            _tx_thread_system_ni_suspend(thread_ptr, wait_option);

            /* Restore interrupts.  */
            TX_RESTORE
#else

            /* Set the suspending flag.  */
            thread_ptr -> tx_thread_suspending =  TX_TRUE;

            /* Setup the timeout period.  */
            thread_ptr -> tx_thread_timer.tx_timer_internal_remaining_ticks =  wait_option;

            /* Temporarily disable preemption.  */
            _tx_thread_preempt_disable++;

            /* Restore interrupts.  */
            TX_RESTORE

            /* Determine if we need to raise the priority of the thread 
               owning the mutex.  */
            if (mutex_ptr -> tx_mutex_inherit)
            {

                /* Determine if this is the highest priority to raise for this mutex.  */
                if (mutex_ptr -> tx_mutex_highest_priority_waiting > thread_ptr -> tx_thread_priority)
                {

                    /* Remember this priority.  */
                    mutex_ptr -> tx_mutex_highest_priority_waiting =  thread_ptr -> tx_thread_priority;
                }

                /* Priority inheritance is requested, check to see if the thread that owns the mutex is lower priority.  */
                if (mutex_owner -> tx_thread_priority > thread_ptr -> tx_thread_priority)
                {

                    /* Yes, raise the suspended, owning thread's priority to that
                       of the current thread.  */
                    _tx_mutex_priority_change(mutex_owner, thread_ptr -> tx_thread_priority, thread_ptr -> tx_thread_priority);

#ifdef TX_MUTEX_ENABLE_PERFORMANCE_INFO

                    /* Increment the total mutex priority inheritance counter.  */
                    _tx_mutex_performance_priority_inheritance_count++;

                    /* Increment the number of priority inheritance situations on this mutex.  */
                    mutex_ptr -> tx_mutex_performance_priority_inheritance_count++;
#endif
                }
            }

            /* Call actual thread suspension routine.  */
            _tx_thread_system_suspend(thread_ptr);
#endif
            /* Return the completion status.  */
            return(thread_ptr -> tx_thread_suspend_status);
        }
        else
        {

            /* Restore interrupts.  */
            TX_RESTORE 

            /* Immediate return, return error completion.  */
            return(TX_NOT_AVAILABLE);
        }
    }
}

