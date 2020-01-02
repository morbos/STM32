pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_s.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_s.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "system__tasking__protected_objects_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "system__tasking__protected_objects__multiprocessors_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__tasking__restricted__stages_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "stm32__exti_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "stm32__mpu_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "stm32__rcc_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "stm32__sau_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "stm32__spi_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "stm32__gpio_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "stm32__device_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "stm32__syscfg_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "cm33_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "stm32__board_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "ns_api_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "sx1276_spi_io_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "peripherals_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "trace_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "utils_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "exti_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "sx1276_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "sx1276_spi_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "sx1276_api_E");

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
      E068 := E068 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E072 := E072 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E077 := E077 + 1;
      E093 := E093 + 1;
      E105 := E105 + 1;
      E089 := E089 + 1;
      E108 := E108 + 1;
      E101 := E101 + 1;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E083 := E083 + 1;
      E091 := E091 + 1;
      E087 := E087 + 1;
      E079 := E079 + 1;
      STM32.BOARD'ELAB_SPEC;
      E114 := E114 + 1;
      E112 := E112 + 1;
      E120 := E120 + 1;
      Peripherals'Elab_Spec;
      E118 := E118 + 1;
      Trace'Elab_Spec;
      E135 := E135 + 1;
      E133 := E133 + 1;
      Exti'Elab_Spec;
      E131 := E131 + 1;
      SX1276_SPI'ELAB_SPEC;
      E122 := E122 + 1;
      Exti'Elab_Body;
      E124 := E124 + 1;
      SX1276_API'ELAB_BODY;
      E117 := E117 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sx1276_s");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/cm33.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/ns_api.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/sx1276_spi_io.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/peripherals.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/trace.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/utils.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/sx1276.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/sx1276_spi.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/exti.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/sx1276_api.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/sx1276_s.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/sx1276_s/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/Ada_Drivers_Library/boards/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/Ada_Drivers_Library/boards/stm32l5_nucleo_s/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/Ada_Drivers_Library/components/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/sx1276_nsapp_l522/Ada_Drivers_Library/middleware/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
