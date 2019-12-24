pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__ex4.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__ex4.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E058 : Short_Integer; pragma Import (Ada, E058, "system__bb__timing_events_E");
   E020 : Short_Integer; pragma Import (Ada, E020, "ada__real_time_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__text_io_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "system__tasking__protected_objects_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__tasking__protected_objects__multiprocessors_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "system__tasking__restricted__stages_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "stm32__adc_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "stm32__dac_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "stm32__exti_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "stm32__spi_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "stm32__i2c_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__gpio_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "stm32__usarts_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "stm32__i2s_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__device_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "driver_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "last_chance_handler_E");

   Sec_Default_Sized_Stacks : array (1 .. 3) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");

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
      Main_Priority := 0;
      Partition_Elaboration_Policy := 'S';

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 3;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      System.Bb.Timing_Events'Elab_Body;
      E058 := E058 + 1;
      Ada.Real_Time'Elab_Body;
      E020 := E020 + 1;
      Ada.Text_Io'Elab_Body;
      E005 := E005 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E078 := E078 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E082 := E082 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E087 := E087 + 1;
      STM32.ADC'ELAB_SPEC;
      E104 := E104 + 1;
      E110 := E110 + 1;
      E142 := E142 + 1;
      STM32.SPI'ELAB_BODY;
      E128 := E128 + 1;
      STM32.GPIO'ELAB_BODY;
      E094 := E094 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E098 := E098 + 1;
      STM32.USARTS'ELAB_BODY;
      E133 := E133 + 1;
      STM32.I2S'ELAB_BODY;
      E122 := E122 + 1;
      STM32.I2C'ELAB_BODY;
      E116 := E116 + 1;
      Driver'Elab_Spec;
      Driver'Elab_Body;
      E018 := E018 + 1;
      E145 := E145 + 1;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_ex4");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/ex4/obj/Debug/driver.o
   --   /backup/ada/STM32/F/F103/ex4/obj/Debug/last_chance_handler.o
   --   /backup/ada/STM32/F/F103/ex4/obj/Debug/ex4.o
   --   -L/backup/ada/STM32/F/F103/ex4/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/ex4/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/ex4/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ex4/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ex4/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/ex4/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ex4/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ex4/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ex4/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
