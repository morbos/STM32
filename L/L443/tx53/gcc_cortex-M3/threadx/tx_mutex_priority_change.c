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
#include "tx_thread.h"
#include "tx_mutex.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_mutex_priority_change                           PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function changes the priority of the specified thread for the  */ 
/*    priority inheritance option of the mutex service.                   */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    thread_ptr                            Pointer to thread to suspend  */ 
/*    new_priority                          New thread priority           */ 
/*    new_threshold                         New preemption-threshold      */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    None                                                                */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_resume          Resume thread                     */ 
/*    _tx_thread_system_ni_resume       Non-interruptable resume thread   */ 
/*    _tx_thread_system_suspend         Suspend thread                    */ 
/*    _tx_thread_system_ni_suspend      Non-interruptable suspend thread  */ 
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    _tx_mutex_get                     Inherit priority                  */ 
/*    _tx_mutex_put                     Restore previous priority         */ 
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            optional logic for          */ 
/*                                            non-interruptable operation,*/ 
/*                                            and made several            */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
VOID  _tx_mutex_priority_change(TX_THREAD *thread_ptr, UINT new_priority, UINT new_threshold)
{

#ifndef TX_NOT_INTERRUPTABLE

TX_INTERRUPT_SAVE_AREA


    /* Lockout interrupts while the thread is being suspended.  */
    TX_MUTEX_DISABLE
#endif

    /* Determine if this thread is currently ready.  */
    if (thread_ptr -> tx_thread_state != TX_READY)
    {

        /* Easy, just setup the priority and threshold in the thread's control
           block.  */
        thread_ptr -> tx_thread_priority =           new_priority;
        thread_ptr -> tx_thread_preempt_threshold =  new_threshold;

#ifndef TX_NOT_INTERRUPTABLE
        /* Restore interrupts.  */
        TX_RESTORE
#endif
    }
    else
    {

#ifdef TX_NOT_INTERRUPTABLE

        /* Increment the preempt disable flag.  */
        _tx_thread_preempt_disable++;

        /* Set the state to suspended.  */
        thread_ptr -> tx_thread_state =    TX_SUSPENDED;

        /* Call actual non-interruptable thread suspension routine.  */
        _tx_thread_system_ni_suspend(thread_ptr, 0);

        /* At this point, the preempt disable flag is still set, so we still have 
           protection against all preemption.  */

        /* Setup the new priority for this thread.  */
        thread_ptr -> tx_thread_priority =           new_priority;
        thread_ptr -> tx_thread_preempt_threshold =  new_threshold;

        /* Resume the thread with the new priority.  */
        _tx_thread_system_ni_resume(thread_ptr);

        /* Decrement the preempt disable flag.  */
        _tx_thread_preempt_disable--;
#else

        /* Increment the preempt disable flag.  */
        _tx_thread_preempt_disable =  _tx_thread_preempt_disable + 2;

        /* Set the state to suspended.  */
        thread_ptr -> tx_thread_state =    TX_SUSPENDED;

        /* Set the suspending flag. */
        thread_ptr -> tx_thread_suspending =  TX_TRUE;

        /* Setup the timeout period.  */
        thread_ptr -> tx_thread_timer.tx_timer_internal_remaining_ticks =  0;

        /* Restore interrupts.  */
        TX_RESTORE 

        /* The thread is ready and must first be removed from the list.  Call the 
           system suspend function to accomplish this.  */
        _tx_thread_system_suspend(thread_ptr);

        /* At this point, the preempt disable flag is still set, so we still have 
           protection against all preemption.  */

        /* Setup the new priority for this thread.  */
        thread_ptr -> tx_thread_priority =           new_priority;
        thread_ptr -> tx_thread_preempt_threshold =  new_threshold;

        /* Resume the thread with the new priority.  */
        _tx_thread_system_resume(thread_ptr);
#endif
    }
}

