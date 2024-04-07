pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__client_wb55x.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__client_wb55x.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E101 : Short_Integer; pragma Import (Ada, E101, "ada__tags_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__bb__timing_events_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "system__soft_links_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "system__exception_table_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "ada__streams_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "system__finalization_root_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "ada__finalization_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "system__storage_pools_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "system__finalization_masters_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__real_time_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "system__pool_global_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "system__tasking__protected_objects_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__tasking__protected_objects__multiprocessors_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__tasking__restricted__stages_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "hal__gpio_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "hal__i2c_E");
   E263 : Short_Integer; pragma Import (Ada, E263, "hal__spi_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "log_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "stm32__adc_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "stm32__exti_E");
   E257 : Short_Integer; pragma Import (Ada, E257, "stm32__i2c_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "stm32__ipcc_E");
   E274 : Short_Integer; pragma Import (Ada, E274, "hw_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "stm32__rcc_E");
   E261 : Short_Integer; pragma Import (Ada, E261, "stm32__spi_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "stm32__gpio_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "stm32__device_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "stm32__syscfg_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "utils_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "gen_list_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "memory_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "uuid_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "comm_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "comm__ble_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "comm__hw_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "comm__setup_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "hci_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "bluenrg_gatt_aci_E");
   E209 : Short_Integer; pragma Import (Ada, E209, "bluenrg_hal_aci_E");
   E267 : Short_Integer; pragma Import (Ada, E267, "bluenrg_l2cap_aci_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "comm__tl_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "comm__shci_E");
   E269 : Short_Integer; pragma Import (Ada, E269, "comm__tl__int_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "hci_le_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "bluenrg_gap_aci_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "comm__run_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "main_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "stm32l4_interrupts_E");

   Sec_Default_Sized_Stacks : array (1 .. 3) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

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
      Binder_Sec_Stacks_Count := 3;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      System.Bb.Timing_Events'Elab_Spec;
      E115 := E115 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E101 := E101 + 1;
      System.Exception_Table'Elab_Body;
      E055 := E055 + 1;
      E057 := E057 + 1;
      Ada.Streams'Elab_Spec;
      E238 := E238 + 1;
      System.Finalization_Root'Elab_Spec;
      E247 := E247 + 1;
      Ada.Finalization'Elab_Spec;
      E245 := E245 + 1;
      System.Storage_Pools'Elab_Spec;
      E249 := E249 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E242 := E242 + 1;
      Ada.Real_Time'Elab_Body;
      E008 := E008 + 1;
      System.Pool_Global'Elab_Spec;
      E251 := E251 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E125 := E125 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E129 := E129 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E134 := E134 + 1;
      HAL.GPIO'ELAB_SPEC;
      E240 := E240 + 1;
      HAL.I2C'ELAB_SPEC;
      E258 := E258 + 1;
      HAL.SPI'ELAB_SPEC;
      E263 := E263 + 1;
      E197 := E197 + 1;
      STM32.ADC'ELAB_SPEC;
      E218 := E218 + 1;
      E233 := E233 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E257 := E257 + 1;
      E144 := E144 + 1;
      E274 := E274 + 1;
      E229 := E229 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E261 := E261 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E216 := E216 + 1;
      E231 := E231 + 1;
      STM32.GPIO'ELAB_BODY;
      E227 := E227 + 1;
      E181 := E181 + 1;
      E195 := E195 + 1;
      Memory'Elab_Spec;
      Memory'Elab_Body;
      E193 := E193 + 1;
      E205 := E205 + 1;
      Comm'Elab_Spec;
      Hci'Elab_Spec;
      E202 := E202 + 1;
      E209 := E209 + 1;
      E267 := E267 + 1;
      E138 := E138 + 1;
      E149 := E149 + 1;
      E213 := E213 + 1;
      Comm.Tl.Int'Elab_Spec;
      E269 := E269 + 1;
      E140 := E140 + 1;
      E191 := E191 + 1;
      E179 := E179 + 1;
      E211 := E211 + 1;
      Comm.Run'Elab_Spec;
      Hci'Elab_Body;
      E151 := E151 + 1;
      Comm.Run'Elab_Body;
      E153 := E153 + 1;
      E207 := E207 + 1;
      Stm32l4_Interrupts'Elab_Spec;
      E279 := E279 + 1;
      E005 := E005 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_client_wb55x");

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
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/ble_status.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/bluenrg_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/bluenrg_gap.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/bluenrg_gatt_server.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/log.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/ogf_ocf.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/security.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/hw.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/utils.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/gen_list.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/memory.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/uuid.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/comm-mbox.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/bluenrg_gatt_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/bluenrg_hal_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/bluenrg_l2cap_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/comm.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/comm-tl.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/comm-shci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/comm-tl-int.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/comm-hw.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/hci_le.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/bluenrg_gap_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/comm-ble.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/hci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/comm-run.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/comm-setup.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/stm32l4_interrupts.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/main.o
   --   /backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/client_wb55x.o
   --   -L/backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55_06_02_19/obj/Debug/
   --   -L/backup/ada/STM32/WB/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55_06_02_19/Ada_Drivers_Library/boards/lib/stm32wb55x_nucleo/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55_06_02_19/Ada_Drivers_Library/boards/stm32wb55x_nucleo/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55_06_02_19/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32wb55x/full/adalib/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55_06_02_19/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55_06_02_19/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55_06_02_19/Ada_Drivers_Library/components/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55_06_02_19/Ada_Drivers_Library/middleware/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32wb55x/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
