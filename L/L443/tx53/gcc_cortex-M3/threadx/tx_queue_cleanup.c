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
#include "tx_thread.h"
#include "tx_queue.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_queue_cleanup                                   PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function processes queue timeout and thread terminate          */ 
/*    actions that require the queue data structures to be cleaned        */ 
/*    up.                                                                 */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    thread_ptr                        Pointer to suspended thread's     */ 
/*                                        control block                   */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    None                                                                */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_resume          Resume thread service             */ 
/*    _tx_thread_system_ni_resume       Non-interruptable resume thread   */ 
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    _tx_thread_timeout                Thread timeout processing         */ 
/*    _tx_thread_terminate              Thread terminate processing       */ 
/*    _tx_thread_wait_abort             Thread wait abort processing      */ 
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            logic to keep suspension    */ 
/*                                            list in order, added        */ 
/*                                            optional logic for          */ 
/*                                            non-interruptable operation,*/ 
/*                                            and made several            */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
VOID  _tx_queue_cleanup(TX_THREAD  *thread_ptr)
{

#ifndef TX_NOT_INTERRUPTABLE
TX_INTERRUPT_SAVE_AREA
#endif

TX_QUEUE            *queue_ptr;                
ULONG               suspended_count;
TX_THREAD           *next_thread;
TX_THREAD           *previous_thread;

    
    /* Setup pointer to queue control block.  */
    queue_ptr =  (TX_QUEUE *) thread_ptr -> tx_thread_suspend_control_block;

#ifndef TX_NOT_INTERRUPTABLE

    /* Disable interrupts to remove the suspended thread from the queue.  */
    TX_DISABLE

    /* Determine if the cleanup is still required.  */
    if ((thread_ptr -> tx_thread_suspend_cleanup) && (queue_ptr) && (queue_ptr -> tx_queue_id == TX_QUEUE_ID))
    {
#endif

        /* Yes, we still have thread suspension!  */

        /* Clear the suspension cleanup flag.  */
        thread_ptr -> tx_thread_suspend_cleanup =  TX_NULL;

        /* Pickup the suspended count.  */
        suspended_count =  --(queue_ptr -> tx_queue_suspended_count);

        /* Remove the suspended thread from the list.  */

        /* See if this is the only suspended thread on the list.  */
        if (suspended_count == 0)
        {

            /* Yes, the only suspended thread.  */

            /* Update the head pointer.  */
            queue_ptr -> tx_queue_suspension_list =  TX_NULL;
        }
        else
        {

            /* At least one more thread is on the same suspension list.  */

            /* Update the links of the adjacent threads.  */
            next_thread =                                   thread_ptr -> tx_thread_suspended_next;
            previous_thread =                               thread_ptr -> tx_thread_suspended_previous;
            next_thread -> tx_thread_suspended_previous =   previous_thread;
            previous_thread -> tx_thread_suspended_next =   next_thread;

            /* Determine if we need to update the head pointer.  */
            if (queue_ptr -> tx_queue_suspension_list == thread_ptr)
            {

                /* Update the list head pointer.  */
                queue_ptr -> tx_queue_suspension_list =         next_thread;
            }
        } 
 
        /* Now we need to determine if this cleanup is from a terminate, timeout,
           or from a wait abort.  */
        if (thread_ptr -> tx_thread_state == TX_QUEUE_SUSP)
        {

            /* Timeout condition and the thread still suspended on the queue.  
               Setup return error status and resume the thread.  */

#ifdef TX_QUEUE_ENABLE_PERFORMANCE_INFO

            /* Increment the total timeouts counter.  */
            _tx_queue_performance_timeout_count++;

            /* Increment the number of timeouts on this queue.  */
            queue_ptr -> tx_queue_performance_timeout_count++;
#endif

            /* Setup return status.  */
            if (queue_ptr -> tx_queue_enqueued)
            {
            
                /* Queue full timeout!  */
                thread_ptr -> tx_thread_suspend_status =  TX_QUEUE_FULL;
            }
            else
            {
            
                /* Queue empty timeout!  */
                thread_ptr -> tx_thread_suspend_status =  TX_QUEUE_EMPTY;
            }
            

#ifdef TX_NOT_INTERRUPTABLE

            /* Resume the thread!  */
            _tx_thread_system_ni_resume(thread_ptr);
#else

            /* Temporarily disable preemption.  */
            _tx_thread_preempt_disable++;

            /* Restore interrupts.  */
            TX_RESTORE

            /* Resume the thread!  */
            _tx_thread_system_resume(thread_ptr);
#endif

            /* Finished, just return.  */
            return;
        }

#ifndef TX_NOT_INTERRUPTABLE
    }

    /* Restore interrupts.  */
    TX_RESTORE
#endif
}

