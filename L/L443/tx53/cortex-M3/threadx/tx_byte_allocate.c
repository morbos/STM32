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
/*    _tx_byte_allocate                                   PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function allocates bytes from the specified memory byte        */ 
/*    pool.                                                               */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    pool_ptr                          Pointer to pool control block     */ 
/*    memory_ptr                        Pointer to place allocated bytes  */ 
/*                                        pointer                         */
/*    memory_size                       Number of bytes to allocate       */ 
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
/*    _tx_byte_pool_search              Search byte pool for memory       */ 
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
UINT  _tx_byte_allocate(TX_BYTE_POOL *pool_ptr, VOID **memory_ptr, ULONG memory_size,  ULONG wait_option)
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


    /* Round the memory size up to the next size that is evenly divisible by
       an ULONG.  This guarantees proper alignment.  */
    memory_size = ((memory_size + sizeof(ULONG)-1)/sizeof(ULONG)) * sizeof(ULONG);

    /* Disable interrupts.  */
    TX_BYTE_POOL_DISABLE

    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(thread_ptr)

#ifdef TX_BYTE_POOL_ENABLE_PERFORMANCE_INFO

    /* Increment the total allocations counter.  */
    _tx_byte_pool_performance_allocate_count++;

    /* Increment the number of allocations on this pool.  */
    pool_ptr -> tx_byte_pool_performance_allocate_count++;
#endif

#ifdef TX_ENABLE_EVENT_TRACE

    /* If trace is enabled, save the current event pointer.  */
    entry_ptr =  _tx_trace_buffer_current_ptr;
#endif

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_BYTE_ALLOCATE, pool_ptr, 0, memory_size, wait_option, TX_TRACE_BYTE_POOL_EVENTS)

#ifdef TX_ENABLE_EVENT_TRACE

    /* Save the time stamp for later comparison to verify that
       the event hasn't been overwritten by the time the allocate
       call succeeds.  */
    if (entry_ptr)
    {

        time_stamp =  entry_ptr -> tx_trace_buffer_entry_time_stamp;
    }
#endif

    /* Loop to handle cases where the owner of the pool changed.  */
    do
    {

        /* Indicate that this thread is the current owner.  */
        pool_ptr -> tx_byte_pool_owner =  thread_ptr;

        /* Restore interrupts.  */
        TX_RESTORE

        /* At this point, the executing thread owns the pool and can perform a search
           for free memory.  */
        work_ptr =  _tx_byte_pool_search(pool_ptr, memory_size);

        /* Lockout interrupts.  */
        TX_BYTE_POOL_DISABLE

    } while ((!work_ptr) && (pool_ptr -> tx_byte_pool_owner != thread_ptr));

    /* Determine if memory was found.  */
    if (work_ptr)
    {

        /* Copy the pointer into the return destination.  */
        *memory_ptr =  (VOID *) work_ptr;

#ifdef TX_ENABLE_EVENT_TRACE

        /* Check that the event time stamp is unchanged.  A different
           timestamp means that a later event wrote over the byte
           allocate event.  In that case, do nothing here.  */
        if ((entry_ptr) && (time_stamp == entry_ptr -> tx_trace_buffer_entry_time_stamp))
        {

            /* Timestamp is the same, update the entry with the address.  */
            entry_ptr -> tx_trace_buffer_entry_information_field_2 =  (ULONG) *memory_ptr;
        }
#endif

        /* Set the status to success.  */
        status =  TX_SUCCESS;
    }
    else
    {

        /* No memory of sufficient size was found...  */

        /* Determine if the request specifies suspension.  */
        if (wait_option)
        {

            /* Prepare for suspension of this thread.  */

#ifdef TX_BYTE_POOL_ENABLE_PERFORMANCE_INFO

            /* Increment the total suspensions counter.  */
            _tx_byte_pool_performance_suspension_count++;

            /* Increment the number of suspensions on this pool.  */
            pool_ptr -> tx_byte_pool_performance_suspension_count++;
#endif

            /* Setup cleanup routine pointer.  */
            thread_ptr -> tx_thread_suspend_cleanup =  _tx_byte_pool_cleanup;

            /* Setup cleanup information, i.e. this pool control
               block.  */
            thread_ptr -> tx_thread_suspend_control_block =  (VOID *) pool_ptr;

            /* Save the return memory pointer address as well.  */
            thread_ptr -> tx_thread_additional_suspend_info =  (VOID *) memory_ptr;

            /* Save the byte size requested.  */
            thread_ptr -> tx_thread_suspend_info =  memory_size;

            /* Pickup the number of suspended threads.  */
            suspended_count =  (pool_ptr -> tx_byte_pool_suspended_count)++;

            /* Setup suspension list.  */
            if (suspended_count == 0)
            {

                /* No other threads are suspended.  Setup the head pointer and
                   just setup this threads pointers to itself.  */
                pool_ptr -> tx_byte_pool_suspension_list =      thread_ptr;
                thread_ptr -> tx_thread_suspended_next =        thread_ptr;
                thread_ptr -> tx_thread_suspended_previous =    thread_ptr;
            }
            else
            {

                /* This list is not NULL, add current thread to the end. */
                next_thread =                                   pool_ptr -> tx_byte_pool_suspension_list;
                thread_ptr -> tx_thread_suspended_next =        next_thread;
                previous_thread =                               next_thread -> tx_thread_suspended_previous;
                thread_ptr -> tx_thread_suspended_previous =    previous_thread;
                previous_thread -> tx_thread_suspended_next =   thread_ptr;
                next_thread -> tx_thread_suspended_previous =   thread_ptr;
            }

            /* Set the state to suspended.  */
            thread_ptr -> tx_thread_state =       TX_BYTE_MEMORY;

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
                entry_ptr -> tx_trace_buffer_entry_information_field_2 =  (ULONG) *memory_ptr;
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

