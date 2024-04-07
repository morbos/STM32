pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;

package body ada_main is

   E419 : Short_Integer; pragma Import (Ada, E419, "ada__text_io_E");
   E444 : Short_Integer; pragma Import (Ada, E444, "gnat__dynamic_tables_E");
   E413 : Short_Integer; pragma Import (Ada, E413, "ada__tags_E");
   E544 : Short_Integer; pragma Import (Ada, E544, "system__bb__timing_events_E");
   E843 : Short_Integer; pragma Import (Ada, E843, "system__soft_links_E");
   E592 : Short_Integer; pragma Import (Ada, E592, "system__exception_table_E");
   E383 : Short_Integer; pragma Import (Ada, E383, "ada__streams_E");
   E618 : Short_Integer; pragma Import (Ada, E618, "system__finalization_root_E");
   E317 : Short_Integer; pragma Import (Ada, E317, "ada__finalization_E");
   E859 : Short_Integer; pragma Import (Ada, E859, "system__storage_pools_E");
   E616 : Short_Integer; pragma Import (Ada, E616, "system__finalization_masters_E");
   E861 : Short_Integer; pragma Import (Ada, E861, "system__storage_pools__subpools_E");
   E402 : Short_Integer; pragma Import (Ada, E402, "ada__strings__wide_maps_E");
   E409 : Short_Integer; pragma Import (Ada, E409, "ada__strings__wide_maps__wide_constants_E");
   E408 : Short_Integer; pragma Import (Ada, E408, "ada__strings__wide_unbounded_E");
   E372 : Short_Integer; pragma Import (Ada, E372, "ada__real_time_E");
   E376 : Short_Integer; pragma Import (Ada, E376, "ada__real_time__timing_events_E");
   E426 : Short_Integer; pragma Import (Ada, E426, "gnat__array_split_E");
   E440 : Short_Integer; pragma Import (Ada, E440, "gnat__crc32_E");
   E459 : Short_Integer; pragma Import (Ada, E459, "gnat__most_recent_exception_E");
   E462 : Short_Integer; pragma Import (Ada, E462, "gnat__secure_hashes_E");
   E464 : Short_Integer; pragma Import (Ada, E464, "gnat__secure_hashes__md5_E");
   E457 : Short_Integer; pragma Import (Ada, E457, "gnat__md5_E");
   E466 : Short_Integer; pragma Import (Ada, E466, "gnat__secure_hashes__sha1_E");
   E482 : Short_Integer; pragma Import (Ada, E482, "gnat__secure_hashes__sha2_common_E");
   E478 : Short_Integer; pragma Import (Ada, E478, "gnat__secure_hashes__sha2_32_E");
   E480 : Short_Integer; pragma Import (Ada, E480, "gnat__secure_hashes__sha2_64_E");
   E468 : Short_Integer; pragma Import (Ada, E468, "gnat__sha1_E");
   E470 : Short_Integer; pragma Import (Ada, E470, "gnat__sha224_E");
   E472 : Short_Integer; pragma Import (Ada, E472, "gnat__sha256_E");
   E474 : Short_Integer; pragma Import (Ada, E474, "gnat__sha384_E");
   E476 : Short_Integer; pragma Import (Ada, E476, "gnat__sha512_E");
   E491 : Short_Integer; pragma Import (Ada, E491, "gnat__wide_string_split_E");
   E531 : Short_Integer; pragma Import (Ada, E531, "system__bb__execution_time_E");
   E388 : Short_Integer; pragma Import (Ada, E388, "ada__strings__maps_E");
   E377 : Short_Integer; pragma Import (Ada, E377, "ada__strings__maps__constants_E");
   E394 : Short_Integer; pragma Import (Ada, E394, "ada__strings__unbounded_E");
   E486 : Short_Integer; pragma Import (Ada, E486, "gnat__string_split_E");
   E578 : Short_Integer; pragma Import (Ada, E578, "system__checked_pools_E");
   E821 : Short_Integer; pragma Import (Ada, E821, "system__pool_global_E");
   E823 : Short_Integer; pragma Import (Ada, E823, "system__pool_local_E");
   E825 : Short_Integer; pragma Import (Ada, E825, "system__pool_size_E");
   E832 : Short_Integer; pragma Import (Ada, E832, "system__regexp_E");
   E869 : Short_Integer; pragma Import (Ada, E869, "system__tasking__protected_objects_E");
   E887 : Short_Integer; pragma Import (Ada, E887, "system__tasking__protected_objects__multiprocessors_E");
   E873 : Short_Integer; pragma Import (Ada, E873, "system__tasking__restricted__stages_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "bit_fields_E");
   E968 : Short_Integer; pragma Import (Ada, E968, "bluetooth_low_energy_E");
   E966 : Short_Integer; pragma Import (Ada, E966, "bluetooth_low_energy__packets_E");
   E964 : Short_Integer; pragma Import (Ada, E964, "bluetooth_low_energy__beacon_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "cortex_m__cache_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "cortex_m__debug_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "cortex_m__fpu_E");
   E001 : Short_Integer; pragma Import (Ada, E001, "hal__audio_E");
   E002 : Short_Integer; pragma Import (Ada, E002, "hal__bitmap_E");
   E960 : Short_Integer; pragma Import (Ada, E960, "bitmap_color_conversion_E");
   E003 : Short_Integer; pragma Import (Ada, E003, "hal__block_drivers_E");
   E004 : Short_Integer; pragma Import (Ada, E004, "hal__dsi_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "hal__filesystem_E");
   E962 : Short_Integer; pragma Import (Ada, E962, "bitmap_file_output_E");
   E970 : Short_Integer; pragma Import (Ada, E970, "file_block_drivers_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "hal__framebuffer_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "hal__gpio_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "hal__i2c_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "bno055_i2c_io_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "bosch_bno055_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "hal__real_time_clock_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "hal__sdmmc_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "hal__spi_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "hal__time_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "ak8963_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "cs43l22_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "hal__touch_panel_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "ft5336_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ft6x06_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "hal__uart_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "adafruit__thermal_printer_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "ht16k33_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "adafruit__trellis_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "ili9341_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "l3gd20_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "lis3dsh_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "lis3dsh__spi_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "mcp23x08_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "mcp23x08__i2c_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "memory_barriers_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "cortex_m__nvic_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "mma8653_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "mpu9250_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "otm8009a_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "ov2640_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "ov7725_E");
   E974 : Short_Integer; pragma Import (Ada, E974, "partitions_E");
   E976 : Short_Integer; pragma Import (Ada, E976, "pathname_manipulation_E");
   E978 : Short_Integer; pragma Import (Ada, E978, "ravenscar_time_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "semihosting_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "semihosting__filesystem_E");
   E980 : Short_Integer; pragma Import (Ada, E980, "simple_synthesizer_E");
   E982 : Short_Integer; pragma Import (Ada, E982, "soft_drawing_bitmap_E");
   E972 : Short_Integer; pragma Import (Ada, E972, "memory_mapped_bitmap_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "ssd1306_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "ssd1306_spi_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "st7735r_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "st7735r__ram_framebuffer_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "stm32__adc_E");
   E024 : Short_Integer; pragma Import (Ada, E024, "stm32__dac_E");
   E033 : Short_Integer; pragma Import (Ada, E033, "stm32__exti_E");
   E037 : Short_Integer; pragma Import (Ada, E037, "stm32__i2c_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "stm32__power_control_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "stm32__rcc_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "stm32__rtc_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "stm32__spi_E");
   E035 : Short_Integer; pragma Import (Ada, E035, "stm32__gpio_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "stm32__device_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "stm32__syscfg_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "stmpe1600_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "stmpe811_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "t67xx_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "t67xx_i2c_io_E");
   E986 : Short_Integer; pragma Import (Ada, E986, "try_E");
   E984 : Short_Integer; pragma Import (Ada, E984, "virtual_file_system_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "vl53l0x_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "vl6180x_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "vl6180x_i2c_io_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "wm8994_E");

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
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
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
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, True, True, False, False, False, False, True, 
           False, False, False, False, False, False, False, True, 
           True, False, False, False, False, False, True, False, 
           False, False, False, False, False, False, False, False, 
           True, True, False, False, True, True, False, False, 
           False, True, False, False, False, False, True, False, 
           True, True, False, False, False, True, True, True, 
           True, True, True, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, True, True, 
           False, True, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, True, False, 
           False, False, False, True, True, True, True, False, 
           False, True, False, False, True, True, False, True, 
           True, False, True, True, True, True, False, True, 
           False, False, False, True, False, False, True, False, 
           True, False, True, True, False, False, False, True, 
           False, False, False, True, False, True, False, False, 
           False, False, False, False, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, True, True, True, True, False, 
           False, True, False, False, False, True, False, False, 
           False, False, True, False),
         Count => (0, 0, 0, 1, 0, 0, 0, 0, 1, 0),
         Unknown => (False, False, False, False, False, False, False, False, True, False));
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

      if E419 = 0 then
         Ada.Text_Io'Elab_Body;
      end if;
      E419 := E419 + 1;
      E444 := E444 + 1;
      if E544 = 0 then
         System.Bb.Timing_Events'Elab_Spec;
      end if;
      E544 := E544 + 1;
      if E843 = 0 then
         System.Soft_Links'Elab_Spec;
      end if;
      if E413 = 0 then
         Ada.Tags'Elab_Body;
      end if;
      E413 := E413 + 1;
      if E592 = 0 then
         System.Exception_Table'Elab_Body;
      end if;
      E592 := E592 + 1;
      E843 := E843 + 1;
      if E383 = 0 then
         Ada.Streams'Elab_Spec;
      end if;
      E383 := E383 + 1;
      if E618 = 0 then
         System.Finalization_Root'Elab_Spec;
      end if;
      E618 := E618 + 1;
      if E317 = 0 then
         Ada.Finalization'Elab_Spec;
      end if;
      E317 := E317 + 1;
      if E859 = 0 then
         System.Storage_Pools'Elab_Spec;
      end if;
      E859 := E859 + 1;
      if E616 = 0 then
         System.Finalization_Masters'Elab_Spec;
      end if;
      if E616 = 0 then
         System.Finalization_Masters'Elab_Body;
      end if;
      E616 := E616 + 1;
      if E861 = 0 then
         System.Storage_Pools.Subpools'Elab_Spec;
      end if;
      E861 := E861 + 1;
      if E402 = 0 then
         Ada.Strings.Wide_Maps'Elab_Spec;
      end if;
      E402 := E402 + 1;
      if E409 = 0 then
         Ada.Strings.Wide_Maps.Wide_Constants'Elab_Spec;
      end if;
      E409 := E409 + 1;
      if E408 = 0 then
         Ada.Strings.Wide_Unbounded'Elab_Spec;
      end if;
      E408 := E408 + 1;
      if E372 = 0 then
         Ada.Real_Time'Elab_Body;
      end if;
      E372 := E372 + 1;
      if E376 = 0 then
         Ada.Real_Time.Timing_Events'Elab_Spec;
      end if;
      E376 := E376 + 1;
      E426 := E426 + 1;
      E440 := E440 + 1;
      E459 := E459 + 1;
      E462 := E462 + 1;
      E464 := E464 + 1;
      if E457 = 0 then
         Gnat.Md5'Elab_Spec;
      end if;
      E457 := E457 + 1;
      E466 := E466 + 1;
      E482 := E482 + 1;
      E478 := E478 + 1;
      if E480 = 0 then
         Gnat.Secure_Hashes.Sha2_64'Elab_Spec;
      end if;
      E480 := E480 + 1;
      if E468 = 0 then
         Gnat.Sha1'Elab_Spec;
      end if;
      E468 := E468 + 1;
      if E470 = 0 then
         Gnat.Sha224'Elab_Spec;
      end if;
      E470 := E470 + 1;
      if E472 = 0 then
         Gnat.Sha256'Elab_Spec;
      end if;
      E472 := E472 + 1;
      if E474 = 0 then
         Gnat.Sha384'Elab_Spec;
      end if;
      E474 := E474 + 1;
      if E476 = 0 then
         Gnat.Sha512'Elab_Spec;
      end if;
      E476 := E476 + 1;
      if E491 = 0 then
         Gnat.Wide_String_Split'Elab_Spec;
      end if;
      E491 := E491 + 1;
      if E531 = 0 then
         System.Bb.Execution_Time'Elab_Body;
      end if;
      E531 := E531 + 1;
      if E388 = 0 then
         Ada.Strings.Maps'Elab_Spec;
      end if;
      E388 := E388 + 1;
      if E377 = 0 then
         Ada.Strings.Maps.Constants'Elab_Spec;
      end if;
      E377 := E377 + 1;
      if E394 = 0 then
         Ada.Strings.Unbounded'Elab_Spec;
      end if;
      E394 := E394 + 1;
      if E486 = 0 then
         Gnat.String_Split'Elab_Spec;
      end if;
      E486 := E486 + 1;
      if E578 = 0 then
         System.Checked_Pools'Elab_Spec;
      end if;
      E578 := E578 + 1;
      if E821 = 0 then
         System.Pool_Global'Elab_Spec;
      end if;
      E821 := E821 + 1;
      if E823 = 0 then
         System.Pool_Local'Elab_Spec;
      end if;
      E823 := E823 + 1;
      if E825 = 0 then
         System.Pool_Size'Elab_Spec;
      end if;
      E825 := E825 + 1;
      if E832 = 0 then
         System.Regexp'Elab_Spec;
      end if;
      E832 := E832 + 1;
      if E869 = 0 then
         System.Tasking.Protected_Objects'Elab_Body;
      end if;
      E869 := E869 + 1;
      if E887 = 0 then
         System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      end if;
      E887 := E887 + 1;
      if E873 = 0 then
         System.Tasking.Restricted.Stages'Elab_Body;
      end if;
      E873 := E873 + 1;
      E128 := E128 + 1;
      E968 := E968 + 1;
      E966 := E966 + 1;
      E964 := E964 + 1;
      E094 := E094 + 1;
      E096 := E096 + 1;
      E100 := E100 + 1;
      if E001 = 0 then
         HAL.AUDIO'ELAB_SPEC;
      end if;
      E001 := E001 + 1;
      if E002 = 0 then
         HAL.BITMAP'ELAB_SPEC;
      end if;
      E002 := E002 + 1;
      E960 := E960 + 1;
      if E003 = 0 then
         HAL.BLOCK_DRIVERS'ELAB_SPEC;
      end if;
      E003 := E003 + 1;
      if E004 = 0 then
         HAL.DSI'ELAB_SPEC;
      end if;
      E004 := E004 + 1;
      if E005 = 0 then
         HAL.FILESYSTEM'ELAB_SPEC;
      end if;
      E005 := E005 + 1;
      E962 := E962 + 1;
      if E970 = 0 then
         File_Block_Drivers'Elab_Spec;
      end if;
      if E970 = 0 then
         File_Block_Drivers'Elab_Body;
      end if;
      E970 := E970 + 1;
      if E006 = 0 then
         HAL.FRAMEBUFFER'ELAB_SPEC;
      end if;
      E006 := E006 + 1;
      if E007 = 0 then
         HAL.GPIO'ELAB_SPEC;
      end if;
      E007 := E007 + 1;
      if E008 = 0 then
         HAL.I2C'ELAB_SPEC;
      end if;
      E008 := E008 + 1;
      if E130 = 0 then
         BNO055_I2C_IO'ELAB_SPEC;
      end if;
      E130 := E130 + 1;
      E132 := E132 + 1;
      if E009 = 0 then
         HAL.REAL_TIME_CLOCK'ELAB_SPEC;
      end if;
      E009 := E009 + 1;
      if E011 = 0 then
         HAL.SDMMC'ELAB_SPEC;
      end if;
      E011 := E011 + 1;
      if E012 = 0 then
         HAL.SPI'ELAB_SPEC;
      end if;
      E012 := E012 + 1;
      if E013 = 0 then
         HAL.TIME'ELAB_SPEC;
      end if;
      E013 := E013 + 1;
      E126 := E126 + 1;
      if E134 = 0 then
         CS43L22'ELAB_SPEC;
      end if;
      if E134 = 0 then
         CS43L22'ELAB_BODY;
      end if;
      E134 := E134 + 1;
      if E014 = 0 then
         HAL.TOUCH_PANEL'ELAB_SPEC;
      end if;
      E014 := E014 + 1;
      if E136 = 0 then
         FT5336'ELAB_SPEC;
      end if;
      if E136 = 0 then
         FT5336'ELAB_BODY;
      end if;
      E136 := E136 + 1;
      if E138 = 0 then
         Ft6x06'Elab_Spec;
      end if;
      if E138 = 0 then
         Ft6x06'Elab_Body;
      end if;
      E138 := E138 + 1;
      if E015 = 0 then
         HAL.UART'ELAB_SPEC;
      end if;
      E015 := E015 + 1;
      if E121 = 0 then
         Adafruit.Thermal_Printer'Elab_Spec;
      end if;
      if E121 = 0 then
         Adafruit.Thermal_Printer'Elab_Body;
      end if;
      E121 := E121 + 1;
      if E140 = 0 then
         HT16K33'ELAB_SPEC;
      end if;
      if E140 = 0 then
         HT16K33'ELAB_BODY;
      end if;
      E140 := E140 + 1;
      if E123 = 0 then
         Adafruit.Trellis'Elab_Spec;
      end if;
      if E123 = 0 then
         Adafruit.Trellis'Elab_Body;
      end if;
      E123 := E123 + 1;
      if E142 = 0 then
         ILI9341'ELAB_SPEC;
      end if;
      if E142 = 0 then
         ILI9341'ELAB_BODY;
      end if;
      E142 := E142 + 1;
      if E145 = 0 then
         L3GD20'ELAB_SPEC;
      end if;
      if E145 = 0 then
         L3GD20'ELAB_BODY;
      end if;
      E145 := E145 + 1;
      if E149 = 0 then
         LIS3DSH'ELAB_SPEC;
      end if;
      if E149 = 0 then
         LIS3DSH'ELAB_BODY;
      end if;
      E149 := E149 + 1;
      if E147 = 0 then
         LIS3DSH.SPI'ELAB_SPEC;
      end if;
      if E147 = 0 then
         LIS3DSH.SPI'ELAB_BODY;
      end if;
      E147 := E147 + 1;
      if E154 = 0 then
         Mcp23x08'Elab_Spec;
      end if;
      if E154 = 0 then
         Mcp23x08'Elab_Body;
      end if;
      E154 := E154 + 1;
      if E152 = 0 then
         Mcp23x08.I2c'Elab_Spec;
      end if;
      if E152 = 0 then
         Mcp23x08.I2c'Elab_Body;
      end if;
      E152 := E152 + 1;
      E113 := E113 + 1;
      if E102 = 0 then
         Cortex_M.Nvic'Elab_Spec;
      end if;
      E102 := E102 + 1;
      if E156 = 0 then
         MMA8653'ELAB_SPEC;
      end if;
      if E156 = 0 then
         MMA8653'ELAB_BODY;
      end if;
      E156 := E156 + 1;
      E158 := E158 + 1;
      if E160 = 0 then
         OTM8009A'ELAB_SPEC;
      end if;
      if E160 = 0 then
         OTM8009A'ELAB_BODY;
      end if;
      E160 := E160 + 1;
      E162 := E162 + 1;
      E164 := E164 + 1;
      E974 := E974 + 1;
      E976 := E976 + 1;
      if E978 = 0 then
         Ravenscar_Time'Elab_Spec;
      end if;
      if E978 = 0 then
         Ravenscar_Time'Elab_Body;
      end if;
      E978 := E978 + 1;
      E117 := E117 + 1;
      if E115 = 0 then
         Semihosting.Filesystem'Elab_Spec;
      end if;
      if E115 = 0 then
         Semihosting.Filesystem'Elab_Body;
      end if;
      E115 := E115 + 1;
      if E980 = 0 then
         Simple_Synthesizer'Elab_Spec;
      end if;
      if E980 = 0 then
         Simple_Synthesizer'Elab_Body;
      end if;
      E980 := E980 + 1;
      if E982 = 0 then
         Soft_Drawing_Bitmap'Elab_Spec;
      end if;
      if E982 = 0 then
         Soft_Drawing_Bitmap'Elab_Body;
      end if;
      E982 := E982 + 1;
      if E972 = 0 then
         Memory_Mapped_Bitmap'Elab_Spec;
      end if;
      if E972 = 0 then
         Memory_Mapped_Bitmap'Elab_Body;
      end if;
      E972 := E972 + 1;
      if E167 = 0 then
         SSD1306'ELAB_SPEC;
      end if;
      if E167 = 0 then
         SSD1306'ELAB_BODY;
      end if;
      E167 := E167 + 1;
      if E169 = 0 then
         SSD1306_SPI'ELAB_SPEC;
      end if;
      if E169 = 0 then
         SSD1306_SPI'ELAB_BODY;
      end if;
      E169 := E169 + 1;
      if E173 = 0 then
         ST7735R'ELAB_SPEC;
      end if;
      if E173 = 0 then
         ST7735R'ELAB_BODY;
      end if;
      E173 := E173 + 1;
      if E171 = 0 then
         ST7735R.RAM_FRAMEBUFFER'ELAB_SPEC;
      end if;
      if E171 = 0 then
         ST7735R.RAM_FRAMEBUFFER'ELAB_BODY;
      end if;
      E171 := E171 + 1;
      if E018 = 0 then
         STM32.ADC'ELAB_SPEC;
      end if;
      E018 := E018 + 1;
      E024 := E024 + 1;
      E033 := E033 + 1;
      if E037 = 0 then
         STM32.I2C'ELAB_SPEC;
      end if;
      if E037 = 0 then
         STM32.I2C'ELAB_BODY;
      end if;
      E037 := E037 + 1;
      E039 := E039 + 1;
      E041 := E041 + 1;
      if E043 = 0 then
         STM32.RTC'ELAB_SPEC;
      end if;
      if E043 = 0 then
         STM32.RTC'ELAB_BODY;
      end if;
      E043 := E043 + 1;
      if E048 = 0 then
         STM32.SPI'ELAB_SPEC;
      end if;
      if E048 = 0 then
         STM32.SPI'ELAB_BODY;
      end if;
      E048 := E048 + 1;
      if E035 = 0 then
         STM32.GPIO'ELAB_SPEC;
      end if;
      if E027 = 0 then
         STM32.DEVICE'ELAB_SPEC;
      end if;
      E027 := E027 + 1;
      E050 := E050 + 1;
      if E035 = 0 then
         STM32.GPIO'ELAB_BODY;
      end if;
      E035 := E035 + 1;
      if E175 = 0 then
         STMPE1600'ELAB_SPEC;
      end if;
      if E175 = 0 then
         STMPE1600'ELAB_BODY;
      end if;
      E175 := E175 + 1;
      if E177 = 0 then
         STMPE811'ELAB_SPEC;
      end if;
      if E177 = 0 then
         STMPE811'ELAB_BODY;
      end if;
      E177 := E177 + 1;
      E179 := E179 + 1;
      if E181 = 0 then
         T67XX_I2C_IO'ELAB_SPEC;
      end if;
      E181 := E181 + 1;
      E986 := E986 + 1;
      if E984 = 0 then
         Virtual_File_System'Elab_Spec;
      end if;
      if E984 = 0 then
         Virtual_File_System'Elab_Body;
      end if;
      E984 := E984 + 1;
      E183 := E183 + 1;
      E185 := E185 + 1;
      if E187 = 0 then
         VL6180X_I2C_IO'ELAB_SPEC;
      end if;
      E187 := E187 + 1;
      if E189 = 0 then
         WM8994'ELAB_SPEC;
      end if;
      if E189 = 0 then
         WM8994'ELAB_BODY;
      end if;
      E189 := E189 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
      Start_Slave_CPUs;
   end adainit;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/L/L443/tx_l443/obj/Debug/try.o
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/Ada_Drivers_Library/boards/lib/stm32l443bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/Ada_Drivers_Library/boards/stm32l443_bluepill/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4bluepill/full/adalib/
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/Ada_Drivers_Library/components/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L443/tx_l443/Ada_Drivers_Library/middleware/lib/stm32l4bluepill/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
