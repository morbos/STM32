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
/**   Trace                                                               */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_thread.h"
#include "tx_timer.h"
#include "tx_event_flags.h"
#include "tx_queue.h"
#include "tx_semaphore.h"
#include "tx_mutex.h"
#include "tx_block_pool.h"
#include "tx_byte_pool.h"
#include "tx_trace.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_trace_enable                                    PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function initializes the ThreadX trace buffer and the          */ 
/*    associated control variables, enabling it for operation.            */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    trace_buffer_start                    Start of trace buffer         */ 
/*    trace_buffer_size                     Size (bytes) of trace buffer  */ 
/*    registry_entries                      Number of object registry     */ 
/*                                            entries.                    */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    Completion Status                                                   */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_preempt_check       Check for preemption          */ 
/*    _tx_trace_object_register             Register existing objects     */ 
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
/*                                            logic to setup event filter,*/ 
/*                                            and modified code to ensure */ 
/*                                            universal trace format,     */ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modfied comment(s), added     */ 
/*                                            trace include source define,*/ 
/*                                            and changed trace buffer    */ 
/*                                            initialization so partial   */ 
/*                                            trace buffers are processed */ 
/*                                            properly, resulting in      */ 
/*                                            version 5.3                 */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_trace_enable(VOID *trace_buffer_start, ULONG trace_buffer_size, ULONG registry_entries)
{

#ifndef TX_ENABLE_EVENT_TRACE

    /* Trace not enabled, return an error.  */
    return(TX_FEATURE_NOT_ENABLED);
#else

TX_INTERRUPT_SAVE_AREA

TX_THREAD               *thread_ptr;
TX_TIMER                *timer_ptr;
TX_EVENT_FLAGS_GROUP    *event_flags_ptr;
TX_QUEUE                *queue_ptr;
TX_SEMAPHORE            *semaphore_ptr;
TX_MUTEX                *mutex_ptr;
TX_BLOCK_POOL           *block_pool_ptr;
TX_BYTE_POOL            *byte_pool_ptr;
UCHAR                   *work_ptr;
ULONG                   i;


    /* First, see if there is enough room for the control header, the registry entries, and at least one event in 
       memory supplied to this call.  */
    if (trace_buffer_size < (sizeof(TX_TRACE_CONTROL_HEADER) + (sizeof(TX_TRACE_OBJECT_REGISTRY_ENTRY) * registry_entries) + sizeof(TX_TRACE_BUFFER_ENTRY)))
    {

        /* No, the memory isn't big enough to hold one trace buffer entry.  Return an error.  */
        return(TX_SIZE_ERROR);
    }

    /* Determine if trace is already enabled.  */
    if (_tx_trace_buffer_current_ptr)
    {
    
        /* Yes, trace is already enabled.  */
        return(TX_NOT_DONE);
    }

    /* Set the enable bits for all events enabled.  */
    _tx_trace_event_enable_bits =  0xFFFFFFFF;

    /* Setup working pointer to the supplied memory.  */
    work_ptr =  (UCHAR *) trace_buffer_start;

    /* Setup pointer to the trace control area.  */
    _tx_trace_control_header_ptr =  (TX_TRACE_CONTROL_HEADER *) work_ptr;

    /* Move the working pointer past the control area.  */
    work_ptr =  work_ptr + sizeof(TX_TRACE_CONTROL_HEADER);

    /* Save the start of the trace object registry.  */
    _tx_trace_registry_start_ptr =  (TX_TRACE_OBJECT_REGISTRY_ENTRY *) work_ptr;

    /* Setup the end of the trace object registry.  */
    _tx_trace_registry_end_ptr =  _tx_trace_registry_start_ptr + registry_entries;

    /* Loop to make all trace object registry entries empty and valid.  */
    for (i = 0; i < registry_entries; i++)
    {

        /* Initialize object registry entry.  */
        _tx_trace_registry_start_ptr[i].tx_trace_object_registry_entry_object_available =         TX_TRUE;
        _tx_trace_registry_start_ptr[i].tx_trace_object_registry_entry_object_type =              TX_TRACE_OBJECT_TYPE_NOT_VALID;
        _tx_trace_registry_start_ptr[i].tx_trace_object_registry_entry_object_reserved1 =         0;
        _tx_trace_registry_start_ptr[i].tx_trace_object_registry_entry_object_reserved2 =         0;
        _tx_trace_registry_start_ptr[i].tx_trace_thread_registry_entry_object_pointer =           TX_NULL;
    }

    /* Setup the work pointer to after the trace object registry.  */
    work_ptr =  (UCHAR *) _tx_trace_registry_end_ptr;

    /* Adjust the remaining trace buffer size.  */
    trace_buffer_size =  trace_buffer_size - (sizeof(TX_TRACE_OBJECT_REGISTRY_ENTRY) * registry_entries) - sizeof(TX_TRACE_CONTROL_HEADER);

    /* Setup pointer to the start of the actual event trace log.  */
    _tx_trace_buffer_start_ptr =      (TX_TRACE_BUFFER_ENTRY *) work_ptr;

    /* Calculate the end of the trace buffer.  */
    _tx_trace_buffer_end_ptr =        _tx_trace_buffer_start_ptr + (trace_buffer_size / sizeof(TX_TRACE_BUFFER_ENTRY));

    /* Loop to mark all entries in the trace buffer as invalid.  */
    for (i = 0; i < (trace_buffer_size/sizeof(TX_TRACE_BUFFER_ENTRY)); i++)
    {

        /* Mark this trace entry as invalid.  */
        _tx_trace_buffer_start_ptr[i].tx_trace_buffer_entry_thread_pointer =  TX_NULL;
    }

    /* Now, fill in the event trace control header.  */
    _tx_trace_control_header_ptr -> tx_trace_control_header_id =                             TX_TRACE_VALID;
    _tx_trace_control_header_ptr -> tx_trace_control_header_timer_valid_mask =               TX_TRACE_TIME_MASK; 
    _tx_trace_control_header_ptr -> tx_trace_control_header_trace_base_address =             (ULONG) trace_buffer_start;
    _tx_trace_control_header_ptr -> tx_trace_control_header_object_registry_start_pointer =  (ULONG) _tx_trace_registry_start_ptr;
    _tx_trace_control_header_ptr -> tx_trace_control_header_reserved1 =                      0;
    _tx_trace_control_header_ptr -> tx_trace_control_header_object_registry_name_size =      TX_TRACE_OBJECT_REGISTRY_NAME;
    _tx_trace_control_header_ptr -> tx_trace_control_header_object_registry_end_pointer =    (ULONG) _tx_trace_registry_end_ptr;
    _tx_trace_control_header_ptr -> tx_trace_control_header_buffer_start_pointer =           (ULONG) _tx_trace_buffer_start_ptr;
    _tx_trace_control_header_ptr -> tx_trace_control_header_buffer_end_pointer =             (ULONG) _tx_trace_buffer_end_ptr;
    _tx_trace_control_header_ptr -> tx_trace_control_header_buffer_current_pointer =         (ULONG) _tx_trace_buffer_start_ptr;
    _tx_trace_control_header_ptr -> tx_trace_control_header_reserved2 =                      0xAAAAAAAAUL;
    _tx_trace_control_header_ptr -> tx_trace_control_header_reserved3 =                      0xBBBBBBBBUL;
    _tx_trace_control_header_ptr -> tx_trace_control_header_reserved4 =                      0xCCCCCCCCUL;

    /* Now, loop through all existing ThreadX objects and register them in the newly setup trace buffer.  */

    /* Disable interrupts.  */
    TX_DISABLE

    /* First, disable preemption.  */
    _tx_thread_preempt_disable++;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Pickup the first thread and the number of created threads.  */
    thread_ptr =  _tx_thread_created_ptr;
    i =           _tx_thread_created_count;

    /* Loop to register all threads.  */
    while (i--)
    {

        /* Register this thread.  */
        _tx_trace_object_register(TX_TRACE_OBJECT_TYPE_THREAD, thread_ptr, thread_ptr -> tx_thread_name, 
                                        (ULONG) thread_ptr -> tx_thread_stack_start, (ULONG) thread_ptr -> tx_thread_stack_size);

        /* Move to the next thread.  */
        thread_ptr =  thread_ptr -> tx_thread_created_next;
    }

    /* Pickup the first timer and the number of created timers.  */
    timer_ptr =  _tx_timer_created_ptr;
    i =          _tx_timer_created_count;

    /* Loop to register all timers.  */
    while (i--)
    {

        /* Register this timer.  */
        _tx_trace_object_register(TX_TRACE_OBJECT_TYPE_TIMER, timer_ptr, timer_ptr -> tx_timer_name, 
                                                    0, timer_ptr -> tx_timer_internal.tx_timer_internal_re_initialize_ticks);

        /* Move to the next timer.  */
        timer_ptr =  timer_ptr -> tx_timer_created_next;
    }


    /* Pickup the first event flag group and the number of created groups.  */
    event_flags_ptr =  _tx_event_flags_created_ptr;
    i =                _tx_event_flags_created_count;

    /* Loop to register all event flags groups.  */
    while (i--)
    {

        /* Register this event flags group.  */
        _tx_trace_object_register(TX_TRACE_OBJECT_TYPE_EVENT_FLAGS, event_flags_ptr, event_flags_ptr -> tx_event_flags_group_name, 0, 0);

        /* Move to the next event flags group.  */
        event_flags_ptr =  event_flags_ptr -> tx_event_flags_group_created_next;
    }

    /* Pickup the first queue and the number of created queues.  */
    queue_ptr =  _tx_queue_created_ptr;
    i =          _tx_queue_created_count;

    /* Loop to register all queues.  */
    while (i--)
    {

        /* Register this queue.  */
        _tx_trace_object_register(TX_TRACE_OBJECT_TYPE_QUEUE, queue_ptr, queue_ptr -> tx_queue_name, 
                                                                (queue_ptr -> tx_queue_capacity * sizeof(ULONG)), 0);

        /* Move to the next queue.  */
        queue_ptr =  queue_ptr -> tx_queue_created_next;
    }

    /* Pickup the first semaphore and the number of created semaphores.  */
    semaphore_ptr =  _tx_semaphore_created_ptr;
    i =              _tx_semaphore_created_count;

    /* Loop to register all semaphores.  */
    while (i--)
    {

        /* Register this semaphore.  */
        _tx_trace_object_register(TX_TRACE_OBJECT_TYPE_SEMAPHORE, semaphore_ptr, semaphore_ptr -> tx_semaphore_name, 0, 0);

        /* Move to the next semaphore.  */
        semaphore_ptr =  semaphore_ptr -> tx_semaphore_created_next;
    }

    /* Pickup the first mutex and the number of created mutexes.  */
    mutex_ptr =  _tx_mutex_created_ptr;
    i =          _tx_mutex_created_count;

    /* Loop to register all mutexes.  */
    while (i--)
    {

        /* Register this mutex.  */
        _tx_trace_object_register(TX_TRACE_OBJECT_TYPE_MUTEX, mutex_ptr, mutex_ptr -> tx_mutex_name, 
                                                                    (ULONG) mutex_ptr -> tx_mutex_inherit, 0);

        /* Move to the next mutex.  */
        mutex_ptr =  mutex_ptr -> tx_mutex_created_next;
    }

    /* Pickup the first block pool and the number of created block pools.  */
    block_pool_ptr =  _tx_block_pool_created_ptr;
    i =               _tx_block_pool_created_count;

    /* Loop to register all block pools.  */
    while (i--)
    {

        /* Register this block pool.  */
        _tx_trace_object_register(TX_TRACE_OBJECT_TYPE_BLOCK_POOL, block_pool_ptr, block_pool_ptr -> tx_block_pool_name, 
                                                                        block_pool_ptr -> tx_block_pool_size, 0);

        /* Move to the next block pool.  */
        block_pool_ptr =  block_pool_ptr -> tx_block_pool_created_next;
    }

    /* Pickup the first byte pool and the number of created byte pools.  */
    byte_pool_ptr =  _tx_byte_pool_created_ptr;
    i =              _tx_byte_pool_created_count;

    /* Loop to register all byte pools.  */
    while (i--)
    {

        /* Register this byte pool.  */
        _tx_trace_object_register(TX_TRACE_OBJECT_TYPE_BYTE_POOL, byte_pool_ptr, byte_pool_ptr -> tx_byte_pool_name, 
                                                                        byte_pool_ptr -> tx_byte_pool_size, 0);

        /* Move to the next byte pool.  */
        byte_pool_ptr =  byte_pool_ptr -> tx_byte_pool_created_next;
    }

    /* Disable interrupts.  */
    TX_DISABLE

    /* Release the preeemption.  */
    _tx_thread_preempt_disable--;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Finally, setup the current buffer pointer, which effectively enables the trace!  */    
    _tx_trace_buffer_current_ptr =    (TX_TRACE_BUFFER_ENTRY *) _tx_trace_buffer_start_ptr;

    /* Check for preemption.  */
    _tx_thread_system_preempt_check();

    /* Return successful completion.  */
    return(TX_SUCCESS);
#endif
}

/* Include the new trace files starting in ThreadX 5.2.  */

#define TX_INCLUDE_TRACE_SOURCE
#include "tx_trace_event_filter.c"
#include "tx_trace_event_unfilter.c"
#include "tx_trace_buffer_full_notify.c"


