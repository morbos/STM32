pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: Community 2019 (20190517-74)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_i2c_1306" & ASCII.NUL;
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
   --  system.img_uns%s
   --  system.img_uns%b
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
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.traceback%s
   --  system.traceback%b
   --  ada.tags%s
   --  system.bb.cpu_primitives%s
   --  system.bb.cpu_primitives.context_switch_trigger%s
   --  system.bb.cpu_primitives.context_switch_trigger%b
   --  system.bb.interrupts%s
   --  system.bb.protection%s
   --  system.multiprocessors%s
   --  system.bb.time%s
   --  system.bb.board_support%s
   --  system.bb.board_support%b
   --  system.bb.threads%s
   --  system.bb.threads.queues%s
   --  system.bb.threads.queues%b
   --  system.bb.timing_events%s
   --  system.bb.timing_events%b
   --  system.multiprocessors.spin_locks%s
   --  system.multiprocessors.spin_locks%b
   --  system.multiprocessors.fair_locks%s
   --  system.os_interface%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  ada.tags%b
   --  system.bb.cpu_primitives%b
   --  system.bb.interrupts%b
   --  system.bb.protection%b
   --  system.bb.threads%b
   --  system.bb.time%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.memory%s
   --  system.memory%b
   --  system.multiprocessors%b
   --  system.multiprocessors.fair_locks%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  system.val_uns%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.real_time.delays%s
   --  ada.real_time.delays%b
   --  system.assertions%s
   --  system.assertions%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.multiprocessors%s
   --  system.tasking.protected_objects.multiprocessors%b
   --  system.tasking.protected_objects.single_entry%s
   --  system.tasking.protected_objects.single_entry%b
   --  system.tasking.restricted%s
   --  system.tasking.restricted.stages%s
   --  system.tasking.restricted.stages%b
   --  ada.task_identification%s
   --  ada.task_identification%b
   --  ada.synchronous_task_control%s
   --  ada.synchronous_task_control%b
   --  system.interrupts%s
   --  system.interrupts%b
   --  ada.interrupts%s
   --  ada.interrupts%b
   --  ada.interrupts.names%s
   --  hal%s
   --  stm32%s
   --  stm32_svd%s
   --  stm32_svd.adc%s
   --  stm32_svd.crc%s
   --  stm32_svd.dma%s
   --  stm32_svd.exti%s
   --  stm32_svd.gpio%s
   --  stm32_svd.i2c%s
   --  stm32_svd.pwr%s
   --  stm32_svd.rcc%s
   --  stm32_svd.spi%s
   --  stm32_svd.syscfg%s
   --  hal.bitmap%s
   --  bitmap_color_conversion%s
   --  bitmap_color_conversion%b
   --  hal.framebuffer%s
   --  hal.gpio%s
   --  hal.i2c%s
   --  hal.spi%s
   --  hal.time%s
   --  ravenscar_time%s
   --  ravenscar_time%b
   --  soft_drawing_bitmap%s
   --  soft_drawing_bitmap%b
   --  memory_mapped_bitmap%s
   --  memory_mapped_bitmap%b
   --  ssd1306%s
   --  ssd1306%b
   --  fonts%s
   --  fonts.font1%s
   --  fonts%b
   --  stm32.adc%s
   --  stm32.crc%s
   --  stm32.crc%b
   --  stm32.dma%s
   --  stm32.dma%b
   --  stm32.exti%s
   --  stm32.exti%b
   --  stm32.i2c%s
   --  stm32.i2c%b
   --  stm32.rcc%s
   --  stm32.rcc%b
   --  stm32.setup%s
   --  stm32.spi%s
   --  stm32.spi%b
   --  stm32.timers%s
   --  stm32.timers%b
   --  stm32.gpio%s
   --  stm32.device%s
   --  stm32.device%b
   --  stm32.syscfg%s
   --  stm32.syscfg%b
   --  stm32.gpio%b
   --  peripherals%s
   --  stm32.board%s
   --  stm32.board%b
   --  last_chance_handler%s
   --  last_chance_handler%b
   --  stm32.subghzphy%s
   --  stm32.subghzphy%b
   --  stm32.subghzrf%s
   --  stm32.subghzrf%b
   --  radio_int%s
   --  radio_int%b
   --  i2c_1306%b
   --  END ELABORATION ORDER

end ada_main;
