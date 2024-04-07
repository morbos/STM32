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
/**   Event Flags                                                         */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_thread.h"
#include "tx_timer.h"
#include "tx_event_flags.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _txe_event_flags_get                                PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function checks for errors in the event flags get function     */ 
/*    call.                                                               */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    group_ptr                         Pointer to group control block    */ 
/*    requested_event_flags             Event flags requested             */ 
/*    get_option                        Specifies and/or and clear options*/ 
/*    actual_flags_ptr                  Pointer to place the actual flags */ 
/*                                        the service retrieved           */ 
/*    wait_option                       Suspension option                 */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_GROUP_ERROR                    Invalid event flags group pointer */ 
/*    TX_PTR_ERROR                      Invalid actual flags pointer      */ 
/*    TX_WAIT_ERROR                     Invalid wait option               */ 
/*    TX_OPTION_ERROR                   Invalid get option                */ 
/*    TX_CALLER_ERROR                   Invalid caller of this function   */ 
/*    status                            Actual completion status          */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_event_flags_get               Actual event flags get function   */ 
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
/*  12-12-2008     William E. Lamie         Modified comment(s), and added*/ 
/*                                            macro to get current thread,*/ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _txe_event_flags_get(TX_EVENT_FLAGS_GROUP *group_ptr, ULONG requested_flags,
                    UINT get_option, ULONG *actual_flags_ptr, ULONG wait_option)
{

UINT            status;                 

#ifndef TX_TIMER_PROCESS_IN_ISR
TX_THREAD       *current_thread;
#endif


    /* First, check for an invalid event flag group pointer.  */
    if ((!group_ptr) || (group_ptr -> tx_event_flags_group_id != TX_EVENT_FLAGS_ID))
    {

        /* Event flags group pointer is invalid, return appropriate error code.  */
        return(TX_GROUP_ERROR);
    }

    /* Check for an invalid destination for actual flags.  */
    if (!actual_flags_ptr)
    {

        /* Null destination pointer, return appropriate error.  */
        return(TX_PTR_ERROR);
    }

    /* Check for a wait option error.  Only threads are allowed any form of suspension.  */
    
#ifndef TX_TIMER_PROCESS_IN_ISR

    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(current_thread)

    if ((wait_option) && ((_tx_thread_system_state) || (current_thread == &_tx_timer_thread)))
#else
    if ((wait_option) && (_tx_thread_system_state))
#endif
    {

        /* A non-thread is trying to suspend, return appropriate error code.  */
        return(TX_WAIT_ERROR);
    }

    /* Check for invalid get option.  */
    if (get_option > TX_AND_CLEAR)
    {

        /* Invalid get events option, return appropriate error.  */
        return(TX_OPTION_ERROR);
    }

    /* Call actual event flags get function.  */
    status =  _tx_event_flags_get(group_ptr, requested_flags, get_option, actual_flags_ptr, wait_option);

    /* Return actual completion status.  */
    return(status);
}

