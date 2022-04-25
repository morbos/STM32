pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__clkreq_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__clkreq_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E007 : Short_Integer; pragma Import (Ada, E007, "ada__real_time_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "stm32__adc_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "stm32__dac_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32__exti_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__gpio_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__i2c_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__i2s_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__spi_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__usarts_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Real_Time'Elab_Body;
      E007 := E007 + 1;
      STM32.ADC'ELAB_SPEC;
      E076 := E076 + 1;
      E082 := E082 + 1;
      E097 := E097 + 1;
      E112 := E112 + 1;
      E088 := E088 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E070 := E070 + 1;
      E117 := E117 + 1;
      E106 := E106 + 1;
      E100 := E100 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_clkreq_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/clkreq_f103/obj/Debug/peripherals.o
   --   /backup/ada/STM32/F/F103/clkreq_f103/obj/Debug/clkreq_f103.o
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/clkreq_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
