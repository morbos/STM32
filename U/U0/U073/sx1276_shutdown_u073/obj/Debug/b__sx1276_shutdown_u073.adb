pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_shutdown_u073.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_shutdown_u073.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E067 : Short_Integer; pragma Import (Ada, E067, "system__tasking__protected_objects_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "system__tasking__protected_objects__multiprocessors_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "system__tasking__restricted__stages_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__dac_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "stm32__exti_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__i2c_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "stm32__power_control_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "stm32__rcc_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "stm32__spi_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "stm32__gpio_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "stm32__device_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "stm32__syscfg_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "sx1276_spi_io_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "peripherals_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "uart_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "crc8_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "utils_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "exti_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "sx1276_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "sx1276_spi_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "wd_E");

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
      E067 := E067 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E071 := E071 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E076 := E076 + 1;
      E100 := E100 + 1;
      E111 := E111 + 1;
      E117 := E117 + 1;
      E147 := E147 + 1;
      E107 := E107 + 1;
      E121 := E121 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E089 := E089 + 1;
      E109 := E109 + 1;
      E105 := E105 + 1;
      E127 := E127 + 1;
      Peripherals'Elab_Spec;
      E086 := E086 + 1;
      E085 := E085 + 1;
      E083 := E083 + 1;
      E140 := E140 + 1;
      Exti'Elab_Spec;
      E138 := E138 + 1;
      SX1276_SPI'ELAB_SPEC;
      E136 := E136 + 1;
      Exti'Elab_Body;
      E131 := E131 + 1;
      Wd'Elab_Spec;
      E153 := E153 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sx1276_shutdown_u073");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/sx1276_spi_io.o
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/peripherals.o
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/uart.o
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/crc8.o
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/utils.o
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/sx1276.o
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/sx1276_spi.o
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/exti.o
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/wd.o
   --   /media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/sx1276_shutdown_u073.o
   --   -L/media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U0/
   --   -L/media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/Ada_Drivers_Library/boards/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/Ada_Drivers_Library/boards/stm32u073_bluepill/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u073bluepill/ssfp/adalib/
   --   -L/media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/hal/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m0/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/Ada_Drivers_Library/components/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/sx1276_shutdown_u073/Ada_Drivers_Library/middleware/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u073bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
