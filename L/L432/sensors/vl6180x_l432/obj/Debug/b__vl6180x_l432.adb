pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__vl6180x_l432.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__vl6180x_l432.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E099 : Short_Integer; pragma Import (Ada, E099, "ada__tags_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "ada__streams_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "system__finalization_root_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "ada__finalization_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "system__soft_links_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "system__storage_pools_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "system__finalization_masters_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "system__bb__timing_events_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "ada__text_io_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "system__exception_table_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "system__pool_global_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "delays_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "hal__gpio_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "hal__i2c_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "hal__spi_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "stm32__adc_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "stm32__dac_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "stm32__exti_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "stm32__gpio_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "stm32__i2c_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "stm32__rcc_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "stm32__spi_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "stm32__syscfg_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "stm32__device_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "vl6180x_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "vl6180x_i2c_io_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "vl6180x_i2c_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Streams'Elab_Spec;
      E151 := E151 + 1;
      System.Finalization_Root'Elab_Spec;
      E160 := E160 + 1;
      Ada.Finalization'Elab_Spec;
      E158 := E158 + 1;
      System.Soft_Links'Elab_Spec;
      System.Storage_Pools'Elab_Spec;
      E162 := E162 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Bb.Timing_Events'Elab_Spec;
      E113 := E113 + 1;
      E052 := E052 + 1;
      Ada.Text_Io'Elab_Body;
      E119 := E119 + 1;
      System.Exception_Table'Elab_Body;
      E050 := E050 + 1;
      System.Pool_Global'Elab_Spec;
      E164 := E164 + 1;
      System.Finalization_Masters'Elab_Body;
      E155 := E155 + 1;
      Ada.Tags'Elab_Body;
      E099 := E099 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      E182 := E182 + 1;
      HAL.GPIO'ELAB_SPEC;
      E153 := E153 + 1;
      HAL.I2C'ELAB_SPEC;
      E169 := E169 + 1;
      HAL.SPI'ELAB_SPEC;
      E174 := E174 + 1;
      STM32.ADC'ELAB_SPEC;
      E127 := E127 + 1;
      E134 := E134 + 1;
      E146 := E146 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.I2C'ELAB_SPEC;
      E168 := E168 + 1;
      E142 := E142 + 1;
      STM32.SPI'ELAB_SPEC;
      E172 := E172 + 1;
      E140 := E140 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E123 := E123 + 1;
      E144 := E144 + 1;
      E184 := E184 + 1;
      VL6180X_I2C_IO'ELAB_SPEC;
      E186 := E186 + 1;
      VL6180X_I2C'ELAB_SPEC;
      E180 := E180 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_vl6180x_l432");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/obj/Debug/delays.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/obj/Debug/vl6180x_i2c.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/obj/Debug/vl6180x_l432.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/Ada_Drivers_Library/boards/lib/stm32l4nucleo/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/Ada_Drivers_Library/boards/stm32l4_nucleo/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/Ada_Drivers_Library/components/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/Ada_Drivers_Library/middleware/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/sensors/vl6180x_l432/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32l4nucleo/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
