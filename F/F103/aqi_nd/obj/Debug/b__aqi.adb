pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__aqi.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__aqi.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E045 : Short_Integer; pragma Import (Ada, E045, "ada__real_time_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "bitmap_color_conversion_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ravenscar_time_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "soft_drawing_bitmap_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "st7735r_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "stm32__adc_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "stm32__dac_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "stm32__exti_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__spi_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "stm32__gpio_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "stm32__i2c_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "stm32__i2s_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "stm32__usarts_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "stm32__device_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "hw_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "last_chance_handler_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "utils_E");

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


      Ada.Real_Time'Elab_Body;
      E045 := E045 + 1;
      E131 := E131 + 1;
      Ravenscar_Time'Elab_Body;
      E138 := E138 + 1;
      E129 := E129 + 1;
      E124 := E124 + 1;
      STM32.ADC'ELAB_SPEC;
      E041 := E041 + 1;
      E087 := E087 + 1;
      E102 := E102 + 1;
      E117 := E117 + 1;
      E093 := E093 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E023 := E023 + 1;
      E105 := E105 + 1;
      E111 := E111 + 1;
      E121 := E121 + 1;
      E017 := E017 + 1;
      E136 := E136 + 1;
      E140 := E140 + 1;
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
   --   /home/hedley/ada/STM32/F/F103/aqi_nd/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/F/F103/aqi_nd/obj/Debug/hw.o
   --   /home/hedley/ada/STM32/F/F103/aqi_nd/obj/Debug/last_chance_handler.o
   --   /home/hedley/ada/STM32/F/F103/aqi_nd/obj/Debug/utils.o
   --   /home/hedley/ada/STM32/F/F103/aqi_nd/obj/Debug/aqi.o
   --   -L/home/hedley/ada/STM32/F/F103/aqi_nd/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqi_nd/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/
   --   -L/home/hedley/ada/STM32/F/F103/aqi_nd/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqi_nd/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqi_nd/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/F/F103/aqi_nd/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqi_nd/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqi_nd/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqi_nd/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
