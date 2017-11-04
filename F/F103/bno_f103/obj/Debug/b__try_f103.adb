pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__try_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__try_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E067 : Short_Integer; pragma Import (Ada, E067, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "stm32__dac_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "stm32__exti_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "stm32__gpio_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__i2c_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "stm32__i2s_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "stm32__spi_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "stm32__usarts_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Text_Io'Elab_Body;
      E067 := E067 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      E093 := E093 + 1;
      E123 := E123 + 1;
      E110 := E110 + 1;
      E078 := E078 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E082 := E082 + 1;
      E115 := E115 + 1;
      E104 := E104 + 1;
      E098 := E098 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_try_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/try_f103/obj/Debug/try_f103.o
   --   -L/backup/ada/STM32/F/F103/try_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/try_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/try_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/try_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/try_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/try_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/try_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/try_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/try_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/try_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
