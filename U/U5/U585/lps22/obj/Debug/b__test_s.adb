pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_s.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_s.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E098 : Short_Integer; pragma Import (Ada, E098, "ada__tags_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__bb__timing_events_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "system__soft_links_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__exception_table_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "ada__streams_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__finalization_root_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "ada__finalization_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "system__storage_pools_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__pool_global_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__tasking__protected_objects_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__tasking__protected_objects__multiprocessors_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__tasking__restricted__stages_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "hal__gpio_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "hal__i2c_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "hal__spi_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "stm32__exti_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "stm32__i2c_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "stm32__mpu_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "stm32__rcc_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "stm32__sau_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "stm32__spi_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__gpio_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "stm32__device_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__syscfg_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "cm33_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "lps22hh_i2c_io_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "stm32__board_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "utils_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "lps22hh_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "lps22hh_i2c_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

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
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      System.Bb.Timing_Events'Elab_Spec;
      E112 := E112 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E098 := E098 + 1;
      System.Exception_Table'Elab_Body;
      E047 := E047 + 1;
      E049 := E049 + 1;
      Ada.Streams'Elab_Spec;
      E156 := E156 + 1;
      System.Finalization_Root'Elab_Spec;
      E165 := E165 + 1;
      Ada.Finalization'Elab_Spec;
      E163 := E163 + 1;
      System.Storage_Pools'Elab_Spec;
      E167 := E167 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E160 := E160 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E169 := E169 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E122 := E122 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E126 := E126 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E131 := E131 + 1;
      HAL.GPIO'ELAB_SPEC;
      E158 := E158 + 1;
      HAL.I2C'ELAB_SPEC;
      E176 := E176 + 1;
      HAL.SPI'ELAB_SPEC;
      E181 := E181 + 1;
      E149 := E149 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E175 := E175 + 1;
      E183 := E183 + 1;
      E145 := E145 + 1;
      E186 := E186 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E179 := E179 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E137 := E137 + 1;
      E147 := E147 + 1;
      STM32.GPIO'ELAB_BODY;
      E143 := E143 + 1;
      E133 := E133 + 1;
      LPS22HH_I2C_IO'ELAB_SPEC;
      E196 := E196 + 1;
      STM32.BOARD'ELAB_SPEC;
      E201 := E201 + 1;
      E194 := E194 + 1;
      E192 := E192 + 1;
      LPS22HH_I2C'ELAB_SPEC;
      E190 := E190 + 1;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_test_s");

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
   --   /media/16T/ada/STM32/U/U5/U585/lps22/obj/Debug/cm33.o
   --   /media/16T/ada/STM32/U/U5/U585/lps22/obj/Debug/lps22hh_i2c_io.o
   --   /media/16T/ada/STM32/U/U5/U585/lps22/obj/Debug/peripherals.o
   --   /media/16T/ada/STM32/U/U5/U585/lps22/obj/Debug/utils.o
   --   /media/16T/ada/STM32/U/U5/U585/lps22/obj/Debug/lps22hh.o
   --   /media/16T/ada/STM32/U/U5/U585/lps22/obj/Debug/lps22hh_i2c.o
   --   /media/16T/ada/STM32/U/U5/U585/lps22/obj/Debug/test_s.o
   --   -L/media/16T/ada/STM32/U/U5/U585/lps22/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U5/U585/lps22/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U5/
   --   -L/media/16T/ada/STM32/U/U5/U585/lps22/Ada_Drivers_Library/boards/lib/stm32u5discovery_ns/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/U/U5/U585/lps22/Ada_Drivers_Library/boards/stm32u5_discovery_ns/lib/stm32u5discovery_ns/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/U/U5/U585/lps22/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u5discovery_ns/full/adalib/
   --   -L/media/16T/ada/STM32/U/U5/U585/lps22/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32u5discovery_ns/ravenscar-full/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/hal/lib/stm32u5discovery_ns/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/U/U5/U585/lps22/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32u5discovery_ns/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/U/U5/U585/lps22/Ada_Drivers_Library/components/lib/stm32u5discovery_ns/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/U/U5/U585/lps22/Ada_Drivers_Library/middleware/lib/stm32u5discovery_ns/ravenscar-full/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u5discovery_ns/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
