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
/**   Event Flags                                                         */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_thread.h"
#include "tx_event_flags.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_event_flags_get                                 PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function gets the specified event flags from the group,        */ 
/*    according to the get option.  The get option also specifies whether */ 
/*    or not the retrieved flags are cleared.                             */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    group_ptr                         Pointer to group control block    */ 
/*    requested_event_flags             Event flags requested             */ 
/*    get_option                        Specifies and/or and clear options*/ 
/*    actual_flags_ptr                  Pointer to place the actual flags */ 
/*                                        the service retrieved           */ 
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
/*                                            added logic for calling     */ 
/*                                            from ISRs, resulting in     */ 
/*                                            version 5.1                 */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            macro to get current thread,*/ 
/*                                            added filter option to      */ 
/*                                            trace insert, added optional*/ 
/*                                            logic for non-interruptable */ 
/*                                            operation, and made several */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_event_flags_get(TX_EVENT_FLAGS_GROUP *group_ptr, ULONG requested_flags,
                    UINT get_option, ULONG *actual_flags_ptr, ULONG wait_option)
{

TX_INTERRUPT_SAVE_AREA

UINT            status;                 
UINT            and_request;
ULONG           current_flags;                 
#ifndef TX_NOT_INTERRUPTABLE
ULONG           delayed_clear_flags;
#endif
ULONG           suspended_count;
TX_THREAD       *thread_ptr;            
TX_THREAD       *next_thread;
TX_THREAD       *previous_thread;


    /* Disable interrupts to examine the event flags group.  */
    TX_EVENT_FLAGS_GROUP_DISABLE

#ifdef TX_EVENT_FLAGS_ENABLE_PERFORMANCE_INFO

    /* Increment the total event flags get counter.  */
    _tx_event_flags_performance_get_count++;

    /* Increment the number of event flags gets on this semaphore.  */
    group_ptr -> tx_event_flags_group_performance_get_count++;
#endif

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_EVENT_FLAGS_GET, group_ptr, requested_flags, group_ptr -> tx_event_flags_group_current, get_option, TX_TRACE_EVENT_FLAGS_EVENTS)

    /* Pickup current flags.  */
    current_flags =  group_ptr -> tx_event_flags_group_current;

    /* Apply the event flag option mask.  */
    and_request =  (get_option & TX_EVENT_FLAGS_AND_MASK);

#ifdef TX_NOT_INTERRUPTABLE


    /* Check for AND condition. All flags must be present to satisfy request.  */
    if (((and_request) && ((current_flags & requested_flags) == requested_flags)) ||
        ((!and_request) && (current_flags & requested_flags)))
    {

        /* Return the actual event flags that satisfied the request.  */
        *actual_flags_ptr =  current_flags;

        /* Determine whether or not clearing needs to take place.  */
        if (get_option & TX_EVENT_FLAGS_CLEAR_MASK)
        {
        
             /* Yes, clear the flags that satisfied this request.  */
             group_ptr -> tx_event_flags_group_current =
                                        group_ptr -> tx_event_flags_group_current & ~requested_flags;
        }

        /* Restore interrupts.  */
        TX_RESTORE

        /* Return success.  */
        return(TX_SUCCESS);
    }

#else

    /* Pickup delayed clear flags.  */
    delayed_clear_flags =  group_ptr -> tx_event_flags_group_delayed_clear;

    /* Determine if there are any delayed clear operations pending.  */
    if (delayed_clear_flags)
    {

        /* Yes, apply them to the current flags.  */
        current_flags =  current_flags & ~delayed_clear_flags;
    }

    /* Determine if the event flags are present, based on the get option.  */
    if (((and_request) && ((current_flags & requested_flags) == requested_flags)) ||
        ((!and_request) && (current_flags & requested_flags)))
    {

        /* Yes, this request can be handled immediately.  */

        /* Return the actual event flags that satisfied the request.  */
        *actual_flags_ptr =  current_flags;

        /* Determine whether or not clearing needs to take place.  */
        if (get_option & TX_EVENT_FLAGS_CLEAR_MASK)
        {

            /* Determine if the suspension list is being processed by an interrupted
               set request.  */
            if ((group_ptr -> tx_event_flags_group_suspended_count) && 
                (group_ptr -> tx_event_flags_group_suspension_list == TX_NULL))
            {

                /* A previous set operation is still busy, we need to defer the
                   event clearing until the set operation is complete.  */

                /* Remember the events to clear.  */
                group_ptr -> tx_event_flags_group_delayed_clear =  
                                        group_ptr -> tx_event_flags_group_delayed_clear | requested_flags;
            }
            else
            {

                /* Yes, clear the flags that satisfied this request.  */
                group_ptr -> tx_event_flags_group_current =
                                        group_ptr -> tx_event_flags_group_current & ~requested_flags;
            }
        }

        /* Set status to success.  */
        status =  TX_SUCCESS;
    }

#endif
    else
    {

        /* Determine if the request specifies suspension.  */
        if (wait_option)
        {

            /* Prepare for suspension of this thread.  */

#ifdef TX_EVENT_FLAGS_ENABLE_PERFORMANCE_INFO

            /* Increment the total event flags suspensions counter.  */
            _tx_event_flags_performance_suspension_count++;

            /* Increment the number of event flags suspensions on this semaphore.  */
            group_ptr -> tx_event_flags_group_performance_suspension_count++;
#endif
            
            /* Pickup thread pointer.  */
            TX_THREAD_GET_CURRENT(thread_ptr)

            /* Setup cleanup routine pointer.  */
            thread_ptr -> tx_thread_suspend_cleanup =  _tx_event_flags_cleanup;

            /* Remember which event flags we are looking for.  */
            thread_ptr -> tx_thread_suspend_info =  requested_flags;

            /* Save the get option as well.  */
            thread_ptr -> tx_thread_suspend_option =  get_option;

            /* Save the destination for the current events.  */
            thread_ptr -> tx_thread_additional_suspend_info =  (VOID *) actual_flags_ptr;

            /* Setup cleanup information, i.e. this event flags group control
               block.  */
            thread_ptr -> tx_thread_suspend_control_block =  (VOID *) group_ptr;

            /* Pickup the suspended count.  */
            suspended_count =  (group_ptr -> tx_event_flags_group_suspended_count)++;

            /* Setup suspension list.  */
            if (suspended_count == 0)
            {

                /* No other threads are suspended.  Setup the head pointer and
                   just setup this threads pointers to itself.  */
                group_ptr -> tx_event_flags_group_suspension_list =   thread_ptr;
                thread_ptr -> tx_thread_suspended_next =              thread_ptr;
                thread_ptr -> tx_thread_suspended_previous =          thread_ptr;
            }
            else
            {

                /* This list is not NULL, add current thread to the end. */
                next_thread =                                   group_ptr -> tx_event_flags_group_suspension_list;
                thread_ptr -> tx_thread_suspended_next =        next_thread;
                previous_thread =                               next_thread -> tx_thread_suspended_previous;
                thread_ptr -> tx_thread_suspended_previous =    previous_thread;
                previous_thread -> tx_thread_suspended_next =   thread_ptr;
                next_thread -> tx_thread_suspended_previous =   thread_ptr;
            }

            /* Set the state to suspended.  */
            thread_ptr -> tx_thread_state =    TX_EVENT_FLAG;

#ifdef TX_NOT_INTERRUPTABLE

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

            /* Call actual thread suspension routine.  */
            _tx_thread_system_suspend(thread_ptr);
#endif

            /* Return the completion status.  */
            return(thread_ptr -> tx_thread_suspend_status);
        }
        else
        {
            
            /* Immediate return, return error completion.  */
            status =  TX_NO_EVENTS;
        }
    }

    /* Restore interrupts.  */
    TX_RESTORE

    /* Return completion status.  */
    return(status);
}

