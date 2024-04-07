pragma Warnings (Off);
pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: Community 2019 (20190517-74)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_test_s" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  interfaces.bit_types%s
   --  system%s
   --  ada.exceptions%s
   --  ada.exceptions%b
   --  interfaces.stm32%s
   --  system.bb%s
   --  system.bb.board_parameters%s
   --  system.bb.cpu_specific%s
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.secondary_stack%s
   --  system.secondary_stack%b
   --  ada.tags%s
   --  ada.tags%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.unsigned_types%s
   --  interfaces.stm32.pwr%s
   --  interfaces.stm32.rcc%s
   --  system.bb.mcu_parameters%s
   --  system.bb.mcu_parameters%b
   --  system.stm32%s
   --  system.bb.parameters%s
   --  system.stm32%b
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
   --  system.bb.cpu_primitives%b
   --  system.bb.interrupts%b
   --  system.bb.protection%b
   --  system.bb.threads%b
   --  system.bb.time%b
   --  system.multiprocessors%b
   --  system.multiprocessors.fair_locks%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.real_time.delays%s
   --  ada.real_time.delays%b
   --  system.assertions%s
   --  system.assertions%b
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
   --  hal%s
   --  stm32%s
   --  stm32_svd%s
   --  stm32_svd.dac%s
   --  stm32_svd.exti%s
   --  stm32_svd.gpio%s
   --  stm32_svd.gtzc%s
   --  stm32_svd.i2c%s
   --  stm32_svd.mpu%s
   --  stm32_svd.nvic%s
   --  stm32_svd.pka%s
   --  stm32_svd.pwr%s
   --  stm32_svd.rcc%s
   --  stm32_svd.rng%s
   --  stm32_svd.sau%s
   --  stm32_svd.spi%s
   --  stm32_svd.syscfg%s
   --  hal.gpio%s
   --  hal.i2c%s
   --  hal.spi%s
   --  stm32.dac%s
   --  stm32.dac%b
   --  stm32.exti%s
   --  stm32.exti%b
   --  stm32.i2c%s
   --  stm32.i2c%b
   --  stm32.mpu%s
   --  stm32.mpu%b
   --  stm32.rcc%s
   --  stm32.rcc%b
   --  stm32.sau%s
   --  stm32.sau%b
   --  stm32.setup%s
   --  stm32.spi%s
   --  stm32.spi%b
   --  stm32.gpio%s
   --  stm32.device%s
   --  stm32.device%b
   --  stm32.syscfg%s
   --  stm32.syscfg%b
   --  stm32.gpio%b
   --  stm32.board%s
   --  stm32.board%b
   --  stm32.rng%s
   --  stm32.rng%b
   --  stm32.pka%s
   --  stm32.pka%b
   --  curve%s
   --  curve%b
   --  test_s%b
   --  END ELABORATION ORDER

end ada_main;
