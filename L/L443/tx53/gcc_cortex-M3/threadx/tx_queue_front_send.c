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
/**   Queue                                                               */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_thread.h"
#include "tx_queue.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_queue_front_send                                PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function places a message at the front of the specified queue. */ 
/*    If there is no room in the queue, this function returns the         */ 
/*    queue full status.                                                  */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    queue_ptr                         Pointer to queue control block    */ 
/*    source_ptr                        Pointer to message source         */ 
/*    wait_option                       Suspension option                 */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    status                            Completion status                 */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_resume          Resume thread routine             */ 
/*    _tx_thread_system_ni_resume       Non-interruptable resume thread   */ 
/*    _tx_thread_system_suspend         Suspend thread routine            */ 
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
/*  04-02-2007     William E. Lamie         Modified comment(s), added    */ 
/*                                            message copy optimization,  */ 
/*                                            and corrected queue full    */ 
/*                                            suspension situation,       */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            macro to get current thread,*/ 
/*                                            made several optimizations, */ 
/*                                            added filter option to trace*/ 
/*                                            insert, added optional      */ 
/*                                            logic for non-interruptable */ 
/*                                            operation, and added macros */ 
/*                                            for message copying,        */ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_queue_front_send(TX_QUEUE *queue_ptr, VOID *source_ptr, ULONG wait_option)
{

TX_INTERRUPT_SAVE_AREA

TX_THREAD       *thread_ptr;            
ULONG           *source;                 
ULONG           *destination;            
ULONG           size;
ULONG           suspended_count;
TX_THREAD       *next_thread;
TX_THREAD       *previous_thread;
#ifndef TX_DISABLE_NOTIFY_CALLBACKS
VOID            (*queue_send_notify)(struct TX_QUEUE_STRUCT *);
#endif


    /* Disable interrupts to place message in the queue.  */
    TX_QUEUE_DISABLE

#ifdef TX_QUEUE_ENABLE_PERFORMANCE_INFO

    /* Increment the total messages sent counter.  */
    _tx_queue_performance_messages_sent_count++;

    /* Increment the number of messages sent to this queue.  */
    queue_ptr -> tx_queue_performance_messages_sent_count++;
#endif

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_QUEUE_FRONT_SEND, queue_ptr, source_ptr, wait_option, queue_ptr -> tx_queue_enqueued, TX_TRACE_QUEUE_EVENTS)

    /* Pickup the suspended count.  */
    suspended_count =  queue_ptr -> tx_queue_suspended_count;

    /* Now check for room in the queue for placing the new message in front.  */
    if (queue_ptr -> tx_queue_available_storage)
    {

        /* Yes there is room in the queue. Now determine if there is a thread waiting 
           for a message.  */
        if (suspended_count == 0)
        {

            /* No thread suspended while waiting for a message from
               this queue.  */

            /* Adjust the read pointer since we are adding to the front of the
               queue.  */

            /* See if the read pointer is at the beginning of the queue area.  */
            if (queue_ptr -> tx_queue_read == queue_ptr -> tx_queue_start)
            {
            
                /* Adjust the read pointer to the last message at the end of the
                   queue.  */
                queue_ptr -> tx_queue_read =  queue_ptr -> tx_queue_end -
                                                queue_ptr -> tx_queue_message_size;
            }
            else
            {
            
                /* Not at the beginning of the queue, just move back one message.  */
                queue_ptr -> tx_queue_read =  
                     queue_ptr -> tx_queue_read - queue_ptr -> tx_queue_message_size;
            }

            /* Simply place the message in the queue.  */
            
            /* Reduce the amount of available storage.  */
            queue_ptr -> tx_queue_available_storage--;

            /* Increase the enqueued count.  */
            queue_ptr -> tx_queue_enqueued++;

            /* Setup source and destination pointers.  */
            source =       (ULONG *) source_ptr;
            destination =  (ULONG *) queue_ptr -> tx_queue_read;
            size =         (ULONG) queue_ptr -> tx_queue_message_size; 

            /* Copy message.  */
            TX_QUEUE_MESSAGE_COPY(source, destination, size)

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

            /* Pickup the notify callback routine for this queue.  */
            queue_send_notify =  queue_ptr -> tx_queue_send_notify;
#endif

            /* Restore interrupts.  */
            TX_RESTORE

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

            /* Determine if a notify callback is required.  */
            if (queue_send_notify)
            {

                /* Call application queue send notification.  */
                (queue_send_notify)(queue_ptr);
            }
#endif

            /* Return success!  */
            return(TX_SUCCESS);
        }              
        else
        {

            /* Thread suspended waiting for a message.  Remove it and copy this message
               into its storage area.  */
            thread_ptr =  queue_ptr -> tx_queue_suspension_list;

            /* See if this is the only suspended thread on the list.  */
            suspended_count--;
            if (suspended_count == 0)
            {

                /* Yes, the only suspended thread.  */

                /* Update the head pointer.  */
                queue_ptr -> tx_queue_suspension_list =  TX_NULL;
            }
            else
            {

                /* At least one more thread is on the same expiration list.  */

                /* Update the list head pointer.  */
                queue_ptr -> tx_queue_suspension_list =  thread_ptr -> tx_thread_suspended_next;

                /* Update the links of the adjacent threads.  */
                next_thread =                            thread_ptr -> tx_thread_suspended_next;
                queue_ptr -> tx_queue_suspension_list =  next_thread;

                /* Update the links of the adjacent threads.  */
                previous_thread =                               thread_ptr -> tx_thread_suspended_previous;
                next_thread -> tx_thread_suspended_previous =   previous_thread;
                previous_thread -> tx_thread_suspended_next =   next_thread;
            } 
 
            /* Decrement the suspension count.  */
            queue_ptr -> tx_queue_suspended_count =  suspended_count;

            /* Prepare for resumption of the thread.  */

            /* Clear cleanup routine to avoid timeout.  */
            thread_ptr -> tx_thread_suspend_cleanup =  TX_NULL;


#ifndef TX_DISABLE_NOTIFY_CALLBACKS

            /* Pickup the notify callback routine for this queue.  */
            queue_send_notify =  queue_ptr -> tx_queue_send_notify;
#endif

            /* Setup source and destination pointers.  */
            source =       (ULONG *) source_ptr;
            destination =  (ULONG *) thread_ptr -> tx_thread_additional_suspend_info;
            size =         (ULONG) queue_ptr -> tx_queue_message_size; 

            /* Copy message.  */
            TX_QUEUE_MESSAGE_COPY(source, destination, size)

            /* Put return status into the thread control block.  */
            thread_ptr -> tx_thread_suspend_status =  TX_SUCCESS;        

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
            if (queue_send_notify)
            {

                /* Call application queue send notification.  */
                (queue_send_notify)(queue_ptr);
            }
#endif

            /* Return successful status.  */
            return(TX_SUCCESS);    
        }
    }

    /* Determine if the caller has requested suspension.  */
    else if (wait_option)
    {

        /* Yes, suspension is requested.  */

        /* Prepare for suspension of this thread.  */
            
        /* Pickup thread pointer.  */
        TX_THREAD_GET_CURRENT(thread_ptr)

        /* Setup cleanup routine pointer.  */
        thread_ptr -> tx_thread_suspend_cleanup =  _tx_queue_cleanup;

        /* Setup cleanup information, i.e. this queue control
           block and the source pointer.  */
        thread_ptr -> tx_thread_suspend_control_block =    (VOID *) queue_ptr;
        thread_ptr -> tx_thread_additional_suspend_info =  (VOID *) source_ptr;

        /* Set the flag to true to indicate a queue front send suspension.  */
        thread_ptr -> tx_thread_suspend_option =           TX_TRUE;

        /* Place this thread at the front of the suspension list, since it is a
           queue front send suspension.  */
        if (suspended_count == 0)
        {

            /* No other threads are suspended.  Setup the head pointer and
               just setup this threads pointers to itself.  */
            queue_ptr -> tx_queue_suspension_list =         thread_ptr;
            thread_ptr -> tx_thread_suspended_next =        thread_ptr;
            thread_ptr -> tx_thread_suspended_previous =    thread_ptr;
        }
        else
        {

            /* This list is not NULL, add current thread to the end. */
            next_thread =                                   queue_ptr -> tx_queue_suspension_list;
            thread_ptr -> tx_thread_suspended_next =        next_thread;
            previous_thread =                               next_thread -> tx_thread_suspended_previous;
            thread_ptr -> tx_thread_suspended_previous =    previous_thread;
            previous_thread -> tx_thread_suspended_next =   thread_ptr;
            next_thread -> tx_thread_suspended_previous =   thread_ptr;

            /* Update the suspension list to put this thread in front, which will put
               the message that was removed in the proper relative order when room is 
               made in the queue.  */
            queue_ptr -> tx_queue_suspension_list =         thread_ptr;
        }

        /* Increment the suspended thread count.  */
        queue_ptr -> tx_queue_suspended_count =  suspended_count + 1;

        /* Set the state to suspended.  */
        thread_ptr -> tx_thread_state =    TX_QUEUE_SUSP;

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

        /* Pickup the notify callback routine for this queue.  */
        queue_send_notify =  queue_ptr -> tx_queue_send_notify;
#endif

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

#ifndef TX_DISABLE_NOTIFY_CALLBACKS

        /* Determine if a notify callback is required.  */
        if ((thread_ptr -> tx_thread_suspend_status == TX_SUCCESS) && (queue_send_notify))
        {

            /* Call application queue send notification.  */
            (queue_send_notify)(queue_ptr);
        }
#endif

        /* Return the completion status.  */
        return(thread_ptr -> tx_thread_suspend_status);
    }
    else
    {

        /* Restore interrupts.  */
        TX_RESTORE

        /* No room in queue and no suspension requested, return error completion.  */
        return(TX_QUEUE_FULL);
    }
}

