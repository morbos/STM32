pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__aqi.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__aqi.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E096 : Short_Integer; pragma Import (Ada, E096, "ada__real_time_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__tasking__protected_objects_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__tasking__protected_objects__multiprocessors_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__tasking__restricted__stages_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "bitmap_color_conversion_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "ravenscar_time_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "soft_drawing_bitmap_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "st7735r_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "fonts_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__adc_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "stm32__dac_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__exti_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "stm32__spi_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "stm32__gpio_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "stm32__i2c_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "stm32__i2s_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "stm32__usarts_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "stm32__device_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "stm32__afio_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "last_chance_handler_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "utils_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "co2_int_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "hw_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "co2_task_E");

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
      E096 := E096 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E025 := E025 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E077 := E077 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E082 := E082 + 1;
      E158 := E158 + 1;
      Ravenscar_Time'Elab_Body;
      E167 := E167 + 1;
      E156 := E156 + 1;
      E151 := E151 + 1;
      E162 := E162 + 1;
      STM32.ADC'ELAB_SPEC;
      E092 := E092 + 1;
      E102 := E102 + 1;
      E117 := E117 + 1;
      E132 := E132 + 1;
      E108 := E108 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E086 := E086 + 1;
      E120 := E120 + 1;
      E126 := E126 + 1;
      E137 := E137 + 1;
      E149 := E149 + 1;
      E165 := E165 + 1;
      E160 := E160 + 1;
      Co2_Int'Elab_Spec;
      E019 := E019 + 1;
      Co2_Task'Elab_Spec;
      Co2_Task'Elab_Body;
      E015 := E015 + 1;
      E021 := E021 + 1;
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
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/fonts-font2.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/fonts.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/peripherals.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/last_chance_handler.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/utils.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/hw.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/co2_task.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/co2_int.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/aqi.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/aqi_co2/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
