pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_s.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_s.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E05 : Short_Integer; pragma Import (Ada, E05, "ada__real_time_E");
   E73 : Short_Integer; pragma Import (Ada, E73, "system__tasking__restricted__stages_E");
   E69 : Short_Integer; pragma Import (Ada, E69, "ns_api_E");
   E71 : Short_Integer; pragma Import (Ada, E71, "stask_E");
   E92 : Short_Integer; pragma Import (Ada, E92, "stm32__exti_E");
   E84 : Short_Integer; pragma Import (Ada, E84, "stm32__gpio_E");
   E80 : Short_Integer; pragma Import (Ada, E80, "stm32__device_E");
   E95 : Short_Integer; pragma Import (Ada, E95, "stm32__sau_E");
   E77 : Short_Integer; pragma Import (Ada, E77, "stm32__board_E");

   Sec_Default_Sized_Stacks : array (1 .. 2) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


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
      Binder_Sec_Stacks_Count := 2;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      Ada.Real_Time'Elab_Body;
      E05 := E05 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E73 := E73 + 1;
      E69 := E69 + 1;
      Stask'Elab_Spec;
      Stask'Elab_Body;
      E71 := E71 + 1;
      E92 := E92 + 1;
      E84 := E84 + 1;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E80 := E80 + 1;
      E95 := E95 + 1;
      STM32.BOARD'ELAB_SPEC;
      E77 := E77 + 1;
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
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/test_s/obj/Debug/ns_api.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/test_s/obj/Debug/stask.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/test_s/obj/Debug/test_s.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/test_s/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/test_s/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/test_s/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/Ada_Drivers_Library/boards/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/Ada_Drivers_Library/boards/stm32l5_nucleo_s/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/Ada_Drivers_Library/components/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/L/L522/test/Ada_Drivers_Library/middleware/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
