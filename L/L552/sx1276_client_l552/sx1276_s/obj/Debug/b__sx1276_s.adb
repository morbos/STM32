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
   E087 : Short_Integer; pragma Import (Ada, E087, "stm32__dac_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__exti_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "stm32__i2c_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__mpu_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__rcc_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "stm32__sau_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "stm32__spi_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__gpio_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "stm32__device_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "stm32__syscfg_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "cm33_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "stm32__board_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "sx1276_spi_io_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "peripherals_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "trace_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "utils_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "exti_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "sx1276_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "sx1276_spi_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "sx1276_api_E");

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
      E087 := E087 + 1;
      E098 := E098 + 1;
      E104 := E104 + 1;
      E112 := E112 + 1;
      E094 := E094 + 1;
      E115 := E115 + 1;
      E108 := E108 + 1;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E083 := E083 + 1;
      E096 := E096 + 1;
      E092 := E092 + 1;
      E079 := E079 + 1;
      STM32.BOARD'ELAB_SPEC;
      E120 := E120 + 1;
      E127 := E127 + 1;
      Peripherals'Elab_Spec;
      E125 := E125 + 1;
      Trace'Elab_Spec;
      E142 := E142 + 1;
      E140 := E140 + 1;
      Exti'Elab_Spec;
      E138 := E138 + 1;
      SX1276_SPI'ELAB_SPEC;
      E129 := E129 + 1;
      Exti'Elab_Body;
      E131 := E131 + 1;
      SX1276_API'ELAB_BODY;
      E124 := E124 + 1;
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
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/cm33.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/sx1276_spi_io.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/trace.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/utils.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/sx1276.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/sx1276_spi.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/exti.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/sx1276_api.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/sx1276_s.o
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/sx1276_s/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/Ada_Drivers_Library/boards/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/Ada_Drivers_Library/boards/stm32l5_nucleo_s/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5discovery_s/sfp/adalib/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/Ada_Drivers_Library/components/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_client_l552/Ada_Drivers_Library/middleware/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
