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
/**   Thread                                                              */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_initialize.h"
#include "tx_timer.h"
#include "tx_thread.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_thread_system_resume                            PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function places the specified thread on the list of ready      */ 
/*    threads at the thread's specific priority.                          */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    thread_ptr                            Pointer to thread to resume   */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    None                                                                */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    [_tx_thread_stack_analyze]            Analyze thread stack usage    */ 
/*    [_tx_thread_stack_error_handler]      Handle thread stack errors    */ 
/*    _tx_thread_system_return              Return to the system          */ 
/*    _tx_thread_system_ni_resume           Noninterruptable thread resume*/ 
/*    _tx_timer_system_deactivate           Timer deactivate              */ 
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    _tx_thread_create                     Thread create function        */ 
/*    _tx_thread_priority_change            Thread priority change        */ 
/*    _tx_thread_resume                     Application resume service    */ 
/*    _tx_thread_timeout                    Thread timeout                */ 
/*    _tx_thread_wait_abort                 Thread wait abort             */ 
/*    Other ThreadX Components                                            */
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s), fixed    */ 
/*                                            conditional declaration of  */ 
/*                                            map_index, and              */ 
/*                                            added logic to remove the   */ 
/*                                            timer logic, resulting      */ 
/*                                            in version 5.1              */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            macro to get current thread,*/ 
/*                                            added state change macro,   */ 
/*                                            added optional logic for    */ 
/*                                            non-interruptable operation,*/ 
/*                                            added filter option to trace*/ 
/*                                            insert, added next thread   */ 
/*                                            to system resume trace      */ 
/*                                            entry, changed MOD32 macro  */ 
/*                                            to new TX_MOD32_BIT_SET     */ 
/*                                            macro, added                */ 
/*                                            TX_DIV32_BIT_SET macro,     */ 
/*                                            added stack check macro, and*/ 
/*                                            optimized code for typical  */ 
/*                                            path processing, resulting  */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s), fixed    */ 
/*                                            problem of not clearing a   */ 
/*                                            pending timer registration  */ 
/*                                            when a thread suspension is */ 
/*                                            interrupted, resulting in   */ 
/*                                            version 5.3                 */ 
/*                                                                        */ 
/**************************************************************************/ 
#ifndef TX_NOT_INTERRUPTABLE
VOID  _tx_thread_system_resume(TX_THREAD *thread_ptr)
{

TX_INTERRUPT_SAVE_AREA

UINT            priority; 
ULONG           priority_bit;
TX_THREAD       *head_ptr; 
TX_THREAD       *tail_ptr; 
TX_THREAD       *execute_ptr;
TX_THREAD       *current_thread;
ULONG           combined_flags;

#ifdef TX_ENABLE_EVENT_TRACE
TX_TRACE_BUFFER_ENTRY       *entry_ptr;
ULONG                       time_stamp =  0;
#endif

#if TX_MAX_PRIORITIES > 32
UINT            map_index;
#endif


#ifndef TX_NO_TIMER

    /* Deactivate the timeout timer if necessary.  */
    if (thread_ptr -> tx_thread_timer.tx_timer_internal_list_head)
    {

        /* Deactivate the thread's timeout timer.  */
        _tx_timer_system_deactivate(&(thread_ptr -> tx_thread_timer));
    }
    else
    {

        /* Clear the remaining time to ensure timer doesn't get activated.  */
        thread_ptr -> tx_thread_timer.tx_timer_internal_remaining_ticks =  0;
    }
#endif

#ifdef TX_ENABLE_STACK_CHECKING 

    /* Check this thread's stack.  */
    TX_THREAD_STACK_CHECK(thread_ptr)
#endif

    /* Lockout interrupts while the thread is being resumed.  */
    TX_DISABLE

#ifdef TX_ENABLE_EVENT_TRACE

    /* If trace is enabled, save the current event pointer.  */
    entry_ptr =  _tx_trace_buffer_current_ptr;
#endif

    /* Log the thread status change.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_THREAD_RESUME, thread_ptr, thread_ptr -> tx_thread_state, &execute_ptr, _tx_thread_execute_ptr, TX_TRACE_INTERNAL_EVENTS)

#ifdef TX_ENABLE_EVENT_TRACE

    /* Save the time stamp for later comparison to verify that
       the event hasn't been overwritten by the time we have 
       computed the next thread to execute.  */
    if (entry_ptr)
    {

        /* Save time stamp.  */
        time_stamp =  entry_ptr -> tx_trace_buffer_entry_time_stamp;
    }
#endif

    /* Decrease the preempt disabled count.  */
    _tx_thread_preempt_disable--;

    /* Determine if the thread is in the process of suspending.  If so, the thread
       control block is already on the linked list so nothing needs to be done.  */
    if (thread_ptr -> tx_thread_suspending == TX_FALSE)
    {

        /* Thread is not in the process of suspending. Now check to make sure the thread 
           has not already been resumed.  */
        if (thread_ptr -> tx_thread_state != TX_READY)
        {

            /* No, now check to see if the delayed suspension flag is set.  */
            if (thread_ptr -> tx_thread_delayed_suspend == TX_FALSE)
            {            
    
                /* Resume the thread!  */
                
                /* Make this thread ready.  */

                /* Change the state to ready.  */
                thread_ptr -> tx_thread_state =  TX_READY;

                /* Pickup priority of thread.  */
                priority =  thread_ptr -> tx_thread_priority;

                /* Thread state change.  */
                TX_THREAD_STATE_CHANGE(thread_ptr, TX_READY)

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

                /* Increment the total number of thread resumptions.  */
                _tx_thread_performance_resume_count++;

                /* Increment this thread's resume count.  */
                thread_ptr -> tx_thread_performance_resume_count++;
#endif

                /* Determine if there are other threads at this priority that are
                   ready.  */
                head_ptr =  _tx_thread_priority_list[priority];
                if (head_ptr == TX_NULL)
                {

                    /* First thread at this priority ready.  Add to the front of the list.  */
                    _tx_thread_priority_list[priority] =       thread_ptr;
                    thread_ptr -> tx_thread_ready_next =       thread_ptr;
                    thread_ptr -> tx_thread_ready_previous =   thread_ptr;

#if TX_MAX_PRIORITIES > 32

                    /* Calculate the index into the bit map array.  */
                    map_index =  priority/32;

                    /* Set the active bit to remember that the priority map has something set.  */
                    TX_DIV32_BIT_SET(priority, priority_bit)
                    _tx_thread_priority_map_active =  _tx_thread_priority_map_active | priority_bit;
#endif

                    /* Or in the thread's priority bit.  */
                    TX_MOD32_BIT_SET(priority, priority_bit)
                    _tx_thread_priority_maps[MAP_INDEX] =  _tx_thread_priority_maps[MAP_INDEX] | priority_bit;

                    /* Determine if this newly ready thread is the highest priority.  */
                    if (priority < _tx_thread_highest_priority)
                    {

                        /* A new highest priority thread is present. */

                        /* Update the highest priority variable.  */
                        _tx_thread_highest_priority =  priority;

                        /* Pickup the execute pointer. Since it is going to be referenced multiple
                           times, it is placed in a local variable.  */
                        execute_ptr =  _tx_thread_execute_ptr;
                        
                        /* Determine if no thread is currently executing.  */
                        if (execute_ptr == TX_NULL)
                        {

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

                            /* Log the new execute pointer.  */
                            _tx_thread_performance_execute_log[_tx_thread_performance_execute_log_index++] =  thread_ptr;
                            if (_tx_thread_performance_execute_log_index >= TX_THREAD_EXECUTE_LOG_SIZE)
                            {
                            
                                _tx_thread_performance_execute_log_index =  0;
                            }
#endif

                            /* Simply setup the execute pointer.  */
                            _tx_thread_execute_ptr =  thread_ptr;
                        }
                        
                        /* Check to see if this is a higher priority thread and determine if preemption is allowed.  */
                        else if (priority < execute_ptr -> tx_thread_preempt_threshold)
                        {

#ifndef TX_DISABLE_PREEMPTION_THRESHOLD

                            /* Determine if the preempted thread had preemption-threshold set.  */
                            if (execute_ptr -> tx_thread_preempt_threshold != execute_ptr -> tx_thread_priority)
                            {

#if TX_MAX_PRIORITIES > 32

                                /* Calculate the index into the bit map array.  */
                                map_index =  (execute_ptr -> tx_thread_priority)/32;

                                /* Set the active bit to remember that the preempt map has something set.  */
                                TX_DIV32_BIT_SET(execute_ptr -> tx_thread_priority, priority_bit)
                                _tx_thread_preempted_map_active =  _tx_thread_preempted_map_active | priority_bit;
#endif

                                /* Remember that this thread was preempted by a thread above the thread's threshold.  */
                                TX_MOD32_BIT_SET(execute_ptr -> tx_thread_priority, priority_bit)
                                _tx_thread_preempted_maps[MAP_INDEX] =  _tx_thread_preempted_maps[MAP_INDEX] | priority_bit;
                            }
#endif

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

                            /* Determine if the caller is an interrupt or from a thread.  */
                            if (_tx_thread_system_state == 0)
                            {

                                /* Caller is a thread, so this is a solicited preemption.  */
                                _tx_thread_performance_solicited_preemption_count++;

                                /* Increment the thread's solicited preemption counter.  */
                                execute_ptr -> tx_thread_performance_solicited_preemption_count++;
                            }
                            else if (_tx_thread_system_state < TX_INITIALIZE_IN_PROGRESS)
                            {

                                /* Caller is an interrupt, so this is an interrupt preemption.  */
                                _tx_thread_performance_interrupt_preemption_count++;

                                /* Increment the thread's interrupt preemption counter.  */
                                execute_ptr -> tx_thread_performance_interrupt_preemption_count++;
                            }

                            /* Remember the thread that preempted this thread.  */
                            execute_ptr -> tx_thread_performance_last_preempting_thread =  thread_ptr;

                            /* Log the new execute pointer.  */
                            _tx_thread_performance_execute_log[_tx_thread_performance_execute_log_index++] =  thread_ptr;
                            if (_tx_thread_performance_execute_log_index >= TX_THREAD_EXECUTE_LOG_SIZE)
                            {
                            
                                _tx_thread_performance_execute_log_index =  0;
                            }
#endif

                            /* Yes, modify the execute thread pointer.  */
                            _tx_thread_execute_ptr =  thread_ptr;

                            /* Restore interrupts.  */
                            TX_RESTORE
                    
                            /* Now determine if preemption should take place. This is only possible if the current thread pointer is
                               not the same as the execute thread pointer AND the system state and preempt disable flags are clear.  */
                            combined_flags =  ((ULONG) _tx_thread_system_state) | ((ULONG) _tx_thread_preempt_disable);
                            if (combined_flags == 0)
                            {

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

                                /* There is another thread ready to run and will be scheduled upon return.  */
                                _tx_thread_performance_non_idle_return_count++;
#endif

                                /* Preemption is needed - return to the system!  */
                                _tx_thread_system_return();
                            }

                            /* Return to caller.  */
                            return;                     
                        }
                    }
                }
                else
                {

                    /* No, there are other threads at this priority already ready.  */
    
                    /* Just add this thread to the priority list.  */
                    tail_ptr =                                 head_ptr -> tx_thread_ready_previous;
                    tail_ptr -> tx_thread_ready_next =         thread_ptr;
                    head_ptr -> tx_thread_ready_previous =     thread_ptr;
                    thread_ptr -> tx_thread_ready_previous =   tail_ptr;
                    thread_ptr -> tx_thread_ready_next =       head_ptr;
                }   
            }

            /* Else, delayed suspend flag was set.  */
            else 
            {

                /* Clear the delayed suspend flag and change the state.  */
                thread_ptr -> tx_thread_delayed_suspend =  TX_FALSE;
                thread_ptr -> tx_thread_state =            TX_SUSPENDED;
            }
        }
    }
    else
    {
    
        /* A resumption occurred in the middle of a previous thread suspension.  */
        
        /* Make sure the type of suspension under way is not a terminate or
           thread completion.  In either of these cases, do not void the 
           interrupted suspension processing.  */
        if ((thread_ptr -> tx_thread_state != TX_COMPLETED) && (thread_ptr -> tx_thread_state != TX_TERMINATED))
        {

            /* Clear the suspending flag.  */
            thread_ptr -> tx_thread_suspending =   TX_FALSE;

            /* Restore the state to ready.  */
            thread_ptr -> tx_thread_state =        TX_READY;

            /* Thread state change.  */
            TX_THREAD_STATE_CHANGE(thread_ptr, TX_READY)

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

            /* Increment the total number of thread resumptions.  */
            _tx_thread_performance_resume_count++;

            /* Increment this thread's resume count.  */
            thread_ptr -> tx_thread_performance_resume_count++;
#endif
        }
    }

#ifdef TX_ENABLE_EVENT_TRACE

    /* Check that the event time stamp is unchanged.  A different
       timestamp means that a later event wrote over the thread
       resume event. In that case, do nothing here.  */
    if ((entry_ptr) && (time_stamp == entry_ptr -> tx_trace_buffer_entry_time_stamp))
    {

        /* Timestamp is the same, set the "next thread pointer" to NULL. This can
           be used by the trace analysis tool to show idle system conditions.  */
        entry_ptr -> tx_trace_buffer_entry_information_field_4 =  (ULONG) _tx_thread_execute_ptr;
    }
#endif

    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(current_thread)

    /* Restore interrupts.  */
    TX_RESTORE

    /* Determine if a preemption condition is present.  */
    if (current_thread != _tx_thread_execute_ptr) 
    {

#ifdef TX_ENABLE_STACK_CHECKING 

        /* Pickup the next execute pointer.  */
        thread_ptr =  _tx_thread_execute_ptr;

        /* Check this thread's stack.  */
        TX_THREAD_STACK_CHECK(thread_ptr)
#endif

        /* Now determine if preemption should take place. This is only possible if the current thread pointer is
           not the same as the execute thread pointer AND the system state and preempt disable flags are clear.  */
        combined_flags =  ((ULONG) _tx_thread_system_state) | ((ULONG) _tx_thread_preempt_disable);
        if (combined_flags == 0)
        {

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

            /* There is another thread ready to run and will be scheduled upon return.  */
            _tx_thread_performance_non_idle_return_count++;
#endif

            /* Preemption is needed - return to the system!  */
            _tx_thread_system_return();
        }
    }
}
#else

VOID  _tx_thread_system_resume(TX_THREAD *thread_ptr)
{

TX_INTERRUPT_SAVE_AREA

UINT            state;


    /* Lockout interrupts while the thread is being resumed.  */
    TX_DISABLE

    /* Decrease the preempt disabled count.  */
    _tx_thread_preempt_disable--;

    /* Determine if the thread is in the process of suspending.  If so, the thread
       control block is already on the linked list so nothing needs to be done.  */
    if (thread_ptr -> tx_thread_suspending == TX_FALSE)
    {

        /* Call the non-interruptable thread system resume function.  */
        _tx_thread_system_ni_resume(thread_ptr);
    }
    else
    {
    
        /* A resumption occurred in the middle of a previous thread suspension.  */

        /* Pickup the current thread state.  */
        state =  thread_ptr -> tx_thread_state;

        /* Log the thread status change.  */
        TX_TRACE_IN_LINE_INSERT(TX_TRACE_THREAD_RESUME, thread_ptr, state, &state, _tx_thread_execute_ptr, TX_TRACE_INTERNAL_EVENTS)
        
        /* Make sure the type of suspension under way is not a terminate or
           thread completion.  In either of these cases, do not void the 
           interrupted suspension processing.  */
        if ((state != TX_COMPLETED) && (state != TX_TERMINATED))
        {

            /* Clear the suspending flag.  */
            thread_ptr -> tx_thread_suspending =   TX_FALSE;

            /* Restore the state to ready.  */
            thread_ptr -> tx_thread_state =        TX_READY;

            /* Thread state change.  */
            TX_THREAD_STATE_CHANGE(thread_ptr, TX_READY)

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

            /* Increment the total number of thread resumptions.  */
            _tx_thread_performance_resume_count++;

            /* Increment this thread's resume count.  */
            thread_ptr -> tx_thread_performance_resume_count++;
#endif
        }
    }

    /* Restore interrupts.  */
    TX_RESTORE
}

/* Define the non-interruptable version of thread resume. It is assumed at this point that
   all interrupts are disabled and will remain so during this function.  */

VOID  _tx_thread_system_ni_resume(TX_THREAD *thread_ptr)
{

UINT            priority; 
ULONG           priority_bit;
TX_THREAD       *head_ptr; 
TX_THREAD       *tail_ptr; 
TX_THREAD       *execute_ptr;
TX_THREAD       *current_thread;
ULONG           combined_flags;

#ifdef TX_ENABLE_EVENT_TRACE
TX_TRACE_BUFFER_ENTRY       *entry_ptr;
ULONG                       time_stamp =  0;
#endif

#if TX_MAX_PRIORITIES > 32
UINT            map_index;
#endif


#ifdef TX_ENABLE_EVENT_TRACE

    /* If trace is enabled, save the current event pointer.  */
    entry_ptr =  _tx_trace_buffer_current_ptr;
#endif

    /* Log the thread status change.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_THREAD_RESUME, thread_ptr, thread_ptr -> tx_thread_state, &execute_ptr, _tx_thread_execute_ptr, TX_TRACE_INTERNAL_EVENTS)

#ifdef TX_ENABLE_EVENT_TRACE

    /* Save the time stamp for later comparison to verify that
       the event hasn't been overwritten by the time we have 
       computed the next thread to execute.  */
    if (entry_ptr)
    {

        /* Save time stamp.  */
        time_stamp =  entry_ptr -> tx_trace_buffer_entry_time_stamp;
    }
#endif


#ifndef TX_NO_TIMER

    /* Deactivate the timeout timer if necessary.  */
    if (thread_ptr -> tx_thread_timer.tx_timer_internal_list_head)
    {

        /* Deactivate the thread's timeout timer.  */
        _tx_timer_system_deactivate(&(thread_ptr -> tx_thread_timer));
    }
#endif

#ifdef TX_ENABLE_STACK_CHECKING 

    /* Check this thread's stack.  */
    TX_THREAD_STACK_CHECK(thread_ptr)
#endif

    /* Thread is not in the process of suspending. Now check to make sure the thread 
       has not already been resumed.  */
    if (thread_ptr -> tx_thread_state != TX_READY)
    {

        /* No, now check to see if the delayed suspension flag is set.  */
        if (thread_ptr -> tx_thread_delayed_suspend == TX_FALSE)
        {            
    
            /* Resume the thread!  */
                
            /* Make this thread ready.  */

            /* Change the state to ready.  */
            thread_ptr -> tx_thread_state =  TX_READY;

            /* Thread state change.  */
            TX_THREAD_STATE_CHANGE(thread_ptr, TX_READY)

            /* Pickup priority of thread.  */
            priority =  thread_ptr -> tx_thread_priority;

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

            /* Increment the total number of thread resumptions.  */
            _tx_thread_performance_resume_count++;

            /* Increment this thread's resume count.  */
            thread_ptr -> tx_thread_performance_resume_count++;
#endif

            /* Determine if there are other threads at this priority that are
               ready.  */
            head_ptr =  _tx_thread_priority_list[priority];
            if (head_ptr == TX_NULL)
            {

                /* First thread at this priority ready.  Add to the front of the list.  */
                _tx_thread_priority_list[priority] =       thread_ptr;
                thread_ptr -> tx_thread_ready_next =       thread_ptr;
                thread_ptr -> tx_thread_ready_previous =   thread_ptr;

#if TX_MAX_PRIORITIES > 32

                /* Calculate the index into the bit map array.  */
                map_index =  priority/32;

                /* Set the active bit to remember that the priority map has something set.  */
                TX_DIV32_BIT_SET(priority, priority_bit)
                _tx_thread_priority_map_active =  _tx_thread_priority_map_active | priority_bit;
#endif

                /* Or in the thread's priority bit.  */
                TX_MOD32_BIT_SET(priority, priority_bit)
                _tx_thread_priority_maps[MAP_INDEX] =  _tx_thread_priority_maps[MAP_INDEX] | priority_bit;

                /* Determine if this newly ready thread is the highest priority.  */
                if (priority < _tx_thread_highest_priority)
                {

                    /* A new highest priority thread is present. */

                    /* Update the highest priority variable.  */
                    _tx_thread_highest_priority =  priority;

                    /* Pickup the execute pointer. Since it is going to be referenced multiple
                       times, it is placed in a local variable.  */
                    execute_ptr =  _tx_thread_execute_ptr;
                        
                    /* Determine if no thread is currently executing.  */
                    if (execute_ptr == TX_NULL)
                    {

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

                        /* Log the new execute pointer.  */
                        _tx_thread_performance_execute_log[_tx_thread_performance_execute_log_index++] =  thread_ptr;
                        if (_tx_thread_performance_execute_log_index >= TX_THREAD_EXECUTE_LOG_SIZE)
                        {
                            
                            _tx_thread_performance_execute_log_index =  0;
                        }
#endif

                        /* Simply setup the execute pointer.  */
                        _tx_thread_execute_ptr =  thread_ptr;
                    }
                        
                    /* Check to see if this is a higher priority thread and determine if preemption is allowed.  */
                    else if (priority < execute_ptr -> tx_thread_preempt_threshold)
                    {

#ifndef TX_DISABLE_PREEMPTION_THRESHOLD

                        /* Determine if the preempted thread had preemption-threshold set.  */
                        if (execute_ptr -> tx_thread_preempt_threshold != execute_ptr -> tx_thread_priority)
                        {

#if TX_MAX_PRIORITIES > 32

                            /* Calculate the index into the bit map array.  */
                            map_index =  (execute_ptr -> tx_thread_priority)/32;

                            /* Set the active bit to remember that the preempt map has something set.  */
                            TX_DIV32_BIT_SET(execute_ptr -> tx_thread_priority, priority_bit)
                            _tx_thread_preempted_map_active =  _tx_thread_preempted_map_active | priority_bit;
#endif

                            /* Remember that this thread was preempted by a thread above the thread's threshold.  */
                            TX_MOD32_BIT_SET(execute_ptr -> tx_thread_priority, priority_bit)
                            _tx_thread_preempted_maps[MAP_INDEX] =  _tx_thread_preempted_maps[MAP_INDEX] | priority_bit;
                        }
#endif

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

                        /* Determine if the caller is an interrupt or from a thread.  */
                        if (_tx_thread_system_state == 0)
                        {

                            /* Caller is a thread, so this is a solicited preemption.  */
                            _tx_thread_performance_solicited_preemption_count++;

                            /* Increment the thread's solicited preemption counter.  */
                            execute_ptr -> tx_thread_performance_solicited_preemption_count++;
                        }
                        else if (_tx_thread_system_state < TX_INITIALIZE_IN_PROGRESS)
                        {

                            /* Caller is an interrupt, so this is an interrupt preemption.  */
                            _tx_thread_performance_interrupt_preemption_count++;

                            /* Increment the thread's interrupt preemption counter.  */
                            execute_ptr -> tx_thread_performance_interrupt_preemption_count++;
                        }

                        /* Remember the thread that preempted this thread.  */
                        execute_ptr -> tx_thread_performance_last_preempting_thread =  thread_ptr;

                        /* Log the new execute pointer.  */
                        _tx_thread_performance_execute_log[_tx_thread_performance_execute_log_index++] =  thread_ptr;
                        if (_tx_thread_performance_execute_log_index >= TX_THREAD_EXECUTE_LOG_SIZE)
                        {
                            
                            _tx_thread_performance_execute_log_index =  0;
                        }
#endif

                        /* Yes, modify the execute thread pointer.  */
                        _tx_thread_execute_ptr =  thread_ptr;

#ifdef TX_ENABLE_EVENT_TRACE

                        /* Check that the event time stamp is unchanged.  A different
                           timestamp means that a later event wrote over the thread
                           resume event. In that case, do nothing here.  */
                        if ((entry_ptr) && (time_stamp == entry_ptr -> tx_trace_buffer_entry_time_stamp))
                        {

                            /* Timestamp is the same, set the "next thread pointer" to NULL. This can
                               be used by the trace analysis tool to show idle system conditions.  */
                            entry_ptr -> tx_trace_buffer_entry_information_field_4 =  (ULONG) _tx_thread_execute_ptr;
                        }
#endif


#ifdef TX_ENABLE_STACK_CHECKING 

                        /* Pickup the next execute pointer.  */
                        thread_ptr =  _tx_thread_execute_ptr;

                        /* Check this thread's stack.  */
                        TX_THREAD_STACK_CHECK(thread_ptr)
#endif

                        /* Now determine if preemption should take place. This is only possible if the current thread pointer is
                           not the same as the execute thread pointer AND the system state and preempt disable flags are clear.  */
                        combined_flags =  ((ULONG) _tx_thread_system_state) | ((ULONG) _tx_thread_preempt_disable);
                        if (combined_flags == 0)
                        {

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

                            /* There is another thread ready to run and will be scheduled upon return.  */
                            _tx_thread_performance_non_idle_return_count++;
#endif

                            /* Preemption is needed - return to the system!  */
                            _tx_thread_system_return();
                        }
                        
                        /* Return to caller.  */
                        return;
                    }
                }
            }
            else
            {

                /* No, there are other threads at this priority already ready.  */
    
                /* Just add this thread to the priority list.  */
                tail_ptr =                                 head_ptr -> tx_thread_ready_previous;
                tail_ptr -> tx_thread_ready_next =         thread_ptr;
                head_ptr -> tx_thread_ready_previous =     thread_ptr;
                thread_ptr -> tx_thread_ready_previous =   tail_ptr;
                thread_ptr -> tx_thread_ready_next =       head_ptr;
            }   
        }

        /* Else, delayed suspend flag was set.  */
        else 
        {

            /* Clear the delayed suspend flag and change the state.  */
            thread_ptr -> tx_thread_delayed_suspend =  TX_FALSE;
            thread_ptr -> tx_thread_state =            TX_SUSPENDED;
        }
    }

    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(current_thread)

    /* Determine if a preemption condition is present.  */
    if (current_thread != _tx_thread_execute_ptr) 
    {

#ifdef TX_ENABLE_STACK_CHECKING 

        /* Pickup the next execute pointer.  */
        thread_ptr =  _tx_thread_execute_ptr;

        /* Check this thread's stack.  */
        TX_THREAD_STACK_CHECK(thread_ptr)
#endif

        /* Now determine if preemption should take place. This is only possible if the current thread pointer is
           not the same as the execute thread pointer AND the system state and preempt disable flags are clear.  */
        combined_flags =  ((ULONG) _tx_thread_system_state) | ((ULONG) _tx_thread_preempt_disable);
        if (combined_flags == 0)
        {

#ifdef TX_THREAD_ENABLE_PERFORMANCE_INFO

            /* There is another thread ready to run and will be scheduled upon return.  */
            _tx_thread_performance_non_idle_return_count++;
#endif

            /* Preemption is needed - return to the system!  */
            _tx_thread_system_return();
        }
    }
}
#endif
