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
#include "tx_thread.h"
#include "tx_timer.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _txe_thread_preemption_change                       PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function checks for errors in the preemption threshold change  */ 
/*    function call.                                                      */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    thread_ptr                            Pointer to thread             */ 
/*    new_threshold                         New preemption threshold      */ 
/*    old_threshold                         Old preemption threshold      */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_THREAD_ERROR                       Invalid thread pointer        */ 
/*    TX_PTR_ERROR                          Invalid old threshold pointer */ 
/*    TX_CALLER_ERROR                       Invalid caller of function    */ 
/*    status                                Actual completion status      */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_thread_preemption_change          Actual preempt change function*/ 
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
/*                                            optimization to caller      */ 
/*                                            checking, and added logic   */ 
/*                                            to handle restoring         */ 
/*                                            preemption-threshold values */ 
/*                                            during priority inheritance,*/ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _txe_thread_preemption_change(TX_THREAD *thread_ptr, UINT new_threshold, UINT *old_threshold)
{

UINT        status;


    /* First, check for an invalid thread pointer.  */
    if ((!thread_ptr) || (thread_ptr -> tx_thread_id != TX_THREAD_ID))
    {

        /* Thread pointer is invalid, return appropriate error code.  */
        return(TX_THREAD_ERROR);
    }

    /* Check for a valid old threshold pointer.  */
    if (!old_threshold)
    {

        /* Invalid destination pointer, return appropriate error code.  */
        return(TX_PTR_ERROR);
    }

    /* Check for invalid caller of this function.  */
    if (_tx_thread_system_state)
    {

        /* Invalid caller of this function, return appropriate error code.  */
        return(TX_CALLER_ERROR);
    }

    /* Determine if the preemption threshold is valid.  */
    if (new_threshold > thread_ptr -> tx_thread_priority)
    {

        /* Now check to see if priority inheritance is in effect. If so, also look at the original priority before returning an error.  */
        if ((thread_ptr -> tx_thread_owned_mutex_count == 0) || (new_threshold > thread_ptr -> tx_thread_original_priority))
        {
        
            /* Return an error status.  */
            return(TX_THRESH_ERROR);
        }
    }

    /* Call actual change thread preemption function.  */
    status =  _tx_thread_preemption_change(thread_ptr, new_threshold, old_threshold);

    /* Return actual completion status.  */
    return(status);
}

