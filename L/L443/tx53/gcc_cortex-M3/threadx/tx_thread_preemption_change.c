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
#include "tx_thread.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_thread_preemption_change                        PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function processes preemption-threshold change requests.  The  */ 
/*    previous preemption is returned to the caller.  If the new request  */ 
/*    allows a higher priority thread to execute, preemption takes place  */ 
/*    inside of this function.                                            */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    thread_ptr                            Pointer to thread             */ 
/*    new_threshold                         New preemption threshold      */ 
/*    old_threshold                         Old preemption threshold      */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    status                                Service return status         */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_preempt_check       Check for preemption          */ 
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
/*                                            logic to update and use the */ 
/*                                            original threshold, and     */ 
/*                                            corrected problem of not    */ 
/*                                            setting preemption-threshold*/ 
/*                                            bit when lowering the       */ 
/*                                            thread preemption-threshold,*/ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            filter option to trace      */ 
/*                                            insert, changed MOD32 macro */ 
/*                                            to new TX_MOD32_BIT_SET     */ 
/*                                            macro, removed code for     */ 
/*                                            interrupt preemption        */ 
/*                                            performance counter updates,*/ 
/*                                            added logic to handle       */ 
/*                                            restoring preemption-       */ 
/*                                            threshold values during     */ 
/*                                            priority inheritance, and   */ 
/*                                            added TX_DIV32_BIT_SET      */ 
/*                                            macro, resulting in         */ 
/*                                            version 5.2                 */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_thread_preemption_change(TX_THREAD *thread_ptr, UINT new_threshold, UINT *old_threshold)
{

TX_INTERRUPT_SAVE_AREA

#ifndef TX_DISABLE_PREEMPTION_THRESHOLD
ULONG       priority_bit;
#if TX_MAX_PRIORITIES > 32
UINT        map_index;
#endif
#endif


#ifdef TX_DISABLE_PREEMPTION_THRESHOLD

    /* Only allow 0 (disable all preemption) and returning preemption-threshold to the 
       current thread priority if preemption-threshold is disabled. All other threshold
       values are converted to 0.  */
    if ((thread_ptr -> tx_thread_priority != new_threshold) && (new_threshold != 0))
    {

        /* Convert the new threshold to disable all preemption, since preemption-threshold is
           not supported.  */
        new_threshold =  0;
    }
#endif

    /* Lockout interrupts while the thread is being resumed.  */
    TX_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_THREAD_PREEMPTION_CHANGE, thread_ptr, new_threshold, thread_ptr -> tx_thread_preempt_threshold, thread_ptr -> tx_thread_state, TX_TRACE_THREAD_EVENTS)

    /* Determine if the new threshold is greater than the current priority.  */
    if (new_threshold > thread_ptr -> tx_thread_priority)
    {
    
        /* Check for priority inheritance.   */
        if ((thread_ptr -> tx_thread_owned_mutex_count) && (thread_ptr -> tx_thread_priority < thread_ptr -> tx_thread_original_priority))
        {
        
            /* Yes, we could be in a priority inheritance situation.  */
        
            /* Ensure the preemption-threshold is the same as the current priority.  */
            thread_ptr -> tx_thread_preempt_threshold =  thread_ptr -> tx_thread_priority;
            
            /* See if the new threshold is valid in comparison with the original priority.  */
            if (new_threshold <= thread_ptr -> tx_thread_original_priority)
            {

                /* Yes, simply update the original priority inheritance and return success.  */
            
                /* Return the previous threshold.  */
                *old_threshold =   thread_ptr -> tx_thread_original_preempt_threshold;
            
                /* Update the original threshold.  */
                thread_ptr -> tx_thread_original_preempt_threshold =  new_threshold;
            
                /* Restore interrupts.  */
                TX_RESTORE
            
                /* Return success.  */
                return(TX_SUCCESS);
            }
        }
        
        /* Restore interrupts.  */
        TX_RESTORE
            
        /* Return error.  */
        return(TX_THRESH_ERROR);
    }

#ifndef TX_DISABLE_PREEMPTION_THRESHOLD

    /* Determine if the new threshold is the same as the priority.  */
    if (thread_ptr -> tx_thread_priority == new_threshold)
    {

        /* Determine if this thread is at the head of the list.  */
        if (_tx_thread_priority_list[thread_ptr -> tx_thread_priority] == thread_ptr)
        {

#if TX_MAX_PRIORITIES > 32

            /* Calculate the index into the bit map array.  */
            map_index =  (thread_ptr -> tx_thread_priority)/32;
#endif

            /* Yes, this thread is at the front of the list.  Make sure
               the preempted bit is cleared for this thread.  */
            TX_MOD32_BIT_SET(thread_ptr -> tx_thread_priority, priority_bit)
            _tx_thread_preempted_maps[MAP_INDEX] =  _tx_thread_preempted_maps[MAP_INDEX] & (~(priority_bit));

#if TX_MAX_PRIORITIES > 32

            /* Determine if there are any other bits set in this preempt map.  */
            if (_tx_thread_preempted_maps[MAP_INDEX] == 0)
            {

                /* No, clear the active bit to signify this preempt map has nothing set.  */
                TX_DIV32_BIT_SET(thread_ptr -> tx_thread_priority, priority_bit)
                _tx_thread_preempted_map_active =  _tx_thread_preempted_map_active & (~(priority_bit));
            }
#endif
        }
    }
#endif

    /* Save the current preemption threshold.   */
    *old_threshold =  thread_ptr -> tx_thread_original_preempt_threshold;

    /* Setup the new threshold.  */
    thread_ptr -> tx_thread_preempt_threshold =           new_threshold;

    /* Only update the original threshold if no priority inheritance mutexes are owned or if 
       the original priority and current priority are equal.  */
    if ((thread_ptr -> tx_thread_owned_mutex_count == 0) || (thread_ptr -> tx_thread_priority == thread_ptr -> tx_thread_original_priority))
    {

        /* Yes, update the original preemption-threshold.  */
        thread_ptr -> tx_thread_original_preempt_threshold =  new_threshold;
    }

    /* See if preemption needs to take place.  */
    if ((_tx_thread_execute_ptr == thread_ptr) &&  (_tx_thread_highest_priority < thread_ptr -> tx_thread_priority) &&
                                                                                        (_tx_thread_highest_priority < new_threshold))
    {

        /* Preemption needs to take place.  */

#ifndef TX_DISABLE_PREEMPTION_THRESHOLD

        /* Determine if this thread has preemption threshold set.  */
        if (thread_ptr -> tx_thread_preempt_threshold != thread_ptr -> tx_thread_priority)
        {

#if TX_MAX_PRIORITIES > 32

            /* Calculate the index into the bit map array.  */
            map_index =  (thread_ptr -> tx_thread_priority)/32;

            /* Set the active bit to remember that the preempt map has something set.  */
            TX_DIV32_BIT_SET(thread_ptr -> tx_thread_priority, priority_bit)
            _tx_thread_preempted_map_active =  _tx_thread_preempted_map_active | priority_bit;
#endif

            /* Remember that this thread was preempted by a thread above the thread's threshold.  */
            TX_MOD32_BIT_SET(thread_ptr -> tx_thread_priority, priority_bit)
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
            thread_ptr -> tx_thread_performance_solicited_preemption_count++;
        }

        /* Remember the thread that preempted this thread.  */
        thread_ptr -> tx_thread_performance_last_preempting_thread =  _tx_thread_priority_list[_tx_thread_highest_priority];

        /* Log the new execute pointer.  */
        _tx_thread_performance_execute_log[_tx_thread_performance_execute_log_index++] =  _tx_thread_priority_list[_tx_thread_highest_priority];
        if (_tx_thread_performance_execute_log_index >= TX_THREAD_EXECUTE_LOG_SIZE)
            _tx_thread_performance_execute_log_index =  0;
#endif

        /* Setup the highest priority thread to execute.  */
        _tx_thread_execute_ptr =  _tx_thread_priority_list[_tx_thread_highest_priority];

        /* Restore interrupts.  */
        TX_RESTORE

        /* Check for preemption.  */
        _tx_thread_system_preempt_check();
        
        /* Return completion status.  */
        return(TX_SUCCESS);
    }

    /* Restore interrupts.  */
    TX_RESTORE

    /* Return completion status.  */
    return(TX_SUCCESS);
}

