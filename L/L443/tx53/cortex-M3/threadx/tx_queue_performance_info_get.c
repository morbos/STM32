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
/**   Queue                                                               */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_queue.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_queue_performance_info_get                      PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function retrieves performance information from the specified  */ 
/*    queue.                                                              */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    queue_ptr                         Pointer to queue control block    */ 
/*    messages_sent                     Destination for messages sent     */ 
/*    messages_received                 Destination for messages received */ 
/*    empty_suspensions                 Destination for number of empty   */ 
/*                                        queue suspensions               */ 
/*    full_suspensions                  Destination for number of full    */ 
/*                                        queue suspensions               */ 
/*    full_errors                       Destination for queue full errors */ 
/*                                        returned - no suspension        */ 
/*    timeouts                          Destination for number of timeouts*/ 
/*                                        on this queue                   */ 
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
UINT  _tx_queue_performance_info_get(TX_QUEUE *queue_ptr, ULONG *messages_sent, ULONG *messages_received,
                    ULONG *empty_suspensions, ULONG *full_suspensions, ULONG *full_errors, ULONG *timeouts)
{

#ifndef TX_QUEUE_ENABLE_PERFORMANCE_INFO

    /* Not enabled, return error.  */
    return(TX_FEATURE_NOT_ENABLED);
#else

TX_INTERRUPT_SAVE_AREA


    /* Determine if this is a legal request.  */
    if ((!queue_ptr) || (queue_ptr -> tx_queue_id != TX_QUEUE_ID))
    {
        
        /* Queue pointer is illegal, return error.  */
        return(TX_PTR_ERROR);
    }

    /* Disable interrupts.  */
    TX_QUEUE_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_QUEUE_PERFORMANCE_INFO_GET, queue_ptr, 0, 0, 0, TX_TRACE_QUEUE_EVENTS)

    /* Retrieve all the pertinent information and return it in the supplied
       destinations.  */

    /* Retrieve the number of messages sent to this queue.  */
    if (messages_sent)
    {
    
        *messages_sent =  queue_ptr -> tx_queue_performance_messages_sent_count;
    }
    
    /* Retrieve the number of messages received from this queue.  */
    if (messages_received)
    {
    
        *messages_received =  queue_ptr -> tx_queue_performance_messages_received_count;
    }
    
    /* Retrieve the number of empty queue suspensions on this queue.  */
    if (empty_suspensions)
    {
    
        *empty_suspensions =  queue_ptr -> tx_queue_performance_empty_suspension_count;
    }
    
    /* Retrieve the number of full queue suspensions on this queue.  */
    if (full_suspensions)
    {
    
        *full_suspensions =  queue_ptr -> tx_queue_performance_full_suspension_count;
    }
    
    /* Retrieve the number of full errors (no suspension!) on this queue.  */
    if (full_errors)
    {
    
        *full_errors =  queue_ptr -> tx_queue_performance_full_error_count;
    }
    
    /* Retrieve the number of timeouts on this queue.  */
    if (timeouts)
    {
    
        *timeouts =  queue_ptr -> tx_queue_performance_timeout_count;
    }
    
    /* Restore interrupts.  */
    TX_RESTORE

    /* Return completion status.  */
    return(TX_SUCCESS);
#endif
}

