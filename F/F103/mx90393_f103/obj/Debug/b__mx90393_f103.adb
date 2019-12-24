pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__mx90393_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__mx90393_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E067 : Short_Integer; pragma Import (Ada, E067, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__adc_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__dac_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "stm32__exti_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "stm32__gpio_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__i2c_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__i2s_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "stm32__spi_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "stm32__usarts_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__device_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "utils_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "mx90393_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "mx90393_spi_io_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "peripherals_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Text_Io'Elab_Body;
      E067 := E067 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      STM32.ADC'ELAB_SPEC;
      E094 := E094 + 1;
      E100 := E100 + 1;
      E131 := E131 + 1;
      E118 := E118 + 1;
      E084 := E084 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E088 := E088 + 1;
      E122 := E122 + 1;
      E112 := E112 + 1;
      E106 := E106 + 1;
      E079 := E079 + 1;
      E077 := E077 + 1;
      E081 := E081 + 1;
      Peripherals'Elab_Spec;
      E133 := E133 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_mx90393_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/mx90393_f103/obj/Debug/utils.o
   --   /backup/ada/STM32/F/F103/mx90393_f103/obj/Debug/mx90393.o
   --   /backup/ada/STM32/F/F103/mx90393_f103/obj/Debug/mx90393_spi_io.o
   --   /backup/ada/STM32/F/F103/mx90393_f103/obj/Debug/mx90393_spi.o
   --   /backup/ada/STM32/F/F103/mx90393_f103/obj/Debug/peripherals.o
   --   /backup/ada/STM32/F/F103/mx90393_f103/obj/Debug/mx90393_f103.o
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/mx90393_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
