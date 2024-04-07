pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__wwv.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__wwv.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "ada__text_io_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "system__tasking__protected_objects_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "system__tasking__protected_objects__multiprocessors_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "system__tasking__restricted__stages_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "stm32__adc_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "stm32__dac_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "stm32__exti_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "stm32__spi_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__gpio_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "stm32__i2c_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "stm32__i2s_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "stm32__usarts_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__device_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "stm32__afio_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "last_chance_handler_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "stm32f1_exti_interrupts_E");

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
      E079 := E079 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E068 := E068 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E072 := E072 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E077 := E077 + 1;
      STM32.ADC'ELAB_SPEC;
      E104 := E104 + 1;
      E110 := E110 + 1;
      E142 := E142 + 1;
      E128 := E128 + 1;
      E094 := E094 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E098 := E098 + 1;
      E116 := E116 + 1;
      E122 := E122 + 1;
      E133 := E133 + 1;
      E153 := E153 + 1;
      E086 := E086 + 1;
      Stm32f1_Exti_Interrupts'Elab_Spec;
      Stm32f1_Exti_Interrupts'Elab_Body;
      E146 := E146 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_wwv");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/F/F103/wwv/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/F/F103/wwv/obj/Debug/last_chance_handler.o
   --   /home/hedley/ada/STM32/F/F103/wwv/obj/Debug/stm32f1_exti_interrupts.o
   --   /home/hedley/ada/STM32/F/F103/wwv/obj/Debug/wwv.o
   --   -L/home/hedley/ada/STM32/F/F103/wwv/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/wwv/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/
   --   -L/home/hedley/ada/STM32/F/F103/wwv/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/wwv/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/wwv/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/F/F103/wwv/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/wwv/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/wwv/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/wwv/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
