pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_l151.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_l151.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "system__tasking__protected_objects_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__tasking__protected_objects__multiprocessors_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__tasking__restricted__stages_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "stm32__dac_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__exti_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "stm32__rcc_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "stm32__spi_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__gpio_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "stm32__device_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__syscfg_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "sx1276_spi_io_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "peripherals_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "utils_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "exti_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "sx1276_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "sx1276_spi_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "gen_list_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "lora_base_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "lora_client_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "sx1276_api_E");

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
      E120 := E120 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E124 := E124 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E129 := E129 + 1;
      E082 := E082 + 1;
      E094 := E094 + 1;
      E090 := E090 + 1;
      E105 := E105 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E071 := E071 + 1;
      E092 := E092 + 1;
      E088 := E088 + 1;
      E110 := E110 + 1;
      Peripherals'Elab_Spec;
      E068 := E068 + 1;
      E133 := E133 + 1;
      Exti'Elab_Spec;
      E131 := E131 + 1;
      SX1276_SPI'ELAB_SPEC;
      E116 := E116 + 1;
      Exti'Elab_Body;
      E066 := E066 + 1;
      E149 := E149 + 1;
      Lora_Base'Elab_Spec;
      Lora_Client'Elab_Spec;
      Lora_Client'Elab_Body;
      E145 := E145 + 1;
      SX1276_API'ELAB_BODY;
      E151 := E151 + 1;
      E147 := E147 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sx1276_l151");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/sx1276_spi_io.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/utils.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/sx1276.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/sx1276_spi.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/exti.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/gen_list.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/lora_client.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/sx1276_api.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/lora_base.o
   --   /home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/sx1276_l151.o
   --   -L/home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L151/sx1276_client_l151/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L151/
   --   -L/home/hedley/ada/STM32/L/L151/sx1276_client_l151/Ada_Drivers_Library/boards/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L151/sx1276_client_l151/Ada_Drivers_Library/boards/stm32l151_Heltec/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L151/sx1276_client_l151/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l151heltec/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/L/L151/sx1276_client_l151/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L151/sx1276_client_l151/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L151/sx1276_client_l151/Ada_Drivers_Library/components/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L151/sx1276_client_l151/Ada_Drivers_Library/middleware/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l151heltec/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
