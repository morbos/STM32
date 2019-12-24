pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__trace_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__trace_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "stm32__adc_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "stm32__dac_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "stm32__exti_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "stm32__gpio_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32__i2c_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32__i2s_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "stm32__spi_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "stm32__usarts_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      STM32.ADC'ELAB_SPEC;
      E083 := E083 + 1;
      E091 := E091 + 1;
      E123 := E123 + 1;
      E109 := E109 + 1;
      E073 := E073 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E077 := E077 + 1;
      E114 := E114 + 1;
      E103 := E103 + 1;
      E097 := E097 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_trace_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/trace_f103/obj/Debug/trace_f103.o
   --   -L/backup/ada/STM32/F/F103/trace_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/trace_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/trace_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/trace_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/trace_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/trace_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/trace_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/trace_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/trace_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/trace_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
