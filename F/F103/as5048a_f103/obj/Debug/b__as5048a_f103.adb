pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__as5048a_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__as5048a_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E050 : Short_Integer; pragma Import (Ada, E050, "system__bb__timing_events_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__text_io_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "stm32__adc_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__dac_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "stm32__exti_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "stm32__spi_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "stm32__i2c_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "stm32__usarts_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "stm32__i2s_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__gpio_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "stm32__device_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "as5048a_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "last_chance_handler_E");

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
      E050 := E050 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      Ada.Text_Io'Elab_Body;
      E068 := E068 + 1;
      STM32.ADC'ELAB_SPEC;
      E086 := E086 + 1;
      E092 := E092 + 1;
      E107 := E107 + 1;
      STM32.SPI'ELAB_BODY;
      E122 := E122 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E080 := E080 + 1;
      STM32.I2S'ELAB_BODY;
      E116 := E116 + 1;
      STM32.I2C'ELAB_BODY;
      E110 := E110 + 1;
      STM32.GPIO'ELAB_BODY;
      E098 := E098 + 1;
      STM32.USARTS'ELAB_BODY;
      E126 := E126 + 1;
      E074 := E074 + 1;
      E130 := E130 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_as5048a_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/as5048a_f103/obj/Debug/peripherals.o
   --   /backup/ada/STM32/F/F103/as5048a_f103/obj/Debug/as5048a.o
   --   /backup/ada/STM32/F/F103/as5048a_f103/obj/Debug/last_chance_handler.o
   --   /backup/ada/STM32/F/F103/as5048a_f103/obj/Debug/as5048a_f103.o
   --   -L/backup/ada/STM32/F/F103/as5048a_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/as5048a_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/as5048a_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/as5048a_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/as5048a_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/as5048a_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/as5048a_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/as5048a_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/as5048a_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
