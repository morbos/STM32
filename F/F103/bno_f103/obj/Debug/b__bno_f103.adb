pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__bno_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__bno_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E067 : Short_Integer; pragma Import (Ada, E067, "ada__text_io_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "ada__real_time_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "delay_milliseconds_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "bno055_i2c_io_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "bosch_bno055_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "last_chance_handler_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "stm32__adc_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "stm32__dac_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "stm32__exti_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "stm32__gpio_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "stm32__i2c_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "stm32__i2s_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "stm32__spi_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "stm32__usarts_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Text_Io'Elab_Body;
      E067 := E067 + 1;
      Ada.Real_Time'Elab_Body;
      E007 := E007 + 1;
      E083 := E083 + 1;
      E075 := E075 + 1;
      E081 := E081 + 1;
      STM32.ADC'ELAB_SPEC;
      E101 := E101 + 1;
      E107 := E107 + 1;
      E138 := E138 + 1;
      E124 := E124 + 1;
      E093 := E093 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E097 := E097 + 1;
      E129 := E129 + 1;
      E118 := E118 + 1;
      E113 := E113 + 1;
      E087 := E087 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_bno_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/bno_f103/obj/Debug/delay_milliseconds.o
   --   /backup/ada/STM32/F/F103/bno_f103/obj/Debug/bno055_i2c.o
   --   /backup/ada/STM32/F/F103/bno_f103/obj/Debug/peripherals.o
   --   /backup/ada/STM32/F/F103/bno_f103/obj/Debug/last_chance_handler.o
   --   /backup/ada/STM32/F/F103/bno_f103/obj/Debug/bno_f103.o
   --   -L/backup/ada/STM32/F/F103/bno_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/bno_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/bno_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/bno_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/bno_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/bno_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/bno_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/bno_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/bno_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/bno_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
