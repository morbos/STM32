pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__co2.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__co2.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E072 : Short_Integer; pragma Import (Ada, E072, "system__bb__timing_events_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__real_time_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "ada__text_io_E");
   E046 : Short_Integer; pragma Import (Ada, E046, "stm32__adc_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__dac_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "stm32__exti_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "stm32__spi_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "stm32__i2c_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "stm32__usarts_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "stm32__i2s_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__gpio_E");
   E034 : Short_Integer; pragma Import (Ada, E034, "stm32__device_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "hw_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "last_chance_handler_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "utils_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      null;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      System.Bb.Timing_Events'Elab_Body;
      E072 := E072 + 1;
      Ada.Real_Time'Elab_Body;
      E050 := E050 + 1;
      Ada.Text_Io'Elab_Body;
      E015 := E015 + 1;
      STM32.ADC'ELAB_SPEC;
      E046 := E046 + 1;
      E092 := E092 + 1;
      E107 := E107 + 1;
      STM32.SPI'ELAB_BODY;
      E122 := E122 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E034 := E034 + 1;
      STM32.I2S'ELAB_BODY;
      E116 := E116 + 1;
      STM32.I2C'ELAB_BODY;
      E110 := E110 + 1;
      STM32.GPIO'ELAB_BODY;
      E098 := E098 + 1;
      STM32.USARTS'ELAB_BODY;
      E127 := E127 + 1;
      E030 := E030 + 1;
      E133 := E133 + 1;
      E137 := E137 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_co2");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/co2/obj/Debug/peripherals.o
   --   /backup/ada/STM32/F/F103/co2/obj/Debug/hw.o
   --   /backup/ada/STM32/F/F103/co2/obj/Debug/last_chance_handler.o
   --   /backup/ada/STM32/F/F103/co2/obj/Debug/utils.o
   --   /backup/ada/STM32/F/F103/co2/obj/Debug/co2.o
   --   -L/backup/ada/STM32/F/F103/co2/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/co2/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/co2/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/co2/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/co2/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/co2/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/co2/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/co2/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/co2/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
