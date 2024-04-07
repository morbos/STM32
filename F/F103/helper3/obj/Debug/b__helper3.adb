pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__helper3.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__helper3.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__text_io_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__tasking__protected_objects_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__tasking__restricted__stages_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "stm32__adc_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "stm32__dac_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "stm32__exti_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "stm32__spi_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "stm32__gpio_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "stm32__i2c_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "stm32__i2s_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "stm32__usarts_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "stm32__device_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "stm32f1_timer_interrupts_E");

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
      E066 := E066 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E132 := E132 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E139 := E139 + 1;
      STM32.ADC'ELAB_SPEC;
      E087 := E087 + 1;
      E095 := E095 + 1;
      E127 := E127 + 1;
      E113 := E113 + 1;
      E077 := E077 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E081 := E081 + 1;
      E101 := E101 + 1;
      E107 := E107 + 1;
      E118 := E118 + 1;
      Stm32f1_Timer_Interrupts'Elab_Spec;
      E130 := E130 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_helper3");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/F/F103/helper3/obj/Debug/stm32f1_timer_interrupts.o
   --   /home/hedley/ada/STM32/F/F103/helper3/obj/Debug/helper3.o
   --   -L/home/hedley/ada/STM32/F/F103/helper3/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/helper3/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/
   --   -L/home/hedley/ada/STM32/F/F103/helper3/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/helper3/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/helper3/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/F/F103/helper3/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/helper3/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/helper3/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/helper3/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
