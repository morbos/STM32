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
/*    _tx_queue_prioritize                                PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function places the highest priority suspended thread at the   */ 
/*    front of the suspension list.  All other threads remain in the same */ 
/*    FIFO suspension order.                                              */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    queue_ptr                         Pointer to queue control block    */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    status                            Completion status                 */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_preempt_check   Check for preemption              */ 
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
/*                                            filter option to trace      */ 
/*                                            insert, and made several    */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_queue_prioritize(TX_QUEUE *queue_ptr)
{

TX_INTERRUPT_SAVE_AREA

TX_THREAD       *thread_ptr;          
TX_THREAD       *priority_thread_ptr;  
TX_THREAD       *head_ptr;
ULONG           suspended_count;
TX_THREAD       *next_thread;
TX_THREAD       *previous_thread;


    /* Disable interrupts to place message in the queue.  */
    TX_QUEUE_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_QUEUE_PRIORITIZE, queue_ptr, queue_ptr -> tx_queue_suspended_count, &suspended_count, 0, TX_TRACE_QUEUE_EVENTS)

    /* Pickup the suspended count.  */
    suspended_count =  queue_ptr -> tx_queue_suspended_count;

    /* Determine if there are fewer than 2 suspended threads.  */
    if (suspended_count < 2)
    {

        /* Restore interrupts.  */
        TX_RESTORE

        /* Nothing to find, simply return success.  */
        return(TX_SUCCESS);
    }

    /* Determine if there how many threads are suspended on this queue.  */
    else if (suspended_count == 2)
    {

        /* Pickup the head pointer and the next pointer.  */
        head_ptr =  queue_ptr -> tx_queue_suspension_list;
        next_thread =  head_ptr -> tx_thread_suspended_next;

        /* Determine if the next suspended thread has a higher priority.  */
        if ((next_thread -> tx_thread_priority) < (head_ptr -> tx_thread_priority))
        {

            /* Yes, move the list head to the next thread.  */
            queue_ptr -> tx_queue_suspension_list =  next_thread;
        }

        /* Restore interrupts.  */
        TX_RESTORE

        /* Return completion status.  */
        return(TX_SUCCESS);
    }
    else 
    {

        /* Remember the suspension count and head pointer.  */
        head_ptr =   queue_ptr -> tx_queue_suspension_list;

        /* Default the highest priority thread to the thread at the front of the list.  */
        priority_thread_ptr =  head_ptr;

        /* Setup search pointer.  */
        thread_ptr =  priority_thread_ptr -> tx_thread_suspended_next;

        /* Disable preemption.  */
        _tx_thread_preempt_disable++;

        /* Search through the list to find the highest priority thread.  */
        do
        {

            /* Is the current thread higher priority?  */
            if (thread_ptr -> tx_thread_priority < priority_thread_ptr -> tx_thread_priority)
            {

                /* Yes, remember that this thread is the highest priority.  */
                priority_thread_ptr =  thread_ptr;
            }

            /* Restore interrupts temporarily.  */
            TX_RESTORE

            /* Disable interrupts again.  */
            TX_QUEUE_DISABLE

            /* Determine if any changes to the list have been found.  */
            if ((head_ptr == queue_ptr -> tx_queue_suspension_list) &&
                (suspended_count == queue_ptr -> tx_queue_suspended_count))
            {

                /* Move the thread pointer to the next thread.  */
                thread_ptr =  thread_ptr -> tx_thread_suspended_next;
            }
            else
            {

                /* Save the suspension count and head pointer.  */
                head_ptr =   queue_ptr -> tx_queue_suspension_list;
                suspended_count =  queue_ptr -> tx_queue_suspended_count;

                /* Default the highest priority thread to the thread at the front of the list.  */
                priority_thread_ptr =  head_ptr;

                /* Setup search pointer.  */
                thread_ptr =  priority_thread_ptr -> tx_thread_suspended_next;
            }

        } while (thread_ptr != head_ptr);

        /* Release preemption.  */
        _tx_thread_preempt_disable--;

        /* Now determine if the highest priority thread is at the front 
           of the list.  */
        if (priority_thread_ptr != head_ptr)
        {

            /* No, we need to move the highest priority suspended thread to the 
               front of the list.  */

            /* First, remove the highest priority thread by updating the
               adjacent suspended threads.  */
            next_thread =                                  priority_thread_ptr -> tx_thread_suspended_next;
            previous_thread =                              priority_thread_ptr -> tx_thread_suspended_previous;
            next_thread -> tx_thread_suspended_previous =  previous_thread;
            previous_thread -> tx_thread_suspended_next =  next_thread;

            /* Now, link the highest priority thread at the front of the list.  */
            previous_thread =                                      head_ptr -> tx_thread_suspended_previous;
            priority_thread_ptr -> tx_thread_suspended_next =      head_ptr;
            priority_thread_ptr -> tx_thread_suspended_previous =  previous_thread;
            previous_thread -> tx_thread_suspended_next =          priority_thread_ptr;
            head_ptr -> tx_thread_suspended_previous =             priority_thread_ptr;

            /* Move the list head pointer to the highest priority suspended thread.  */
            queue_ptr -> tx_queue_suspension_list =  priority_thread_ptr;
        }

        /* Restore interrupts.  */
        TX_RESTORE

        /* Check for preemption.  */
        _tx_thread_system_preempt_check();

        /* Return completion status.  */
        return(TX_SUCCESS);
    }
}

