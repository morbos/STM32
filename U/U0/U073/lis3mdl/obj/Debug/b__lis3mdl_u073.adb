pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__lis3mdl_u073.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__lis3mdl_u073.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__text_io_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "cortex_m__debug_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "lis3mdl_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "lis3mdl_i2c_io_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "semihosting_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__dac_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32__exti_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "stm32__i2c_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "stm32__rcc_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "stm32__spi_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32__gpio_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "stm32__device_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "stm32__syscfg_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "last_chance_handler_E");

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
      E063 := E063 + 1;
      E131 := E131 + 1;
      E121 := E121 + 1;
      E123 := E123 + 1;
      E128 := E128 + 1;
      E092 := E092 + 1;
      E103 := E103 + 1;
      E109 := E109 + 1;
      E099 := E099 + 1;
      E113 := E113 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E081 := E081 + 1;
      E101 := E101 + 1;
      E097 := E097 + 1;
      E073 := E073 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_lis3mdl_u073");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /media/16T/ada/STM32/U/U0/U073/lis3mdl/obj/Debug/lis3mdl.o
   --   /media/16T/ada/STM32/U/U0/U073/lis3mdl/obj/Debug/lis3mdl_i2c_io.o
   --   /media/16T/ada/STM32/U/U0/U073/lis3mdl/obj/Debug/lis3mdl_i2c.o
   --   /media/16T/ada/STM32/U/U0/U073/lis3mdl/obj/Debug/peripherals.o
   --   /media/16T/ada/STM32/U/U0/U073/lis3mdl/obj/Debug/last_chance_handler.o
   --   /media/16T/ada/STM32/U/U0/U073/lis3mdl/obj/Debug/lis3mdl_u073.o
   --   -L/media/16T/ada/STM32/U/U0/U073/lis3mdl/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/lis3mdl/obj/Debug/
   --   -L/media/16T/ada/STM32/U/U0/
   --   -L/media/16T/ada/STM32/U/U0/U073/lis3mdl/Ada_Drivers_Library/boards/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/lis3mdl/Ada_Drivers_Library/boards/stm32u073_bluepill/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/lis3mdl/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u073bluepill/ssfp/adalib/
   --   -L/media/16T/ada/STM32/U/U0/U073/lis3mdl/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/hal/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/lis3mdl/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m0/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/lis3mdl/Ada_Drivers_Library/components/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/STM32/U/U0/U073/lis3mdl/Ada_Drivers_Library/middleware/lib/stm32u073bluepill/ravenscar-ssfp/Debug/
   --   -L/media/16T/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32u073bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
