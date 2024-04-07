pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__adc_i2c.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__adc_i2c.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E119 : Short_Integer; pragma Import (Ada, E119, "ada__text_io_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__tags_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__bb__timing_events_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "system__soft_links_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "system__exception_table_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "ada__streams_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__finalization_root_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "ada__finalization_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__storage_pools_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__finalization_masters_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada__real_time_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "system__pool_global_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "hal__bitmap_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "bitmap_color_conversion_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "hal__framebuffer_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "hal__gpio_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "hal__i2c_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "hal__real_time_clock_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "hal__spi_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "hal__time_E");
   E205 : Short_Integer; pragma Import (Ada, E205, "ravenscar_time_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "soft_drawing_bitmap_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "memory_mapped_bitmap_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "ssd1306_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "fonts_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "stm32__adc_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "stm32__dac_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "stm32__exti_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "stm32__i2c_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "stm32__power_control_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "stm32__rcc_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "stm32__rtc_E");
   E199 : Short_Integer; pragma Import (Ada, E199, "stm32__spi_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "stm32__gpio_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "stm32__device_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "stm32__syscfg_E");

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
      E119 := E119 + 1;
      System.Bb.Timing_Events'Elab_Spec;
      E080 := E080 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E058 := E058 + 1;
      System.Exception_Table'Elab_Body;
      E092 := E092 + 1;
      E094 := E094 + 1;
      Ada.Streams'Elab_Spec;
      E126 := E126 + 1;
      System.Finalization_Root'Elab_Spec;
      E134 := E134 + 1;
      Ada.Finalization'Elab_Spec;
      E132 := E132 + 1;
      System.Storage_Pools'Elab_Spec;
      E136 := E136 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E129 := E129 + 1;
      Ada.Real_Time'Elab_Body;
      E117 := E117 + 1;
      System.Pool_Global'Elab_Spec;
      E138 := E138 + 1;
      HAL.BITMAP'ELAB_SPEC;
      E124 := E124 + 1;
      E152 := E152 + 1;
      HAL.FRAMEBUFFER'ELAB_SPEC;
      E145 := E145 + 1;
      HAL.GPIO'ELAB_SPEC;
      E146 := E146 + 1;
      HAL.I2C'ELAB_SPEC;
      E147 := E147 + 1;
      HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      E193 := E193 + 1;
      HAL.SPI'ELAB_SPEC;
      E201 := E201 + 1;
      HAL.TIME'ELAB_SPEC;
      E148 := E148 + 1;
      Ravenscar_Time'Elab_Spec;
      Ravenscar_Time'Elab_Body;
      E205 := E205 + 1;
      Soft_Drawing_Bitmap'Elab_Spec;
      Soft_Drawing_Bitmap'Elab_Body;
      E154 := E154 + 1;
      Memory_Mapped_Bitmap'Elab_Spec;
      Memory_Mapped_Bitmap'Elab_Body;
      E150 := E150 + 1;
      SSD1306'ELAB_SPEC;
      SSD1306'ELAB_BODY;
      E142 := E142 + 1;
      E121 := E121 + 1;
      STM32.ADC'ELAB_SPEC;
      E164 := E164 + 1;
      E172 := E172 + 1;
      E184 := E184 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E189 := E189 + 1;
      E195 := E195 + 1;
      E180 := E180 + 1;
      STM32.RTC'ELAB_SPEC;
      STM32.RTC'ELAB_BODY;
      E192 := E192 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E199 := E199 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E160 := E160 + 1;
      E182 := E182 + 1;
      STM32.GPIO'ELAB_BODY;
      E178 := E178 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_adc_i2c");

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
   --   /home/hedley/ada/STM32/L/L443/pir_i2c/obj/Debug/fonts-font1.o
   --   /home/hedley/ada/STM32/L/L443/pir_i2c/obj/Debug/fonts.o
   --   /home/hedley/ada/STM32/L/L443/pir_i2c/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/L/L443/pir_i2c/obj/Debug/adc_i2c.o
   --   -L/home/hedley/ada/STM32/L/L443/pir_i2c/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/pir_i2c/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/
   --   -L/home/hedley/ada/STM32/L/L443/pir_i2c/Ada_Drivers_Library/boards/lib/stm32l443bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/pir_i2c/Ada_Drivers_Library/boards/stm32l443_bluepill/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/pir_i2c/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4bluepill/full/adalib/
   --   -L/home/hedley/ada/STM32/L/L443/pir_i2c/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/pir_i2c/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/pir_i2c/Ada_Drivers_Library/components/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/pir_i2c/Ada_Drivers_Library/middleware/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
