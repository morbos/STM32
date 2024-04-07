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
/**   Byte Memory                                                         */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_thread.h"
#include "tx_byte_pool.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_byte_release                                    PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function returns previously allocated memory to its            */ 
/*    associated memory byte pool.                                        */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    memory_ptr                        Pointer to allocated memory       */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    [TX_PTR_ERROR | TX_SUCCESS]       Completion status                 */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_preempt_check   Check for preemption              */ 
/*    _tx_thread_system_resume          Resume thread service             */ 
/*    _tx_thread_system_ni_resume       Non-interruptable resume thread   */ 
/*    _tx_byte_pool_search              Search the byte pool for memory   */ 
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
/*                                            added optimization for      */ 
/*                                            memory search pointer       */ 
/*                                            update, resulting in        */ 
/*                                            version 5.1                 */ 
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
UINT  _tx_byte_release(VOID *memory_ptr)
{

TX_INTERRUPT_SAVE_AREA

TX_BYTE_POOL        *pool_ptr;          
TX_THREAD           *thread_ptr;        
UCHAR               *work_ptr;           
TX_THREAD           *susp_thread_ptr;   
ULONG               suspended_count;
TX_THREAD           *next_thread;
TX_THREAD           *previous_thread;


    /* Determine if the memory pointer is valid.  */
    work_ptr =  (UCHAR *) memory_ptr;
    if (work_ptr)
    {
        
        /* Back off the memory pointer to pickup its header.  */
        work_ptr = work_ptr - sizeof(UCHAR *) - sizeof(ULONG);

        /* There is a pointer, pickup the pool pointer address.  */
        if (*((ULONG *) (work_ptr + sizeof(UCHAR *))) != TX_BYTE_BLOCK_FREE)
        {

            /* Pickup the pool pointer.  */
            pool_ptr =  (TX_BYTE_POOL *) *((TX_BYTE_POOL **) (work_ptr + sizeof(UCHAR *)));

            /* See if we have a valid pool.  */
            if ((!pool_ptr) || (pool_ptr -> tx_byte_pool_id != TX_BYTE_POOL_ID))
            {
                
                /* Return pointer error.  */
                return(TX_PTR_ERROR);
            }
        }
        else
        {

            /* Return pointer error.  */
            return(TX_PTR_ERROR);
        }
    }
    else
    {

        /* Return pointer error.  */
        return(TX_PTR_ERROR);
    }

    /* At this point, we know that the pointer is valid.  */

    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(thread_ptr)

    /* Indicate that this thread is the current owner.  */
    pool_ptr -> tx_byte_pool_owner =  thread_ptr;

    /* Lockout interrupts.  */
    TX_BYTE_POOL_DISABLE

#ifdef TX_BYTE_POOL_ENABLE_PERFORMANCE_INFO

    /* Increment the total release counter.  */
    _tx_byte_pool_performance_release_count++;

    /* Increment the number of releases on this pool.  */
    pool_ptr -> tx_byte_pool_performance_release_count++;
#endif

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_BYTE_RELEASE, pool_ptr, memory_ptr, pool_ptr -> tx_byte_pool_suspended_count, pool_ptr -> tx_byte_pool_available, TX_TRACE_BYTE_POOL_EVENTS)

    /* Release the memory.  */
    *((ULONG *) (work_ptr + sizeof(UCHAR *))) =  TX_BYTE_BLOCK_FREE;

    /* Update the number of available bytes in the pool.  */
    pool_ptr -> tx_byte_pool_available =  
            pool_ptr -> tx_byte_pool_available + (*((UCHAR **) (work_ptr)) - work_ptr);

    /* Determine if the free block is prior to current search pointer.  */
    if (work_ptr < (pool_ptr -> tx_byte_pool_search))
    {

        /* Yes, update the search pointer to the released block.  */
        pool_ptr -> tx_byte_pool_search =  work_ptr;
    }

    /* Now examine the suspension list to find threads waiting for 
       memory.  Maybe it is now available!  */
    while (pool_ptr -> tx_byte_pool_suspended_count)
    {

        /* Pickup the first suspended thread pointer.  */
        susp_thread_ptr =  pool_ptr -> tx_byte_pool_suspension_list;

        /* Restore interrupts.  */
        TX_RESTORE

        /* See if the request can be satisfied.  */
        work_ptr =  _tx_byte_pool_search(pool_ptr, susp_thread_ptr -> tx_thread_suspend_info);   

        /* Disable interrupts.  */
        TX_BYTE_POOL_DISABLE

        /* If there is not enough memory, break this loop!  */
        if (!work_ptr)
           break;

        /* Check to make sure the thread is still suspended.  */
        if (susp_thread_ptr !=  pool_ptr -> tx_byte_pool_suspension_list)
        {

            /* Put the memory back on the available list since this thread is no longer
               suspended.  */
            work_ptr = work_ptr - sizeof(UCHAR *) - sizeof(ULONG);
            *((ULONG *) (work_ptr + sizeof(UCHAR *))) =  TX_BYTE_BLOCK_FREE;

            /* Update the number of available bytes in the pool.  */
            pool_ptr -> tx_byte_pool_available =  
                pool_ptr -> tx_byte_pool_available + (*((UCHAR **) (work_ptr)) - work_ptr);

            /* Determine if the current pointer is before the search pointer. */
            if (work_ptr < (pool_ptr -> tx_byte_pool_search))
            { 

                /* Yes, update the search pointer.  */
                pool_ptr -> tx_byte_pool_search =  work_ptr;
            }

            /* Start at the top of this loop.  */
            continue;
        }

        /* Remove the suspended thread from the list.  */

        /* Pickup the suspended count.  */
        suspended_count =  --(pool_ptr -> tx_byte_pool_suspended_count);

        /* See if this is the only suspended thread on the list.  */
        if (suspended_count == 0)
        {

            /* Yes, the only suspended thread.  */

            /* Update the head pointer.  */
            pool_ptr -> tx_byte_pool_suspension_list =  TX_NULL;
        }
        else
        {

            /* At least one more thread is on the same expiration list.  */

            /* Update the list head pointer.  */
            next_thread =                                susp_thread_ptr -> tx_thread_suspended_next;
            pool_ptr -> tx_byte_pool_suspension_list =   next_thread;

            /* Update the links of the adjacent threads.  */
            previous_thread =                              susp_thread_ptr -> tx_thread_suspended_previous;
            next_thread -> tx_thread_suspended_previous =  previous_thread;
            previous_thread -> tx_thread_suspended_next =  next_thread;
        } 
 
        /* Prepare for resumption of the thread.  */

        /* Clear cleanup routine to avoid timeout.  */
        susp_thread_ptr -> tx_thread_suspend_cleanup =  TX_NULL;

        /* Return this block pointer to the suspended thread waiting for
           a block.  */
        *((UCHAR **) susp_thread_ptr -> tx_thread_additional_suspend_info) =  (UCHAR *) work_ptr;

        /* Put return status into the thread control block.  */
        susp_thread_ptr -> tx_thread_suspend_status =  TX_SUCCESS;

#ifdef TX_NOT_INTERRUPTABLE

        /* Resume the thread!  */
        _tx_thread_system_ni_resume(susp_thread_ptr);

        /* Restore interrupts.  */
        TX_RESTORE
#else
        /* Temporarily disable preemption.  */
        _tx_thread_preempt_disable++;

        /* Restore interrupts.  */
        TX_RESTORE

        /* Resume thread.  */
        _tx_thread_system_resume(susp_thread_ptr);
#endif

        /* Lockout interrupts.  */
        TX_BYTE_POOL_DISABLE
    }

    /* Restore interrupts.  */
    TX_RESTORE

    /* Check for preemption.  */
    _tx_thread_system_preempt_check();

    /* Return completion status.  */
    return(TX_SUCCESS);
}

