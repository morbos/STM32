pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_s.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_s.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "system__tasking__protected_objects_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "system__tasking__protected_objects__multiprocessors_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__tasking__restricted__stages_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "stm32__exti_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__mpu_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32__rcc_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "stm32__sau_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "stm32__spi_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "stm32__gpio_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__device_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "stm32__syscfg_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "stm32__board_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__rng_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "stm32__pka_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "curve_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
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
      E070 := E070 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E074 := E074 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E079 := E079 + 1;
      E101 := E101 + 1;
      E112 := E112 + 1;
      E097 := E097 + 1;
      E121 := E121 + 1;
      E108 := E108 + 1;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E092 := E092 + 1;
      E099 := E099 + 1;
      E095 := E095 + 1;
      STM32.BOARD'ELAB_SPEC;
      E085 := E085 + 1;
      STM32.RNG'ELAB_SPEC;
      E117 := E117 + 1;
      E115 := E115 + 1;
      E081 := E081 + 1;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_test_s");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/L/L562/pka_gen2/test_s/obj/Debug/curve.o
   --   /home/hedley/ada/STM32/L/L562/pka_gen2/test_s/obj/Debug/test_s.o
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/test_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/test_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/test_s/
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/Ada_Drivers_Library/boards/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/Ada_Drivers_Library/boards/stm32l5_discovery_s/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/Ada_Drivers_Library/components/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pka_gen2/Ada_Drivers_Library/middleware/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5discovery_s/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
