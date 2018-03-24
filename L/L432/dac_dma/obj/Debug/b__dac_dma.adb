pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__dac_dma.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__dac_dma.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E098 : Short_Integer; pragma Import (Ada, E098, "ada__tags_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "ada__streams_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__finalization_root_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "ada__finalization_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "system__soft_links_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "system__storage_pools_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "system__finalization_masters_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__bb__timing_events_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "ada__text_io_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "system__exception_table_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "system__pool_global_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__real_time_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "hal__gpio_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "hal__i2c_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "hal__spi_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "stm32__adc_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "stm32__dac_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "stm32__exti_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "stm32__gpio_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "stm32__i2c_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "stm32__rcc_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "stm32__spi_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__syscfg_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "stm32__device_E");

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
      E150 := E150 + 1;
      System.Finalization_Root'Elab_Spec;
      E159 := E159 + 1;
      Ada.Finalization'Elab_Spec;
      E157 := E157 + 1;
      System.Soft_Links'Elab_Spec;
      System.Storage_Pools'Elab_Spec;
      E161 := E161 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Bb.Timing_Events'Elab_Spec;
      E112 := E112 + 1;
      E055 := E055 + 1;
      Ada.Text_Io'Elab_Body;
      E118 := E118 + 1;
      System.Exception_Table'Elab_Body;
      E053 := E053 + 1;
      System.Pool_Global'Elab_Spec;
      E163 := E163 + 1;
      System.Finalization_Masters'Elab_Body;
      E154 := E154 + 1;
      Ada.Tags'Elab_Body;
      E098 := E098 + 1;
      Ada.Real_Time'Elab_Body;
      E008 := E008 + 1;
      HAL.GPIO'ELAB_SPEC;
      E152 := E152 + 1;
      HAL.I2C'ELAB_SPEC;
      E170 := E170 + 1;
      HAL.SPI'ELAB_SPEC;
      E175 := E175 + 1;
      STM32.ADC'ELAB_SPEC;
      E131 := E131 + 1;
      E122 := E122 + 1;
      E145 := E145 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.I2C'ELAB_SPEC;
      E169 := E169 + 1;
      E141 := E141 + 1;
      STM32.SPI'ELAB_SPEC;
      E173 := E173 + 1;
      E139 := E139 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E128 := E128 + 1;
      E143 := E143 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_dac_dma");

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
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/obj/Debug/dac_dma.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/Ada_Drivers_Library/examples/shared/common/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/Ada_Drivers_Library/boards/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/Ada_Drivers_Library/boards/stm32l4_nucleo/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/Ada_Drivers_Library/components/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/Ada_Drivers_Library/middleware/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L432/dac_dma/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
