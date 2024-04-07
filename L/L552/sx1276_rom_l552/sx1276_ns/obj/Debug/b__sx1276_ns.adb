pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_ns.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_ns.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E099 : Short_Integer; pragma Import (Ada, E099, "ada__tags_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__bb__timing_events_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "system__soft_links_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "system__exception_table_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "ada__streams_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__finalization_root_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "ada__finalization_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__storage_pools_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__pool_global_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "hal__gpio_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "hal__spi_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "stm32__exti_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "stm32__mpu_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "stm32__rcc_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "stm32__spi_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__gpio_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__device_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "stm32__syscfg_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "stm32__board_E");

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
      E113 := E113 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E099 := E099 + 1;
      System.Exception_Table'Elab_Body;
      E053 := E053 + 1;
      E055 := E055 + 1;
      Ada.Streams'Elab_Spec;
      E123 := E123 + 1;
      System.Finalization_Root'Elab_Spec;
      E131 := E131 + 1;
      Ada.Finalization'Elab_Spec;
      E129 := E129 + 1;
      System.Storage_Pools'Elab_Spec;
      E133 := E133 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E126 := E126 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E135 := E135 + 1;
      HAL.GPIO'ELAB_SPEC;
      E159 := E159 + 1;
      HAL.SPI'ELAB_SPEC;
      E121 := E121 + 1;
      E153 := E153 + 1;
      E166 := E166 + 1;
      E149 := E149 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E163 := E163 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E143 := E143 + 1;
      E151 := E151 + 1;
      STM32.GPIO'ELAB_BODY;
      E147 := E147 + 1;
      STM32.BOARD'ELAB_SPEC;
      E140 := E140 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sx1276_ns");

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
   --   /backup/ada/STM32/L/L552/sx1276_rom_l552/sx1276_ns/obj/Debug/sx1276_ns.o
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/sx1276_ns/obj/Debug/
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/sx1276_ns/obj/Debug/
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/sx1276_ns/
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/Ada_Drivers_Library/boards/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/Ada_Drivers_Library/boards/stm32l5_nucleo_ns/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_ns/full/adalib/
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/Ada_Drivers_Library/components/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L552/sx1276_rom_l552/Ada_Drivers_Library/middleware/lib/stm32l5nucleo_ns/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_ns/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
