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
/**   Timer                                                               */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_initialize.h"
#include "tx_thread.h"
#include "tx_timer.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _txe_timer_create                                   PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function checks for errors in the create application timer     */ 
/*    function call.                                                      */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    timer_ptr                         Pointer to timer control block    */ 
/*    name_ptr                          Pointer to timer name             */ 
/*    expiration_function               Application expiration function   */ 
/*    initial_ticks                     Initial expiration ticks          */ 
/*    reschedule_ticks                  Reschedule ticks                  */ 
/*    auto_activate                     Automatic activation flag         */ 
/*    timer_control_block_size          Size of timer control block       */
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_TIMER_ERROR                    Invalid timer control block       */ 
/*    TX_TICK_ERROR                     Invalid initial expiration count  */ 
/*    TX_ACTIVATE_ERROR                 Invalid timer activation option   */ 
/*    TX_CALLER_ERROR                   Invalid caller of this function   */ 
/*    status                            Actual completion status          */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_system_preempt_check   Check for preemption              */ 
/*    _tx_timer_create                  Actual timer create function      */ 
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
/*  12-12-2008     William E. Lamie         Modified comment(s), made     */ 
/*                                            optimization to timer       */ 
/*                                            thread checking, and added  */ 
/*                                            macro to get current thread,*/ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _txe_timer_create(TX_TIMER *timer_ptr, CHAR *name_ptr, 
            VOID (*expiration_function)(ULONG), ULONG expiration_input,
            ULONG initial_ticks, ULONG reschedule_ticks, UINT auto_activate, UINT timer_control_block_size)
{

TX_INTERRUPT_SAVE_AREA

UINT            status; 
ULONG           i;
TX_TIMER        *next_timer;
#ifndef TX_TIMER_PROCESS_IN_ISR
TX_THREAD       *thread_ptr;
#endif


    /* First, check for a NULL timer pointer.  */
    if ((!timer_ptr) || (timer_control_block_size != sizeof(TX_TIMER)))
    {

        /* Timer pointer is invalid, return appropriate error code.  */
        return(TX_TIMER_ERROR);
    }

    /* Disable interrupts.  */
    TX_DISABLE

    /* Increment the preempt disable flag.  */
    _tx_thread_preempt_disable++;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Next see if it is already in the created list.  */
    next_timer =  _tx_timer_created_ptr;
    for (i = 0; i < _tx_timer_created_count; i++)
    {

        /* Determine if this timer matches the current timer in the list.  */
        if (timer_ptr == next_timer)
        {
        
            break;
        }
        else
        {
        
            /* Move to next timer.  */
            next_timer =  next_timer -> tx_timer_created_next;
        }
    }

    /* Disable interrupts.  */
    TX_DISABLE

    /* Decrement the preempt disable flag.  */
    _tx_thread_preempt_disable--;
    
    /* Restore interrupts.  */
    TX_RESTORE

    /* Check for preemption.  */
    _tx_thread_system_preempt_check();

    /* At this point, check to see if there is a duplicate timer.  */
    if (timer_ptr == next_timer)
    {

        /* Timer is already created, return appropriate error code.  */
        return(TX_TIMER_ERROR);
    }

    /* Check for an illegal initial tick value.  */
    if (!initial_ticks)
    {

        /* Invalid initial tick value, return appropriate error code.  */
        return(TX_TICK_ERROR);
    }

    /* Check for an illegal activation.  */
    if ((auto_activate != TX_AUTO_ACTIVATE) && (auto_activate != TX_NO_ACTIVATE))
    {

        /* Invalid activation selected, return appropriate error code.  */
        return(TX_ACTIVATE_ERROR);
    }

#ifndef TX_TIMER_PROCESS_IN_ISR

    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(thread_ptr)

    /* Check for invalid caller of this function.  First check for a calling thread.  */
    if (thread_ptr == &_tx_timer_thread)
    {

        /* Invalid caller of this function, return appropriate error code.  */
        return(TX_CALLER_ERROR);
    }
#endif

    /* Check for interrupt call.  */
    if ((_tx_thread_system_state) && (_tx_thread_system_state < TX_INITIALIZE_IN_PROGRESS))
    {
    
        /* Invalid caller of this function, return appropriate error code.  */
        return(TX_CALLER_ERROR);
    }

    /* Call actual application timer create function.  */
    status =  _tx_timer_create(timer_ptr, name_ptr, expiration_function, expiration_input,
                                                initial_ticks, reschedule_ticks, auto_activate);

    /* Return actual completion status.  */
    return(status);
}

