pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__tasking__protected_objects_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__tasking__protected_objects__multiprocessors_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "system__tasking__restricted__stages_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "stm32__adc_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "stm32__dac_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "stm32__exti_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "stm32__spi_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "stm32__gpio_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "stm32__i2c_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "stm32__i2s_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "stm32__usarts_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "stm32__device_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "sx1276_spi_io_E");
   E067 : Short_Integer; pragma Import (Ada, E067, "peripherals_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "utils_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "exti_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "sx1276_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "sx1276_spi_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


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
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E131 := E131 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E135 := E135 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E140 := E140 + 1;
      STM32.ADC'ELAB_SPEC;
      E076 := E076 + 1;
      E084 := E084 + 1;
      E099 := E099 + 1;
      E114 := E114 + 1;
      E090 := E090 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E070 := E070 + 1;
      E102 := E102 + 1;
      E108 := E108 + 1;
      E118 := E118 + 1;
      E122 := E122 + 1;
      Peripherals'Elab_Spec;
      E067 := E067 + 1;
      E144 := E144 + 1;
      Exti'Elab_Spec;
      E151 := E151 + 1;
      SX1276_SPI'ELAB_SPEC;
      E127 := E127 + 1;
      Exti'Elab_Body;
      E142 := E142 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sx1276_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/obj/Debug/sx1276_spi_io.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/obj/Debug/peripherals.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/obj/Debug/utils.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/obj/Debug/sx1276.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/obj/Debug/sx1276_spi.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/obj/Debug/exti.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/obj/Debug/sx1276_f103.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/sx1276_no_motion_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
