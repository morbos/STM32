                        Express Logic's ThreadX  

1. Revision History

For installation and usage please see the readme_threadx.txt file included
in your distribution. For port-specific version information, please refer
to the bottom of readme_threadx.txt. The ThreadX generic code version 
information is as follows:

07/04/2009  ThreadX generic code version 5.3. This release includes the following 
            modifications:

            tx_api.h                                        Changed the start of user trace events to 4096.
            tx_thread_system_resume.c                       Fixed problem of not clearing a pending timer 
                                                            registration when a thread suspension is interrupted.
            tx_trace.h                                      Removed FileX & NetX event IDs since they are defined 
                                                            elsewhere, and corrected priority assignment in event 
                                                            trace.
            tx_trace_buffer_full_notify.c                   Added conditional so that the function is only compiled once.
            tx_trace_enable.c                               Added trace include source define, and changed trace buffer 
                                                            initialization so partial trace buffers are processed properly.
            tx_trace_event_filter.c                         Added conditional so that the function is only compiled once.
            tx_trace_event_unfilter.c                       Added conditional so that the function is only compiled once.
            tx*.c                                           Changed comments and copyright header.
            tx*.h                                           Changed comments and copyright header.

12/12/2008  ThreadX generic code version 5.2. This release includes the following 
            modifications:

            tx_api.h                                        Added various trace constants.
            tx_initialize.h                                 Added new macro for defining port-specific data 
                                                            and port-specific initialization processing.
            tx_queue.h                                      Added macro for copying queue message.
            tx_thread.h                                     Added new system resume and suspend function 
                                                            prototypes, changed macro MOD32 to TX_MOD32_BIT_SET, 
                                                            added TX_DIV32_BIT_SET macro, removed old lowest bit 
                                                            set table, added new state change macro, added macro 
                                                            to pickup current thread, added macro to clear the 
                                                            current thread, added stack checking macro, and added 
                                                            new macro for calculating the lowest bit set.
            tx_trace.h                                      Added new event definitions, changed types 
                                                            to ensure the trace has universal format, 
                                                            optimized event macro, and added filter 
                                                            logic and new function prototypes.
            tx_user.h                                       Added new defines, and removed TX_USE_PRESET_DATA
                                                            since it is no longer required.
            tx_block_allocate.c                             Added macro to get current thread, added filter 
                                                            option to trace insert, added optional logic for 
                                                            non-interruptable operation, and made several 
                                                            optimizations.
            tx_block_pool_cleanup.c                         Added logic to keep suspension list in order, 
                                                            added optional logic for non-interruptable operation, 
                                                            and made several optimizations.
            tx_block_pool_create.c                          Added parameter to trace registry, added filter option 
                                                            to trace insert, treat the zero blocks situation as an 
                                                            error, and made several optimizations.
            tx_block_pool_delete.c                          Added filter option to trace insert, added optional 
                                                            logic for non-interruptable operation, and made several  
                                                            optimizations.
            tx_block_pool_info_get.c                        Added filter option to trace insert.
            tx_block_pool_performance_info_get.c            Added filter option to trace insert.
            tx_block_pool_performance_system_info_get.c     Added filter option to trace insert.
            tx_block_pool_prioritize.c                      Added filter option to trace insert, and made several 
                                                            optimizations.
            tx_block_release.c                              Added filter option to trace insert, added optional  
                                                            logic for non-interruptable operation, and made several  
                                                            optimizations.
            tx_byte_allocate.c                              Added macro to get current thread, added filter option 
                                                            to trace insert, added optional logic for non-interruptable 
                                                            operation, and made several optimizations.
            tx_byte_pool_cleanup.c                          Added logic to keep suspension list in order, added 
                                                            optional logic for non-interruptable operation, and made 
                                                            several optimizations.
            tx_byte_pool_create.c                           Added filter option to trace insert, and made several  
                                                            optimizations.
            tx_byte_pool_delete.c                           Added filter option to trace insert, added optional logic 
                                                            for non-interruptable operation, and made several  
                                                            optimizations.
            tx_byte_pool_info_get.c                         Added filter option to trace insert.
            tx_byte_pool_performance_info_get.c             Added filter option to trace insert.
            tx_byte_pool_performance_system_info_get.c      Added filter option to trace insert.
            tx_byte_pool_prioritize.c                       Added filter option to trace insert, and made several 
                                                            optimizations.
            tx_byte_pool_search.c                           Added macro to get current thread, and made several 
                                                            optimizations.
            tx_byte_release.c                               Added macro to get current thread, added filter option 
                                                            to trace insert, added optional logic for 
                                                            non-interruptable operation, and made several  
                                                            optimizations.
            tx_event_flags_cleanup.c                        Added logic to handle wait aborts on event flag 
                                                            suspension from ISRs, added logic to keep suspension 
                                                            list in order, added optional logic for non-interruptable 
                                                            operation, and made several optimizations.
            tx_event_flags_create.c                         Added filter option to trace insert, and made several  
                                                            optimizations.
            tx_event_flags_delete.c                         Added filter option to trace insert, added optional  
                                                            logic for non-interruptable operation, and made 
                                                            several optimizations.
            tx_event_flags_get.c                            Added macro to get current thread, added filter 
                                                            option to trace insert, added optional logic for 
                                                            non-interruptable operation, and made several  
                                                            optimizations.
            tx_event_flags_info_get.c                       Added filter option to trace insert.
            tx_event_flags_performance_info_get.c           Added filter option to trace insert.
            tx_event_flags_performance_system_info_get.c    Added filter option to trace insert.
            tx_event_flags_set.c                            Added filter option to trace insert, added check for  
                                                            threads whose suspension was aborted from an ISR  
                                                            during the search for satisfied requests, added  
                                                            optional logic for non-interruptable operation, 
                                                            and made several optimizations.
            tx_event_flags_set_notify.c                     Added filter option to trace insert.
            tx_initialize_kernel_enter.c                    Added macros for port-specific initialization use.
            tx_initialize_kernel_setup.c                    Added macros for port-specific initialization use.
            tx_mutex_cleanup.c                              Added logic to keep suspension list in order, added 
                                                            optional logic for non-interruptable operation, 
                                                            and made several optimizations.
            tx_mutex_create.c                               Added filter option to trace insert, and made 
                                                            several optimizations.
            tx_mutex_delete.c                               Added filter option to trace insert, added optional  
                                                            logic for non-interruptable operation, and made 
                                                            several optimizations.
            tx_mutex_get.c                                  Added macro to get current thread, added filter 
                                                            option to trace insert, added optional logic for 
                                                            non-interruptable operation, and made several  
                                                            optimizations.
            tx_mutex_info_get.c                             Added filter option to trace insert.
            tx_mutex_performance_info_get.c                 Added filter option to trace insert.
            tx_mutex_performance_system_info_get.c          Added filter option to trace insert.
            tx_mutex_prioritize.c                           Added filter option to trace insert, and made 
                                                            several optimizations.
            tx_mutex_priority_change.c                      Added optional logic for non-interruptable operation, 
                                                            and made several optimizations.
            tx_mutex_put.c                                  Added macro to get current thread, optimized the 
                                                            normal no priority-inheritance path, added filter 
                                                            option to trace insert, added optional logic for  
                                                            non-interruptable operation, and made several other
                                                            optimizations.
            tx_queue_cleanup.c                              Added logic to keep suspension list in order, added 
                                                            optional logic for non-interruptable operation, 
                                                            and made several optimizations.
            tx_queue_create.c                               Added parameter to trace registry, added filter  
                                                            option to trace insert, and made several 
                                                            optimizations.
            tx_queue_delete.c                               Added filter option to trace insert, added optional 
                                                            logic for non-interruptable operation, and made 
                                                            several optimizations.
            tx_queue_flush.c                                Added optional logic for non-interruptable operation, 
                                                            and added filter option to trace insert.
            tx_queue_front_send.c                           Added macro to get current thread, made several 
                                                            optimizations, added filter option to trace insert, 
                                                            added optional logic for non-interruptable 
                                                            operation, and added macros for message copying.
            tx_queue_info_get.c                             Added filter option to trace insert.
            tx_queue_performance_info_get.c                 Added filter option to trace insert.
            tx_queue_performance_system_info_get.c          Added filter option to trace insert.
            tx_queue_prioritize.c                           Added filter option to trace insert, and made 
                                                            several optimizations.
            tx_queue_receive.c                              Added macro to get current thread, made several 
                                                            optimizations, corrected the performance 
                                                            information names, added filter option to trace  
                                                            insert, added optional logic for non-interruptable  
                                                            operation, and added macros for message copying.
            tx_queue_send.c                                 Added macro to get current thread, made several 
                                                            optimizations, added filter option to trace 
                                                            insert, added optional logic for non-interruptable  
                                                            operation, and added macros for message copying.
            tx_queue_send_notify.c                          Added filter option to trace insert.
            tx_semaphore_ceiling_put.c                      Added filter option to trace insert, added optional 
                                                            logic for non-interruptable operation, and made 
                                                            several optimizations.
            tx_semaphore_cleanup.c                          Added logic to keep suspension list in order, added 
                                                            optional logic for non-interruptable operation, 
                                                            and made several optimizations.
            tx_semaphore_create.c                           Added filter option to trace insert, and made 
                                                            several optimizations.
            tx_semaphore_delete.c                           Added filter option to trace insert, added optional 
                                                            logic for non-interruptable operation, and made 
                                                            several optimizations.
            tx_semaphore_get.c                              Added macro to get current thread, added filter 
                                                            option to trace insert, added optional logic for 
                                                            non-interruptable operation, and made several  
                                                            optimizations.
            tx_semaphore_info_get.c                         Added filter option to trace insert.
            tx_semaphore_performance_info_get.c             Added filter option to trace insert.
            tx_semaphore_performance_system_info_get.c      Added filter option to trace insert.
            tx_semaphore_prioritize.c                       Added filter option to trace insert, and made 
                                                            several optimizations.
            tx_semaphore_put.c                              Added filter option to trace insert, added optional  
                                                            logic for non-interruptable operation, and made 
                                                            several optimizations.
            tx_semaphore_put_notify.c                       Added filter option to trace insert.
            tx_thread_create.c                              Added filter option to trace insert, moved extension 
                                                            processing to interrupt enabled area, added logic  
                                                            to align stack pointers for stack checking, added  
                                                            optional logic for non-interruptable operation, 
                                                            and made several optimizations.
            tx_thread_delete.c                              Added filter option to trace insert, moved extension
                                                            processing to interrupt enabled area, and made  
                                                            several optimizations.
            tx_thread_entry_exit_notify.c                   Added filter option to trace insert.
            tx_thread_identify.c                            Added filter option to trace insert, expanded interrupt
                                                            disable area, and added macro to get current thread.
            tx_thread_info_get.c                            Added filter option to trace insert.
            tx_thread_initialize.c                          Added macro to set current thread, added new bit 
                                                            assignments for _tx_build_options, and removed logic 
                                                            to setup the lowest bit set table since it is no 
                                                            longer required.
            tx_thread_performance_info_get.c                Added filter option to trace insert.
            tx_thread_performance_system_info_get.c         Added filter option to trace insert.
            tx_thread_preemption_change.c                   Added filter option to trace insert, changed MOD32 
                                                            macro to new TX_MOD32_BIT_SET macro, removed code 
                                                            for interrupt preemption performance counter updates, 
                                                            added logic to handle restoring preemption-threshold 
                                                            values during priority inheritance, and added 
                                                            TX_DIV32_BIT_SET macro.
            tx_thread_priority_change.c                     Added filter option to trace insert, added optional 
                                                            logic for non-interruptable operation, and made 
                                                            several optimizations.
            tx_thread_relinquish.c                          Added macro to get current thread, moved relinquish 
                                                            trace event, added next thread parameter, added 
                                                            filter option to trace insert, added stack check
                                                            macro, and removed unnecessary code.
            tx_thread_reset.c                               Added filter option to trace insert, and added 
                                                            macro to get current thread.
            tx_thread_resume.c                              Added macro to get current thread, added state 
                                                            change macro, added filter option to trace insert, 
                                                            added optional logic for non-interruptable 
                                                            operation, and added optional in-line thread 
                                                            suspension logic.
            tx_thread_shell_entry.c                         Added macro to get current thread, added state 
                                                            change macro, cleared the timeout value to avoid 
                                                            a timeout on a completed thread, moved extension 
                                                            processing to interrupt enabled area, added 
                                                            optional logic for non-interruptable operation, 
                                                            and made several optimizations.
            tx_thread_sleep.c                               Added filter option to trace insert, added 
                                                            optional logic for non-interruptable operation, 
                                                            and added macro to get current thread.
            tx_thread_stack_analyze.c                       Made optimization.
            tx_thread_stack_error_handler.c                 Removed spin loop.
            tx_thread_stack_error_notify.c                  Added filter option to trace insert.
            tx_thread_suspend.c                             Added macro to get current thread, added filter 
                                                            option to trace insert, added state change macro, 
                                                            added optional logic for non-interruptable 
                                                            operation, and added optional in-line thread 
                                                            suspension logic.
            tx_thread_system_preempt_check.c                Added macro to get current thread, added null next 
                                                            thread check, added stack check macro, and optimized 
                                                            flag processing.
            tx_thread_system_resume.c                       Added macro to get current thread, added state 
                                                            change macro, added optional logic for 
                                                            non-interruptable operation, added filter option 
                                                            to trace insert, added next thread to system 
                                                            resume trace entry, changed MOD32 macro to new 
                                                            TX_MOD32_BIT_SET macro, added TX_DIV32_BIT_SET 
                                                            macro, added stack check macro, and optimized 
                                                            code for typical path processing.
            tx_thread_system_suspend.c                      Added macro to get current thread, added state 
                                                            change macro, added filter option to trace
                                                            insert, added optional logic for non-interruptable  
                                                            operation, changed MOD32 macro to new 
                                                            TX_MOD32_BIT_SET macro, added TX_DIV32_BIT_SET 
                                                            macro, optimized lowest set bit logic, added 
                                                            stack check macro, and optimized code for typical 
                                                            path processing.
            tx_thread_terminate.c                           Added state change macro, added filter option 
                                                            to trace insert, moved extension processing 
                                                            to interrupt enabled area, added optional logic 
                                                            for non-interruptable operation, and made 
                                                            several optimizations.
            tx_thread_time_slice.c                          Added macro to get current thread, added event 
                                                            trace call, added filter option to trace insert, 
                                                            added stack check macro, and added thread pointer 
                                                            check in stack checking logic.
            tx_thread_time_slice_change.c                   Added filter option to trace insert, and added 
                                                            macro to get current thread.
            tx_thread_timeout.c                             Added optional logic for non-interruptable 
                                                            operation.
            tx_thread_wait_abort.c                          Added optional logic for non-interruptable 
                                                            operation, and added filter option to trace 
                                                            insert.
            tx_time_get.c                                   Added filter option to trace insert.
            tx_time_set.c                                   Added filter option to trace insert.
            tx_timer_activate.c                             Added filter option to trace insert.
            tx_timer_change.c                               Added filter option to trace insert.
            tx_timer_create.c                               Added filter option to trace insert, and 
                                                            made several optimizations.
            tx_timer_deactivate.c                           Added filter option to trace insert, and  
                                                            made several optimizations.
            tx_timer_delete.c                               Added filter option to trace insert, and 
                                                            made several optimizations.
            tx_timer_expiration.c                           Added optional logic for non-interruptable 
                                                            operation, and made several optimizations.
            tx_timer_info_get.c                             Added filter option to trace insert.
            tx_timer_performance_info_get.c                 Added filter option to trace insert.
            tx_timer_performance_system_info_get.c          Added filter option to trace insert.
            tx_timer_system_activate.c                      Made several optimizations.
            tx_timer_system_deactivate.c                    Made several optimizations.
            tx_timer_thread_entry.c                         Added optional logic for non-interruptable 
                                                            operation, and made several optimizations.
            tx_trace_buffer_full_notify.c                   Added new trace function.
            tx_trace_enable.c                               Added logic to setup event filter, and 
                                                            modified code to ensure universal trace 
                                                            format.
            tx_trace_event_filter.c                         Added new trace function.
            tx_trace_event_unfilter.c                       Added new trace function. 
            tx_trace_interrupt_control.c                    Added filter option to trace insert.
            tx_trace_isr_enter_insert.c                     Added parameters to ISR trace event.
            tx_trace_isr_exit_insert.c                      Added parameters to ISR trace event.
            tx_trace_object_register.c                      Modified code to ensure universal trace format.
            tx_trace_object_unregister.c                    Modified code to ensure universal trace format.
            tx_trace_user_event_insert.c                    Added interrupt restore in error path, and  
                                                            added filter option to trace insert.
            txe_block_allocate.c                            Added macro to get current thread.
            txe_block_pool_create.c                         Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_block_pool_delete.c                         Added macro to get current thread.
            txe_byte_allocate.c                             Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_byte_pool_create.c                          Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_byte_pool_delete.c                          Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_byte_release.c                              Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_event_flags_create.c                        Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_event_flags_delete.c                        Added macro to get current thread.
            txe_event_flags_get.c                           Added macro to get current thread.
            txe_mutex_create.c                              Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_mutex_delete.c                              Added macro to get current thread.
            txe_mutex_get.c                                 Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_mutex_put.c                                 Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_queue_create.c                              Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_queue_delete.c                              Added macro to get current thread.
            txe_queue_front_send.c                          Added macro to get current thread.
            txe_queue_receive.c                             Added macro to get current thread.
            txe_queue_send.c                                Added macro to get current thread.
            txe_semaphore_create.c                          Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_semaphore_delete.c                          Added macro to get current thread.
            txe_semaphore_get.c                             Added macro to get current thread.
            txe_thread_create.c                             Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_thread_delete.c                             Made optimization to caller checking.
            txe_thread_preemption_change.c                  Made optimization to caller checking, added 
                                                            logic to handle restoring preemption- 
                                                            threshold values during priority inheritance.
            txe_thread_priority_change.c                    Made optimization to caller checking.
            txe_thread_relinquish.c                         Added macro to get current thread.
            txe_thread_reset.c                              Added macro to get current thread, and added 
                                                            logic to detect calls from timer thread.
            txe_thread_terminate.c                          Made optimization to caller checking.
            txe_thread_time_slice_change.c                  Made optimization to caller checking.
            txe_timer_change.c                              Made optimization to caller checking.
            txe_timer_create.c                              Made optimization to timer thread checking, 
                                                            and added macro to get current thread.
            txe_timer_delete.c                              Added macro to get current thread.
            tx*.c                                           Changed comments and copyright header.
            tx*.h                                           Changed comments and copyright header.

04/02/2007  ThreadX generic code version 5.1. This release includes the following 
            modifications:

            tx_api.h                                        Replaced UL constant modifier with ULONG cast.
            tx_block_pool.h                                 Replaced UL constant modifier with ULONG cast.
            tx_byte_pool.h                                  Replaced UL constant modifier with ULONG cast.
            tx_event_flags.h                                Replaced UL constant modifier with ULONG cast.
            tx_initialize.h                                 Replaced UL constant modifier with ULONG cast.
            tx_mutex.h                                      Replaced UL constant modifier with ULONG cast.
            tx_queue.h                                      Replaced UL constant modifier with ULONG cast.
            tx_semaphore.h                                  Replaced UL constant modifier with ULONG cast.
            tx_thread.h                                     Replaced UL constant modifier with ULONG cast
                                                            and added logic to use preset global C data.
            tx_timer.h                                      Replaced UL constant modifier with ULONG cast.
            tx_user.h                                       Added two new conditional build options, 
                                                            TX_NO_TIMER and TX_USE_PRESET_DATA.
            tx_byte_pool_search.c                           Added optimization for memory search pointer
                                                            update.
            tx_byte_release.c                               Added optimization for memory search pointer
                                                            update.
            tx_event_flags_get.c                            Added logic for calling from ISRs.
            tx_event_flags_info_get.c                       Added logic to accurately report the currently 
                                                            set flags in the group.
            tx_event_flags_set.c                            Corrected problem clearing event flags from ISRs.
            tx_initialize_high_level.c                      Added logic to remove the timer logic.
            tx_queue_front_send.c                           Modify code to not remove the oldest message 
                                                            from the queue in order to avoid losing messages
                                                            during timeout processing and optimized message
                                                            copying.
            tx_queue_receive.c                              Check for queue front send suspension request
                                                            and optimized message copying.
            tx_queue_send.c                                 Initialize suspension option field to indicate 
                                                            type of suspension and optimized message
                                                            copying.
            tx_thread_create.c                              Added setup for original priority and threshold.
            tx_thread_initialize.c                          Added logic to use preset global C data.
            tx_thread_preemption_change.c                   Added logic to update and use the original preemption-
                                                            threshold, and corrected problem of not setting 
                                                            preemption-threshold bit when lowering the thread 
                                                            preemption-threshold.
            tx_thread_priority_change.c                     Added logic to update and use the original priority.
            tx_thread_stack_error_notify.c                  Added included of tx_trace.h.
            tx_thread_system_resume.c                       Fixed conditional declaration of map_index, and
                                                            added logic to remove the timer logic.
            tx_thread_system_suspend.c                      Fixed conditional declaration of map_index, and
                                                            added logic to remove the timer logic.
            txe_timer_change.c                              Replaced UL constant modifier with ULONG cast.
            tx*.c                                           Changed comments and copyright header.
            tx*.h                                           Changed comments and copyright header.

12/12/2005  Initial ThreadX generic code version 5.0. This release includes the 
            the following fixes from generic code version 4.0c:

            tx_mutex_create.c                               Properly initialize mutex owner field to NULL.
            tx_mutex_put.c                                  Set the mutex owner to NULL on put operation.


Copyright(c) 1996-2009 Express Logic, Inc.


Express Logic, Inc.
11423 West Bernardo Court
San Diego, CA  92127

www.expresslogic.com


