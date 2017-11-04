pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__vl53l0x_f722.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__vl53l0x_f722.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E097 : Short_Integer; pragma Import (Ada, E097, "ada__tags_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "ada__streams_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "system__finalization_root_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "ada__finalization_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "system__soft_links_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "system__storage_pools_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "system__finalization_masters_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "system__bb__timing_events_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada__text_io_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "system__exception_table_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__pool_global_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__tasking__protected_objects_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "system__tasking__protected_objects__multiprocessors_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__tasking__restricted__stages_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "hal__audio_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "hal__gpio_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "hal__i2c_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "hal__real_time_clock_E");
   E207 : Short_Integer; pragma Import (Ada, E207, "hal__sdmmc_E");
   E211 : Short_Integer; pragma Import (Ada, E211, "hal__spi_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "last_chance_handler_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "sdmmc_init_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "stm32__adc_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "stm32__dac_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "stm32__exti_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "stm32__gpio_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "stm32__i2c_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "stm32__i2s_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "stm32__power_control_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "stm32__rcc_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "stm32__rtc_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "stm32__sdmmc_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "stm32__spi_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "stm32__syscfg_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__device_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "stm32__board_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "vl53l0x_E");

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
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
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

      Runtime_Initialize (1);

      Ada.Streams'Elab_Spec;
      E169 := E169 + 1;
      System.Finalization_Root'Elab_Spec;
      E178 := E178 + 1;
      Ada.Finalization'Elab_Spec;
      E176 := E176 + 1;
      System.Soft_Links'Elab_Spec;
      System.Storage_Pools'Elab_Spec;
      E180 := E180 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Bb.Timing_Events'Elab_Spec;
      E111 := E111 + 1;
      E054 := E054 + 1;
      Ada.Text_Io'Elab_Body;
      E117 := E117 + 1;
      System.Exception_Table'Elab_Body;
      E052 := E052 + 1;
      System.Pool_Global'Elab_Spec;
      E182 := E182 + 1;
      System.Finalization_Masters'Elab_Body;
      E173 := E173 + 1;
      Ada.Tags'Elab_Body;
      E097 := E097 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E136 := E136 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E140 := E140 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E132 := E132 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      HAL.AUDIO'ELAB_SPEC;
      E193 := E193 + 1;
      HAL.GPIO'ELAB_SPEC;
      E171 := E171 + 1;
      HAL.I2C'ELAB_SPEC;
      E189 := E189 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E197 := E197 + 1;
      HAL.SDMMC'ELAB_SPEC;
      E207 := E207 + 1;
      HAL.SPI'ELAB_SPEC;
      E211 := E211 + 1;
      E205 := E205 + 1;
      STM32.ADC'ELAB_SPEC;
      E149 := E149 + 1;
      E152 := E152 + 1;
      E164 := E164 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.I2C'ELAB_SPEC;
      E188 := E188 + 1;
      STM32.I2S'ELAB_SPEC;
      E199 := E199 + 1;
      E160 := E160 + 1;
      STM32.RTC'ELAB_SPEC;
      E196 := E196 + 1;
      STM32.SDMMC'ELAB_SPEC;
      STM32.SPI'ELAB_SPEC;
      E210 := E210 + 1;
      E158 := E158 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E143 := E143 + 1;
      E162 := E162 + 1;
      E203 := E203 + 1;
      E192 := E192 + 1;
      STM32.BOARD'ELAB_SPEC;
      E125 := E125 + 1;
      E120 := E120 + 1;
      E217 := E217 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_vl53l0x_f722");

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
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/obj/Debug/peripherals.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/obj/Debug/last_chance_handler.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/obj/Debug/vl53l0x_f722.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/Ada_Drivers_Library/examples/shared/common/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/Ada_Drivers_Library/boards/lib/stm32f722nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/Ada_Drivers_Library/boards/stm32f722_nucleo/lib/stm32f722nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f722nucleo/full/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f722nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32f722nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/middleware/lib/stm32f722nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m7/stm32f722nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/Ada_Drivers_Library/components/lib/stm32f722nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/Ada_Drivers_Library/middleware/lib/stm32f722nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F722/vl53l0x_f722/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f722nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
