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
#include "tx_timer.h"
#include "tx_event_flags.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_event_flags_set                                 PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function sets the specified flags in the event group based on  */ 
/*    the set option specified.  All threads suspended on the group whose */ 
/*    get request can now be satisfied are resumed.                       */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    group_ptr                         Pointer to group control block    */ 
/*    flags_to_set                      Event flags to set                */ 
/*    set_option                        Specified either AND or OR        */ 
/*                                        operation on the event flags    */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_SUCCESS                        Always returns success            */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_preempt_check   Check for preemption              */ 
/*    _tx_thread_system_resume          Resume thread service             */ 
/*    _tx_thread_system_ni_resume       Non-interruptable resume thread   */ 
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
/*                                            corrected problem clearing  */ 
/*                                            event flags from ISRs,      */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            filter option to trace      */ 
/*                                            insert, added check for     */ 
/*                                            threads whose suspension    */ 
/*                                            was aborted from an ISR     */ 
/*                                            during the search for       */ 
/*                                            satisfied requests, added   */ 
/*                                            optional logic for          */ 
/*                                            non-interruptable operation,*/ 
/*                                            and made several            */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_event_flags_set(TX_EVENT_FLAGS_GROUP *group_ptr, ULONG flags_to_set, UINT set_option)
{

TX_INTERRUPT_SAVE_AREA

TX_THREAD       *thread_ptr;            
TX_THREAD       *next_thread_ptr;       
TX_THREAD       *next_thread;
TX_THREAD       *previous_thread;
TX_THREAD       *satisfied_list;        
TX_THREAD       *last_satisfied;        
TX_THREAD       *suspended_list;        
ULONG           suspended_count;         
ULONG           current_event_flags;    
ULONG           requested_flags;
UINT            and_request;
UINT            get_option;             
#ifndef TX_DISABLE_NOTIFY_CALLBACKS
VOID            (*events_set_notify)(struct TX_EVENT_FLAGS_GROUP_STRUCT *);
#endif


    /* Disable interrupts to remove the semaphore from the created list.  */
    TX_EVENT_FLAGS_GROUP_DISABLE

#ifdef TX_EVENT_FLAGS_ENABLE_PERFORMANCE_INFO

    /* Increment the total event flags set counter.  */
    _tx_event_flags_performance_set_count++;

    /* Increment the number of event flags sets on this semaphore.  */
    group_ptr -> tx_event_flags_group_performance_set_count++;
#endif

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_EVENT_FLAGS_SET, group_ptr, flags_to_set, set_option, group_ptr -> tx_event_flags_group_suspended_count, TX_TRACE_EVENT_FLAGS_EVENTS)

    /* Determine how to set this group's event flags.  */
    if (set_option & TX_EVENT_FLAGS_AND_MASK)
    {

#ifndef TX_NOT_INTERRUPTABLE

        /* Determine if the suspension list is being processed by an interrupted
           set request.  */
        if ((group_ptr -> tx_event_flags_group_suspended_count) && 
            (group_ptr -> tx_event_flags_group_suspension_list == TX_NULL))
        {

            /* A previous set operation is still busy, we need to defer the
               event clearing until the set operation is complete.  */

            /* Remember the events to clear.  */
            group_ptr -> tx_event_flags_group_delayed_clear =  
                                        group_ptr -> tx_event_flags_group_delayed_clear | ~flags_to_set;
        }
        else
        {
#endif

            /* Previous set operation was not interrupted, simply clear the 
               specified flags by "ANDing" the flags into the current events 
               of the group.  */
            group_ptr -> tx_event_flags_group_current =
                group_ptr -> tx_event_flags_group_current & flags_to_set;

#ifndef TX_NOT_INTERRUPTABLE

        }
#endif        
    
        /* There is no need to check for any suspended threads since no
           new bits are set.  */
        TX_RESTORE

        /* Return successful status.  */
        return(TX_SUCCESS);
    }
    else
    {

        /* "OR" the flags into the current events of the group.  */
        group_ptr -> tx_event_flags_group_current =
            group_ptr -> tx_event_flags_group_current | flags_to_set;

#ifndef TX_NOT_INTERRUPTABLE

        /* Determine if there are any delayed flags to clear.  */
        if (group_ptr -> tx_event_flags_group_delayed_clear)
        {

            /* Yes, we need to neutralize the delayed clearing as well.  */
            group_ptr -> tx_event_flags_group_delayed_clear =  
                                        group_ptr -> tx_event_flags_group_delayed_clear & ~flags_to_set;
        }
#endif

    }

    /* Pickup the thread suspended count.  */
    suspended_count =  group_ptr -> tx_event_flags_group_suspended_count;

    /* Determine if there are any threads suspended on the event flag group.  */
    if (group_ptr -> tx_event_flags_group_suspension_list)
    {

        /* Determine if there is just a single thread waiting on the event 
           flag group.  */
        if (suspended_count == 1)
        {

            /* Single thread waiting for event flags.  Bypass the multiple thread
               logic.  */

            /* Setup thread pointer.  */
            thread_ptr =  group_ptr -> tx_event_flags_group_suspension_list;

            /* Pickup the current event flags.  */
            current_event_flags =  group_ptr -> tx_event_flags_group_current;
            
            /* Pickup the suspend information.  */
            requested_flags =  thread_ptr -> tx_thread_suspend_info;

            /* Pickup the suspend option.  */
            get_option =  thread_ptr -> tx_thread_suspend_option;

            /* Isolate the AND selection.  */
            and_request =  get_option & TX_EVENT_FLAGS_AND_MASK;

            /* Determine if this thread's get event flag request has been met.  */
            if (((and_request) && ((current_event_flags & requested_flags) == requested_flags)) ||
                ((!and_request) && (current_event_flags & requested_flags)))
            {

                /* Yes, resume the thread and apply any event flag
                   clearing.  */

                /* Return the actual event flags that satisfied the request.  */
                *((ULONG *) thread_ptr -> tx_thread_additional_suspend_info) =  current_event_flags;

                /* Determine whether or not clearing needs to take place.  */
                if (get_option & TX_EVENT_FLAGS_CLEAR_MASK)
                {

                    /* Yes, clear the flags that satisfied this request.  */
                    group_ptr -> tx_event_flags_group_current =  current_event_flags & ~requested_flags;
                }

                /* Clear the suspension information in the event flag group.  */
                group_ptr -> tx_event_flags_group_suspension_list =  TX_NULL;
                group_ptr -> tx_event_flags_group_suspended_count =  0;

                /* Clear cleanup routine to avoid timeout.  */
                thread_ptr -> tx_thread_suspend_cleanup =  TX_NULL;

                /* Put return status into the thread control block.  */
                thread_ptr -> tx_thread_suspend_status =  TX_SUCCESS;        

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

                /* Pickup the notify callback routine for this event flag group.  */
                events_set_notify =  group_ptr -> tx_event_flags_group_set_notify;
#endif

#ifdef TX_NOT_INTERRUPTABLE

                /* Resume the thread!  */
                _tx_thread_system_ni_resume(thread_ptr);

                /* Restore interrupts.  */
                TX_RESTORE

#else

                /* Temporarily disable preemption.  */
                _tx_thread_preempt_disable++;


                /* Restore interrupts.  */
                TX_RESTORE

                /* Resume thread.  */
                _tx_thread_system_resume(thread_ptr);
#endif

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

                /* Determine if a notify callback is required.  */
                if (events_set_notify)
                {

                    /* Call application event flags set notification.  */
                    (events_set_notify)(group_ptr);
                }
#endif

                /* Return successful status.  */
                return(TX_SUCCESS);    
            }
            else
            {

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

                /* Pickup the notify callback routine for this event flag group.  */
                events_set_notify =  group_ptr -> tx_event_flags_group_set_notify;
#endif

                /* Flags of single suspended thread were not satisfied.  */
                TX_RESTORE

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

                /* Determine if a notify callback is required.  */
                if (events_set_notify)
                {

                    /* Call application event flags set notification.  */
                    (events_set_notify)(group_ptr);
                }
#endif

                /* Return successful status.  */
                return(TX_SUCCESS);
            }
        }

        /* Otherwise, the event flag requests of multiple threads must be 
           examined.  */

        /* Setup thread pointer, keep a local copy of the head pointer.  */
        suspended_list =  group_ptr -> tx_event_flags_group_suspension_list;
        thread_ptr =      suspended_list;

        /* Clear the suspended list head pointer to thwart manipulation of
           the list in ISR's while we are processing here.  */
        group_ptr -> tx_event_flags_group_suspension_list =  TX_NULL;
        
        /* Setup the satisfied thread pointers.  */
        satisfied_list =  TX_NULL;
        last_satisfied =  TX_NULL;

        /* Pickup the current event flags.  */
        current_event_flags =  group_ptr -> tx_event_flags_group_current;

        /* Disable preemption while we process the suspended list.  */
        _tx_thread_preempt_disable++;

        /* Loop to examine all of the suspended threads. */
        do 
        {

#ifndef TX_NOT_INTERRUPTABLE

            /* Restore interrupts temporarily.  */
            TX_RESTORE

            /* Disable interrupts again.  */
            TX_EVENT_FLAGS_GROUP_DISABLE
#endif

            /* Determine if we need to reset the search.  */
            if (group_ptr -> tx_event_flags_group_reset_search)
            {

                /* Clear the reset search flag.  */
                group_ptr -> tx_event_flags_group_reset_search =  0;

                /* Move the thread pointer to the beginning of the search list.  */
                thread_ptr =  suspended_list;

                /* Reset the suspended count.  */      
                suspended_count =  group_ptr -> tx_event_flags_group_suspended_count;

                /* Update the current events with any new ones that might
                   have been set in a nested set events call from an ISR.  */
                current_event_flags =  current_event_flags | group_ptr -> tx_event_flags_group_current;
            }

            /* Pickup the suspend information.  */
            requested_flags =  thread_ptr -> tx_thread_suspend_info;

            /* Pickup this thread's suspension get option.  */
            get_option =  thread_ptr -> tx_thread_suspend_option;

            /* Isolate the AND selection.  */
            and_request =  get_option & TX_EVENT_FLAGS_AND_MASK;

            /* Save next thread pointer.  */
            next_thread_ptr =  thread_ptr -> tx_thread_suspended_next;

            /* Determine if this thread's get event flag request has been met.  */
            if (((and_request) && ((current_event_flags & requested_flags) == requested_flags)) ||
                ((!and_request) && (current_event_flags & requested_flags)) ||
                (thread_ptr -> tx_thread_state != TX_EVENT_FLAG))
            {

                /* Yes, this request can be handled now.  */

                /* Determine if the thread is still suspended on the event flag group. If not, a wait
                   abort must have been done from an ISR.  */
                if (thread_ptr -> tx_thread_state == TX_EVENT_FLAG)
                {

                    /* Return the actual event flags that satisfied the request.  */
                    *((ULONG *) thread_ptr -> tx_thread_additional_suspend_info) =  current_event_flags;

                    /* Determine whether or not clearing needs to take place.  */
                    if (get_option & TX_EVENT_FLAGS_CLEAR_MASK)
                    {
                
                        /* Yes, clear the flags that satisfied this request.  */
                        group_ptr -> tx_event_flags_group_current =  current_event_flags & ~requested_flags;
                    }
            
                    /* Prepare for resumption of the first thread.  */

                    /* Clear cleanup routine to avoid timeout.  */
                    thread_ptr -> tx_thread_suspend_cleanup =  TX_NULL;

                    /* Put return status into the thread control block.  */
                    thread_ptr -> tx_thread_suspend_status =  TX_SUCCESS;        
                }

                /* We need to remove the thread from the suspension list and place it in the
                   expired list.  */

               /* See if this is the only suspended thread on the list.  */
                if (thread_ptr == thread_ptr -> tx_thread_suspended_next)
                {

                    /* Yes, the only suspended thread.  */

                    /* Update the head pointer.  */
                    suspended_list =  TX_NULL;
                }
                else
                {

                    /* At least one more thread is on the same expiration list.  */

                    /* Update the links of the adjacent threads.  */
                    next_thread =                                  thread_ptr -> tx_thread_suspended_next;
                    previous_thread =                              thread_ptr -> tx_thread_suspended_previous;
                    next_thread -> tx_thread_suspended_previous =  previous_thread;
                    previous_thread -> tx_thread_suspended_next =  next_thread;

                    /* Update the list head pointer, if removing the head of the
                       list.  */
                    if (suspended_list == thread_ptr)
                    {
                    
                        /* Yes, head pointer needs to be updated.  */
                        suspended_list =  thread_ptr -> tx_thread_suspended_next;
                    }
                } 
                
                /* Decrement the suspension count.  */
                group_ptr -> tx_event_flags_group_suspended_count--;

                /* Place this thread on the expired list.  */
                if (!satisfied_list)
                {

                    /* First thread on the satisfied list.  */
                    satisfied_list =  thread_ptr;
                    last_satisfied =  thread_ptr;
    
                    /* Setup initial next pointer.  */
                    thread_ptr -> tx_thread_suspended_next =  TX_NULL;
                }
                else
                {

                    /* Not the first thread on the satisfied list.  */
                
                    /* Link it up at the end.  */
                    last_satisfied -> tx_thread_suspended_next =  thread_ptr;
                    thread_ptr -> tx_thread_suspended_next =      TX_NULL;
                    last_satisfied =                              thread_ptr;
                }
            }

            /* Copy next thread pointer to working thread ptr.  */
            thread_ptr =  next_thread_ptr;

        } while (--suspended_count);

        /* Setup the group's suspension list head again.  */
        group_ptr -> tx_event_flags_group_suspension_list =  suspended_list;

#ifndef TX_NOT_INTERRUPTABLE

        /* Determine if there is any delayed event clearing to perform.  */
        if (group_ptr -> tx_event_flags_group_delayed_clear)
        {

            /* Perform the delayed event clearing.  */
            group_ptr -> tx_event_flags_group_current =
                current_event_flags & ~(group_ptr -> tx_event_flags_group_delayed_clear);

            /* Clear the delayed event flag clear value.  */
            group_ptr -> tx_event_flags_group_delayed_clear =  0;
        }
#endif

        /* Restore interrupts.  */
        TX_RESTORE

        /* Walk through the satisfied list, setup initial thread pointer. */
        thread_ptr =  satisfied_list;
        while(thread_ptr)
        {
    
            /* Get next pointer first.  */
            next_thread_ptr =  thread_ptr -> tx_thread_suspended_next;

            /* Disable interrupts.  */
            TX_EVENT_FLAGS_GROUP_DISABLE

#ifdef TX_NOT_INTERRUPTABLE

            /* Resume the thread!  */
            _tx_thread_system_ni_resume(thread_ptr);

            /* Restore interrupts.  */
            TX_RESTORE
#else

            /* Disable preemption again.  */
            _tx_thread_preempt_disable++;

            /* Restore interrupt posture.  */
            TX_RESTORE

            /* Resume the thread.  */
            _tx_thread_system_resume(thread_ptr);
#endif

            /* Move next thread to current.  */
            thread_ptr =  next_thread_ptr;
        }

        /* Disable interrupts.  */
        TX_EVENT_FLAGS_GROUP_DISABLE

        /* Release thread preemption disable.  */
        _tx_thread_preempt_disable--;

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

        /* Pickup the notify callback routine for this event flag group.  */
        events_set_notify =  group_ptr -> tx_event_flags_group_set_notify;
#endif

        /* Restore interrupts.  */
        TX_RESTORE

        /* Check for preemption.  */
        _tx_thread_system_preempt_check();
    }
    else
    {

        /* Determine if we need to set the reset search field.  */
        if (group_ptr -> tx_event_flags_group_suspended_count)
        {
                    
            /* We interrupted a search of an event flag group suspension
               list.  Make sure we reset the search.  */
            group_ptr -> tx_event_flags_group_reset_search++;
        }

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

        /* Pickup the notify callback routine for this event flag group.  */
        events_set_notify =  group_ptr -> tx_event_flags_group_set_notify;
#endif

        /* Restore interrupts.  */
        TX_RESTORE
    }

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

    /* Determine if a notify callback is required.  */
    if (events_set_notify)
    {

        /* Call application event flags set notification.  */
        (events_set_notify)(group_ptr);
    }
#endif

    /* Return completion status.  */
    return(TX_SUCCESS);
}

