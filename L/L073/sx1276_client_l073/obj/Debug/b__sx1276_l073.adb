pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_l073.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_l073.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "system__tasking__protected_objects_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "system__tasking__protected_objects__multiprocessors_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "system__tasking__restricted__stages_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "stm32__exti_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "stm32__rcc_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "stm32__spi_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "stm32__gpio_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "stm32__device_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "stm32__syscfg_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "sx1276_spi_io_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "peripherals_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "utils_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "exti_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "sx1276_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "sx1276_spi_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "gen_list_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "lora_base_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "lora_client_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "sx1276_api_E");

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
      E101 := E101 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E105 := E105 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E110 := E110 + 1;
      E079 := E079 + 1;
      E075 := E075 + 1;
      E087 := E087 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E069 := E069 + 1;
      E077 := E077 + 1;
      E073 := E073 + 1;
      E091 := E091 + 1;
      Peripherals'Elab_Spec;
      E066 := E066 + 1;
      E114 := E114 + 1;
      Exti'Elab_Spec;
      E112 := E112 + 1;
      SX1276_SPI'ELAB_SPEC;
      E097 := E097 + 1;
      Exti'Elab_Body;
      E064 := E064 + 1;
      E130 := E130 + 1;
      Lora_Base'Elab_Spec;
      Lora_Client'Elab_Spec;
      Lora_Client'Elab_Body;
      E126 := E126 + 1;
      SX1276_API'ELAB_BODY;
      E132 := E132 + 1;
      E128 := E128 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sx1276_l073");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/sx1276_spi_io.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/utils.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/sx1276.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/sx1276_spi.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/exti.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/gen_list.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/lora_client.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/sx1276_api.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/lora_base.o
   --   /home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/sx1276_l073.o
   --   -L/home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L073/sx1276_client_l073/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L073/
   --   -L/home/hedley/ada/STM32/L/L073/sx1276_client_l073/Ada_Drivers_Library/boards/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L073/sx1276_client_l073/Ada_Drivers_Library/boards/stm32l073_Lodev/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L073/sx1276_client_l073/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l073lodev/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/L/L073/sx1276_client_l073/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L073/sx1276_client_l073/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m0/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L073/sx1276_client_l073/Ada_Drivers_Library/components/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L073/sx1276_client_l073/Ada_Drivers_Library/middleware/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l073lodev/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
