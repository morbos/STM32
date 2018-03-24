pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__dotstar_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__dotstar_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E065 : Short_Integer; pragma Import (Ada, E065, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "last_chance_handler_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__adc_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__dac_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "stm32__exti_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "stm32__gpio_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "dotstar_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__i2c_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__i2s_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__spi_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "stm32__usarts_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Text_Io'Elab_Body;
      E065 := E065 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      STM32.ADC'ELAB_SPEC;
      E088 := E088 + 1;
      E094 := E094 + 1;
      E125 := E125 + 1;
      E071 := E071 + 1;
      E112 := E112 + 1;
      E078 := E078 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E082 := E082 + 1;
      E116 := E116 + 1;
      E106 := E106 + 1;
      E100 := E100 + 1;
      E128 := E128 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_dotstar_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/obj/Debug/dotstar.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/obj/Debug/peripherals.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/obj/Debug/last_chance_handler.o
   --   /.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/obj/Debug/dotstar_f103.o
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/obj/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/.share/CACHEDEV1_DATA/Ada/STM32/F/F103/dotstar_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
