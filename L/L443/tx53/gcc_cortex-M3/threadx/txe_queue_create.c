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
#include "tx_initialize.h"
#include "tx_timer.h"
#include "tx_thread.h"
#include "tx_queue.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _txe_queue_create                                   PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function checks for errors in the queue create function call.  */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    queue_ptr                         Pointer to queue control block    */ 
/*    name_ptr                          Pointer to queue name             */ 
/*    message_size                      Size of each queue message        */ 
/*    queue_start                       Starting address of the queue area*/ 
/*    queue_size                        Number of bytes in the queue      */ 
/*    queue_control_block_size          Size of queue control block       */
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_QUEUE_ERROR                    Invalid queue pointer             */ 
/*    TX_PTR_ERROR                      Invalid starting address of queue */ 
/*    TX_SIZE_ERROR                     Invalid message queue size        */ 
/*    status                            Actual completion status          */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_queue_create                  Actual queue create function      */ 
/*    _tx_thread_system_preempt_check   Check for preemption              */ 
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
UINT  _txe_queue_create(TX_QUEUE *queue_ptr, CHAR *name_ptr, UINT message_size, 
                        VOID *queue_start, ULONG queue_size, UINT queue_control_block_size)
{

TX_INTERRUPT_SAVE_AREA

UINT            status; 
ULONG           i;
TX_QUEUE        *next_queue;
#ifndef TX_TIMER_PROCESS_IN_ISR
TX_THREAD       *thread_ptr;
#endif


    /* First, check for an invalid queue pointer.  */
    if ((!queue_ptr) || (queue_control_block_size != sizeof(TX_QUEUE)))
    {

        /* Queue pointer is invalid, return appropriate error code.  */
        return(TX_QUEUE_ERROR);
    }

    /* Disable interrupts.  */
    TX_DISABLE

    /* Increment the preempt disable flag.  */
    _tx_thread_preempt_disable++;

    /* Restore interrupts.  */
    TX_RESTORE

    /* Next see if it is already in the created list.  */
    next_queue =   _tx_queue_created_ptr;
    for (i = 0; i < _tx_queue_created_count; i++)
    {

        /* Determine if this queue matches the queue in the list.  */
        if (queue_ptr == next_queue)
        {

            break;
        }
        else
        {
            /* Move to the next queue.  */
            next_queue =  next_queue -> tx_queue_created_next;
        }
    }

    /* Disable interrupts.  */
    TX_DISABLE

    /* Decrement the preempt disable flag.  */
    _tx_thread_preempt_disable--;
    
    /* Restore interrupts.  */
    TX_RESTORE

    /* Check for preemption.  */
    _tx_thread_system_preempt_check();

    /* At this point, check to see if there is a duplicate queue.  */
    if (queue_ptr == next_queue)
    {

        /* Queue is already created, return appropriate error code.  */
        return(TX_QUEUE_ERROR);
    }

    /* Check the starting address of the queue.  */
    if (!queue_start)
    {

        /* Invalid starting address of queue.  */
        return(TX_PTR_ERROR);
    }

    /* Check for an invalid message size.  */
    if ((message_size < TX_1_ULONG) || (message_size > TX_16_ULONG))
    {

        /* Invalid message size specified.  */
        return(TX_SIZE_ERROR);
    }

    /* Check on the queue size.  */
    if (queue_size/sizeof(ULONG) < message_size)
    {

        /* Invalid queue size specified.  */
        return(TX_SIZE_ERROR);
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

    /* Call actual queue create function.  */
    status =  _tx_queue_create(queue_ptr, name_ptr, message_size, queue_start, queue_size);

    /* Return actual completion status.  */
    return(status);
}
