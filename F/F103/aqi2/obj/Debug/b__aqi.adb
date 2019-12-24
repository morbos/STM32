pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__aqi.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__aqi.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E050 : Short_Integer; pragma Import (Ada, E050, "system__bb__timing_events_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__text_io_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "bitmap_color_conversion_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "ravenscar_time_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "soft_drawing_bitmap_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "st7735r_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "fonts_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__adc_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__dac_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "stm32__exti_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "stm32__spi_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "stm32__i2c_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__gpio_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "stm32__usarts_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "stm32__i2s_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "stm32__device_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "last_chance_handler_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "utils_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      null;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      System.Bb.Timing_Events'Elab_Body;
      E050 := E050 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      Ada.Text_Io'Elab_Body;
      E066 := E066 + 1;
      E087 := E087 + 1;
      Ravenscar_Time'Elab_Body;
      E145 := E145 + 1;
      Soft_Drawing_Bitmap'Elab_Body;
      E085 := E085 + 1;
      ST7735R'ELAB_BODY;
      E076 := E076 + 1;
      E072 := E072 + 1;
      STM32.ADC'ELAB_SPEC;
      E106 := E106 + 1;
      E112 := E112 + 1;
      E141 := E141 + 1;
      STM32.SPI'ELAB_BODY;
      E130 := E130 + 1;
      STM32.GPIO'ELAB_BODY;
      E098 := E098 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E102 := E102 + 1;
      STM32.USARTS'ELAB_BODY;
      E134 := E134 + 1;
      STM32.I2S'ELAB_BODY;
      E124 := E124 + 1;
      STM32.I2C'ELAB_BODY;
      E118 := E118 + 1;
      E090 := E090 + 1;
      E147 := E147 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_aqi");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/aqi2/obj/Debug/fonts-font2.o
   --   /backup/ada/STM32/F/F103/aqi2/obj/Debug/fonts.o
   --   /backup/ada/STM32/F/F103/aqi2/obj/Debug/peripherals.o
   --   /backup/ada/STM32/F/F103/aqi2/obj/Debug/last_chance_handler.o
   --   /backup/ada/STM32/F/F103/aqi2/obj/Debug/utils.o
   --   /backup/ada/STM32/F/F103/aqi2/obj/Debug/aqi.o
   --   -L/backup/ada/STM32/F/F103/aqi2/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi2/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/aqi2/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi2/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi2/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/aqi2/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi2/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi2/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi2/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
