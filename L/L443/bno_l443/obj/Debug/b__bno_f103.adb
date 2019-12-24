pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__bno_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__bno_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E050 : Short_Integer; pragma Import (Ada, E050, "system__bb__timing_events_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "ada__real_time_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__text_io_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "delay_milliseconds_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "bno055_i2c_io_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "bosch_bno055_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "stm32__adc_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "stm32__dac_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "stm32__exti_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "stm32__spi_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "stm32__i2c_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__gpio_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "stm32__usarts_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "stm32__i2s_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__device_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "last_chance_handler_E");

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
      E007 := E007 + 1;
      Ada.Text_Io'Elab_Body;
      E068 := E068 + 1;
      E084 := E084 + 1;
      E076 := E076 + 1;
      E082 := E082 + 1;
      STM32.ADC'ELAB_SPEC;
      E102 := E102 + 1;
      E108 := E108 + 1;
      E139 := E139 + 1;
      STM32.SPI'ELAB_BODY;
      E125 := E125 + 1;
      STM32.GPIO'ELAB_BODY;
      E094 := E094 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E098 := E098 + 1;
      STM32.USARTS'ELAB_BODY;
      E130 := E130 + 1;
      STM32.I2S'ELAB_BODY;
      E119 := E119 + 1;
      STM32.I2C'ELAB_BODY;
      E114 := E114 + 1;
      E088 := E088 + 1;
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
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
