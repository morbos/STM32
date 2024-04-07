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
#include "tx_trace.h"
#include "tx_mutex.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_mutex_performance_system_info_get               PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function retrieves system mutex performance information.       */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    puts                              Destination for total number of   */
/*                                        mutex puts                      */ 
/*    gets                              Destination for total number of   */ 
/*                                        mutex gets                      */ 
/*    suspensions                       Destination for total number of   */ 
/*                                        mutex suspensions               */ 
/*    timeouts                          Destination for total number of   */ 
/*                                        mutex timeouts                  */ 
/*    inversions                        Destination for total number of   */ 
/*                                        mutex priority inversions       */ 
/*    inheritances                      Destination for total number of   */ 
/*                                        mutex priority inheritances     */ 
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
UINT  _tx_mutex_performance_system_info_get(ULONG *puts, ULONG *gets, ULONG *suspensions, 
                                ULONG *timeouts, ULONG *inversions, ULONG *inheritances)
{

#ifndef TX_MUTEX_ENABLE_PERFORMANCE_INFO

    /* Not enabled, return error.  */
    return(TX_FEATURE_NOT_ENABLED);
#else


TX_INTERRUPT_SAVE_AREA


    /* Disable interrupts.  */
    TX_MUTEX_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_MUTEX_PERFORMANCE_SYSTEM_INFO_GET, 0, 0, 0, 0, TX_TRACE_MUTEX_EVENTS)

    /* Retrieve all the pertinent information and return it in the supplied
       destinations.  */

    /* Retrieve the total number of mutex puts.  */
    if (puts)
    {
    
        *puts =  _tx_mutex_performance_put_count;
    }
    
    /* Retrieve the total number of mutex gets.  */
    if (gets)
    {
    
        *gets =  _tx_mutex_performance_get_count;
    }
    
    /* Retrieve the total number of mutex suspensions.  */
    if (suspensions)
    {
    
        *suspensions =  _tx_mutex_performance_suspension_count;
    }
    
    /* Retrieve the total number of mutex timeouts.  */
    if (timeouts)
    {
    
        *timeouts =  _tx_mutex_performance_timeout_count;
    }
    
    /* Retrieve the total number of mutex priority inversions.  */
    if (inversions)
    {
    
        *inversions =  _tx_mutex_performance_priority_inversion_count;
    }
    
    /* Retrieve the total number of mutex priority inheritances.  */
    if (inheritances)
    {
    
        *inheritances =  _tx_mutex_performance_priority_inheritance_count;
    }
    
    /* Restore interrupts.  */
    TX_RESTORE

    /* Return completion status.  */
    return(TX_SUCCESS);
#endif
}

