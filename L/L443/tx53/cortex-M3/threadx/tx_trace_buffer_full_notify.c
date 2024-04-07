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
/**   Trace                                                               */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#ifndef TX_SOURCE_CODE
#define TX_SOURCE_CODE
#endif


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"


#ifdef TX_INCLUDE_TRACE_SOURCE
/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_trace_buffer_full_notify                        PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function sets up the application callback function that is     */ 
/*    called whenever the trace buffer becomes full. The application      */ 
/*    can then swap to a new trace buffer in order not to lose any        */ 
/*    events.                                                             */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    full_buffer_callback                  Full trace buffer processing  */ 
/*                                            function                    */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    Completion Status                                                   */ 
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
/*  12-12-2008     William E. Lamie         Initial Version 5.2           */ 
/*  07-04-2009     William E. Lamie         Modified comment(s), and      */ 
/*                                            added conditional so that   */ 
/*                                            the function is only        */ 
/*                                            compiled once, resulting in */ 
/*                                            version 5.3                 */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_trace_buffer_full_notify(VOID (*full_buffer_callback)(VOID *))
{

#ifndef TX_ENABLE_EVENT_TRACE

    /* Trace not enabled, return an error.  */
    return(TX_FEATURE_NOT_ENABLED);
#else

    /* Setup the callback function pointer.  */
    _tx_trace_full_notify_function =  full_buffer_callback;

    /* Return success.  */
    return(TX_SUCCESS);
#endif
}

#else

/* Define a stub function in case this file is also included into the library.  */
void _tx_trace_buffer_full_notify_stub(void)
{
    return;
}
#endif

