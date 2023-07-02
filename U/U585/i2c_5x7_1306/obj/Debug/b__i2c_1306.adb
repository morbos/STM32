pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__i2c_1306.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__i2c_1306.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E118 : Short_Integer; pragma Import (Ada, E118, "ada__text_io_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__tags_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__bb__timing_events_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "system__soft_links_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__exception_table_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__streams_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__finalization_root_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__finalization_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__storage_pools_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "system__finalization_masters_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__pool_global_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "hal__bitmap_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "bitmap_color_conversion_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "hal__framebuffer_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "hal__gpio_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "hal__i2c_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "hal__spi_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "hal__time_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "ravenscar_time_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "soft_drawing_bitmap_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "memory_mapped_bitmap_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "ssd1306_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "fonts_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "stm32__exti_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "stm32__i2c_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "stm32__rcc_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "stm32__spi_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "stm32__gpio_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "stm32__device_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "stm32__syscfg_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "last_chance_handler_E");

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
      E118 := E118 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E112 := E112 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E098 := E098 + 1;
      System.Exception_Table'Elab_Body;
      E047 := E047 + 1;
      E049 := E049 + 1;
      Ada.Streams'Elab_Spec;
      E125 := E125 + 1;
      System.Finalization_Root'Elab_Spec;
      E133 := E133 + 1;
      Ada.Finalization'Elab_Spec;
      E131 := E131 + 1;
      System.Storage_Pools'Elab_Spec;
      E135 := E135 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E128 := E128 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      System.Pool_Global'Elab_Spec;
      E137 := E137 + 1;
      HAL.BITMAP'ELAB_SPEC;
      E123 := E123 + 1;
      E151 := E151 + 1;
      HAL.FRAMEBUFFER'ELAB_SPEC;
      E144 := E144 + 1;
      HAL.GPIO'ELAB_SPEC;
      E145 := E145 + 1;
      HAL.I2C'ELAB_SPEC;
      E146 := E146 + 1;
      HAL.SPI'ELAB_SPEC;
      E187 := E187 + 1;
      HAL.TIME'ELAB_SPEC;
      E147 := E147 + 1;
      Ravenscar_Time'Elab_Spec;
      Ravenscar_Time'Elab_Body;
      E190 := E190 + 1;
      Soft_Drawing_Bitmap'Elab_Spec;
      Soft_Drawing_Bitmap'Elab_Body;
      E153 := E153 + 1;
      Memory_Mapped_Bitmap'Elab_Spec;
      Memory_Mapped_Bitmap'Elab_Body;
      E149 := E149 + 1;
      SSD1306'ELAB_SPEC;
      SSD1306'ELAB_BODY;
      E141 := E141 + 1;
      E120 := E120 + 1;
      E177 := E177 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E182 := E182 + 1;
      E173 := E173 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E185 := E185 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E165 := E165 + 1;
      E175 := E175 + 1;
      STM32.GPIO'ELAB_BODY;
      E171 := E171 + 1;
      E157 := E157 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_i2c_1306");

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
   --   /home/hedley/ada/STM32/U/U585/i2c_5x7_1306/obj/Debug/fonts-font1.o
   --   /home/hedley/ada/STM32/U/U585/i2c_5x7_1306/obj/Debug/fonts.o
   --   /home/hedley/ada/STM32/U/U585/i2c_5x7_1306/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/U/U585/i2c_5x7_1306/obj/Debug/last_chance_handler.o
   --   /home/hedley/ada/STM32/U/U585/i2c_5x7_1306/obj/Debug/i2c_1306.o
   --   -L/home/hedley/ada/STM32/U/U585/i2c_5x7_1306/obj/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/i2c_5x7_1306/obj/Debug/
   --   -L/home/hedley/ada/STM32/U/
   --   -L/home/hedley/ada/STM32/U/U585/i2c_5x7_1306/Ada_Drivers_Library/boards/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/i2c_5x7_1306/Ada_Drivers_Library/boards/stm32u5_bluepill_ns/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/i2c_5x7_1306/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u5bluepill_ns/full/adalib/
   --   -L/home/hedley/ada/STM32/U/U585/i2c_5x7_1306/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/i2c_5x7_1306/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/i2c_5x7_1306/Ada_Drivers_Library/components/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/U/U585/i2c_5x7_1306/Ada_Drivers_Library/middleware/lib/stm32u5bluepill_ns/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u5bluepill_ns/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
