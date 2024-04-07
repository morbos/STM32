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
/*    _tx_queue_receive                                   PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function receives a message from the specified queue. If there */ 
/*    are no messages in the queue, this function waits according to the  */ 
/*    option specified.                                                   */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    queue_ptr                         Pointer to queue control block    */ 
/*    destination_ptr                   Pointer to message destination    */ 
/*                                        **** MUST BE LARGE ENOUGH TO    */ 
/*                                             HOLD MESSAGE ****          */ 
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
/*                                            cleared suspend option, and */ 
/*                                            added logic to look for     */ 
/*                                            queue front suspensions,    */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            macro to get current thread,*/ 
/*                                            made several optimizations, */ 
/*                                            corrected the performance   */ 
/*                                            information names, added    */ 
/*                                            filter option to trace      */ 
/*                                            insert, added optional      */ 
/*                                            logic for non-interruptable */ 
/*                                            operation, and added macros */ 
/*                                            for message copying,        */ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_queue_receive(TX_QUEUE *queue_ptr, VOID *destination_ptr, ULONG wait_option)
{

TX_INTERRUPT_SAVE_AREA

TX_THREAD       *thread_ptr;    
ULONG           *source;         
ULONG           *destination;            
ULONG           size;
ULONG           suspended_count;
TX_THREAD       *next_thread;
TX_THREAD       *previous_thread;


    /* Disable interrupts to receive message from queue.  */
    TX_QUEUE_DISABLE

#ifdef TX_QUEUE_ENABLE_PERFORMANCE_INFO

    /* Increment the total messages received counter.  */
    _tx_queue_performance_messages_received_count++;

    /* Increment the number of messages received from this queue.  */
    queue_ptr -> tx_queue_performance_messages_received_count++;

#endif

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_QUEUE_RECEIVE, queue_ptr, destination_ptr, wait_option, queue_ptr -> tx_queue_enqueued, TX_TRACE_QUEUE_EVENTS)

    /* Pickup the thread suspension count.  */
    suspended_count =  queue_ptr -> tx_queue_suspended_count;
    
    /* Determine if there is anything in the queue.  */
    if ((queue_ptr -> tx_queue_enqueued) && (suspended_count == 0))
    {

        /* Setup source and destination pointers.  */
        source =       (ULONG *) queue_ptr -> tx_queue_read;
        destination =  (ULONG *) destination_ptr;
        size =         (ULONG) queue_ptr -> tx_queue_message_size; 

        /* Copy message.  */
        TX_QUEUE_MESSAGE_COPY(source, destination, size)

        /* Determine if we are at the end.  */
        if (source >= queue_ptr -> tx_queue_end)
        {

            /* Yes, wrap around to the beginning.  */
            source =  queue_ptr -> tx_queue_start;
        }
        
        /* Setup the queue read pointer.   */
        queue_ptr -> tx_queue_read =  source;
        
        /* Increase the amount of available storage.  */
        queue_ptr -> tx_queue_available_storage++;

        /* Decrease the enqueued count.  */
        queue_ptr -> tx_queue_enqueued--;

        /* Restore interrupts.  */
        TX_RESTORE

        /* Return success!  */
        return(TX_SUCCESS);
    }

    /* Pickup thread suspension list head pointer.  */
    thread_ptr =  queue_ptr -> tx_queue_suspension_list;

    /* Now determine if there is a queue front suspension active.   */
    
    /* Determine if there is pending queue front suspension.  */
    if ((thread_ptr) && (thread_ptr -> tx_thread_suspend_option))
    {

        /* Yes, a queue front suspension is present.  */

        /* Return the message associated with this suspension.  */

        /* Setup source and destination pointers.  */
        source =       (ULONG *) thread_ptr -> tx_thread_additional_suspend_info;
        destination =  (ULONG *) destination_ptr;
        size =         (ULONG) queue_ptr -> tx_queue_message_size; 

        /* Copy message.  */
        TX_QUEUE_MESSAGE_COPY(source, destination, size)

        /* Message is now in the caller's destination. See if this is the only suspended thread 
           on the list.  */
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
            next_thread =                            thread_ptr -> tx_thread_suspended_next;
            queue_ptr -> tx_queue_suspension_list =  next_thread;

            /* Update the links of the adjacent threads.  */
            previous_thread =                              thread_ptr -> tx_thread_suspended_previous;
            next_thread -> tx_thread_suspended_previous =  previous_thread;
            previous_thread -> tx_thread_suspended_next =  next_thread;
        } 
 
        /* Decrement the suspension count.  */
        queue_ptr -> tx_queue_suspended_count =  suspended_count;

        /* Prepare for resumption of the first thread.  */

        /* Clear cleanup routine to avoid timeout.  */
        thread_ptr -> tx_thread_suspend_cleanup =  TX_NULL;

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

        /* Return success.  */
        return(TX_SUCCESS);    
    }

    /* Now determine if there are any messages queued.  */
    else if (queue_ptr -> tx_queue_enqueued)
    {

        /* At this point, we know that the queue is full and there 
           are one or more threads suspended trying to send another
           message to this queue.  */

        /* Setup source and destination pointers.  */
        source =       (ULONG *) queue_ptr -> tx_queue_read;
        destination =  (ULONG *) destination_ptr;
        size =         (ULONG) queue_ptr -> tx_queue_message_size; 

        /* Copy message.  */
        TX_QUEUE_MESSAGE_COPY(source, destination, size)

        /* Determine if we are at the end.  */
        if (source >= queue_ptr -> tx_queue_end)
        {

            /* Yes, wrap around to the beginning.  */
            source =  queue_ptr -> tx_queue_start;
        }

        /* Setup the queue read pointer.   */
        queue_ptr -> tx_queue_read =  source;
  
        /* Disable preemption.  */
        _tx_thread_preempt_disable++;

#ifdef TX_NOT_INTERRUPTABLE

        /* Restore interrupts.  */
        TX_RESTORE

        /* Interrupts are enabled briefly here to keep the interrupt
           lockout time deterministic.  */

        /* Disable interrupts again.  */
        TX_QUEUE_DISABLE
#endif

        /* Decrement the preemption disable variable.  */
        _tx_thread_preempt_disable--;

        /* Setup source and destination pointers.  */
        source =       (ULONG *) thread_ptr -> tx_thread_additional_suspend_info;
        destination =  (ULONG *) queue_ptr -> tx_queue_write;
        size =         (ULONG) queue_ptr -> tx_queue_message_size; 

        /* Copy message.  */
        TX_QUEUE_MESSAGE_COPY(source, destination, size)

        /* Determine if we are at the end.  */
        if (destination >= queue_ptr -> tx_queue_end)
        {
            
            /* Yes, wrap around to the beginning.  */
            destination =  queue_ptr -> tx_queue_start;
        }

        /* Adjust the write pointer.  */
        queue_ptr -> tx_queue_write =  destination;

        /* Pickup thread pointer.  */
        thread_ptr =  queue_ptr -> tx_queue_suspension_list;

        /* Message is now in the queue.  See if this is the only suspended thread 
           on the list.  */
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
            next_thread =                            thread_ptr -> tx_thread_suspended_next;
            queue_ptr -> tx_queue_suspension_list =  next_thread;

            /* Update the links of the adjacent threads.  */
            previous_thread =                               thread_ptr -> tx_thread_suspended_previous;
            next_thread -> tx_thread_suspended_previous =   previous_thread;
            previous_thread -> tx_thread_suspended_next =   next_thread;
        } 
 
        /* Decrement the suspension count.  */
        queue_ptr -> tx_queue_suspended_count =  suspended_count;

        /* Prepare for resumption of the first thread.  */

        /* Clear cleanup routine to avoid timeout.  */
        thread_ptr -> tx_thread_suspend_cleanup =  TX_NULL;

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

        /* Return success.  */
        return(TX_SUCCESS);    
    }

    /* Determine if the request specifies suspension.  */
    else if (wait_option)
    {

        /* Prepare for suspension of this thread.  */

#ifdef TX_QUEUE_ENABLE_PERFORMANCE_INFO

        /* Increment the total queue empty suspensions counter.  */
        _tx_queue_performance_empty_suspension_count++;

        /* Increment the number of empty suspensions on this queue.  */
        queue_ptr -> tx_queue_performance_empty_suspension_count++;
#endif
            
        /* Pickup thread pointer.  */
        TX_THREAD_GET_CURRENT(thread_ptr)

        /* Setup cleanup routine pointer.  */
        thread_ptr -> tx_thread_suspend_cleanup =  _tx_queue_cleanup;

        /* Setup cleanup information, i.e. this queue control
           block and the source pointer.  */
        thread_ptr -> tx_thread_suspend_control_block =    (VOID *) queue_ptr;
        thread_ptr -> tx_thread_additional_suspend_info =  (VOID *) destination_ptr;
        thread_ptr -> tx_thread_suspend_option =           TX_FALSE;

        /* Setup suspension list.  */
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
        }

        /* Increment the suspended thread count.  */
        queue_ptr -> tx_queue_suspended_count =  suspended_count + 1;

        /* Set the state to suspended.  */
        thread_ptr -> tx_thread_state =    TX_QUEUE_SUSP;

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

        /* Restore interrupts.  */
        TX_RESTORE
           
        /* Immediate return, return error completion.  */
        return(TX_QUEUE_EMPTY);
    }
}

