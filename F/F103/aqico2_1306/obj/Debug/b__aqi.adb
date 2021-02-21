pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__aqi.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__aqi.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__tasking__protected_objects_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__tasking__protected_objects__multiprocessors_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "system__tasking__restricted__stages_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "bitmap_color_conversion_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "ravenscar_time_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "soft_drawing_bitmap_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "memory_mapped_bitmap_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "ssd1306_spi_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "fonts_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__adc_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "stm32__dac_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__exti_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "stm32__spi_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "stm32__gpio_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "stm32__i2c_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "stm32__i2s_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "stm32__usarts_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__device_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "screen_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "stm32__afio_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "last_chance_handler_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "utils_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "co2_int_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "hw_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "co2_task_E");

   Sec_Default_Sized_Stacks : array (1 .. 2) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      procedure Install_Restricted_Handlers_Sequential;
      pragma Import (C,Install_Restricted_Handlers_Sequential, "__gnat_attach_all_handlers");

      Partition_Elaboration_Policy : Character;
      pragma Import (C, Partition_Elaboration_Policy, "__gnat_partition_elaboration_policy");

      procedure Activate_All_Tasks_Sequential;
      pragma Import (C, Activate_All_Tasks_Sequential, "__gnat_activate_all_tasks");

      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      Partition_Elaboration_Policy := 'S';

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 2;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E075 := E075 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E079 := E079 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E084 := E084 + 1;
      E159 := E159 + 1;
      Ravenscar_Time'Elab_Body;
      E166 := E166 + 1;
      E161 := E161 + 1;
      E157 := E157 + 1;
      E152 := E152 + 1;
      E149 := E149 + 1;
      STM32.ADC'ELAB_SPEC;
      E094 := E094 + 1;
      E102 := E102 + 1;
      E117 := E117 + 1;
      E132 := E132 + 1;
      E108 := E108 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E088 := E088 + 1;
      E120 := E120 + 1;
      E126 := E126 + 1;
      E137 := E137 + 1;
      Screen'Elab_Spec;
      E164 := E164 + 1;
      E163 := E163 + 1;
      E170 := E170 + 1;
      E168 := E168 + 1;
      Co2_Int'Elab_Spec;
      E069 := E069 + 1;
      Co2_Task'Elab_Spec;
      Co2_Task'Elab_Body;
      E066 := E066 + 1;
      E071 := E071 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
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
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/fonts-font2.o
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/fonts.o
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/screen.o
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/last_chance_handler.o
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/utils.o
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/hw.o
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/co2_task.o
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/co2_int.o
   --   /home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/aqi.o
   --   -L/home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqico2_1306/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/
   --   -L/home/hedley/ada/STM32/F/F103/aqico2_1306/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqico2_1306/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqico2_1306/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/F/F103/aqico2_1306/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqico2_1306/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqico2_1306/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/aqico2_1306/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
