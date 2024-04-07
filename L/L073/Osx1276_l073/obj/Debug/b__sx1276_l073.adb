pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_l073.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_l073.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "system__tasking__protected_objects_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "system__tasking__protected_objects__multiprocessors_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__tasking__restricted__stages_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "stm32__exti_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "stm32__rcc_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "stm32__spi_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "stm32__gpio_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "stm32__device_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "stm32__syscfg_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "sx1276_spi_io_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "peripherals_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "utils_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "exti_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "sx1276_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "sx1276_spi_E");

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
      E103 := E103 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E107 := E107 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E112 := E112 + 1;
      E081 := E081 + 1;
      E077 := E077 + 1;
      E089 := E089 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E071 := E071 + 1;
      E079 := E079 + 1;
      E075 := E075 + 1;
      E093 := E093 + 1;
      Peripherals'Elab_Spec;
      E068 := E068 + 1;
      E116 := E116 + 1;
      Exti'Elab_Spec;
      E114 := E114 + 1;
      SX1276_SPI'ELAB_SPEC;
      E099 := E099 + 1;
      Exti'Elab_Body;
      E066 := E066 + 1;
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
   --   /backup/ada/STM32/L/L073/sx1276_l073/obj/Debug/sx1276_spi_io.o
   --   /backup/ada/STM32/L/L073/sx1276_l073/obj/Debug/peripherals.o
   --   /backup/ada/STM32/L/L073/sx1276_l073/obj/Debug/utils.o
   --   /backup/ada/STM32/L/L073/sx1276_l073/obj/Debug/sx1276.o
   --   /backup/ada/STM32/L/L073/sx1276_l073/obj/Debug/sx1276_spi.o
   --   /backup/ada/STM32/L/L073/sx1276_l073/obj/Debug/exti.o
   --   /backup/ada/STM32/L/L073/sx1276_l073/obj/Debug/sx1276_l073.o
   --   -L/backup/ada/STM32/L/L073/sx1276_l073/obj/Debug/
   --   -L/backup/ada/STM32/L/L073/sx1276_l073/obj/Debug/
   --   -L/backup/ada/STM32/L/L073/
   --   -L/backup/ada/STM32/L/L073/sx1276_l073/Ada_Drivers_Library/boards/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/sx1276_l073/Ada_Drivers_Library/boards/stm32l073_Lodev/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/sx1276_l073/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l073lodev/ssfp/adalib/
   --   -L/backup/ada/STM32/L/L073/sx1276_l073/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/sx1276_l073/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m0/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/sx1276_l073/Ada_Drivers_Library/components/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/sx1276_l073/Ada_Drivers_Library/middleware/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l073lodev/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
