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
/**   Byte Pool                                                           */
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
/*    _tx_byte_pool_create                                PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function creates a pool of memory bytes in the specified       */ 
/*    memory area.                                                        */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    pool_ptr                          Pointer to pool control block     */ 
/*    name_ptr                          Pointer to byte pool name         */ 
/*    pool_start                        Address of beginning of pool area */ 
/*    pool_size                         Number of bytes in the byte pool  */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_SUCCESS                        Successful completion status      */ 
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
/*  12-12-2008     William E. Lamie         Modified comment(s), added    */ 
/*                                            filter option to trace      */ 
/*                                            insert, and made several    */ 
/*                                            optimizations, resulting    */ 
/*                                            in version 5.2              */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_byte_pool_create(TX_BYTE_POOL *pool_ptr, CHAR *name_ptr, VOID *pool_start, ULONG pool_size)
{

TX_INTERRUPT_SAVE_AREA

UCHAR               *block_ptr;                  
ULONG               created_count;
TX_BYTE_POOL        *next_pool;
TX_BYTE_POOL        *previous_pool;


    /* Initialize the byte pool control block to all zeros.  */
    memset(pool_ptr, 0, sizeof(TX_BYTE_POOL));

    /* Round the pool size down to something that is evenly divisible by 
       an ULONG.  */
    pool_size =   (pool_size/sizeof(ULONG)) * sizeof(ULONG);

    /* Setup the basic byte pool fields.  */
    pool_ptr -> tx_byte_pool_name =              name_ptr;

    /* Save the start and size of the pool.  */
    pool_ptr -> tx_byte_pool_start =   (UCHAR *) pool_start;
    pool_ptr -> tx_byte_pool_size =    pool_size;

    /* Setup memory list to the beginning as well as the search pointer.  */
    pool_ptr -> tx_byte_pool_list =    (UCHAR *) pool_start;
    pool_ptr -> tx_byte_pool_search =  (UCHAR *) pool_start;

    /* Initially, the pool will have two blocks.  One large block at the 
       beginning that is available and a small allocated block at the end
       of the pool that is there just for the algorithm.  Be sure to count
       the available block's header in the available bytes count.  */
    pool_ptr -> tx_byte_pool_available =   pool_size - sizeof(VOID *) - sizeof(ULONG);
    pool_ptr -> tx_byte_pool_fragments =    2;
    
    /* Calculate the end of the pool's memory area.  */
    block_ptr =  ((UCHAR *) pool_start) + (UINT) pool_size;

    /* Backup the end of the pool pointer and build the pre-allocated block.  */
    block_ptr =  block_ptr - sizeof(ULONG);
    *((ULONG *) block_ptr) =  TX_BYTE_BLOCK_ALLOC;
    block_ptr =  block_ptr - sizeof(UCHAR *);
    *((UCHAR **) block_ptr) =  pool_start;

    /* Now setup the large available block in the pool.  */
    *((UCHAR **) pool_start) =  block_ptr;
    block_ptr =  (UCHAR *) pool_start;
    block_ptr =  block_ptr + sizeof(UCHAR *);
    *((ULONG *) block_ptr) =  TX_BYTE_BLOCK_FREE;

    /* Clear the owner id.  */
    pool_ptr -> tx_byte_pool_owner =  TX_NULL;

    /* Disable interrupts to place the byte pool on the created list.  */
    TX_DISABLE

    /* Setup the byte pool ID to make it valid.  */
    pool_ptr -> tx_byte_pool_id =  TX_BYTE_POOL_ID;

    /* Pickup the created count.  */
    created_count =  _tx_byte_pool_created_count++;

    /* Place the byte pool on the list of created byte pools.  First,
       check for an empty list.  */
    if (created_count == 0)
    {

        /* The created byte pool list is empty.  Add byte pool to empty list.  */
        _tx_byte_pool_created_ptr =                  pool_ptr;
        pool_ptr -> tx_byte_pool_created_next =      pool_ptr;
        pool_ptr -> tx_byte_pool_created_previous =  pool_ptr;
    }
    else
    {

        /* This list is not NULL, add to the end of the list.  */
        next_pool =      _tx_byte_pool_created_ptr;
        previous_pool =  next_pool -> tx_byte_pool_created_previous;

        /* Place the new byte pool in the list.  */
        next_pool -> tx_byte_pool_created_previous =  pool_ptr;
        previous_pool -> tx_byte_pool_created_next =  pool_ptr;

        /* Setup this byte pool's created links.  */
        pool_ptr -> tx_byte_pool_created_previous =  previous_pool;
        pool_ptr -> tx_byte_pool_created_next =      next_pool; 
    }

    /* Optional byte pool create extended processing.  */
    TX_BYTE_POOL_CREATE_EXTENSION(pool_ptr)

    /* If trace is enabled, register this object.  */
    TX_TRACE_OBJECT_REGISTER(TX_TRACE_OBJECT_TYPE_BYTE_POOL, pool_ptr, name_ptr, pool_size, 0)

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_BYTE_POOL_CREATE, pool_ptr, pool_start, pool_size, &block_ptr, TX_TRACE_BYTE_POOL_EVENTS)

    /* Restore interrupts.  */
    TX_RESTORE

    /* Return TX_SUCCESS.  */
    return(TX_SUCCESS);
}

