pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__font1306_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__font1306_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__text_io_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "bitmap_color_conversion_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "ravenscar_time_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "soft_drawing_bitmap_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "memory_mapped_bitmap_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "ssd1306_spi_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "fonts_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "stm32__adc_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "stm32__dac_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__exti_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "stm32__spi_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "stm32__gpio_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "stm32__i2c_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "stm32__i2s_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "stm32__usarts_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32__device_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "last_chance_handler_E");

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
      E005 := E005 + 1;
      Ada.Text_Io'Elab_Body;
      E066 := E066 + 1;
      E087 := E087 + 1;
      Ravenscar_Time'Elab_Body;
      E147 := E147 + 1;
      E089 := E089 + 1;
      E085 := E085 + 1;
      E076 := E076 + 1;
      E072 := E072 + 1;
      STM32.ADC'ELAB_SPEC;
      E107 := E107 + 1;
      E113 := E113 + 1;
      E143 := E143 + 1;
      E131 := E131 + 1;
      E099 := E099 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E103 := E103 + 1;
      E119 := E119 + 1;
      E125 := E125 + 1;
      E135 := E135 + 1;
      E091 := E091 + 1;
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
   --   /home/hedley/ada/STM32/F/F103/font1306_f103/obj/Debug/fonts-font2.o
   --   /home/hedley/ada/STM32/F/F103/font1306_f103/obj/Debug/fonts.o
   --   /home/hedley/ada/STM32/F/F103/font1306_f103/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/F/F103/font1306_f103/obj/Debug/last_chance_handler.o
   --   /home/hedley/ada/STM32/F/F103/font1306_f103/obj/Debug/font1306_f103.o
   --   -L/home/hedley/ada/STM32/F/F103/font1306_f103/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/font1306_f103/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/
   --   -L/home/hedley/ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/font1306_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
