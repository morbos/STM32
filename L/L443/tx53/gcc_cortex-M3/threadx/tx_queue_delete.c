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
/*    _tx_queue_delete                                    PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function deletes the specified queue.  All threads suspended   */ 
/*    on the queue are resumed with the TX_DELETED status code.           */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    queue_ptr                         Pointer to queue control block    */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_SUCCESS                        Successful completion status      */ 
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
/*  04-02-2007     William E. Lamie         Modified comment(s),          */ 
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
UINT  _tx_queue_delete(TX_QUEUE *queue_ptr)
{

TX_INTERRUPT_SAVE_AREA

TX_THREAD       *thread_ptr;                
TX_THREAD       *next_thread;
ULONG           suspended_count;
ULONG           created_count;
TX_QUEUE        *next_queue;
TX_QUEUE        *previous_queue;


    /* Disable interrupts to remove the queue from the created list.  */
    TX_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_QUEUE_DELETE, queue_ptr, &thread_ptr, 0, 0, TX_TRACE_QUEUE_EVENTS)

    /* Optional queue delete extended processing.  */
    TX_QUEUE_DELETE_EXTENSION(queue_ptr)

    /* If trace is enabled, unregister this object.  */
    TX_TRACE_OBJECT_UNREGISTER(queue_ptr)

    /* Clear the queue ID to make it invalid.  */
    queue_ptr -> tx_queue_id =  0;

    /* Decrement the number of queues created.  */
    _tx_queue_created_count--;
    created_count =  _tx_queue_created_count;

    /* See if the queue is the only one on the list.  */
    if (created_count == 0)
    {

        /* Only created queue, just set the created list to NULL.  */
        _tx_queue_created_ptr =  TX_NULL;
    }
    else
    {

        /* Link-up the neighbors.  */
        next_queue =                               queue_ptr -> tx_queue_created_next;
        previous_queue =                           queue_ptr -> tx_queue_created_previous;
        next_queue -> tx_queue_created_previous =  previous_queue;
        previous_queue -> tx_queue_created_next =  next_queue;

        /* See if we have to update the created list head pointer.  */
        if (_tx_queue_created_ptr == queue_ptr)
        {
        
            /* Yes, move the head pointer to the next link. */
            _tx_queue_created_ptr =  next_queue; 
        }
    }

    /* Temporarily disable preemption.  */
    _tx_thread_preempt_disable++;

    /* Pickup the suspension information.  */
    thread_ptr =                             queue_ptr -> tx_queue_suspension_list;    
    queue_ptr -> tx_queue_suspension_list =  TX_NULL;
    suspended_count =                        queue_ptr -> tx_queue_suspended_count;
    queue_ptr -> tx_queue_suspended_count =  0;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Walk through the queue list to resume any and all threads suspended
       on this queue.  */
    while (suspended_count--)
    {

        /* Lockout interrupts.  */
        TX_DISABLE

        /* Clear the cleanup pointer, this prevents the timeout from doing 
           anything.  */
        thread_ptr -> tx_thread_suspend_cleanup =  TX_NULL;

        /* Set the return status in the thread to TX_DELETED.  */
        thread_ptr -> tx_thread_suspend_status =  TX_DELETED;

        /* Move the thread pointer ahead.  */
        next_thread =  thread_ptr -> tx_thread_suspended_next;

#ifdef TX_NOT_INTERRUPTABLE

        /* Resume the thread!  */
        _tx_thread_system_ni_resume(thread_ptr);

        /* Restore interrupts.  */
        TX_RESTORE
#else

        /* Temporarily disable preemption again.  */
        _tx_thread_preempt_disable++;

        /* Restore interrupts.  */
        TX_RESTORE

        /* Resume the thread.  */
        _tx_thread_system_resume(thread_ptr);
#endif

        /* Move to next thread.  */
        thread_ptr =  next_thread;
    }

    /* Disable interrupts.  */
    TX_DISABLE

    /* Release previous preempt disable.  */
    _tx_thread_preempt_disable--;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Check for preemption.  */
    _tx_thread_system_preempt_check();

    /* Return TX_SUCCESS.  */
    return(TX_SUCCESS);
}

