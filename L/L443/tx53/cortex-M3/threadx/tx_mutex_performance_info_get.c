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
/*    _tx_mutex_performance_info_get                      PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function retrieves performance information from the specified  */ 
/*    mutex.                                                              */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    mutex_ptr                         Pointer to mutex control block    */ 
/*    puts                              Destination for the number of     */
/*                                        puts on to this mutex           */ 
/*    gets                              Destination for the number of     */ 
/*                                        gets on this mutex              */ 
/*    suspensions                       Destination for the number of     */ 
/*                                        suspensions on this mutex       */ 
/*    timeouts                          Destination for number of timeouts*/ 
/*                                        on this mutex                   */ 
/*    inversions                        Destination for number of priority*/ 
/*                                        inversions on this mutex        */ 
/*    inheritances                      Destination for number of priority*/ 
/*                                        inheritances on this mutex      */ 
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
UINT  _tx_mutex_performance_info_get(TX_MUTEX *mutex_ptr, ULONG *puts, ULONG *gets,
                    ULONG *suspensions, ULONG *timeouts, ULONG *inversions, ULONG *inheritances)
{

#ifndef TX_MUTEX_ENABLE_PERFORMANCE_INFO

    /* Not enabled, return error.  */
    return(TX_FEATURE_NOT_ENABLED);
#else


TX_INTERRUPT_SAVE_AREA


    /* Determine if this is a legal request.  */
    if ((!mutex_ptr) || (mutex_ptr -> tx_mutex_id != TX_MUTEX_ID))
    {
        
        /* Mutex pointer is illegal, return error.  */
        return(TX_PTR_ERROR);
    }

    /* Disable interrupts.  */
    TX_MUTEX_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_MUTEX_PERFORMANCE_INFO_GET, mutex_ptr, 0, 0, 0, TX_TRACE_MUTEX_EVENTS)

    /* Retrieve all the pertinent information and return it in the supplied
       destinations.  */

    /* Retrieve the number of puts on this mutex.  */
    if (puts)
    {
    
        *puts =  mutex_ptr -> tx_mutex_performance_put_count;
    }
    
    /* Retrieve the number of gets on this mutex.  */
    if (gets)
    {
    
        *gets =  mutex_ptr -> tx_mutex_performance_get_count;
    }
    
    /* Retrieve the number of suspensions on this mutex.  */
    if (suspensions)
    {
    
        *suspensions =  mutex_ptr -> tx_mutex_performance_suspension_count;
    }
    
    /* Retrieve the number of timeouts on this mutex.  */
    if (timeouts)
    {
    
        *timeouts =  mutex_ptr -> tx_mutex_performance_timeout_count;
    }
    
    /* Retrieve the number of priority inversions on this mutex.  */
    if (inversions)
    {
    
        *inversions =  mutex_ptr -> tx_mutex_performance_priority_inversion_count;
    }
    
    /* Retrieve the number of priority inheritances on this mutex.  */
    if (inheritances)
    {
    
        *inheritances =  mutex_ptr -> tx_mutex_performance_priority_inheritance_count;
    }
    
    /* Restore interrupts.  */
    TX_RESTORE

    /* Return completion status.  */
    return(TX_SUCCESS);
#endif
}

