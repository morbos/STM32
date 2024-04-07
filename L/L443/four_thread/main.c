
#include   "tx_api.h"

typedef unsigned char   u8;
typedef unsigned short  u16;
typedef unsigned int    u32;
typedef char            s8;
typedef short           s16;
typedef int             s32;

#define     DEMO_STACK_SIZE         1024
#define     DEMO_BYTE_POOL_SIZE     9120
#define     DEMO_BLOCK_POOL_SIZE    100
#define     DEMO_QUEUE_SIZE         100

TX_SEMAPHORE            semaphore;

/* Define the ThreadX object control blocks...  */

TX_THREAD               thread1;
TX_THREAD               thread2;
TX_THREAD               thread3;
TX_THREAD               thread4;
TX_BYTE_POOL            byte_pool;

/* Define the counters used in the demo application...  */

ULONG           thread_counter;

extern char _tx_version_id[];
char *p = _tx_version_id;
/* Define thread prototypes.  */

void    thread1_entry(ULONG thread_input);
void    thread2_entry(ULONG thread_input);
void    thread3_entry(ULONG thread_input);
void    thread4_entry(ULONG thread_input);

int
main()
{
    /* Enter the ThreadX kernel.  */
    tx_kernel_enter();
}


/* Define what the initial system looks like.  */
void
tx_application_define(void *first_unused_memory)
{
    CHAR        *pointer;
    /* Create a byte memory pool from which to allocate the thread stacks.  */
    tx_byte_pool_create(&byte_pool, "byte pool", first_unused_memory, DEMO_BYTE_POOL_SIZE);
    /* Put system definition stuff in here, e.g. thread creates and other 
       assorted create information.  */
    /* Allocate the stack for thread 0.  */
    tx_byte_allocate(&byte_pool, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
    /* Create the main thread.  */
    tx_thread_create(&thread1, "thread1", thread1_entry, 0,  
                     pointer, DEMO_STACK_SIZE, 
                     1, 1, TX_NO_TIME_SLICE, TX_AUTO_START);
    tx_byte_allocate(&byte_pool, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
    tx_thread_create(&thread2, "thread2", thread2_entry, 0,  
                     pointer, DEMO_STACK_SIZE, 
                     2, 2, TX_NO_TIME_SLICE, TX_AUTO_START);
    tx_byte_allocate(&byte_pool, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
    tx_thread_create(&thread3, "thread3", thread3_entry, 0,  
                     pointer, DEMO_STACK_SIZE, 
                     3, 3, TX_NO_TIME_SLICE, TX_AUTO_START);
    tx_byte_allocate(&byte_pool, (VOID **) &pointer, DEMO_STACK_SIZE, TX_NO_WAIT);
    tx_thread_create(&thread4, "thread4", thread4_entry, 0,  
                     pointer, DEMO_STACK_SIZE, 
                     4, 4, TX_NO_TIME_SLICE, TX_AUTO_START);
    /* Create the semaphore */
    tx_semaphore_create(&semaphore, "semaphore", 1);

}

/* Define the test threads.  */

void
thread1_entry(ULONG thread_input)
{
    UINT        status;
    UINT        i;
    /* This thread simply sits in while-forever-sleep loop.  */
    while(1) {
        /* Get the semaphore with suspension.  */
        status = tx_semaphore_get(&semaphore, TX_WAIT_FOREVER);
        if(status != TX_SUCCESS) {
            break;
        }
        /* Release the semaphore.  */
        status = tx_semaphore_put(&semaphore);
        if(status != TX_SUCCESS) {
            break;
        }
        tx_thread_sleep(1);
    }
}
void
thread2_entry(ULONG thread_input)
{
    UINT        status;

    /* This thread simply sits in while-forever-sleep loop.  */
    while(1) {
        /* Get the semaphore with suspension.  */
        status = tx_semaphore_get(&semaphore, TX_WAIT_FOREVER);
        if(status != TX_SUCCESS) {
            break;
        }
        /* Release the semaphore.  */
        status = tx_semaphore_put(&semaphore);
        if(status != TX_SUCCESS) {
            break;
        }
        tx_thread_sleep(100);
    }
}

void 
thread3_entry(ULONG thread_input)
{
    UINT        status;

    /* This thread simply sits in while-forever-sleep loop.  */
    while(1) {
        /* Get the semaphore with suspension.  */
        status = tx_semaphore_get(&semaphore, TX_WAIT_FOREVER);
        if(status != TX_SUCCESS) {
            break;
        }
        /* Release the semaphore.  */
        status = tx_semaphore_put(&semaphore);
        if(status != TX_SUCCESS) {
            break;
        }
        tx_thread_sleep(1000);
    }
}
void
thread4_entry(ULONG thread_input)
{
    UINT        status;

    /* This thread simply sits in while-forever-sleep loop.  */
    while(1) {
        /* Get the semaphore with suspension.  */
        status = tx_semaphore_get(&semaphore, TX_WAIT_FOREVER);
        if(status != TX_SUCCESS) {
            break;
        }
        /* Release the semaphore.  */
        status = tx_semaphore_put(&semaphore);
        if(status != TX_SUCCESS) {
            break;
        }
        tx_thread_sleep(10000);
    }
}
