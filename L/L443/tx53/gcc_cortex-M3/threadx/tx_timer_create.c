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
#include "tx_trace.h"
#include "tx_timer.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_timer_create                                    PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function creates an application timer from the specified       */ 
/*    input.                                                              */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    timer_ptr                         Pointer to timer control block    */ 
/*    name_ptr                          Pointer to timer name             */ 
/*    expiration_function               Application expiration function   */ 
/*    initial_ticks                     Initial expiration ticks          */ 
/*    reschedule_ticks                  Reschedule ticks                  */ 
/*    auto_activate                     Automatic activation flag         */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_SUCCESS                        Successful completion status      */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_timer_system_activate         Timer activation function         */ 
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
/*                                            filter option to trace      */ 
/*                                            insert, and made several    */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_timer_create(TX_TIMER *timer_ptr, CHAR *name_ptr, 
            VOID (*expiration_function)(ULONG), ULONG expiration_input,
            ULONG initial_ticks, ULONG reschedule_ticks, UINT auto_activate)
{

TX_INTERRUPT_SAVE_AREA

ULONG           created_count;
TX_TIMER        *next_timer;
TX_TIMER        *previous_timer;


    /* Initialize timer control block to all zeros.  */
    memset(timer_ptr, 0, sizeof(TX_TIMER));

    /* Setup the basic timer fields.  */
    timer_ptr -> tx_timer_name =                                            name_ptr;
    timer_ptr -> tx_timer_internal.tx_timer_internal_remaining_ticks =      initial_ticks;
    timer_ptr -> tx_timer_internal.tx_timer_internal_re_initialize_ticks =  reschedule_ticks;
    timer_ptr -> tx_timer_internal.tx_timer_internal_timeout_function =     expiration_function;
    timer_ptr -> tx_timer_internal.tx_timer_internal_timeout_param =        expiration_input;
    
    /* Disable interrupts to put the timer on the created list.  */
    TX_DISABLE

    /* Setup the timer ID to make it valid.  */
    timer_ptr -> tx_timer_id =  TX_TIMER_ID;

    /* Pickup the created count.  */
    created_count =  _tx_timer_created_count++;

    /* Place the timer on the list of created application timers.  First,
       check for an empty list.  */
    if (created_count == 0)
    {

        /* The created timer list is empty.  Add timer to empty list.  */
        _tx_timer_created_ptr =                   timer_ptr;
        timer_ptr -> tx_timer_created_next =      timer_ptr;
        timer_ptr -> tx_timer_created_previous =  timer_ptr;
    }
    else
    {

        /* This list is not NULL, add to the end of the list.  */
        next_timer =  _tx_timer_created_ptr;
        previous_timer =  next_timer -> tx_timer_created_previous;

        /* Place the new timer in the list.  */
        next_timer -> tx_timer_created_previous =  timer_ptr;
        previous_timer -> tx_timer_created_next =    timer_ptr;

        /* Setup this timer's created links.  */
        timer_ptr -> tx_timer_created_previous =  previous_timer;
        timer_ptr -> tx_timer_created_next =      next_timer;    
    }

    /* Optional timer create extended processing.  */
    TX_TIMER_CREATE_EXTENSION(timer_ptr)

    /* If trace is enabled, register this object.  */
    TX_TRACE_OBJECT_REGISTER(TX_TRACE_OBJECT_TYPE_TIMER, timer_ptr, name_ptr, initial_ticks, reschedule_ticks)

    /* If trace is enabled, insert this call in the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_TIMER_CREATE, timer_ptr, initial_ticks, reschedule_ticks, auto_activate, TX_TRACE_TIMER_EVENTS)

    /* Restore interrupts.  */
    TX_RESTORE

    /* Determine if this timer needs to be activated.  */
    if (auto_activate)
    {

#ifdef TX_TIMER_ENABLE_PERFORMANCE_INFO

        /* Increment the total activations counter.  */
        _tx_timer_performance_activate_count++;

        /* Increment the number of activations on this timer.  */
        timer_ptr -> tx_timer_performance_activate_count++;
#endif

        /* Call actual activation function.  */
        _tx_timer_system_activate(&(timer_ptr -> tx_timer_internal));
    }

    /* Return TX_SUCCESS.  */
    return(TX_SUCCESS);
}

