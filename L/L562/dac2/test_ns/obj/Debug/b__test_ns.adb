pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_ns.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_ns.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E100 : Short_Integer; pragma Import (Ada, E100, "ada__tags_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "system__bb__timing_events_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "system__soft_links_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "system__exception_table_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "ada__streams_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "system__finalization_root_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "ada__finalization_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__storage_pools_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "system__finalization_masters_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__real_time_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "system__pool_global_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "hal__gpio_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "hal__spi_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "stm32__dac_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "stm32__exti_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "stm32__mpu_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "stm32__rcc_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "stm32__spi_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "stm32__gpio_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "stm32__device_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "stm32__syscfg_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "stm32__board_E");

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
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
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
      E114 := E114 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E100 := E100 + 1;
      System.Exception_Table'Elab_Body;
      E054 := E054 + 1;
      E056 := E056 + 1;
      Ada.Streams'Elab_Spec;
      E145 := E145 + 1;
      System.Finalization_Root'Elab_Spec;
      E154 := E154 + 1;
      Ada.Finalization'Elab_Spec;
      E152 := E152 + 1;
      System.Storage_Pools'Elab_Spec;
      E156 := E156 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E149 := E149 + 1;
      Ada.Real_Time'Elab_Body;
      E008 := E008 + 1;
      System.Pool_Global'Elab_Spec;
      E158 := E158 + 1;
      HAL.GPIO'ELAB_SPEC;
      E147 := E147 + 1;
      HAL.SPI'ELAB_SPEC;
      E166 := E166 + 1;
      E129 := E129 + 1;
      E140 := E140 + 1;
      E168 := E168 + 1;
      E136 := E136 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E164 := E164 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E125 := E125 + 1;
      E138 := E138 + 1;
      STM32.GPIO'ELAB_BODY;
      E134 := E134 + 1;
      STM32.BOARD'ELAB_SPEC;
      E122 := E122 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_test_ns");

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
   --   /home/hedley/ada/STM32/L/L562/dac2/test_ns/obj/Debug/test_ns.o
   --   -L/home/hedley/ada/STM32/L/L562/dac2/test_ns/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac2/test_ns/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac2/test_ns/
   --   -L/home/hedley/ada/STM32/L/L562/dac2/Ada_Drivers_Library/boards/lib/stm32l5discovery_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac2/Ada_Drivers_Library/boards/stm32l5_discovery_ns/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac2/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_ns/full/adalib/
   --   -L/home/hedley/ada/STM32/L/L562/dac2/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac2/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac2/Ada_Drivers_Library/components/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac2/Ada_Drivers_Library/middleware/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5discovery_ns/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
