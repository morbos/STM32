pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__vl53l1x_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__vl53l1x_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E067 : Short_Integer; pragma Import (Ada, E067, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "last_chance_handler_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "stm32__adc_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "stm32__dac_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "stm32__exti_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "stm32__gpio_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "stm32__afio_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "stm32__i2c_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "stm32__i2s_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "stm32__spi_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "stm32__usarts_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "stm32__device_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "trace_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "vl53l1x_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Text_Io'Elab_Body;
      E067 := E067 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      STM32.ADC'ELAB_SPEC;
      E090 := E090 + 1;
      E096 := E096 + 1;
      E123 := E123 + 1;
      E080 := E080 + 1;
      E114 := E114 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E084 := E084 + 1;
      E119 := E119 + 1;
      E108 := E108 + 1;
      E102 := E102 + 1;
      E082 := E082 + 1;
      E074 := E074 + 1;
      Trace'Elab_Spec;
      Trace'Elab_Body;
      E133 := E133 + 1;
      E139 := E139 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_vl53l1x_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/obj/Production/peripherals.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/obj/Production/last_chance_handler.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/obj/Production/trace.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/obj/Production/vl53l1x.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/obj/Production/vl53l1x_f103.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/obj/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/obj/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l1x_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
