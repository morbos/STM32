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
/**   Semaphore                                                           */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_semaphore.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_semaphore_put_notify                            PORTABLE C      */ 
/*                                                           5.3          */  
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function registers an application callback function that is    */ 
/*    called whenever the this semaphore is put.                          */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    semaphore_ptr                         Pointer to semaphore          */ 
/*    semaphore_put_notify                  Application callback function */ 
/*                                            (TX_NULL disables notify)   */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    status                                Service return status         */ 
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
UINT  _tx_semaphore_put_notify(TX_SEMAPHORE *semaphore_ptr, VOID (*semaphore_put_notify)(TX_SEMAPHORE *))
{

#ifdef TX_DISABLE_NOTIFY_CALLBACKS

    /* Feature is not enabled, return error.  */
    return(TX_FEATURE_NOT_ENABLED);
#else

TX_INTERRUPT_SAVE_AREA


    /* Disable interrupts.  */
    TX_DISABLE

    /* Make entry in event log.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_SEMAPHORE_PUT_NOTIFY, semaphore_ptr, 0, 0, 0, TX_TRACE_SEMAPHORE_EVENTS)

    /* Setup semaphore put notification callback function.  */
    semaphore_ptr -> tx_semaphore_put_notify =  semaphore_put_notify;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Return success to caller.  */
    return(TX_SUCCESS);
#endif
}

