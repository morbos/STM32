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
/**   Block Pool                                                          */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_thread.h"
#include "tx_timer.h"
#include "tx_block_pool.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_block_allocate                                  PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function allocates a block from the specified memory block     */ 
/*    pool.                                                               */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    pool_ptr                          Pointer to pool control block     */ 
/*    block_ptr                         Pointer to place allocated block  */ 
/*                                        pointer                         */
/*    wait_option                       Suspension option                 */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    status                            Completion status                 */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_suspend         Suspend thread                    */ 
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
UINT  _tx_block_allocate(TX_BLOCK_POOL *pool_ptr, VOID **block_ptr, ULONG wait_option)
{

TX_INTERRUPT_SAVE_AREA

UINT                        status;                 
TX_THREAD                   *thread_ptr;            
UCHAR                       *work_ptr;               
ULONG                       suspended_count;
TX_THREAD                   *next_thread;
TX_THREAD                   *previous_thread;
#ifdef TX_ENABLE_EVENT_TRACE
TX_TRACE_BUFFER_ENTRY       *entry_ptr;
ULONG                       time_stamp =  0;
#endif


    /* Disable interrupts to get a block from the pool.  */
    TX_BLOCK_POOL_DISABLE

#ifdef TX_BLOCK_POOL_ENABLE_PERFORMANCE_INFO

    /* Increment the total allocations counter.  */
    _tx_block_pool_performance_allocate_count++;

    /* Increment the number of allocations on this pool.  */
    pool_ptr -> tx_block_pool_performance_allocate_count++;
#endif

#ifdef TX_ENABLE_EVENT_TRACE

    /* If trace is enabled, save the current event pointer.  */
    entry_ptr =  _tx_trace_buffer_current_ptr;
#endif

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_BLOCK_ALLOCATE, pool_ptr, 0, wait_option, pool_ptr -> tx_block_pool_available, TX_TRACE_BLOCK_POOL_EVENTS)

#ifdef TX_ENABLE_EVENT_TRACE

    /* Save the time stamp for later comparison to verify that
       the event hasn't been overwritten by the time the allocate
       call succeeds.  */
    if (entry_ptr)
    {

        time_stamp =  entry_ptr -> tx_trace_buffer_entry_time_stamp;
    }
#endif

    /* Determine if there is an available block.  */
    if (pool_ptr -> tx_block_pool_available)
    {

        /* Yes, a block is available.  Decrement the available count.  */
        pool_ptr -> tx_block_pool_available--;

        /* Pickup the current block pointer.  */
        work_ptr =  pool_ptr -> tx_block_pool_available_list;

        /* Return the first available block to the caller.  */
        *((UCHAR **) block_ptr) =  work_ptr + sizeof(UCHAR *);

        /* Modify the available list to point at the next block in the pool. */
        pool_ptr -> tx_block_pool_available_list =  *((UCHAR **) work_ptr);

        /* Save the pool's address in the block for when it is released!  */
        *((UCHAR **) work_ptr) =  (UCHAR *) pool_ptr;
    
#ifdef TX_ENABLE_EVENT_TRACE

        /* Check that the event time stamp is unchanged.  A different
           timestamp means that a later event wrote over the byte
           allocate event.  In that case, do nothing here.  */
        if ((entry_ptr) && (time_stamp == entry_ptr -> tx_trace_buffer_entry_time_stamp))
        {

            /* Timestamp is the same, update the entry with the address.  */
            entry_ptr -> tx_trace_buffer_entry_information_field_2 =  (ULONG) *block_ptr;
        }
#endif

        /* Set status to success.  */
        status =  TX_SUCCESS;
    }
    else
    {

        /* Determine if the request specifies suspension.  */
        if (wait_option)
        {

            /* Prepare for suspension of this thread.  */
            
#ifdef TX_BLOCK_POOL_ENABLE_PERFORMANCE_INFO

            /* Increment the total suspensions counter.  */
            _tx_block_pool_performance_suspension_count++;

            /* Increment the number of suspensions on this pool.  */
            pool_ptr -> tx_block_pool_performance_suspension_count++;
#endif

            /* Pickup thread pointer.  */
            TX_THREAD_GET_CURRENT(thread_ptr)

            /* Setup cleanup routine pointer.  */
            thread_ptr -> tx_thread_suspend_cleanup =  _tx_block_pool_cleanup;

            /* Setup cleanup information, i.e. this pool control
               block.  */
            thread_ptr -> tx_thread_suspend_control_block =  (VOID *) pool_ptr;

            /* Save the return block pointer address as well.  */
            thread_ptr -> tx_thread_additional_suspend_info =  (VOID *) block_ptr;

            /* Pickup the number of suspended threads.  */
            suspended_count =  (pool_ptr -> tx_block_pool_suspended_count)++;

            /* Setup suspension list.  */
            if (suspended_count == 0)
            {

                /* No other threads are suspended.  Setup the head pointer and
                   just setup this threads pointers to itself.  */
                pool_ptr -> tx_block_pool_suspension_list =     thread_ptr;
                thread_ptr -> tx_thread_suspended_next =        thread_ptr;
                thread_ptr -> tx_thread_suspended_previous =    thread_ptr;
            }
            else
            {

                /* This list is not NULL, add current thread to the end. */
                next_thread =                                   pool_ptr -> tx_block_pool_suspension_list;
                thread_ptr -> tx_thread_suspended_next =        next_thread;
                previous_thread =                               next_thread -> tx_thread_suspended_previous;
                thread_ptr -> tx_thread_suspended_previous =    previous_thread;
                previous_thread -> tx_thread_suspended_next =   thread_ptr;
                next_thread -> tx_thread_suspended_previous =   thread_ptr;
            }

            /* Set the state to suspended.  */
            thread_ptr -> tx_thread_state =       TX_BLOCK_MEMORY;

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

#ifdef TX_ENABLE_EVENT_TRACE

            /* Check that the event time stamp is unchanged.  A different
               timestamp means that a later event wrote over the byte
               allocate event.  In that case, do nothing here.  */
            if ((entry_ptr) && (time_stamp == entry_ptr -> tx_trace_buffer_entry_time_stamp))
            {

                /* Timestamp is the same, update the entry with the address.  */
                entry_ptr -> tx_trace_buffer_entry_information_field_2 =  (ULONG) *block_ptr;
            }
#endif

            /* Return the completion status.  */
            return(thread_ptr -> tx_thread_suspend_status);
        }
        else
        {

            /* Immediate return, return error completion.  */
            status =  TX_NO_MEMORY;
        }
    }

    /* Restore interrupts.  */
    TX_RESTORE

    /* Return completion status.  */
    return(status);
}

