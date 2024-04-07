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
/**   Block Pool                                                          */
/**                                                                       */
/**************************************************************************/
/**************************************************************************/

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"
#include "tx_block_pool.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_block_pool_create                               PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function creates a pool of fixed-size memory blocks in the     */ 
/*    specified memory area.                                              */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    pool_ptr                          Pointer to pool control block     */ 
/*    name_ptr                          Pointer to block pool name        */ 
/*    block_size                        Number of bytes in each block     */ 
/*    pool_start                        Address of beginning of pool area */ 
/*    pool_size                         Number of bytes in the block pool */ 
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
/*                                            parameter to trace          */ 
/*                                            registry, added filter      */ 
/*                                            option to trace insert,     */ 
/*                                            treat the zero blocks       */ 
/*                                            situation as an error, and  */ 
/*                                            made several optimizations, */ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _tx_block_pool_create(TX_BLOCK_POOL *pool_ptr, CHAR *name_ptr, ULONG block_size,
                    VOID *pool_start, ULONG pool_size)
{

TX_INTERRUPT_SAVE_AREA

ULONG               blocks;                     
UCHAR               *block_ptr;                  
UCHAR               *next_block_ptr;             
UCHAR               *end_of_pool;                
ULONG               created_count;
TX_BLOCK_POOL       *next_pool;
TX_BLOCK_POOL       *previous_pool;


    /* Initialize block pool control block to all zeros.  */
    memset(pool_ptr, 0, sizeof(TX_BLOCK_POOL));

    /* Round the block size up to something that is evenly divisible by
       an ULONG.  This helps guarantee proper alignment.  */
    block_size =  ((block_size + sizeof(ULONG) - 1)/sizeof(ULONG)) * sizeof(ULONG);

    /* Round the pool size down to something that is evenly divisible by 
       an ULONG.  */
    pool_size =   (pool_size/sizeof(ULONG)) * sizeof(ULONG);

    /* Setup the basic block pool fields.  */
    pool_ptr -> tx_block_pool_name =             name_ptr;
    pool_ptr -> tx_block_pool_start =            (UCHAR *) pool_start;
    pool_ptr -> tx_block_pool_size =             pool_size;
    pool_ptr -> tx_block_pool_block_size =       block_size;
    
    /* Calculate the end of the pool's memory area.  */
    end_of_pool =  ((UCHAR *) pool_start) + (UINT) pool_size;

    /* Walk through the pool area, setting up the available block list.  */
    blocks =            0;
    block_ptr =         (UCHAR *) pool_start;
    next_block_ptr =    block_ptr + (UINT) (block_size + sizeof(UCHAR *));
    while(next_block_ptr <= end_of_pool)
    {

        /* Yes, we have another block.  Increment the block count.  */
        blocks++;

        /* Setup the link to the next block.  */
        *((UCHAR **) block_ptr) =  next_block_ptr;

        /* Advance to the next block.  */
        block_ptr =   next_block_ptr;

        /* Update the next block pointer.  */
        next_block_ptr =  block_ptr + (UINT) (block_size + sizeof(UCHAR *));
    }

    /* Backup to the last block in the pool.  */
    block_ptr =  block_ptr - (UINT) (block_size + sizeof(UCHAR *));

    /* Set the last block's forward pointer to NULL.  */
    *((UCHAR **) block_ptr) =  TX_NULL;

    /* Save the remaining information in the pool control block.  */
    pool_ptr -> tx_block_pool_available =  blocks;
    pool_ptr -> tx_block_pool_total =      blocks;

    /* Quickly check to make sure at least one block is in the pool.  */
    if (blocks)
    {
        
        /* Setup the starting pool address.  */
        pool_ptr -> tx_block_pool_available_list =  (UCHAR *) pool_start;
    }
    else
    {

        /* Not enough memory for one block, return appropriate error.  */
        return(TX_SIZE_ERROR);
    }
    
    /* Disable interrupts to place the block pool on the created list.  */
    TX_DISABLE

    /* Setup the block pool ID to make it valid.  */
    pool_ptr -> tx_block_pool_id =  TX_BLOCK_POOL_ID;

    /* Pickup the created count.  */
    created_count =  _tx_block_pool_created_count++;

    /* Place the block pool on the list of created block pools.  First,
       check for an empty list.  */
    if (created_count == 0)
    {

        /* The created block pool list is empty.  Add block pool to empty list.  */
        _tx_block_pool_created_ptr =                  pool_ptr;
        pool_ptr -> tx_block_pool_created_next =      pool_ptr;
        pool_ptr -> tx_block_pool_created_previous =  pool_ptr;
    }
    else
    {

        /* This list is not NULL, add to the end of the list.  */
        next_pool =      _tx_block_pool_created_ptr;
        previous_pool =  next_pool -> tx_block_pool_created_previous;

        /* Place the new block pool in the list.  */
        next_pool -> tx_block_pool_created_previous =  pool_ptr;
        previous_pool -> tx_block_pool_created_next =  pool_ptr;

        /* Setup this block pool's created links.  */
        pool_ptr -> tx_block_pool_created_previous =  previous_pool;
        pool_ptr -> tx_block_pool_created_next =      next_pool;
    }

    /* Optional block pool create extended processing.  */
    TX_BLOCK_POOL_CREATE_EXTENSION(pool_ptr)

    /* If trace is enabled, register this object.  */
    TX_TRACE_OBJECT_REGISTER(TX_TRACE_OBJECT_TYPE_BLOCK_POOL, pool_ptr, name_ptr, pool_size, block_size)

    /* If trace is enabled, insert this event into the trace buffer.  */
    TX_TRACE_IN_LINE_INSERT(TX_TRACE_BLOCK_POOL_CREATE, pool_ptr, pool_start, blocks, block_size, TX_TRACE_BLOCK_POOL_EVENTS)

    /* Restore interrupts.  */
    TX_RESTORE

    /* Return TX_SUCCESS.  */
    return(TX_SUCCESS);
}

