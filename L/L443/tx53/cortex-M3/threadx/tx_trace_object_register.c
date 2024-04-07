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

#define TX_SOURCE_CODE


/* Include necessary system files.  */

#include "tx_api.h"
#include "tx_trace.h"


/**************************************************************************/ 
/*                                                                        */ 
/*  FUNCTION                                               RELEASE        */ 
/*                                                                        */ 
/*    _tx_trace_object_register                           PORTABLE C      */ 
/*                                                           5.3          */ 
/*  AUTHOR                                                                */ 
/*                                                                        */ 
/*    William E. Lamie, Express Logic, Inc.                               */ 
/*                                                                        */ 
/*  DESCRIPTION                                                           */ 
/*                                                                        */ 
/*    This function registers a ThreadX system object in the trace        */ 
/*    registry area. This provides a mapping between the object pointers  */ 
/*    stored in each trace event to the actual ThreadX objects.           */ 
/*                                                                        */ 
/*  INPUT                                                                 */ 
/*                                                                        */ 
/*    object_type                           Type of system object         */ 
/*    object_ptr                            Address of system object      */ 
/*    object_name                           Name of system object         */ 
/*    parameter_1                           Supplemental parameter 1      */ 
/*    parameter_2                           Supplemental parameter 2      */ 
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
/*                                            modified code to ensure     */ 
/*                                            universal trace format,     */ 
/*                                            resulting in version 5.2    */ 
/*  07-04-2009     William E. Lamie         Modified comment(s),          */ 
/*                                            resulting in version 5.3    */ 
/*                                                                        */ 
/**************************************************************************/ 
VOID  _tx_trace_object_register(UCHAR object_type, VOID *object_ptr, CHAR *object_name, ULONG parameter_1, ULONG parameter_2)
{

#ifdef TX_ENABLE_EVENT_TRACE

UINT        i, entries;
UINT        found;


    /* Determine if the registry area is setup.  */
    if (_tx_trace_registry_start_ptr == TX_NULL)
    {

        /* No, registry is not setup, simply return.  */
        return;
    }

    /* Calculate the total entries.  */
    entries =  _tx_trace_registry_end_ptr - _tx_trace_registry_start_ptr;

    /* Initialize found to the max entries... indicating no space was found.  */
    found =  entries;

    /* Loop to find available entry.  */
    for (i = 0; i < entries; i++)
    {

        /* Determine if this entry matches the object pointer... we must reuse old entries left in the 
           registry.  */
        if (_tx_trace_registry_start_ptr[i].tx_trace_thread_registry_entry_object_pointer == (ULONG) object_ptr)
        {

            /* Set found to this index and break out of the loop.  */
            found =  i;

            break;
        }

        /* Is this entry available?  */
        if (_tx_trace_registry_start_ptr[i].tx_trace_object_registry_entry_object_available)
        {

            /* Yes, determine if we have not already found an empty slot.  */
            if (found == entries)
                found =  i;
            else if (_tx_trace_registry_start_ptr[found].tx_trace_object_registry_entry_object_type)
                found =  i;
        }
    }

    /* Now determine if an empty or reuse entry has been found.  */
    if (found < entries)
    {

        /* Yes, an entry has been found... populate it!  */
        _tx_trace_registry_start_ptr[found].tx_trace_object_registry_entry_object_available =    TX_FALSE;
        _tx_trace_registry_start_ptr[found].tx_trace_object_registry_entry_object_type =         object_type;
        _tx_trace_registry_start_ptr[found].tx_trace_thread_registry_entry_object_pointer =      (ULONG) object_ptr;
        _tx_trace_registry_start_ptr[found].tx_trace_object_registry_entry_object_parameter_1 =  parameter_1;
        _tx_trace_registry_start_ptr[found].tx_trace_object_registry_entry_object_parameter_2 =  parameter_2;

        /* Loop to copy the object name string...  */
        for (i = 0; i < TX_TRACE_OBJECT_REGISTRY_NAME-1; i++)
        {

            /* Copy a character of the name.  */
            _tx_trace_registry_start_ptr[found].tx_trace_thread_registry_entry_object_name[i] =  (UCHAR) object_name[i];

            /* Determine if we are at the end.  */
            if (object_name[i] == (UCHAR) 0)
                break;
        }

        /* Null terminate the object string.  */
        _tx_trace_registry_start_ptr[found].tx_trace_thread_registry_entry_object_name[i] =  (UCHAR) 0;
    }
#endif
}

