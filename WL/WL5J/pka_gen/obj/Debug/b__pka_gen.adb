pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__pka_gen.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__pka_gen.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E099 : Short_Integer; pragma Import (Ada, E099, "ada__tags_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__bb__timing_events_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "system__soft_links_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "system__exception_table_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "ada__streams_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "system__finalization_root_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "ada__finalization_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "system__storage_pools_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "system__pool_global_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__tasking__protected_objects_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__tasking__protected_objects__multiprocessors_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__tasking__restricted__stages_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "hal__gpio_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "hal__i2c_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "hal__spi_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "stm32__exti_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "stm32__i2c_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "stm32__rcc_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "stm32__spi_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "stm32__gpio_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "stm32__device_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "stm32__syscfg_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "stm32__rng_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "stm32__pka_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "curve_E");

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
      E113 := E113 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E099 := E099 + 1;
      System.Exception_Table'Elab_Body;
      E053 := E053 + 1;
      E055 := E055 + 1;
      Ada.Streams'Elab_Spec;
      E166 := E166 + 1;
      System.Finalization_Root'Elab_Spec;
      E175 := E175 + 1;
      Ada.Finalization'Elab_Spec;
      E173 := E173 + 1;
      System.Storage_Pools'Elab_Spec;
      E177 := E177 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E170 := E170 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E179 := E179 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E123 := E123 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E127 := E127 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E132 := E132 + 1;
      HAL.GPIO'ELAB_SPEC;
      E168 := E168 + 1;
      HAL.I2C'ELAB_SPEC;
      E186 := E186 + 1;
      HAL.SPI'ELAB_SPEC;
      E191 := E191 + 1;
      E161 := E161 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E185 := E185 + 1;
      E157 := E157 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E189 := E189 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E141 := E141 + 1;
      E159 := E159 + 1;
      STM32.GPIO'ELAB_BODY;
      E155 := E155 + 1;
      STM32.RNG'ELAB_SPEC;
      E197 := E197 + 1;
      E195 := E195 + 1;
      E134 := E134 + 1;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_pka_gen");

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
   --   /home/hedley/ada/STM32/WL/WL5J/pka_gen/obj/Debug/curve.o
   --   /home/hedley/ada/STM32/WL/WL5J/pka_gen/obj/Debug/pka_gen.o
   --   -L/home/hedley/ada/STM32/WL/WL5J/pka_gen/obj/Debug/
   --   -L/home/hedley/ada/STM32/WL/WL5J/pka_gen/obj/Debug/
   --   -L/home/hedley/ada/STM32/WL/
   --   -L/home/hedley/ada/STM32/WL/WL5J/pka_gen/Ada_Drivers_Library/boards/lib/stm32wl5x_nucleo/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/WL/WL5J/pka_gen/Ada_Drivers_Library/boards/stm32wl5x_nucleo/lib/stm32wl5x/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/WL/WL5J/pka_gen/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32wl5x/full/adalib/
   --   -L/home/hedley/ada/STM32/WL/WL5J/pka_gen/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32wl5x/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32wl5x/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/WL/WL5J/pka_gen/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4/stm32wl5x/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/WL/WL5J/pka_gen/Ada_Drivers_Library/components/lib/stm32wl5x/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/WL/WL5J/pka_gen/Ada_Drivers_Library/middleware/lib/stm32wl5x/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32wl5x/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
