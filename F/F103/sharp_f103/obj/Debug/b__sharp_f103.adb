pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sharp_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sharp_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E065 : Short_Integer; pragma Import (Ada, E065, "ada__text_io_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "ada__real_time_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "stm32__adc_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__dac_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "stm32__exti_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "stm32__gpio_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__i2c_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__i2s_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__spi_E");
   E117 : Short_Integer; pragma Import (Ada, E117, "stm32__usarts_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Text_Io'Elab_Body;
      E065 := E065 + 1;
      Ada.Real_Time'Elab_Body;
      E007 := E007 + 1;
      STM32.ADC'ELAB_SPEC;
      E073 := E073 + 1;
      E094 := E094 + 1;
      E126 := E126 + 1;
      E112 := E112 + 1;
      E084 := E084 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E088 := E088 + 1;
      E117 := E117 + 1;
      E106 := E106 + 1;
      E100 := E100 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sharp_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/sharp_f103/obj/Debug/sharp_f103.o
   --   -L/backup/ada/STM32/F/F103/sharp_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/sharp_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/sharp_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/sharp_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/sharp_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/sharp_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/sharp_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/sharp_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/sharp_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/sharp_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
