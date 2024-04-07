pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_l443.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_l443.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E099 : Short_Integer; pragma Import (Ada, E099, "ada__tags_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__bb__timing_events_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "system__soft_links_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "system__exception_table_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "ada__streams_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "system__finalization_root_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "ada__finalization_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__storage_pools_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "system__pool_global_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "system__tasking__protected_objects_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "system__tasking__protected_objects__multiprocessors_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__tasking__restricted__stages_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "hal__gpio_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "hal__i2c_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "hal__real_time_clock_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "hal__spi_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "crc8_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "stm32__adc_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "stm32__dac_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "stm32__exti_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "stm32__i2c_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "stm32__power_control_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "stm32__rcc_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "stm32__rtc_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "stm32__spi_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "stm32__gpio_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "stm32__device_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "stm32__syscfg_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "sx1276_spi_io_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "peripherals_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "utils_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "exti_E");
   E213 : Short_Integer; pragma Import (Ada, E213, "sx1276_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "sx1276_spi_E");

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
      E136 := E136 + 1;
      System.Finalization_Root'Elab_Spec;
      E144 := E144 + 1;
      Ada.Finalization'Elab_Spec;
      E142 := E142 + 1;
      System.Storage_Pools'Elab_Spec;
      E146 := E146 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E139 := E139 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E148 := E148 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E121 := E121 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E125 := E125 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E130 := E130 + 1;
      HAL.GPIO'ELAB_SPEC;
      E186 := E186 + 1;
      HAL.I2C'ELAB_SPEC;
      E191 := E191 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E195 := E195 + 1;
      HAL.SPI'ELAB_SPEC;
      E134 := E134 + 1;
      E132 := E132 + 1;
      STM32.ADC'ELAB_SPEC;
      E160 := E160 + 1;
      E170 := E170 + 1;
      E182 := E182 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E190 := E190 + 1;
      E197 := E197 + 1;
      E178 := E178 + 1;
      STM32.RTC'ELAB_SPEC;
      STM32.RTC'ELAB_BODY;
      E194 := E194 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E201 := E201 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E156 := E156 + 1;
      E180 := E180 + 1;
      STM32.GPIO'ELAB_BODY;
      E176 := E176 + 1;
      SX1276_SPI_IO'ELAB_SPEC;
      E206 := E206 + 1;
      Peripherals'Elab_Spec;
      E153 := E153 + 1;
      E215 := E215 + 1;
      Exti'Elab_Spec;
      E213 := E213 + 1;
      SX1276_SPI'ELAB_SPEC;
      E211 := E211 + 1;
      Exti'Elab_Body;
      E152 := E152 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sx1276_l443");

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
   --   /media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/crc8.o
   --   /media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/sx1276_spi_io.o
   --   /media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/peripherals.o
   --   /media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/utils.o
   --   /media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/sx1276.o
   --   /media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/sx1276_spi.o
   --   /media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/exti.o
   --   /media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/sx1276_l443.o
   --   -L/media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/
   --   -L/media/16T/ada/STM32/L/L443/sx1276_l443/obj/Debug/
   --   -L/media/16T/ada/STM32/L/
   --   -L/media/16T/ada/STM32/L/L443/sx1276_l443/Ada_Drivers_Library/boards/lib/stm32l443bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/sx1276_l443/Ada_Drivers_Library/boards/stm32l443_bluepill/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/sx1276_l443/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4bluepill/full/adalib/
   --   -L/media/16T/ada/STM32/L/L443/sx1276_l443/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/hal/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/sx1276_l443/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/sx1276_l443/Ada_Drivers_Library/components/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/sx1276_l443/Ada_Drivers_Library/middleware/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
