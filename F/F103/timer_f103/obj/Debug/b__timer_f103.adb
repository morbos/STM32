pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__timer_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__timer_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "system__tasking__protected_objects_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "system__tasking__protected_objects__multiprocessors_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__tasking__restricted__stages_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "stm32__adc_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__dac_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "stm32__exti_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "stm32__gpio_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__i2c_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__i2s_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__spi_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "stm32__usarts_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "stm32__device_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "stm32f1_timer_interrupts_E");


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

      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E125 := E125 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E138 := E138 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E132 := E132 + 1;
      STM32.ADC'ELAB_SPEC;
      E080 := E080 + 1;
      E088 := E088 + 1;
      E120 := E120 + 1;
      E106 := E106 + 1;
      E070 := E070 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E074 := E074 + 1;
      E111 := E111 + 1;
      E100 := E100 + 1;
      E094 := E094 + 1;
      Stm32f1_Timer_Interrupts'Elab_Spec;
      E123 := E123 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_timer_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/timer_f103/obj/Debug/stm32f1_timer_interrupts.o
   --   /backup/ada/STM32/F/F103/timer_f103/obj/Debug/timer_f103.o
   --   -L/backup/ada/STM32/F/F103/timer_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/timer_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/timer_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/timer_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/timer_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/timer_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/timer_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/timer_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/timer_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/timer_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
