pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_shutdown_u073.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_shutdown_u073.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "system__tasking__protected_objects_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "system__tasking__protected_objects__multiprocessors_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "system__tasking__restricted__stages_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "crc8_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "stm32__dac_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "stm32__exti_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "stm32__i2c_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "stm32__power_control_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__rcc_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "stm32__spi_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "stm32__gpio_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__device_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "stm32__syscfg_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "sx1276_spi_io_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "peripherals_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "utils_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "exti_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "sx1276_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "sx1276_spi_E");

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
      E065 := E065 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E069 := E069 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E074 := E074 + 1;
      E081 := E081 + 1;
      E099 := E099 + 1;
      E110 := E110 + 1;
      E116 := E116 + 1;
      E143 := E143 + 1;
      E106 := E106 + 1;
      E120 := E120 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E088 := E088 + 1;
      E108 := E108 + 1;
      E104 := E104 + 1;
      E125 := E125 + 1;
      Peripherals'Elab_Spec;
      E085 := E085 + 1;
      E134 := E134 + 1;
      Exti'Elab_Spec;
      E132 := E132 + 1;
      SX1276_SPI'ELAB_SPEC;
      E130 := E130 + 1;
      Exti'Elab_Body;
      E084 := E084 + 1;
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
   --   /media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/crc8.o
   --   /media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/sx1276_spi_io.o
   --   /media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/peripherals.o
   --   /media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/utils.o
   --   /media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/sx1276.o
   --   /media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/sx1276_spi.o
   --   /media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/exti.o
   --   /media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/sx1276_shutdown_u073.o
   --   -L/media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/exp/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U0/
   --   -L/media/16T/ada/STM32/U/U0/U073/exp/Ada_Drivers_Library/boards/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/exp/Ada_Drivers_Library/boards/stm32u073_bluepill/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/exp/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u073bluepill/ssfp/adalib/
   --   -L/media/16T/ada/STM32/U/U0/U073/exp/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/hal/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/exp/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m0/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/exp/Ada_Drivers_Library/components/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/exp/Ada_Drivers_Library/middleware/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u073bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
