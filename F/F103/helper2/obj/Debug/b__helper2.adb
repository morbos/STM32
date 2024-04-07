pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__helper2.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__helper2.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E065 : Short_Integer; pragma Import (Ada, E065, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "system__tasking__protected_objects_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "system__tasking__protected_objects__multiprocessors_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "system__tasking__restricted__stages_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "stm32__adc_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__dac_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "stm32__exti_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "stm32__gpio_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__i2c_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__i2s_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__spi_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__usarts_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "stm32__device_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "stm32l4_timer_interrupts_E");


   procedure adainit is
      procedure Install_Restricted_Handlers_Sequential;
      pragma Import (C,Install_Restricted_Handlers_Sequential, "__gnat_attach_all_handlers");

      Partition_Elaboration_Policy : Character;
      pragma Import (C, Partition_Elaboration_Policy, "__gnat_partition_elaboration_policy");

      procedure Activate_All_Tasks_Sequential;
      pragma Import (C, Activate_All_Tasks_Sequential, "__gnat_activate_all_tasks");

      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      Partition_Elaboration_Policy := 'S';

      Ada.Text_Io'Elab_Body;
      E065 := E065 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E131 := E131 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E144 := E144 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E138 := E138 + 1;
      STM32.ADC'ELAB_SPEC;
      E086 := E086 + 1;
      E094 := E094 + 1;
      E126 := E126 + 1;
      E112 := E112 + 1;
      E076 := E076 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E080 := E080 + 1;
      E117 := E117 + 1;
      E106 := E106 + 1;
      E100 := E100 + 1;
      Stm32l4_Timer_Interrupts'Elab_Spec;
      E129 := E129 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_helper2");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/helper2/obj/Debug/stm32l4_timer_interrupts.o
   --   /backup/ada/STM32/F/F103/helper2/obj/Debug/helper2.o
   --   -L/backup/ada/STM32/F/F103/helper2/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/helper2/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/helper2/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/helper2/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/helper2/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/helper2/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/helper2/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/helper2/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/helper2/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/helper2/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
