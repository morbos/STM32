pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__dotstar_dma_l443.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__dotstar_dma_l443.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E097 : Short_Integer; pragma Import (Ada, E097, "ada__tags_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "ada__streams_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__finalization_root_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "ada__finalization_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "system__soft_links_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__storage_pools_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__finalization_masters_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "system__bb__timing_events_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada__text_io_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "system__exception_table_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__pool_global_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "system__tasking__protected_objects_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "system__tasking__protected_objects__multiprocessors_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "system__tasking__restricted__stages_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "hal__gpio_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "hal__i2c_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "hal__spi_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "stm32__adc_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "stm32__dac_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "dma_interrupt_handling_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "stm32__exti_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "stm32__gpio_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "dotstar_dma_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "stm32__i2c_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "stm32__rcc_E");
   E197 : Short_Integer; pragma Import (Ada, E197, "stm32__spi_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "stm32__syscfg_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "stm32__device_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "memory_transfer_E");

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
      E123 := E123 + 1;
      System.Finalization_Root'Elab_Spec;
      E131 := E131 + 1;
      Ada.Finalization'Elab_Spec;
      E129 := E129 + 1;
      System.Soft_Links'Elab_Spec;
      System.Storage_Pools'Elab_Spec;
      E133 := E133 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Bb.Timing_Events'Elab_Spec;
      E111 := E111 + 1;
      E054 := E054 + 1;
      Ada.Text_Io'Elab_Body;
      E117 := E117 + 1;
      System.Exception_Table'Elab_Body;
      E052 := E052 + 1;
      System.Pool_Global'Elab_Spec;
      E135 := E135 + 1;
      System.Finalization_Masters'Elab_Body;
      E126 := E126 + 1;
      Ada.Tags'Elab_Body;
      E097 := E097 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E149 := E149 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E153 := E153 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E145 := E145 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      HAL.GPIO'ELAB_SPEC;
      E189 := E189 + 1;
      HAL.I2C'ELAB_SPEC;
      E194 := E194 + 1;
      HAL.SPI'ELAB_SPEC;
      E121 := E121 + 1;
      STM32.ADC'ELAB_SPEC;
      E168 := E168 + 1;
      E176 := E176 + 1;
      E156 := E156 + 1;
      E185 := E185 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.I2C'ELAB_SPEC;
      E193 := E193 + 1;
      E181 := E181 + 1;
      STM32.SPI'ELAB_SPEC;
      E197 := E197 + 1;
      E179 := E179 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E165 := E165 + 1;
      E183 := E183 + 1;
      Memory_Transfer'Elab_Spec;
      E138 := E138 + 1;
      Dotstar_Dma'Elab_Body;
      E119 := E119 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_dotstar_dma_l443");

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
   --   /backup/ada/STM32/L/L443/dotstar_dma_l443/obj/Debug/dma_interrupt_handling.o
   --   /backup/ada/STM32/L/L443/dotstar_dma_l443/obj/Debug/memory_transfer.o
   --   /backup/ada/STM32/L/L443/dotstar_dma_l443/obj/Debug/peripherals.o
   --   /backup/ada/STM32/L/L443/dotstar_dma_l443/obj/Debug/dotstar_dma_l443.o
   --   /backup/ada/STM32/L/L443/dotstar_dma_l443/obj/Debug/dotstar_dma.o
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/obj/Debug/
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/obj/Debug/
   --   -L/backup/ada/STM32/L/
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/Ada_Drivers_Library/boards/lib/stm32l443bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/Ada_Drivers_Library/boards/stm32l443_bluepill/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4bluepill/full/adalib/
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/Ada_Drivers_Library/components/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/Ada_Drivers_Library/middleware/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/dotstar_dma_l443/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
