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
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__exti_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "stm32__mpu_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__rcc_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "stm32__sau_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__spi_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__gpio_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__device_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "stm32__syscfg_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "stm32__board_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "ns_api_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "trace_E");

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
      E098 := E098 + 1;
      E110 := E110 + 1;
      E094 := E094 + 1;
      E113 := E113 + 1;
      E106 := E106 + 1;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E088 := E088 + 1;
      E096 := E096 + 1;
      E092 := E092 + 1;
      STM32.BOARD'ELAB_SPEC;
      E085 := E085 + 1;
      E082 := E082 + 1;
      Trace'Elab_Spec;
      E117 := E117 + 1;
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
   --   /backup/ada/STM32/L/L552/test/test_s/obj/Debug/ns_api.o
   --   /backup/ada/STM32/L/L552/test/test_s/obj/Debug/trace.o
   --   /backup/ada/STM32/L/L552/test/test_s/obj/Debug/test_s.o
   --   -L/backup/ada/STM32/L/L552/test/test_s/obj/Debug/
   --   -L/backup/ada/STM32/L/L552/test/test_s/obj/Debug/
   --   -L/backup/ada/STM32/L/L552/test/test_s/
   --   -L/backup/ada/STM32/L/L552/test/Ada_Drivers_Library/boards/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/backup/ada/STM32/L/L552/test/Ada_Drivers_Library/boards/stm32l5_nucleo_s/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/backup/ada/STM32/L/L552/test/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -L/backup/ada/STM32/L/L552/test/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/backup/ada/STM32/L/L552/test/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/backup/ada/STM32/L/L552/test/Ada_Drivers_Library/components/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/backup/ada/STM32/L/L552/test/Ada_Drivers_Library/middleware/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
