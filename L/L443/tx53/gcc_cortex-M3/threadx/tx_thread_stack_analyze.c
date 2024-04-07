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
#include "tx_thread.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_thread_stack_analyze                            PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function analyzes the stack to calculate the highest stack     */ 
/*    pointer in the thread's stack. This can then be used to derive the  */ 
/*    minimum amount of stack left for any given thread.                  */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    thread_ptr                            Thread control block pointer  */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    None                                                                */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    None                                                                */ 
/*                                                                        */ 
/*  CALLED BY                                                             */ 
/*                                                                        */ 
/*    ThreadX internal code                                               */ 
/*                                                                        */ 
/*  RELEASE HISTORY                                                       */ 
/*                                                                        */ 
/*    DATE              NAME                      DESCRIPTION             */ 
/*                                                                        */ 
/*  12-12-2005     William E. Lamie         Initial Version 5.0           */ 
/*  04-02-2007     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.1    */ 
/*  12-12-2008     William E. Lamie         Modified comment(s), and      */ 
/*                                            made optimization,          */ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
VOID  _tx_thread_stack_analyze(TX_THREAD *thread_ptr)
{

TX_INTERRUPT_SAVE_AREA

ULONG       *stack_ptr;
ULONG       *stack_lowest;
ULONG       *stack_highest;
ULONG       size;


    /* Disable interrupts.  */
    TX_DISABLE

    /* Determine if the thread pointer is NULL.  */
    if ((thread_ptr == TX_NULL) || (thread_ptr -> tx_thread_id != TX_THREAD_ID))
    {

        /* Restore interrupts.  */
        TX_RESTORE

        /* Yes, just return.  */
        return;
    }

    /* Pickup the current stack variables.  */
    stack_lowest =   (ULONG *) thread_ptr -> tx_thread_stack_start;
    stack_highest =  (ULONG *) thread_ptr -> tx_thread_stack_highest_ptr;

    /* Restore interrupts.  */
    TX_RESTORE

    /* We need to binary search the remaining stack for missing 0xEF pattern. 
       This is a best effort algorithm to find the highest stack usage. */
    do
    {

        /* Calculate the size again.  */
        size =  (stack_highest - stack_lowest)/2;
        stack_ptr =  stack_lowest + size;

        /* Determine if the pattern is still there.  */
        if (*stack_ptr != TX_STACK_FILL)
        {

            /* Update the stack highest, since we need to look in the upper half now.  */
            stack_highest =  stack_ptr;
        }
        else
        {

            /* Update the stack lowest, since we need to look in the lower half now.  */
            stack_lowest =  stack_ptr;
        }

    } while(size > 1);

    /* Position to first used word - at this point we are within a few words.  */
    while (*stack_ptr == TX_STACK_FILL)
    {
            
        /* Position to next word in stack.  */
        stack_ptr++;
    }

    /* Disable interrupts.  */
    TX_DISABLE

    /* Check to see if the thread is still created.  */
    if (thread_ptr -> tx_thread_id == TX_THREAD_ID)
    {

        /* Yes, setup the highest stack usage.  */
        thread_ptr -> tx_thread_stack_highest_ptr =  stack_ptr;
    }

    /* Restore interrupts.  */
    TX_RESTORE
}

