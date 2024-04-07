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
/**   Byte Memory                                                         */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_byte_pool.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_byte_pool_performance_info_get                  PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function retrieves performance information from the specified  */ 
/*    byte pool.                                                          */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    pool_ptr                          Pointer to byte pool control block*/ 
/*    allocates                         Destination for number of         */ 
/*                                        allocates on this pool          */ 
/*    releases                          Destination for number of         */ 
/*                                        releases on this pool           */ 
/*    fragments_searched                Destination for number of         */ 
/*                                        fragments searched during       */ 
/*                                        allocation                      */ 
/*    merges                            Destination for number of adjacent*/ 
/*                                        free fragments merged           */ 
/*    splits                            Destination for number of         */ 
/*                                        fragments split during          */ 
/*                                        allocation                      */ 
/*    suspensions                       Destination for number of         */ 
/*                                        suspensions on this pool        */
/*    timeouts                          Destination for number of timeouts*/ 
/*                                        on this byte pool               */ 
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
UINT  _tx_byte_pool_performance_info_get(TX_BYTE_POOL *pool_ptr, ULONG *allocates, ULONG *releases,
                    ULONG *fragments_searched, ULONG *merges, ULONG *splits, ULONG *suspensions, ULONG *timeouts)
{

#ifndef TX_BYTE_POOL_ENABLE_PERFORMANCE_INFO

    /* Not enabled, return error.  */
    return(TX_FEATURE_NOT_ENABLED);
#else

TX_INTERRUPT_SAVE_AREA


    /* Determine if this is a legal request.  */
    if ((!pool_ptr) || (pool_ptr -> tx_byte_pool_id != TX_BYTE_POOL_ID))
    {
        
        /* Byte pool pointer is illegal, return error.  */
        return(TX_PTR_ERROR);
    }

    /* Disable interrupts.  */
    TX_BYTE_POOL_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_BYTE_POOL_PERFORMANCE_INFO_GET, pool_ptr, 0, 0, 0, TX_TRACE_BYTE_POOL_EVENTS)

    /* Retrieve all the pertinent information and return it in the supplied
       destinations.  */

    /* Retrieve the number of allocates on this byte pool.  */
    if (allocates)
    {
    
        *allocates =  pool_ptr -> tx_byte_pool_performance_allocate_count;
    }

    /* Retrieve the number of releases on this byte pool.  */
    if (releases)
    {

        *releases =  pool_ptr -> tx_byte_pool_performance_release_count;
    }

    /* Retrieve the number of fragments searched in this byte pool.  */
    if (fragments_searched)
    {
    
        *fragments_searched =  pool_ptr -> tx_byte_pool_performance_search_count;
    }
    
    /* Retrieve the number of fragments merged on this byte pool.  */
    if (merges)
    {

        *merges =  pool_ptr -> tx_byte_pool_performance_merge_count;
    }
    
    /* Retrieve the number of fragment splits on this byte pool.  */
    if (splits)
    {
    
        *splits =  pool_ptr -> tx_byte_pool_performance_split_count;
    }

    /* Retrieve the number of suspensions on this byte pool.  */
    if (suspensions)
    {
    
        *suspensions =  pool_ptr -> tx_byte_pool_performance_suspension_count;
    }

    /* Retrieve the number of timeouts on this byte pool.  */
    if (timeouts)
    {
    
        *timeouts =  pool_ptr -> tx_byte_pool_performance_timeout_count;
    }

    /* Restore interrupts.  */
    TX_RESTORE

    /* Return completion status.  */
    return(TX_SUCCESS);
#endif
}

