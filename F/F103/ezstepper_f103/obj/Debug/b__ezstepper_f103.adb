pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__ezstepper_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__ezstepper_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__text_io_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "stm32__adc_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32__dac_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "stm32__exti_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "stm32__spi_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "stm32__gpio_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32__i2c_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "stm32__i2s_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "stm32__usarts_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "stm32__device_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "last_chance_handler_E");

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


      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      Ada.Text_Io'Elab_Body;
      E068 := E068 + 1;
      STM32.ADC'ELAB_SPEC;
      E091 := E091 + 1;
      E097 := E097 + 1;
      E129 := E129 + 1;
      E115 := E115 + 1;
      E081 := E081 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E085 := E085 + 1;
      E103 := E103 + 1;
      E109 := E109 + 1;
      E120 := E120 + 1;
      E075 := E075 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_ezstepper_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/F/F103/ezstepper_f103/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/F/F103/ezstepper_f103/obj/Debug/last_chance_handler.o
   --   /home/hedley/ada/STM32/F/F103/ezstepper_f103/obj/Debug/ezstepper_f103.o
   --   -L/home/hedley/ada/STM32/F/F103/ezstepper_f103/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/ezstepper_f103/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/
   --   -L/home/hedley/ada/STM32/F/F103/ezstepper_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/ezstepper_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/ezstepper_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/F/F103/ezstepper_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/ezstepper_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/ezstepper_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/ezstepper_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
