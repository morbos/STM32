pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__iwdg_u073.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__iwdg_u073.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "ada__text_io_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__tasking__protected_objects_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "system__tasking__protected_objects__multiprocessors_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__tasking__restricted__stages_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "stm32__dac_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32__exti_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32__i2c_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "stm32__rcc_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "stm32__spi_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "stm32__gpio_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "stm32__device_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "stm32__syscfg_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "uart_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "wd_E");

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
      Ada.Text_Io'Elab_Body;
      E065 := E065 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E122 := E122 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E138 := E138 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E129 := E129 + 1;
      E086 := E086 + 1;
      E097 := E097 + 1;
      E103 := E103 + 1;
      E093 := E093 + 1;
      E107 := E107 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E075 := E075 + 1;
      E095 := E095 + 1;
      E091 := E091 + 1;
      E117 := E117 + 1;
      Wd'Elab_Spec;
      E120 := E120 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_iwdg_u073");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /media/16T/ada/STM32/U/U0/U073/iwdg_u073/obj/Debug/peripherals.o
   --   /media/16T/ada/STM32/U/U0/U073/iwdg_u073/obj/Debug/uart.o
   --   /media/16T/ada/STM32/U/U0/U073/iwdg_u073/obj/Debug/wd.o
   --   /media/16T/ada/STM32/U/U0/U073/iwdg_u073/obj/Debug/iwdg_u073.o
   --   -L/media/16T/ada/STM32/U/U0/U073/iwdg_u073/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/iwdg_u073/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U0/
   --   -L/media/16T/ada/STM32/U/U0/U073/iwdg_u073/Ada_Drivers_Library/boards/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/iwdg_u073/Ada_Drivers_Library/boards/stm32u073_bluepill/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/iwdg_u073/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u073bluepill/ssfp/adalib/
   --   -L/media/16T/ada/STM32/U/U0/U073/iwdg_u073/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/hal/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/iwdg_u073/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m0/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/iwdg_u073/Ada_Drivers_Library/components/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/iwdg_u073/Ada_Drivers_Library/middleware/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u073bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
