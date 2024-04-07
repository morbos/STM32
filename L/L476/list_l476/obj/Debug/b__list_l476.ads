pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: Community 2018 (20180524-73)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_list_l476" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   procedure main;
   pragma Export (C, main, "main");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  gnat%s
   --  interfaces%s
   --  interfaces.bit_types%s
   --  system%s
   --  ada.io_exceptions%s
   --  interfaces.stm32%s
   --  system.bb%s
   --  system.bb.board_parameters%s
   --  system.bb.cpu_specific%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.secondary_stack%s
   --  system.secondary_stack%b
   --  gnat.debug_utilities%s
   --  gnat.debug_utilities%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  interfaces.stm32.gpio%s
   --  interfaces.stm32.pwr%s
   --  interfaces.stm32.rcc%s
   --  interfaces.stm32.usart%s
   --  system.bb.mcu_parameters%s
   --  system.bb.mcu_parameters%b
   --  system.stm32%s
   --  system.bb.parameters%s
   --  system.stm32%b
   --  system.text_io%s
   --  system.text_io%b
   --  system.io%s
   --  system.io%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.multiprocessors%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  ada.exceptions%s
   --  system.val_util%s
   --  system.val_uns%s
   --  ada.tags%s
   --  system.bb.time%s
   --  system.bb.protection%s
   --  system.bb.interrupts%s
   --  system.bb.board_support%s
   --  system.multiprocessors%b
   --  system.multiprocessors.spin_locks%s
   --  system.multiprocessors.spin_locks%b
   --  system.multiprocessors.fair_locks%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.bb.cpu_primitives%s
   --  system.bb.cpu_primitives.context_switch_trigger%s
   --  system.bb.cpu_primitives.context_switch_trigger%b
   --  system.bb.board_support%b
   --  ada.exceptions.last_chance_handler%s
   --  system.wch_stw%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.memory%s
   --  system.memory%b
   --  system.val_util%b
   --  system.val_uns%b
   --  ada.tags%b
   --  system.bb.timing_events%s
   --  system.bb.threads%s
   --  system.bb.threads.queues%s
   --  system.bb.threads.queues%b
   --  system.bb.interrupts%b
   --  system.bb.cpu_primitives%b
   --  system.os_interface%s
   --  ada.exceptions.last_chance_handler%b
   --  system.task_primitives%s
   --  system.wch_stw%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.standard_library%b
   --  ada.exceptions%b
   --  system.bb.timing_events%b
   --  system.bb.time%b
   --  system.bb.protection%b
   --  system.bb.threads%b
   --  system.multiprocessors.fair_locks%b
   --  system.tasking%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.soft_links%b
   --  system.task_primitives.operations%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  hal%s
   --  hal.spi%s
   --  utils%s
   --  utils%b
   --  gen_list%s
   --  gen_list%b
   --  list_l476%b
   --  END ELABORATION ORDER

end ada_main;
