pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__adcgpio_l443.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__adcgpio_l443.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E058 : Short_Integer; pragma Import (Ada, E058, "ada__tags_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__bb__timing_events_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "system__soft_links_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "system__exception_table_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "ada__streams_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "system__finalization_root_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "ada__finalization_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "system__storage_pools_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "system__finalization_masters_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "ada__real_time_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "system__pool_global_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "cortex_m__debug_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "hal__gpio_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "hal__i2c_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "hal__real_time_clock_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "hal__spi_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "semihosting_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "stm32__adc_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__dac_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "stm32__exti_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "stm32__i2c_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "stm32__power_control_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "stm32__rcc_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "stm32__rtc_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "stm32__spi_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "stm32__gpio_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "stm32__device_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "stm32__syscfg_E");

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

      System.Bb.Timing_Events'Elab_Spec;
      E080 := E080 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E058 := E058 + 1;
      System.Exception_Table'Elab_Body;
      E092 := E092 + 1;
      E094 := E094 + 1;
      Ada.Streams'Elab_Spec;
      E164 := E164 + 1;
      System.Finalization_Root'Elab_Spec;
      E173 := E173 + 1;
      Ada.Finalization'Elab_Spec;
      E171 := E171 + 1;
      System.Storage_Pools'Elab_Spec;
      E175 := E175 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E168 := E168 + 1;
      Ada.Real_Time'Elab_Body;
      E118 := E118 + 1;
      System.Pool_Global'Elab_Spec;
      E177 := E177 + 1;
      E124 := E124 + 1;
      HAL.GPIO'ELAB_SPEC;
      E166 := E166 + 1;
      HAL.I2C'ELAB_SPEC;
      E184 := E184 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E188 := E188 + 1;
      HAL.SPI'ELAB_SPEC;
      E196 := E196 + 1;
      E121 := E121 + 1;
      STM32.ADC'ELAB_SPEC;
      E130 := E130 + 1;
      E147 := E147 + 1;
      E159 := E159 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E183 := E183 + 1;
      E190 := E190 + 1;
      E155 := E155 + 1;
      STM32.RTC'ELAB_SPEC;
      STM32.RTC'ELAB_BODY;
      E187 := E187 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E194 := E194 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E141 := E141 + 1;
      E157 := E157 + 1;
      STM32.GPIO'ELAB_BODY;
      E153 := E153 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_adcgpio_l443");

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
   --   /media/16T/ada/STM32/L/L443/adcminmax_l443/obj/Debug/adcgpio_l443.o
   --   -L/media/16T/ada/STM32/L/L443/adcminmax_l443/obj/Debug/
   --   -L/media/16T/ada/STM32/L/L443/adcminmax_l443/obj/Debug/
   --   -L/media/16T/ada/STM32/L/
   --   -L/media/16T/ada/STM32/L/L443/adcminmax_l443/Ada_Drivers_Library/boards/lib/stm32l443bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/adcminmax_l443/Ada_Drivers_Library/boards/stm32l443_bluepill/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/adcminmax_l443/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4bluepill/full/adalib/
   --   -L/media/16T/ada/STM32/L/L443/adcminmax_l443/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/hal/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/adcminmax_l443/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/adcminmax_l443/Ada_Drivers_Library/components/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/STM32/L/L443/adcminmax_l443/Ada_Drivers_Library/middleware/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
