pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__lsm_font_l443.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__lsm_font_l443.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E057 : Short_Integer; pragma Import (Ada, E057, "ada__tags_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "ada__streams_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__finalization_root_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "ada__finalization_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "system__soft_links_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "system__storage_pools_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__finalization_masters_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__bb__timing_events_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "ada__text_io_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "system__exception_table_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "system__pool_global_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "ada__real_time_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "hal__bitmap_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "bitmap_color_conversion_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "hal__framebuffer_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "hal__gpio_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "hal__i2c_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "hal__spi_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "hal__time_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "ravenscar_time_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "soft_drawing_bitmap_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "memory_mapped_bitmap_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ssd1306_spi_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "fonts_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "stm32__adc_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "stm32__dac_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "stm32__exti_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "stm32__gpio_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "lsm9ds1_spi_io_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "stm32__i2c_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "stm32__rcc_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "stm32__spi_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "stm32__syscfg_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "stm32__device_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "peripherals_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "utils_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "lsm9ds1_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "lsm9ds1_spi_E");

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
      E127 := E127 + 1;
      System.Finalization_Root'Elab_Spec;
      E136 := E136 + 1;
      Ada.Finalization'Elab_Spec;
      E134 := E134 + 1;
      System.Soft_Links'Elab_Spec;
      System.Storage_Pools'Elab_Spec;
      E138 := E138 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Bb.Timing_Events'Elab_Spec;
      E079 := E079 + 1;
      E093 := E093 + 1;
      Ada.Text_Io'Elab_Body;
      E117 := E117 + 1;
      System.Exception_Table'Elab_Body;
      E091 := E091 + 1;
      System.Pool_Global'Elab_Spec;
      E140 := E140 + 1;
      System.Finalization_Masters'Elab_Body;
      E131 := E131 + 1;
      Ada.Tags'Elab_Body;
      E057 := E057 + 1;
      Ada.Real_Time'Elab_Body;
      E115 := E115 + 1;
      HAL.BITMAP'ELAB_SPEC;
      E129 := E129 + 1;
      E150 := E150 + 1;
      HAL.FRAMEBUFFER'ELAB_SPEC;
      E143 := E143 + 1;
      HAL.GPIO'ELAB_SPEC;
      E144 := E144 + 1;
      HAL.I2C'ELAB_SPEC;
      E190 := E190 + 1;
      HAL.SPI'ELAB_SPEC;
      E145 := E145 + 1;
      HAL.TIME'ELAB_SPEC;
      E146 := E146 + 1;
      Ravenscar_Time'Elab_Spec;
      Ravenscar_Time'Elab_Body;
      E204 := E204 + 1;
      Soft_Drawing_Bitmap'Elab_Spec;
      E152 := E152 + 1;
      Memory_Mapped_Bitmap'Elab_Spec;
      E148 := E148 + 1;
      SSD1306_SPI'ELAB_SPEC;
      E125 := E125 + 1;
      STM32.ADC'ELAB_SPEC;
      E177 := E177 + 1;
      E183 := E183 + 1;
      E198 := E198 + 1;
      STM32.GPIO'ELAB_SPEC;
      LSM9DS1_SPI_IO'ELAB_SPEC;
      E164 := E164 + 1;
      STM32.I2C'ELAB_SPEC;
      E189 := E189 + 1;
      E169 := E169 + 1;
      STM32.SPI'ELAB_SPEC;
      E193 := E193 + 1;
      E167 := E167 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E175 := E175 + 1;
      E173 := E173 + 1;
      Peripherals'Elab_Spec;
      E202 := E202 + 1;
      E122 := E122 + 1;
      E119 := E119 + 1;
      E162 := E162 + 1;
      LSM9DS1_SPI'ELAB_SPEC;
      E158 := E158 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_lsm_font_l443");

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
   --   /backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/fonts-font2.o
   --   /backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/lsm9ds1_spi_io.o
   --   /backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/peripherals.o
   --   /backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/utils.o
   --   /backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/fonts.o
   --   /backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/lsm9ds1.o
   --   /backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/lsm9ds1_spi.o
   --   /backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/lsm_font_l443.o
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/obj/Debug/
   --   -L/backup/ada/STM32/L/
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/Ada_Drivers_Library/boards/lib/stm32l443bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/Ada_Drivers_Library/boards/stm32l443_bluepill/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4bluepill/full/adalib/
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/Ada_Drivers_Library/components/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/Ada_Drivers_Library/middleware/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/backup/ada/STM32/L/L443/lsm_font_l443/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
