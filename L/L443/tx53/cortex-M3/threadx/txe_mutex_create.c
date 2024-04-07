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
#include "tx_initialize.h"
#include "tx_thread.h"
#include "tx_timer.h"
#include "tx_mutex.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _txe_mutex_create                                   PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function checks for errors in the create mutex function        */ 
/*    call.                                                               */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    mutex_ptr                         Pointer to mutex control block    */ 
/*    name_ptr                          Pointer to mutex name             */ 
/*    inherit                           Initial mutex count               */ 
/*    mutex_control_block_size          Size of mutex control block       */
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_MUTEX_ERROR                    Invalid mutex pointer             */ 
/*    TX_CALLER_ERROR                   Invalid caller of this function   */ 
/*    TX_INHERIT_ERROR                  Invalid inherit option            */ 
/*    status                            Actual completion status          */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_mutex_create                  Actual create mutex function      */ 
/*    _tx_thread_system_preempt_check   Check for preemption              */ 
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
UINT  _txe_mutex_create(TX_MUTEX *mutex_ptr, CHAR *name_ptr, UINT inherit, UINT mutex_control_block_size)
{

TX_INTERRUPT_SAVE_AREA

UINT            status;                 
ULONG           i;
TX_MUTEX        *next_mutex;
#ifndef TX_TIMER_PROCESS_IN_ISR
TX_THREAD       *thread_ptr;
#endif


    /* First, check for an invalid mutex pointer.  */
    if ((!mutex_ptr) || (mutex_control_block_size != sizeof(TX_MUTEX)))
    {

        /* Mutex pointer is invalid, return appropriate error code.  */
        return(TX_MUTEX_ERROR);
    }

    /* Disable interrupts.  */
    TX_DISABLE

    /* Increment the preempt disable flag.  */
    _tx_thread_preempt_disable++;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Next see if it is already in the created list.  */
    next_mutex =   _tx_mutex_created_ptr;
    for (i = 0; i < _tx_mutex_created_count; i++)
    {

        /* Determine if this mutex matches the mutex in the list.  */
        if (mutex_ptr == next_mutex)
        {

            break;
        }
        else
        {
            /* Move to the next mutex.  */
            next_mutex =  next_mutex -> tx_mutex_created_next;
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

    /* At this point, check to see if there is a duplicate mutex.  */
    if (mutex_ptr == next_mutex)
    {

        /* Mutex is already created, return appropriate error code.  */
        return(TX_MUTEX_ERROR);
    }

    /* Check for a valid inherit option.  */
    if ((inherit != TX_INHERIT) && (inherit != TX_NO_INHERIT))
    {

        /* Inherit option is illegal.  */
        return(TX_INHERIT_ERROR);
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

    /* Call actual mutex create function.  */
    status =  _tx_mutex_create(mutex_ptr, name_ptr, inherit);

    /* Return actual completion status.  */
    return(status);
}

