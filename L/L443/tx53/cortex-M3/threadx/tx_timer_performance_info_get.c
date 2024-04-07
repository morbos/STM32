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
/*    _tx_timer_performance_info_get                      PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function retrieves performance information from the specified  */ 
/*    timer.                                                              */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    timer_ptr                         Pointer to timer control block    */ 
/*    activates                         Destination for the number of     */ 
/*                                        activations of this timer       */ 
/*    reactivates                       Destination for the number of     */ 
/*                                        reactivations of this timer     */ 
/*    deactivates                       Destination for the number of     */ 
/*                                        deactivations of this timer     */ 
/*    expirations                       Destination for the number of     */ 
/*                                        expirations of this timer       */ 
/*    expiration_adjusts                Destination for the number of     */ 
/*                                        expiration adjustments of this  */ 
/*                                        timer                           */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    status                            Completion status                 */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    None                                                                */ 
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
/*  12-12-2008     William E. Lamie         Modified comment(s), and      */ 
/*                                            added filter option to      */ 
/*                                            trace insert, resulting     */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_timer_performance_info_get(TX_TIMER *timer_ptr, ULONG *activates, ULONG *reactivates,
                    ULONG *deactivates, ULONG *expirations, ULONG *expiration_adjusts)
{

#ifndef TX_TIMER_ENABLE_PERFORMANCE_INFO

    /* Not enabled, return error.  */
    return(TX_FEATURE_NOT_ENABLED);
#else


TX_INTERRUPT_SAVE_AREA


    /* Determine if this is a legal request.  */
    if ((!timer_ptr) || (timer_ptr -> tx_timer_id != TX_TIMER_ID))
    {
        
        /* Timer pointer is illegal, return error.  */
        return(TX_PTR_ERROR);
    }

    /* Disable interrupts.  */
    TX_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_TIMER_PERFORMANCE_INFO_GET, timer_ptr, 0, 0, 0, TX_TRACE_TIMER_EVENTS)

    /* Retrieve the number of activations of this timer.  */
    if (activates)
    {
    
        *activates =  timer_ptr -> tx_timer_performance_activate_count;
    }
    
    /* Retrieve the number of reactivations of this timer.  */
    if (reactivates)
    {
    
        *reactivates =  timer_ptr -> tx_timer_performance_reactivate_count;
    }
    
    /* Retrieve the number of deactivations of this timer.  */
    if (deactivates)
    {
    
        *deactivates =  timer_ptr -> tx_timer_performance_deactivate_count;
    }
    
    /* Retrieve the number of expirations of this timer.  */
    if (expirations)
    {
    
        *expirations =  timer_ptr -> tx_timer_performance_expiration_count;
    }
    
    /* Retrieve the number of expiration adjustments of this timer.  */
    if (expiration_adjusts)
    {
    
        *expiration_adjusts =  timer_ptr -> tx_timer_performance_expiration_adjust_count;
    }
    
    /* Restore interrupts.  */
    TX_RESTORE

    /* Return completion status.  */
    return(TX_SUCCESS);
#endif
}

