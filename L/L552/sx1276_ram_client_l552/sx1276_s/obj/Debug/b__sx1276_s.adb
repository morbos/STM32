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
   E121 : Short_Integer; pragma Import (Ada, E121, "sx1276_spi_io_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "peripherals_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "trace_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "utils_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "exti_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "sx1276_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "sx1276_spi_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "sx1276_api_E");

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
      E121 := E121 + 1;
      Peripherals'Elab_Spec;
      E119 := E119 + 1;
      Trace'Elab_Spec;
      E136 := E136 + 1;
      E134 := E134 + 1;
      Exti'Elab_Spec;
      E132 := E132 + 1;
      SX1276_SPI'ELAB_SPEC;
      E123 := E123 + 1;
      Exti'Elab_Body;
      E125 := E125 + 1;
      SX1276_API'ELAB_BODY;
      E118 := E118 + 1;
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
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/cm33.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/ns_api.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/sx1276_spi_io.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/trace.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/utils.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/sx1276.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/sx1276_spi.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/exti.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/sx1276_api.o
   --   /home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/sx1276_s.o
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/sx1276_s/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/Ada_Drivers_Library/boards/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/Ada_Drivers_Library/boards/stm32l5_nucleo_s/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5discovery_s/sfp/adalib/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/Ada_Drivers_Library/components/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L552/sx1276_ram_client_l552/Ada_Drivers_Library/middleware/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
