pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__dac_sw.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__dac_sw.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E100 : Short_Integer; pragma Import (Ada, E100, "ada__tags_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "ada__streams_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "system__finalization_root_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "ada__finalization_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "system__soft_links_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "system__storage_pools_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__finalization_masters_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "system__bb__timing_events_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "ada__text_io_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "system__exception_table_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__pool_global_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__real_time_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "hal__gpio_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "hal__i2c_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "hal__spi_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "stm32__adc_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "stm32__dac_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__exti_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "stm32__gpio_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "stm32__i2c_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__rcc_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "stm32__spi_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "stm32__syscfg_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Streams'Elab_Spec;
      E152 := E152 + 1;
      System.Finalization_Root'Elab_Spec;
      E161 := E161 + 1;
      Ada.Finalization'Elab_Spec;
      E159 := E159 + 1;
      System.Soft_Links'Elab_Spec;
      System.Storage_Pools'Elab_Spec;
      E163 := E163 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Bb.Timing_Events'Elab_Spec;
      E114 := E114 + 1;
      E053 := E053 + 1;
      Ada.Text_Io'Elab_Body;
      E120 := E120 + 1;
      System.Exception_Table'Elab_Body;
      E051 := E051 + 1;
      System.Pool_Global'Elab_Spec;
      E165 := E165 + 1;
      System.Finalization_Masters'Elab_Body;
      E156 := E156 + 1;
      Ada.Tags'Elab_Body;
      E100 := E100 + 1;
      Ada.Real_Time'Elab_Body;
      E006 := E006 + 1;
      HAL.GPIO'ELAB_SPEC;
      E154 := E154 + 1;
      HAL.I2C'ELAB_SPEC;
      E170 := E170 + 1;
      HAL.SPI'ELAB_SPEC;
      E175 := E175 + 1;
      STM32.ADC'ELAB_SPEC;
      E133 := E133 + 1;
      E124 := E124 + 1;
      E147 := E147 + 1;
      STM32.GPIO'ELAB_SPEC;
      STM32.I2C'ELAB_SPEC;
      E169 := E169 + 1;
      E143 := E143 + 1;
      STM32.SPI'ELAB_SPEC;
      E173 := E173 + 1;
      E141 := E141 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E130 := E130 + 1;
      E145 := E145 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_dac_sw");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/obj/Debug/dac_sw.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/Ada_Drivers_Library/boards/lib/stm32l4nucleo/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/Ada_Drivers_Library/boards/stm32l4_nucleo/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l4nucleo/full/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/Ada_Drivers_Library/components/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/Ada_Drivers_Library/middleware/lib/stm32l4nucleo/ravenscar-full/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L432/dac_sw/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32l4nucleo/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
