pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_l151.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_l151.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__tasking__protected_objects_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__tasking__protected_objects__multiprocessors_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__tasking__restricted__stages_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "stm32__dac_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "stm32__exti_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__rcc_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "stm32__spi_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "stm32__gpio_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "stm32__device_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__syscfg_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "sx1276_spi_io_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "peripherals_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "utils_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "exti_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "sx1276_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "sx1276_spi_E");

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
      E122 := E122 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E126 := E126 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E131 := E131 + 1;
      E084 := E084 + 1;
      E096 := E096 + 1;
      E092 := E092 + 1;
      E107 := E107 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E073 := E073 + 1;
      E094 := E094 + 1;
      E090 := E090 + 1;
      E112 := E112 + 1;
      Peripherals'Elab_Spec;
      E070 := E070 + 1;
      E135 := E135 + 1;
      Exti'Elab_Spec;
      E133 := E133 + 1;
      SX1276_SPI'ELAB_SPEC;
      E118 := E118 + 1;
      Exti'Elab_Body;
      E068 := E068 + 1;
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
   --   /backup/ada/STM32/L/L151/sx1276_l151/obj/Debug/sx1276_spi_io.o
   --   /backup/ada/STM32/L/L151/sx1276_l151/obj/Debug/peripherals.o
   --   /backup/ada/STM32/L/L151/sx1276_l151/obj/Debug/utils.o
   --   /backup/ada/STM32/L/L151/sx1276_l151/obj/Debug/sx1276.o
   --   /backup/ada/STM32/L/L151/sx1276_l151/obj/Debug/sx1276_spi.o
   --   /backup/ada/STM32/L/L151/sx1276_l151/obj/Debug/exti.o
   --   /backup/ada/STM32/L/L151/sx1276_l151/obj/Debug/sx1276_l151.o
   --   -L/backup/ada/STM32/L/L151/sx1276_l151/obj/Debug/
   --   -L/backup/ada/STM32/L/L151/sx1276_l151/obj/Debug/
   --   -L/backup/ada/STM32/L/L151/
   --   -L/backup/ada/STM32/L/L151/sx1276_l151/Ada_Drivers_Library/boards/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/sx1276_l151/Ada_Drivers_Library/boards/stm32l151_Heltec/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/sx1276_l151/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l151heltec/ssfp/adalib/
   --   -L/backup/ada/STM32/L/L151/sx1276_l151/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/sx1276_l151/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/sx1276_l151/Ada_Drivers_Library/components/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/sx1276_l151/Ada_Drivers_Library/middleware/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l151heltec/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
