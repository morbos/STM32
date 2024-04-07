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
/*    _tx_mutex_delete                                    PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function deletes the specified mutex.  All threads             */ 
/*    suspended on the mutex are resumed with the TX_DELETED status       */ 
/*    code.                                                               */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    mutex_ptr                         Pointer to mutex control block    */ 
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
UINT  _tx_mutex_delete(TX_MUTEX *mutex_ptr)
{

TX_INTERRUPT_SAVE_AREA

TX_THREAD       *thread_ptr;                
TX_THREAD       *next_thread;
ULONG           suspended_count;
ULONG           created_count;
ULONG           owned_count;
TX_MUTEX        *next_mutex;
TX_MUTEX        *previous_mutex;


    /* Disable interrupts to remove the mutex from the created list.  */
    TX_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_MUTEX_DELETE, mutex_ptr, &thread_ptr, 0, 0, TX_TRACE_MUTEX_EVENTS)

    /* Optional mutex delete extended processing.  */
    TX_MUTEX_DELETE_EXTENSION(mutex_ptr)

    /* If trace is enabled, unregister this object.  */
    TX_TRACE_OBJECT_UNREGISTER(mutex_ptr)

    /* Clear the mutex ID to make it invalid.  */
    mutex_ptr -> tx_mutex_id =  0;

    /* Decrement the number of mutexes created.  */
    _tx_mutex_created_count--;
    created_count =  _tx_mutex_created_count;

    /* See if the mutex is the only one on the list.  */
    if (created_count == 0)
    {

        /* Only created mutex, just set the created list to NULL.  */
        _tx_mutex_created_ptr =  TX_NULL;
    }
    else
    {

        /* Link-up the neighbors.  */
        next_mutex =                               mutex_ptr -> tx_mutex_created_next;
        previous_mutex =                           mutex_ptr -> tx_mutex_created_previous;
        next_mutex -> tx_mutex_created_previous =  previous_mutex;
        previous_mutex -> tx_mutex_created_next =  next_mutex;

        /* See if we have to update the created list head pointer.  */
        if (_tx_mutex_created_ptr == mutex_ptr)
        {
        
            /* Yes, move the head pointer to the next link. */
            _tx_mutex_created_ptr =  next_mutex; 
        }
    }

    /* Determine if the mutex is currently on a thread's ownership list.  */

    /* Setup pointer to owner of mutex.  */
    thread_ptr =  mutex_ptr -> tx_mutex_owner;

    /* Does this mutex support priority inheritance?  */
    if ((mutex_ptr -> tx_mutex_inherit) && (thread_ptr))
    {

        /* Yes, remove this mutex from the owned list.  */

        /* Decrement the ownership count.  */
        thread_ptr -> tx_thread_owned_mutex_count--;
        owned_count =  thread_ptr -> tx_thread_owned_mutex_count;

        /* Determine if this mutex was the only one on the list.  */
        if (owned_count == 0)
        {

            /* Yes, the list is empty.  Simply set the head pointer to NULL.  */
            thread_ptr -> tx_thread_owned_mutex_list =  TX_NULL;
        }
        else
        {

            /* No, there are more mutexes on the list.  */

            /* Link-up the neighbors.  */
            next_mutex =                             mutex_ptr -> tx_mutex_owned_next;
            previous_mutex =                         mutex_ptr -> tx_mutex_owned_previous;
            next_mutex -> tx_mutex_owned_previous =  previous_mutex;
            previous_mutex -> tx_mutex_owned_next =  next_mutex;

            /* See if we have to update the created list head pointer.  */
            if (thread_ptr -> tx_thread_owned_mutex_list == mutex_ptr)
            {

                /* Yes, move the head pointer to the next link. */
                thread_ptr -> tx_thread_owned_mutex_list =  next_mutex; 
            }
        }
    }

    /* Clear the ownership of the mutex.  */
    mutex_ptr -> tx_mutex_owner =  TX_NULL;

    /* Temporarily disable preemption.  */
    _tx_thread_preempt_disable++;

    /* Pickup the suspension information.  */
    thread_ptr =                             mutex_ptr -> tx_mutex_suspension_list;    
    mutex_ptr -> tx_mutex_suspension_list =  TX_NULL;
    suspended_count =                        mutex_ptr -> tx_mutex_suspended_count;
    mutex_ptr -> tx_mutex_suspended_count =  0;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Walk through the mutex list to resume any and all threads suspended
       on this mutex.  */
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

