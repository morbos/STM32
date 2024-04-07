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
#include "tx_thread.h"
#include "tx_initialize.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_thread_create                                   PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function creates a thread and places it on the list of created */ 
/*    threads.                                                            */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    thread_ptr                            Thread control block pointer  */ 
/*    name                                  Pointer to thread name string */ 
/*    entry_function                        Entry function of the thread  */ 
/*    entry_input                           32-bit input value to thread  */ 
/*    stack_start                           Pointer to start of stack     */ 
/*    stack_size                            Stack size in bytes           */ 
/*    priority                              Priority of thread (0-31)     */ 
/*    preempt_threshold                     Preemption threshold          */
/*    time_slice                            Thread time-slice value       */ 
/*    auto_start                            Automatic start selection     */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    return status                         Thread create return status   */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_stack_build                Build initial thread stack    */ 
/*    _tx_thread_system_resume              Resume automatic start thread */ 
/*    _tx_thread_system_ni_resume           Noninterruptable resume thread*/ 
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    Application Code                                                    */ 
/*    _tx_timer_initialize                  Create system timer thread    */ 
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s), and      */ 
/*                                            added setup for original    */ 
/*                                            priority and threshold,     */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            filter option to trace      */ 
/*                                            insert, moved extension     */ 
/*                                            processing to interrupt     */ 
/*                                            enabled area, added logic   */ 
/*                                            to align stack pointers     */ 
/*                                            for stack checking, added   */ 
/*                                            optional logic for          */ 
/*                                            non-interruptable operation,*/ 
/*                                            and made several            */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_thread_create(TX_THREAD *thread_ptr, CHAR *name, VOID (*entry_function)(ULONG), ULONG entry_input,
                            VOID *stack_start, ULONG stack_size, UINT priority, UINT preempt_threshold,
                            ULONG time_slice, UINT auto_start)
{

TX_INTERRUPT_SAVE_AREA

ULONG                   created_count;
TX_THREAD               *next_thread;
TX_THREAD               *previous_thread;
#ifndef TX_DISABLE_PREEMPTION_THRESHOLD
TX_THREAD               *saved_thread_ptr;
UINT                    saved_threshold =  0;
#endif
#ifdef TX_ENABLE_STACK_CHECKING
ULONG                   new_stack_start;
#endif

#ifndef TX_DISABLE_STACK_FILLING

    /* Set the thread stack to a pattern prior to creating the initial
       stack frame.  This pattern is used by the stack checking routines
       to see how much has been used.  */
    memset(stack_start, ((UCHAR) TX_STACK_FILL), stack_size);
#endif

#ifdef TX_ENABLE_STACK_CHECKING

    /* Ensure that there are two ULONG of 0xEF patterns at the top and 
       bottom of the thread's stack. This will be used to check for stack
       overflow conditions during run-time.  */
    stack_size =  ((stack_size/sizeof(ULONG)) * sizeof(ULONG)) - sizeof(ULONG);

    /* Ensure the starting stack address is evenly aligned.  */
    new_stack_start =  ((((ULONG) stack_start) + (sizeof(ULONG) - 1) ) & (~(sizeof(ULONG) - 1)));

    /* Determine if the starting stack address is different.  */
    if (new_stack_start != ((ULONG) stack_start))
    {
    
        /* Yes, subtract another ULONG from the size to avoid going past the stack area.  */
        stack_size =  stack_size - sizeof(ULONG);
    }

    /* Update the starting stack pointer.  */
    stack_start =  (VOID *) new_stack_start;
#endif

    /* Prepare the thread control block prior to placing it on the created
       list.  */

    /* Initialize thread control block to all zeros.  */
    memset(thread_ptr, 0, sizeof(TX_THREAD));

    /* Place the supplied parameters into the thread's control block.  */
    thread_ptr -> tx_thread_name =              name;
    thread_ptr -> tx_thread_entry =             entry_function;
    thread_ptr -> tx_thread_entry_parameter =   entry_input;
    thread_ptr -> tx_thread_stack_start =       stack_start;
    thread_ptr -> tx_thread_stack_size =        stack_size;
    thread_ptr -> tx_thread_stack_end =         (VOID *) (((UCHAR *) stack_start) + (stack_size-1));
    thread_ptr -> tx_thread_priority =          priority;
    thread_ptr -> tx_thread_original_priority = priority;
    thread_ptr -> tx_thread_time_slice =        time_slice;
    thread_ptr -> tx_thread_new_time_slice =    time_slice;


#ifndef TX_DISABLE_PREEMPTION_THRESHOLD

    /* Preemption-threshold is enabled, setup accordingly.  */
    thread_ptr -> tx_thread_preempt_threshold =           preempt_threshold;
    thread_ptr -> tx_thread_original_preempt_threshold =  preempt_threshold;
#else

    /* Preemption-threshold is disabled, determine if preemption-threshold was required.  */
    if (priority != preempt_threshold)
    {

        /* Preemption-threshold specified. Since specific preemption-threshold is not supported,
           disable all preemption.  */
        thread_ptr -> tx_thread_preempt_threshold =  0;
    } 
    else
    {

        /* Preemption-threshold is not specified, just setup with the priority.  */
        thread_ptr -> tx_thread_preempt_threshold =  priority;
    }
#endif

    /* Now fill in the values that are required for thread initialization.  */
    thread_ptr -> tx_thread_state =  TX_SUSPENDED;

    /* Setup the necessary fields in the thread timer block.  */
    thread_ptr -> tx_thread_timer.tx_timer_internal_timeout_function =     _tx_thread_timeout;
    thread_ptr -> tx_thread_timer.tx_timer_internal_timeout_param =        (ULONG) thread_ptr;

    /* Call the target specific stack frame building routine to build the 
       thread's initial stack and to setup the actual stack pointer in the
       control block.  */
    _tx_thread_stack_build(thread_ptr, _tx_thread_shell_entry);

#ifdef TX_ENABLE_STACK_CHECKING

    /* Setup the highest usage stack pointer.  */
    thread_ptr -> tx_thread_stack_highest_ptr =  thread_ptr -> tx_thread_stack_ptr;
#endif

    /* Prepare to make this thread a member of the created thread list.  */
    TX_DISABLE

    /* Load the thread ID field in the thread control block.  */
    thread_ptr -> tx_thread_id =  TX_THREAD_ID;

    /* Pickup the created count.  */
    created_count =  _tx_thread_created_count++;

    /* Place the thread on the list of created threads.  First,
       check for an empty list.  */
    if (created_count == 0)
    {

        /* The created thread list is empty.  Add thread to empty list.  */
        _tx_thread_created_ptr =                    thread_ptr;
        thread_ptr -> tx_thread_created_next =      thread_ptr;
        thread_ptr -> tx_thread_created_previous =  thread_ptr;
    }
    else
    {

        /* This list is not NULL, add to the end of the list.  */
        next_thread =  _tx_thread_created_ptr;
        previous_thread =  next_thread -> tx_thread_created_previous;

        /* Place the new thread in the list.  */
        next_thread -> tx_thread_created_previous =  thread_ptr;
        previous_thread -> tx_thread_created_next =  thread_ptr;

        /* Setup this thread's created links.  */
        thread_ptr -> tx_thread_created_previous =  previous_thread;
        thread_ptr -> tx_thread_created_next =      next_thread;    
    }

    /* If trace is enabled, register this object.  */
    TX_TRACE_OBJECT_REGISTER(TX_TRACE_OBJECT_TYPE_THREAD, thread_ptr, name, stack_start, stack_size)

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_THREAD_CREATE, thread_ptr, priority, stack_start, stack_size, TX_TRACE_THREAD_EVENTS)

    /* Determine if an automatic start was requested.  If so, call the resume
       thread function and then check for a preemption condition.  */
    if (auto_start)
    {

#ifndef TX_DISABLE_PREEMPTION_THRESHOLD

        /* Determine if the create call is being called from initialization.  */
        if (_tx_thread_system_state >= TX_INITIALIZE_IN_PROGRESS)
        {

            /* Yes, this create call was made from initialization.  */

            /* Pickup the current thread execute pointer, which corresponds to the
               highest priority thread ready to execute.  Interrupt lockout is 
               not required, since interrupts are assumed to be disabled during 
               initialization.  */
            saved_thread_ptr =  _tx_thread_execute_ptr;

            /* Determine if there is thread ready for execution.  */
            if (saved_thread_ptr)
            {
                
                /* Yes, a thread is ready for execution when initialization completes.  */

                /* Save the current preemption-threshold.  */
                saved_threshold =  saved_thread_ptr -> tx_thread_preempt_threshold;

                /* For initialization, temporarily set the preemption-threshold to the 
                   priority level to make sure the highest-priority thread runs once 
                   initialization is complete.  */
                saved_thread_ptr -> tx_thread_preempt_threshold =  saved_thread_ptr -> tx_thread_priority;
            }
        } 
        else
        {

            /* Simply set the saved thread pointer to NULL.  */
            saved_thread_ptr =  TX_NULL;
        }
#endif

#ifdef TX_NOT_INTERRUPTABLE

        /* Perform any additional activities for tool or user purpose.  */
        TX_THREAD_CREATE_EXTENSION(thread_ptr)

        /* Resume the thread!  */
        _tx_thread_system_ni_resume(thread_ptr);

        /* Restore previous interrupt posture.  */
        TX_RESTORE
#else

        /* Temporarily disable preemption.  */
        _tx_thread_preempt_disable++;

        /* Restore previous interrupt posture.  */
        TX_RESTORE

        /* Perform any additional activities for tool or user purpose.  */
        TX_THREAD_CREATE_EXTENSION(thread_ptr)

        /* Call the resume thread function to make this thread ready.  */ 
        _tx_thread_system_resume(thread_ptr);
#endif
 
#ifndef TX_DISABLE_PREEMPTION_THRESHOLD

        /* Determine if the thread's preemption-threshold needs to be restored.  */
        if (saved_thread_ptr)
        {

            /* Yes, restore the previous highest-priority thread's preemption-threshold. This
               can only happen if this routine is called from initialization.  */
            saved_thread_ptr -> tx_thread_preempt_threshold =  saved_threshold;
        } 
#endif

        /* Interrupts are already restored, simply return success.  */
        return(TX_SUCCESS);
    }

    /* Restore interrupts.  */
    TX_RESTORE

    /* Always return a success.  */
    return(TX_SUCCESS);
}

