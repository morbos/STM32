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
#include "tx_initialize.h"
#include "tx_thread.h"
#include "tx_timer.h"
#include "tx_byte_pool.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _txe_byte_allocate                                  PORTABLE C      */ 
/*                                                           5.3          */  
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function checks for errors in allocate bytes function call.    */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    pool_ptr                          Pointer to pool control block     */ 
/*    memory_ptr                        Pointer to place allocated bytes  */ 
/*                                        pointer                         */
/*    memory_size                       Number of bytes to allocate       */ 
/*    wait_option                       Suspension option                 */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_POOL_ERROR                     Invalid memory pool pointer       */ 
/*    TX_PTR_ERROR                      Invalid destination pointer       */ 
/*    TX_WAIT_ERROR                     Invalid wait option               */ 
/*    TX_CALLER_ERROR                   Invalid caller of this function   */ 
/*    TX_SIZE_ERROR                     Invalid size of memory request    */ 
/*    status                            Actual completion status          */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_byte_allocate                 Actual byte allocate function     */ 
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
/*                                            optimization to timer       */ 
/*                                            thread checking, and added  */ 
/*                                            macro to get current thread,*/ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _txe_byte_allocate(TX_BYTE_POOL *pool_ptr, VOID **memory_ptr, 
                                    ULONG memory_size,  ULONG wait_option)
{

UINT            status;                 
#ifndef TX_TIMER_PROCESS_IN_ISR
TX_THREAD       *thread_ptr;
#endif


    /* First, check for an invalid byte pool pointer.  */
    if ((!pool_ptr) || (pool_ptr -> tx_byte_pool_id != TX_BYTE_POOL_ID))
    {
        
        /* Byte pool pointer is invalid, return appropriate error code.  */
        return(TX_POOL_ERROR);
    }

    /* Check for an invalid destination for return pointer.  */
    if (!memory_ptr)
    {

        /* Null destination pointer, return appropriate error.  */
        return(TX_PTR_ERROR);
    }

    /* Check for an invalid memory size.  */
    if ((memory_size == 0) || (memory_size > pool_ptr -> tx_byte_pool_size))
    {

        /* Error in size, return appropriate error.  */
        return(TX_SIZE_ERROR);
    }

    /* Check for a wait option error.  Only threads are allowed any form of 
       suspension.  */
    if ((wait_option) && (_tx_thread_system_state))
    {

        /* A non-thread is trying to suspend, return appropriate error code.  */
        return(TX_WAIT_ERROR);
    }

#ifndef TX_TIMER_PROCESS_IN_ISR

    /* Pickup thread pointer.  */
    TX_THREAD_GET_CURRENT(thread_ptr)

    /* Check for invalid caller of this function.  First check for a calling thread.  */
    if (thread_ptr == &_tx_timer_thread)
    {

        /* Invalid caller of this function, return appropriate error code.  */
        return(TX_CALLER_ERROR);
    }
#endif

    /* Check for interrupt call.  */
    if ((_tx_thread_system_state) && (_tx_thread_system_state < TX_INITIALIZE_IN_PROGRESS))
    {
    
        /* Invalid caller of this function, return appropriate error code.  */
        return(TX_CALLER_ERROR);
    }

    /* Call actual byte memory allocate function.  */
    status =  _tx_byte_allocate(pool_ptr, memory_ptr, memory_size,  wait_option);

    /* Return actual completion status.  */
    return(status);
}

