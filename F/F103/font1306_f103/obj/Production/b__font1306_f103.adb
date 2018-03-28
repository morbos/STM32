pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__font1306_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__font1306_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E065 : Short_Integer; pragma Import (Ada, E065, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "bitmap_color_conversion_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "last_chance_handler_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "ravenscar_time_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "soft_drawing_bitmap_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "memory_mapped_bitmap_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "ssd1306_spi_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "fonts_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__adc_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__dac_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "stm32__exti_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__gpio_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__afio_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "stm32__i2c_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "stm32__i2s_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "stm32__spi_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "stm32__usarts_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Text_Io'Elab_Body;
      E065 := E065 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      E084 := E084 + 1;
      Ravenscar_Time'Elab_Body;
      E147 := E147 + 1;
      E086 := E086 + 1;
      E082 := E082 + 1;
      E075 := E075 + 1;
      E071 := E071 + 1;
      STM32.ADC'ELAB_SPEC;
      E106 := E106 + 1;
      E112 := E112 + 1;
      E138 := E138 + 1;
      E098 := E098 + 1;
      E130 := E130 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E102 := E102 + 1;
      E134 := E134 + 1;
      E124 := E124 + 1;
      E118 := E118 + 1;
      E100 := E100 + 1;
      E090 := E090 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_font1306_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/obj/Production/fonts-font2.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/obj/Production/fonts.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/obj/Production/peripherals.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/obj/Production/last_chance_handler.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/obj/Production/font1306_f103.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/obj/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/obj/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
