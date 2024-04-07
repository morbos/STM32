pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__client_wb55x.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__client_wb55x.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E101 : Short_Integer; pragma Import (Ada, E101, "ada__tags_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "system__soft_links_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "system__exception_table_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__bb__timing_events_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "ada__streams_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__finalization_root_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "ada__finalization_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "system__storage_pools_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "system__finalization_masters_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__real_time_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__pool_global_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "system__tasking__protected_objects_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__tasking__protected_objects__multiprocessors_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__tasking__restricted__stages_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "hal__gpio_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "hal__i2c_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "hal__spi_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "log_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "stm32__adc_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "stm32__exti_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "stm32__i2c_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__ipcc_E");
   E269 : Short_Integer; pragma Import (Ada, E269, "hw_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "stm32__rcc_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "stm32__spi_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "stm32__gpio_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "stm32__device_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "stm32__syscfg_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "utils_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "gen_list_E");
   E274 : Short_Integer; pragma Import (Ada, E274, "memory_E");
   E256 : Short_Integer; pragma Import (Ada, E256, "uuid_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "hci_le_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "hci_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "comm_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "comm__hw_E");
   E264 : Short_Integer; pragma Import (Ada, E264, "bluenrg_hal_aci_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "bluenrg_gap_aci_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "bluenrg_l2cap_aci_E");
   E252 : Short_Integer; pragma Import (Ada, E252, "bluenrg_gatt_aci_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "comm__run_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "comm__shci_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "comm__setup_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "comm__tl__int_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "main_E");

   Sec_Default_Sized_Stacks : array (1 .. 2) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

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
      Binder_Sec_Stacks_Count := 2;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E055 := E055 + 1;
      Ada.Tags'Elab_Body;
      E101 := E101 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E115 := E115 + 1;
      E057 := E057 + 1;
      Ada.Streams'Elab_Spec;
      E181 := E181 + 1;
      System.Finalization_Root'Elab_Spec;
      E190 := E190 + 1;
      Ada.Finalization'Elab_Spec;
      E188 := E188 + 1;
      System.Storage_Pools'Elab_Spec;
      E192 := E192 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E185 := E185 + 1;
      Ada.Real_Time'Elab_Body;
      E008 := E008 + 1;
      System.Pool_Global'Elab_Spec;
      E194 := E194 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E125 := E125 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E129 := E129 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E134 := E134 + 1;
      HAL.GPIO'ELAB_SPEC;
      E183 := E183 + 1;
      HAL.I2C'ELAB_SPEC;
      E201 := E201 + 1;
      HAL.SPI'ELAB_SPEC;
      E206 := E206 + 1;
      E152 := E152 + 1;
      STM32.ADC'ELAB_SPEC;
      E159 := E159 + 1;
      E176 := E176 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E200 := E200 + 1;
      E147 := E147 + 1;
      E269 := E269 + 1;
      E172 := E172 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E204 := E204 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E157 := E157 + 1;
      STM32.GPIO'ELAB_BODY;
      E170 := E170 + 1;
      E174 := E174 + 1;
      E220 := E220 + 1;
      E262 := E262 + 1;
      Memory'Elab_Body;
      E274 := E274 + 1;
      E256 := E256 + 1;
      Hci'Elab_Spec;
      Comm'Elab_Spec;
      E264 := E264 + 1;
      E260 := E260 + 1;
      E218 := E218 + 1;
      E258 := E258 + 1;
      E252 := E252 + 1;
      Comm.Run'Elab_Spec;
      E225 := E225 + 1;
      E266 := E266 + 1;
      E138 := E138 + 1;
      Comm.Tl.Int'Elab_Spec;
      E140 := E140 + 1;
      Comm.Run'Elab_Body;
      E227 := E227 + 1;
      E215 := E215 + 1;
      E143 := E143 + 1;
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
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/ble_status.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/bluenrg_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/bluenrg_gap.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/bluenrg_gatt_server.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/log.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/ogf_ocf.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/security.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/hw.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/utils.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/gen_list.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/memory.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/uuid.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/comm-mbox.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/comm-tl.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/bluenrg_hal_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/hci_le.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/bluenrg_gap_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/bluenrg_l2cap_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/bluenrg_gatt_aci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/hci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/comm-shci.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/comm.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/comm-hw.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/comm-run.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/comm-setup.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/comm-tl-int.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/main.o
   --   /backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/client_wb55x.o
   --   -L/backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55/obj/Debug/
   --   -L/backup/ada/STM32/WB/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55/Ada_Drivers_Library/boards/lib/stm32wb55x_nucleo/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55/Ada_Drivers_Library/boards/stm32wb55x_nucleo/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32wb55x/full/adalib/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55/Ada_Drivers_Library/components/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/WB/WB55/client_wb55/Ada_Drivers_Library/middleware/lib/stm32wb55x/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32wb55x/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
