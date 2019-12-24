pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__ex4.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__ex4.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E006 : Short_Integer; pragma Import (Ada, E006, "ada__text_io_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "ada__tags_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "system__soft_links_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "system__exception_table_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "system__bb__timing_events_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "ada__streams_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "system__finalization_root_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "ada__finalization_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "system__storage_pools_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "system__finalization_masters_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "ada__real_time_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "system__pool_global_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__tasking__protected_objects_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__tasking__protected_objects__multiprocessors_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__tasking__restricted__stages_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "hal__gpio_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "hal__i2c_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "hal__spi_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__adc_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "stm32__dac_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "stm32__exti_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "stm32__i2c_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "stm32__rcc_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "stm32__spi_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "stm32__gpio_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__device_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "stm32__syscfg_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "driver_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "last_chance_handler_E");

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
      Main_Priority := 0;
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

      Ada.Text_Io'Elab_Body;
      E006 := E006 + 1;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E057 := E057 + 1;
      Ada.Tags'Elab_Body;
      E103 := E103 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E117 := E117 + 1;
      E059 := E059 + 1;
      Ada.Streams'Elab_Spec;
      E172 := E172 + 1;
      System.Finalization_Root'Elab_Spec;
      E181 := E181 + 1;
      Ada.Finalization'Elab_Spec;
      E179 := E179 + 1;
      System.Storage_Pools'Elab_Spec;
      E183 := E183 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E176 := E176 + 1;
      Ada.Real_Time'Elab_Body;
      E028 := E028 + 1;
      System.Pool_Global'Elab_Spec;
      E185 := E185 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E127 := E127 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E131 := E131 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E136 := E136 + 1;
      HAL.GPIO'ELAB_SPEC;
      E174 := E174 + 1;
      HAL.I2C'ELAB_SPEC;
      E192 := E192 + 1;
      HAL.SPI'ELAB_SPEC;
      E197 := E197 + 1;
      STM32.ADC'ELAB_SPEC;
      E147 := E147 + 1;
      E155 := E155 + 1;
      E167 := E167 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E191 := E191 + 1;
      E163 := E163 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E195 := E195 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E143 := E143 + 1;
      STM32.GPIO'ELAB_BODY;
      E161 := E161 + 1;
      E165 := E165 + 1;
      Driver'Elab_Spec;
      Driver'Elab_Body;
      E026 := E026 + 1;
      E201 := E201 + 1;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_ex4");

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
   --   /backup/ada/STM32/L/L443/ex4/obj/Debug/driver.o
   --   /backup/ada/STM32/L/L443/ex4/obj/Debug/last_chance_handler.o
   --   /backup/ada/STM32/L/L443/ex4/obj/Debug/ex4.o
   --   -L/backup/ada/STM32/L/L443/ex4/obj/Debug/
   --   -L/backup/ada/STM32/L/L443/ex4/obj/Debug/
   --   -L/backup/ada/STM32/L/
   --   -L/backup/ada/STM32/L/L443/ex4/Ada_Drivers_Library/boards/lib/stm32l443bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/ex4/Ada_Drivers_Library/boards/stm32l443_bluepill/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/ex4/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4bluepill/full/adalib/
   --   -L/backup/ada/STM32/L/L443/ex4/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/ex4/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/ex4/Ada_Drivers_Library/components/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/ex4/Ada_Drivers_Library/middleware/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
