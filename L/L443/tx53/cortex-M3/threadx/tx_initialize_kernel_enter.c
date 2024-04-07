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
/**   Initialize                                                          */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Locate initialization component data in this file.  */

#define TX_INITIALIZE_INIT


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_initialize.h"
#include "tx_thread.h"
#include "tx_timer.h"


/* Define any port-specific scheduling data structures.  */

TX_PORT_SPECIFIC_DATA


/* Define the user's initialization function.  */

VOID    tx_application_define(VOID *first_unused_memory);


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_initialize_kernel_enter                         PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function is the first ThreadX function called during           */ 
/*    initialization.  It is called from the application's "main()"       */ 
/*    function.  It is important to note that this routine never          */ 
/*    returns.  The processing of this function is relatively simple:     */ 
/*    it calls several ThreadX initialization functions (if needed),      */ 
/*    calls the application define function, and then invokes the         */ 
/*    scheduler.                                                          */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    None                                                                */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    None                                                                */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_initialize_low_level          Low-level initialization          */ 
/*    _tx_initialize_high_level         High-level initialization         */ 
/*    tx_application_define             Application define function       */ 
/*    _tx_thread_scheduler              ThreadX scheduling loop           */ 
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    main                              Application main program          */ 
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), and      */ 
/*                                            added macros for port-      */ 
/*                                            specific use, resulting     */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
VOID  _tx_initialize_kernel_enter(VOID)
{

    /* Determine if the compiler has pre-initialized ThreadX.  */
    if (_tx_thread_system_state != TX_INITIALIZE_ALMOST_DONE)
    {

        /* No, the initialization still needs to take place.  */

        /* Ensure that the system state variable is set to indicate 
           initialization is in progress.  Note that this variable is 
           later used to represent interrupt nesting.  */
        _tx_thread_system_state =  TX_INITIALIZE_IN_PROGRESS;

        /* Call any port specific preprocessing.  */
        TX_PORT_SPECIFIC_PRE_INITIALIZATION

        /* Invoke the low-level initialization to handle all processor specific
           initialization issues.  */
        _tx_initialize_low_level();
    
        /* Invoke the high-level initialization to exercise all of the 
           ThreadX components and the application's initialization 
           function.  */
        _tx_initialize_high_level();

        /* Call any port specific post-processing.  */
        TX_PORT_SPECIFIC_POST_INITIALIZATION
    }

    /* Ensure that the system state variable is set to indicate 
       initialization is in progress.  Note that this variable is 
       later used to represent interrupt nesting.  */
    _tx_thread_system_state =  TX_INITIALIZE_IN_PROGRESS;

    /* Call the application provided initialization function.  Pass the
       first available memory address to it.  */
    tx_application_define(_tx_initialize_unused_memory);

    /* Set the system state in preparation for entering the thread 
       scheduler.  */
    _tx_thread_system_state =  TX_INITIALIZE_IS_FINISHED;

    /* Call any port specific pre-scheduler processing.  */
    TX_PORT_SPECIFIC_PRE_SCHEDULER_INITIALIZATION

    /* Enter the scheduling loop to start executing threads!  */
    _tx_thread_schedule();
}

