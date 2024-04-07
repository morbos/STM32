pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__try.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__try.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E120 : Short_Integer; pragma Import (Ada, E120, "ada__text_io_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__tags_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__bb__timing_events_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "system__soft_links_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__exception_table_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "ada__streams_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "system__finalization_root_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "ada__finalization_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__storage_pools_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "system__pool_global_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "cortex_m__debug_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "hal__gpio_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "hal__i2c_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "hal__spi_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "semihosting_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__exti_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "stm32__i2c_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__rcc_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "stm32__spi_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "stm32__gpio_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "stm32__device_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "stm32__syscfg_E");

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
      Time_Slice_Value := 0;
      WC_Encoding := 'b';
      Locking_Policy := 'C';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := 'F';
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

      Ada.Text_Io'Elab_Body;
      E120 := E120 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E112 := E112 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E098 := E098 + 1;
      System.Exception_Table'Elab_Body;
      E047 := E047 + 1;
      E049 := E049 + 1;
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
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E167 := E167 + 1;
      E126 := E126 + 1;
      HAL.GPIO'ELAB_SPEC;
      E156 := E156 + 1;
      HAL.I2C'ELAB_SPEC;
      E174 := E174 + 1;
      HAL.SPI'ELAB_SPEC;
      E179 := E179 + 1;
      E123 := E123 + 1;
      E147 := E147 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E173 := E173 + 1;
      E143 := E143 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E177 := E177 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E135 := E135 + 1;
      E145 := E145 + 1;
      STM32.GPIO'ELAB_BODY;
      E141 := E141 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_try");

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
   --   /home/hedley/ada/STM32/U/U585/io/obj/Debug/try.o
   --   -L/home/hedley/ada/STM32/U/U585/io/obj/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/io/obj/Debug/
   --   -L/home/hedley/ada/STM32/U/
   --   -L/home/hedley/ada/STM32/U/U585/io/Ada_Drivers_Library/boards/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/io/Ada_Drivers_Library/boards/stm32u5_bluepill_ns/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/io/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u5bluepill_ns/full/adalib/
   --   -L/home/hedley/ada/STM32/U/U585/io/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/io/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/io/Ada_Drivers_Library/components/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/io/Ada_Drivers_Library/middleware/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u5bluepill_ns/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
