pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sensortile.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sensortile.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E101 : Short_Integer; pragma Import (Ada, E101, "ada__tags_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "system__bb__timing_events_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "system__soft_links_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "system__exception_table_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "ada__streams_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "system__finalization_root_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "ada__finalization_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "system__storage_pools_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "system__finalization_masters_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__real_time_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__pool_global_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "system__tasking__protected_objects_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__tasking__protected_objects__multiprocessors_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__tasking__restricted__stages_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "hal__gpio_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "hal__i2c_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "hal__spi_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "hts221_i2c_io_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "log_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "pcm1774_i2c_io_E");
   E253 : Short_Integer; pragma Import (Ada, E253, "stc3115_i2c_io_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "stm32__adc_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "stm32__dac_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "stm32__exti_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "stm32__i2c_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__rcc_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "stm32__spi_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "stm32__dfsdm_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "stm32__gpio_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "stm32__device_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__syscfg_E");
   E243 : Short_Integer; pragma Import (Ada, E243, "bluenrg_spi_io_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "lps22hb_spi_io_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "lsm303agr_spi_io_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "lsm6dsm_spi_io_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "peripherals_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "stm32__sai_E");
   E282 : Short_Integer; pragma Import (Ada, E282, "uuid_E");
   E319 : Short_Integer; pragma Import (Ada, E319, "bluenrg_int_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "bluenrg_utils_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "comm_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "comm__hw_E");
   E284 : Short_Integer; pragma Import (Ada, E284, "comm__setup_E");
   E315 : Short_Integer; pragma Import (Ada, E315, "gen_list_E");
   E268 : Short_Integer; pragma Import (Ada, E268, "hci_le_E");
   E294 : Short_Integer; pragma Import (Ada, E294, "hts221_E");
   E298 : Short_Integer; pragma Import (Ada, E298, "lps22hb_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "pcm1774_E");
   E310 : Short_Integer; pragma Import (Ada, E310, "stc3115_E");
   E322 : Short_Integer; pragma Import (Ada, E322, "stm32l4_interrupts_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "utils_E");
   E270 : Short_Integer; pragma Import (Ada, E270, "hci_E");
   E264 : Short_Integer; pragma Import (Ada, E264, "bluenrg_E");
   E276 : Short_Integer; pragma Import (Ada, E276, "bluenrg_gap_aci_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "bluenrg_gatt_aci_E");
   E286 : Short_Integer; pragma Import (Ada, E286, "bluenrg_hal_aci_E");
   E313 : Short_Integer; pragma Import (Ada, E313, "bluenrg_l2cap_aci_E");
   E272 : Short_Integer; pragma Import (Ada, E272, "comm__run_E");
   E292 : Short_Integer; pragma Import (Ada, E292, "hts221_i2c_E");
   E296 : Short_Integer; pragma Import (Ada, E296, "lps22hb_spi_E");
   E302 : Short_Integer; pragma Import (Ada, E302, "lsm303agr_E");
   E300 : Short_Integer; pragma Import (Ada, E300, "lsm303agr_spi_E");
   E306 : Short_Integer; pragma Import (Ada, E306, "lsm6dsm_E");
   E304 : Short_Integer; pragma Import (Ada, E304, "lsm6dsm_spi_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "main_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "bluenrg_spi_E");
   E317 : Short_Integer; pragma Import (Ada, E317, "nrg_hal_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "pcm1774_i2c_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "audio_E");
   E308 : Short_Integer; pragma Import (Ada, E308, "stc3115_i2c_E");
   E289 : Short_Integer; pragma Import (Ada, E289, "sensors_E");

   Sec_Default_Sized_Stacks : array (1 .. 3) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

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
      Binder_Sec_Stacks_Count := 3;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      System.Bb.Timing_Events'Elab_Spec;
      E115 := E115 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E101 := E101 + 1;
      System.Exception_Table'Elab_Body;
      E055 := E055 + 1;
      E057 := E057 + 1;
      Ada.Streams'Elab_Spec;
      E170 := E170 + 1;
      System.Finalization_Root'Elab_Spec;
      E178 := E178 + 1;
      Ada.Finalization'Elab_Spec;
      E176 := E176 + 1;
      System.Storage_Pools'Elab_Spec;
      E180 := E180 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E173 := E173 + 1;
      Ada.Real_Time'Elab_Body;
      E008 := E008 + 1;
      System.Pool_Global'Elab_Spec;
      E182 := E182 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E123 := E123 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E127 := E127 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E132 := E132 + 1;
      HAL.GPIO'ELAB_SPEC;
      E200 := E200 + 1;
      HAL.I2C'ELAB_SPEC;
      E168 := E168 + 1;
      HAL.SPI'ELAB_SPEC;
      E191 := E191 + 1;
      HTS221_I2C_IO'ELAB_SPEC;
      E245 := E245 + 1;
      E137 := E137 + 1;
      PCM1774_I2C_IO'ELAB_SPEC;
      E238 := E238 + 1;
      STC3115_I2C_IO'ELAB_SPEC;
      E253 := E253 + 1;
      STM32.ADC'ELAB_SPEC;
      E151 := E151 + 1;
      E158 := E158 + 1;
      E196 := E196 + 1;
      STM32.I2C'ELAB_SPEC;
      STM32.I2C'ELAB_BODY;
      E167 := E167 + 1;
      E143 := E143 + 1;
      STM32.SPI'ELAB_SPEC;
      STM32.SPI'ELAB_BODY;
      E189 := E189 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.DEVICE'ELAB_SPEC;
      E149 := E149 + 1;
      E147 := E147 + 1;
      E161 := E161 + 1;
      STM32.GPIO'ELAB_BODY;
      E141 := E141 + 1;
      Bluenrg_Spi_Io'Elab_Spec;
      E243 := E243 + 1;
      LPS22HB_SPI_IO'ELAB_SPEC;
      E247 := E247 + 1;
      LSM303AGR_SPI_IO'ELAB_SPEC;
      E249 := E249 + 1;
      LSM6DSM_SPI_IO'ELAB_SPEC;
      E251 := E251 + 1;
      Peripherals'Elab_Spec;
      E241 := E241 + 1;
      E255 := E255 + 1;
      E282 := E282 + 1;
      Bluenrg_Int'Elab_Spec;
      E266 := E266 + 1;
      Stm32l4_Interrupts'Elab_Spec;
      E315 := E315 + 1;
      Hci'Elab_Spec;
      E276 := E276 + 1;
      E279 := E279 + 1;
      E286 := E286 + 1;
      E319 := E319 + 1;
      E313 := E313 + 1;
      E258 := E258 + 1;
      Comm.Run'Elab_Spec;
      E268 := E268 + 1;
      E294 := E294 + 1;
      HTS221_I2C'ELAB_SPEC;
      E292 := E292 + 1;
      E298 := E298 + 1;
      LPS22HB_SPI'ELAB_SPEC;
      E296 := E296 + 1;
      E302 := E302 + 1;
      LSM303AGR_SPI'ELAB_SPEC;
      E300 := E300 + 1;
      E306 := E306 + 1;
      LSM6DSM_SPI'ELAB_SPEC;
      E304 := E304 + 1;
      Main'Elab_Spec;
      E264 := E264 + 1;
      Bluenrg_Spi'Elab_Spec;
      E262 := E262 + 1;
      E260 := E260 + 1;
      E284 := E284 + 1;
      Nrg_Hal'Elab_Spec;
      E317 := E317 + 1;
      E270 := E270 + 1;
      E236 := E236 + 1;
      PCM1774_I2C'ELAB_SPEC;
      E234 := E234 + 1;
      Audio'Elab_Spec;
      E134 := E134 + 1;
      E310 := E310 + 1;
      STC3115_I2C'ELAB_SPEC;
      E308 := E308 + 1;
      Sensors'Elab_Body;
      E289 := E289 + 1;
      Comm.Run'Elab_Body;
      E272 := E272 + 1;
      Main'Elab_Body;
      E005 := E005 + 1;
      E322 := E322 + 1;
      E203 := E203 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sensortile");

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
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/ble_status.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_aci.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_gap.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_gatt_server.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/hts221_i2c_io.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/log.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/ogf_ocf.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/pcm1774_i2c_io.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/security.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/sensor_types.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/stc3115_i2c_io.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_spi_io.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/lps22hb_spi_io.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/lsm303agr_spi_io.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/lsm6dsm_spi_io.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/uuid.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_utils.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/gen_list.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_gap_aci.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_gatt_aci.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_hal_aci.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_int.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_l2cap_aci.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/comm.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/hci_le.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/hts221.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/hts221_i2c.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/lps22hb.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/lps22hb_spi.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/lsm303agr.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/lsm303agr_spi.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/lsm6dsm.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/lsm6dsm_spi.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/bluenrg_spi.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/comm-hw.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/comm-setup.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/nrg_hal.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/hci.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/pcm1774.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/pcm1774_i2c.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/audio.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/stc3115.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/stc3115_i2c.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/sensors.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/comm-run.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/main.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/stm32l4_interrupts.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/utils.o
   --   /home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/sensortile.o
   --   -L/home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L476/sensortile/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/
   --   -L/home/hedley/ada/STM32/L/L476/sensortile/Ada_Drivers_Library/boards/lib/stm32l476sensortile/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L476/sensortile/Ada_Drivers_Library/boards/stm32l476_sensortile/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L476/sensortile/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4x6/full/adalib/
   --   -L/home/hedley/ada/STM32/L/L476/sensortile/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L476/sensortile/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L476/sensortile/Ada_Drivers_Library/components/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/home/hedley/ada/STM32/L/L476/sensortile/Ada_Drivers_Library/middleware/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4x6/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
