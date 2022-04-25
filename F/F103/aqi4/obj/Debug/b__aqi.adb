pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__aqi.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__aqi.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E080 : Short_Integer; pragma Import (Ada, E080, "system__bb__timing_events_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__real_time_E");
   E031 : Short_Integer; pragma Import (Ada, E031, "bitmap_color_conversion_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "ravenscar_time_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "soft_drawing_bitmap_E");
   E020 : Short_Integer; pragma Import (Ada, E020, "st7735r_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "fonts_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "stm32__adc_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__dac_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "stm32__exti_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "stm32__spi_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__i2c_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "stm32__usarts_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "stm32__i2s_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__gpio_E");
   E038 : Short_Integer; pragma Import (Ada, E038, "stm32__device_E");
   E033 : Short_Integer; pragma Import (Ada, E033, "hw_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "last_chance_handler_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "utils_E");

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
      E080 := E080 + 1;
      Ada.Real_Time'Elab_Body;
      E058 := E058 + 1;
      E031 := E031 + 1;
      Ravenscar_Time'Elab_Body;
      E141 := E141 + 1;
      Soft_Drawing_Bitmap'Elab_Body;
      E029 := E029 + 1;
      ST7735R'ELAB_BODY;
      E020 := E020 + 1;
      E015 := E015 + 1;
      STM32.ADC'ELAB_SPEC;
      E054 := E054 + 1;
      E100 := E100 + 1;
      E114 := E114 + 1;
      STM32.SPI'ELAB_BODY;
      E129 := E129 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E038 := E038 + 1;
      STM32.I2S'ELAB_BODY;
      E123 := E123 + 1;
      STM32.I2C'ELAB_BODY;
      E117 := E117 + 1;
      STM32.GPIO'ELAB_BODY;
      E106 := E106 + 1;
      STM32.USARTS'ELAB_BODY;
      E133 := E133 + 1;
      E033 := E033 + 1;
      E139 := E139 + 1;
      E143 := E143 + 1;
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
   --   /backup/ada/STM32/F/F103/aqi4/obj/Debug/fonts-font2.o
   --   /backup/ada/STM32/F/F103/aqi4/obj/Debug/fonts.o
   --   /backup/ada/STM32/F/F103/aqi4/obj/Debug/peripherals.o
   --   /backup/ada/STM32/F/F103/aqi4/obj/Debug/hw.o
   --   /backup/ada/STM32/F/F103/aqi4/obj/Debug/last_chance_handler.o
   --   /backup/ada/STM32/F/F103/aqi4/obj/Debug/utils.o
   --   /backup/ada/STM32/F/F103/aqi4/obj/Debug/aqi.o
   --   -L/backup/ada/STM32/F/F103/aqi4/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi4/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/aqi4/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi4/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi4/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/aqi4/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi4/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi4/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/aqi4/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
