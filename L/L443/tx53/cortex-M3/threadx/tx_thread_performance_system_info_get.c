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
#include "tx_trace.h"
#include "tx_thread.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_thread_performance_system_info_get              PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function retrieves thread system performance information.      */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    resumptions                       Destination for total number of   */ 
/*                                        thread resumptions              */ 
/*    suspensions                       Destination for total number of   */ 
/*                                        thread suspensions              */ 
/*    solicited_preemptions             Destination for total number of   */ 
/*                                        thread preemption from thread   */ 
/*                                        API calls                       */ 
/*    interrupt_preemptions             Destination for total number of   */ 
/*                                        thread preemptions as a result  */ 
/*                                        of threads made ready inside of */ 
/*                                        Interrupt Service Routines      */ 
/*    priority_inversions               Destination for total number of   */ 
/*                                        priority inversions             */ 
/*    time_slices                       Destination for total number of   */ 
/*                                        time-slices                     */ 
/*    relinquishes                      Destination for total number of   */ 
/*                                        relinquishes                    */ 
/*    timeouts                          Destination for total number of   */ 
/*                                        timeouts                        */ 
/*    wait_aborts                       Destination for total number of   */ 
/*                                        wait aborts                     */ 
/*    non_idle_returns                  Destination for total number of   */ 
/*                                        times threads return when       */ 
/*                                        another thread is ready         */ 
/*    idle_returns                      Destination for total number of   */ 
/*                                        times threads return when no    */ 
/*                                        other thread is ready           */ 
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
UINT  _tx_thread_performance_system_info_get(ULONG *resumptions, ULONG *suspensions,
                ULONG *solicited_preemptions, ULONG *interrupt_preemptions, ULONG *priority_inversions,
                ULONG *time_slices, ULONG *relinquishes, ULONG *timeouts, ULONG *wait_aborts,
                ULONG *non_idle_returns, ULONG *idle_returns)
{

#ifndef TX_THREAD_ENABLE_PERFORMANCE_INFO

    /* Not enabled, return error.  */
    return(TX_FEATURE_NOT_ENABLED);
#else

TX_INTERRUPT_SAVE_AREA


    /* Disable interrupts.  */
    TX_DISABLE

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_THREAD_PERFORMANCE_SYSTEM_INFO_GET, 0, 0, 0, 0, TX_TRACE_THREAD_EVENTS)

    /* Retrieve all the pertinent information and return it in the supplied
       destinations.  */

    /* Retrieve total number of thread resumptions.  */
    if (resumptions)
    {
    
        *resumptions =  _tx_thread_performance_resume_count;
    }
    
    /* Retrieve total number of thread suspensions.  */
    if (suspensions)
    {
    
        *suspensions =  _tx_thread_performance_suspend_count;
    }
    
    /* Retrieve total number of solicited thread preemptions.  */
    if (solicited_preemptions)
    {
    
        *solicited_preemptions =  _tx_thread_performance_solicited_preemption_count;
    }
    
    /* Retrieve total number of interrupt thread preemptions.  */
    if (interrupt_preemptions)
    {
    
        *interrupt_preemptions =  _tx_thread_performance_interrupt_preemption_count;
    }
    
    /* Retrieve total number of thread priority inversions.  */
    if (priority_inversions)
    {
    
        *priority_inversions =  _tx_thread_performance_priority_inversion_count;
    }
    
    /* Retrieve total number of thread time-slices.  */
    if (time_slices)
    {
    
        *time_slices =  _tx_thread_performance_time_slice_count;
    }
    
    /* Retrieve total number of thread relinquishes.  */
    if (relinquishes)
    {
    
        *relinquishes =  _tx_thread_performance_relinquish_count;
    }
    
    /* Retrieve total number of thread timeouts.  */
    if (timeouts)
    {
    
        *timeouts =  _tx_thread_performance_timeout_count;
    }
    
    /* Retrieve total number of thread wait aborts.  */
    if (wait_aborts)
    {
    
        *wait_aborts =  _tx_thread_performance_wait_abort_count;
    }
    
    /* Retrieve total number of thread non-idle system returns.  */
    if (non_idle_returns)
    {
    
        *non_idle_returns =  _tx_thread_performance_non_idle_return_count;
    }
    
    /* Retrieve total number of thread idle system returns.  */
    if (idle_returns)
    {
    
        *idle_returns =  _tx_thread_performance_idle_return_count;
    }
    
    /* Restore interrupts.  */
    TX_RESTORE

    /* Return completion status.  */
    return(TX_SUCCESS);
#endif
}

