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
#include "tx_byte_pool.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _txe_byte_pool_info_get                             PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function checks for errors in the byte pool information get    */ 
/*    service.                                                            */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    pool_ptr                          Pointer to byte pool control block*/ 
/*    name                              Destination for the pool name     */ 
/*    available_bytes                   Number of free bytes in byte pool */ 
/*    fragments                         Number of fragments in byte pool  */ 
/*    first_suspended                   Destination for pointer of first  */ 
/*                                        thread suspended on byte pool   */ 
/*    suspended_count                   Destination for suspended count   */ 
/*    next_pool                         Destination for pointer to next   */ 
/*                                        byte pool on the created list   */ 
/*                                                                        */ 
/*  OUTPUT                                                                */ 
/*                                                                        */ 
/*    TX_POOL_ERROR                     Invalid byte pool pointer         */ 
/*    status                            Completion status                 */ 
/*                                                                        */ 
/*  CALLS                                                                 */ 
/*                                                                        */ 
/*    _tx_byte_pool_info_get            Actual byte pool info get service */ 
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
/*  12-12-2008     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
UINT  _txe_byte_pool_info_get(TX_BYTE_POOL *pool_ptr, CHAR **name, ULONG *available_bytes, 
                    ULONG *fragments, TX_THREAD **first_suspended, 
                    ULONG *suspended_count, TX_BYTE_POOL **next_pool)
{

UINT    status;


    /* First, check for an invalid byte pool pointer.  */
    if ((!pool_ptr) || (pool_ptr -> tx_byte_pool_id != TX_BYTE_POOL_ID))
    {

        /* Block pool pointer is invalid, return appropriate error code.  */
        return(TX_POOL_ERROR);
    }

    /* Otherwise, call the actual byte pool information get service.  */
    status =  _tx_byte_pool_info_get(pool_ptr, name, available_bytes, 
                    fragments, first_suspended, suspended_count, next_pool);

    /* Return completion status.  */
    return(status);
}

