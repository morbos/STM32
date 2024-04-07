pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__server_wb55x.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__server_wb55x.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E229 : Short_Integer; pragma Import (Ada, E229, "ada__text_io_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "ada__tags_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__bb__timing_events_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "system__soft_links_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "system__exception_table_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "ada__streams_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "system__finalization_root_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "ada__finalization_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__storage_pools_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "system__finalization_masters_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__real_time_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "system__pool_global_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "system__tasking__protected_objects_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "system__tasking__protected_objects__multiprocessors_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "system__tasking__restricted__stages_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "hal__gpio_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "hal__i2c_E");
   E261 : Short_Integer; pragma Import (Ada, E261, "hal__real_time_clock_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "hal__spi_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "stm32__adc_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "stm32__exti_E");
   E257 : Short_Integer; pragma Import (Ada, E257, "stm32__hsem_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "stm32__i2c_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "stm32__ipcc_E");
   E263 : Short_Integer; pragma Import (Ada, E263, "stm32__power_control_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "stm32__rcc_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "stm32__rtc_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "stm32__spi_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__gpio_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "stm32__device_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__syscfg_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "last_chance_handler_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "sx1276_spi_io_E");
   E253 : Short_Integer; pragma Import (Ada, E253, "peripherals_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "utils_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "gen_list_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "uuid_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "comm_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "comm__ble_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "comm__hw_E");
   E275 : Short_Integer; pragma Import (Ada, E275, "exti_E");
   E252 : Short_Integer; pragma Import (Ada, E252, "hw_E");
   E283 : Short_Integer; pragma Import (Ada, E283, "lora_base_E");
   E281 : Short_Integer; pragma Import (Ada, E281, "lora_server_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "memory_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "hci_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "bluenrg_gatt_aci_E");
   E243 : Short_Integer; pragma Import (Ada, E243, "bluenrg_hal_aci_E");
   E271 : Short_Integer; pragma Import (Ada, E271, "bluenrg_l2cap_aci_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "comm__tl_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "comm__shci_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "comm__tl__int_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "hci_le_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "bluenrg_gap_aci_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "comm__run_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "comm__setup_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "log_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "main_E");
   E287 : Short_Integer; pragma Import (Ada, E287, "stm32l4_interrupts_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "sx1276_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "sx1276_spi_E");
   E285 : Short_Integer; pragma Import (Ada, E285, "sx1276_api_E");
   E291 : Short_Integer; pragma Import (Ada, E291, "comm__server_E");
   E289 : Short_Integer; pragma Import (Ada, E289, "serverhw_E");

   Sec_Default_Sized_Stacks : array (1 .. 8) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      procedure Install_Restricted_Handlers_Sequential;
      pragma Import (C,Install_Restricted_Handlers_Sequential, "__gnat_attach_all_handlers");

      Partition_Elaboration_Policy : Character;
      pragma Import (C, Partition_Elaboration_Policy, "__gnat_partition_elaboration_policy");

      procedure Activate_All_Tasks_Sequential;
      pragma Import (C, Activate_All_Tasks_Sequential, "__gnat_activate_all_tasks");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
      Partition_Elaboration_Policy := 'S';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 8;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Ada.Text_Io'Elab_Body;
      E229 := E229 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E115 := E115 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E101 := E101 + 1;
      System.Exception_Table'Elab_Body;
      E055 := E055 + 1;
      E057 := E057 + 1;
      Ada.Streams'Elab_Spec;
      E154 := E154 + 1;
      System.Finalization_Root'Elab_Spec;
      E163 := E163 + 1;
      Ada.Finalization'Elab_Spec;
      E161 := E161 + 1;
      System.Storage_Pools'Elab_Spec;
      E165 := E165 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E158 := E158 + 1;
      Ada.Real_Time'Elab_Body;
      E008 := E008 + 1;
      System.Pool_Global'Elab_Spec;
      E167 := E167 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E187 := E187 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E191 := E191 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E196 := E196 + 1;
      HAL.GPIO'ELAB_SPEC;
      E156 := E156 + 1;
      HAL.I2C'ELAB_SPEC;
      E174 := E174 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E261 := E261 + 1;
      HAL.SPI'ELAB_SPEC;
      E179 := E179 + 1;
      STM32.ADC'ELAB_SPEC;
      E132 := E132 + 1;
      E149 := E149 + 1;
      E257 := E257 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E173 := E173 + 1;
      E204 := E204 + 1;
      E263 := E263 + 1;
      E145 := E145 + 1;
      STM32.RTC'ELAB_SPEC;
      STM32.RTC'ELAB_BODY;
      E260 := E260 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E177 := E177 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E128 := E128 + 1;
      E147 := E147 + 1;
      STM32.GPIO'ELAB_BODY;
      E143 := E143 + 1;
      E005 := E005 + 1;
      SX1276_SPI_IO'ELAB_SPEC;
      E255 := E255 + 1;
      Peripherals'Elab_Spec;
      E253 := E253 + 1;
      E215 := E215 + 1;
      E213 := E213 + 1;
      E241 := E241 + 1;
      Comm'Elab_Spec;
      Exti'Elab_Spec;
      Lora_Server'Elab_Spec;
      Memory'Elab_Spec;
      Hci'Elab_Spec;
      E238 := E238 + 1;
      E243 := E243 + 1;
      E271 := E271 + 1;
      Comm.Tl.Int'Elab_Spec;
      E201 := E201 + 1;
      E235 := E235 + 1;
      E233 := E233 + 1;
      Comm.Run'Elab_Spec;
      E199 := E199 + 1;
      E209 := E209 + 1;
      E247 := E247 + 1;
      E249 := E249 + 1;
      E207 := E207 + 1;
      E273 := E273 + 1;
      E225 := E225 + 1;
      Main'Elab_Spec;
      Comm.Run'Elab_Body;
      E227 := E227 + 1;
      E245 := E245 + 1;
      E252 := E252 + 1;
      Memory'Elab_Body;
      E211 := E211 + 1;
      Stm32l4_Interrupts'Elab_Spec;
      E287 := E287 + 1;
      Main'Elab_Body;
      E183 := E183 + 1;
      E279 := E279 + 1;
      SX1276_SPI'ELAB_SPEC;
      E277 := E277 + 1;
      Exti'Elab_Body;
      E275 := E275 + 1;
      SX1276_API'ELAB_BODY;
      E285 := E285 + 1;
      E283 := E283 + 1;
      Lora_Server'Elab_Body;
      E281 := E281 + 1;
      E291 := E291 + 1;
      Serverhw'Elab_Spec;
      Serverhw'Elab_Body;
      E289 := E289 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_server_wb55x");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/ble_status.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/bluenrg_aci.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/bluenrg_gap.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/bluenrg_gatt_server.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/ogf_ocf.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/security.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/last_chance_handler.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/sx1276_spi_io.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/peripherals.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/utils.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/gen_list.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/uuid.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm-mbox.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/bluenrg_gatt_aci.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/bluenrg_hal_aci.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/bluenrg_l2cap_aci.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm-hw.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/hci_le.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/bluenrg_gap_aci.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/log.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm-ble.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm-shci.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm-tl.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm-tl-int.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/hci.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm-run.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm-setup.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/hw.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/memory.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/stm32l4_interrupts.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/main.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/sx1276.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/sx1276_spi.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/exti.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/sx1276_api.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/lora_base.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/lora_server.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/comm-server.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/serverhw.o
   --   /backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/server_wb55x.o
   --   -L/backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/
   --   -L/backup/ada/STM32/WB/WB55/sx1276_wb55/obj/Debug/
   --   -L/backup/ada/STM32/WB/
   --   -L/backup/ada/STM32/WB/WB55/sx1276_wb55/Ada_Drivers_Library/boards/lib/stm32wb55x_nucleo/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/sx1276_wb55/Ada_Drivers_Library/boards/stm32wb55x_nucleo/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/sx1276_wb55/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32wb55x/full/adalib/
   --   -L/backup/ada/STM32/WB/WB55/sx1276_wb55/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/sx1276_wb55/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/sx1276_wb55/Ada_Drivers_Library/components/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/sx1276_wb55/Ada_Drivers_Library/middleware/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32wb55x/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
