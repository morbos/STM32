pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__vl53l0x_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__vl53l0x_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E067 : Short_Integer; pragma Import (Ada, E067, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__tasking__protected_objects_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "system__tasking__protected_objects__multiprocessors_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "system__tasking__restricted__stages_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "last_chance_handler_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__adc_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__dac_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "stm32__exti_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "stm32__gpio_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "stm32__afio_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__i2c_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__i2s_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__spi_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__usarts_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "stm32__device_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "stm32f1_exti_interrupts_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "vl53l0x_E");


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
      E067 := E067 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E133 := E133 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E146 := E146 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E140 := E140 + 1;
      STM32.ADC'ELAB_SPEC;
      E088 := E088 + 1;
      E094 := E094 + 1;
      E121 := E121 + 1;
      E080 := E080 + 1;
      E112 := E112 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E084 := E084 + 1;
      E117 := E117 + 1;
      E106 := E106 + 1;
      E100 := E100 + 1;
      E082 := E082 + 1;
      E074 := E074 + 1;
      Stm32f1_Exti_Interrupts'Elab_Spec;
      E131 := E131 + 1;
      E149 := E149 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_vl53l0x_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/obj/Production/peripherals.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/obj/Production/last_chance_handler.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/obj/Production/stm32f1_exti_interrupts.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/obj/Production/vl53l0x_f103.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/obj/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/obj/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Production/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/vl53l0x_avgirq_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
