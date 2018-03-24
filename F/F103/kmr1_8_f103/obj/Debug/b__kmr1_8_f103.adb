pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__kmr1_8_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__kmr1_8_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E065 : Short_Integer; pragma Import (Ada, E065, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "bitmap_color_conversion_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "last_chance_handler_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "ravenscar_time_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "soft_drawing_bitmap_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "st7735r_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "stm32__adc_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32__dac_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "stm32__exti_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "stm32__gpio_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32__i2c_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "stm32__i2s_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "stm32__spi_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "stm32__usarts_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Text_Io'Elab_Body;
      E065 := E065 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      E141 := E141 + 1;
      Ravenscar_Time'Elab_Body;
      E132 := E132 + 1;
      E139 := E139 + 1;
      E135 := E135 + 1;
      STM32.ADC'ELAB_SPEC;
      E091 := E091 + 1;
      E097 := E097 + 1;
      E128 := E128 + 1;
      E115 := E115 + 1;
      E081 := E081 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E085 := E085 + 1;
      E119 := E119 + 1;
      E109 := E109 + 1;
      E103 := E103 + 1;
      E073 := E073 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_kmr1_8_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/obj/Debug/peripherals.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/obj/Debug/last_chance_handler.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/obj/Debug/kmr1_8_f103.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/kmr1_8_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
