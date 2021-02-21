pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__ssd1306_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__ssd1306_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E065 : Short_Integer; pragma Import (Ada, E065, "ada__text_io_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "bitmap_color_conversion_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "last_chance_handler_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "ravenscar_time_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "soft_drawing_bitmap_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "memory_mapped_bitmap_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "ssd1306_spi_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__adc_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "stm32__dac_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "stm32__exti_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "stm32__gpio_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "stm32__i2c_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "stm32__i2s_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "stm32__spi_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "stm32__usarts_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "stm32__device_E");


   procedure adainit is
      procedure Start_Slave_CPUs;
      pragma Import (C, Start_Slave_CPUs, "__gnat_start_slave_cpus");
   begin
      null;

      Ada.Text_Io'Elab_Body;
      E065 := E065 + 1;
      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      E141 := E141 + 1;
      Ravenscar_Time'Elab_Body;
      E133 := E133 + 1;
      E143 := E143 + 1;
      E139 := E139 + 1;
      E136 := E136 + 1;
      STM32.ADC'ELAB_SPEC;
      E092 := E092 + 1;
      E098 := E098 + 1;
      E129 := E129 + 1;
      E116 := E116 + 1;
      E082 := E082 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E086 := E086 + 1;
      E120 := E120 + 1;
      E110 := E110 + 1;
      E104 := E104 + 1;
      E074 := E074 + 1;
      Start_Slave_CPUs;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_ssd1306_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/F/F103/ssd1306_f103/obj/Debug/peripherals.o
   --   /backup/ada/STM32/F/F103/ssd1306_f103/obj/Debug/last_chance_handler.o
   --   /backup/ada/STM32/F/F103/ssd1306_f103/obj/Debug/ssd1306_f103.o
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/obj/Debug/
   --   -L/backup/ada/STM32/F/
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/F/F103/ssd1306_f103/Ada_Drivers_Library/boards/../embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
