pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_s.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_s.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "stm32__dac_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "stm32__exti_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "stm32__mpu_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "stm32__rcc_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "stm32__sau_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "stm32__spi_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "stm32__gpio_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "stm32__device_E");
   E084 : Short_Integer; pragma Import (Ada, E084, "stm32__syscfg_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "cm33_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "stm32__board_E");

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
      E075 := E075 + 1;
      E086 := E086 + 1;
      E096 := E096 + 1;
      E082 := E082 + 1;
      E099 := E099 + 1;
      E092 := E092 + 1;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E072 := E072 + 1;
      E084 := E084 + 1;
      E080 := E080 + 1;
      E066 := E066 + 1;
      STM32.BOARD'ELAB_SPEC;
      E104 := E104 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_test_s");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/L/L562/dac/test_s/obj/Debug/cm33.o
   --   /home/hedley/ada/STM32/L/L562/dac/test_s/obj/Debug/test_s.o
   --   -L/home/hedley/ada/STM32/L/L562/dac/test_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac/test_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac/test_s/
   --   -L/home/hedley/ada/STM32/L/L562/dac/Ada_Drivers_Library/boards/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac/Ada_Drivers_Library/boards/stm32l5_discovery_s/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -L/home/hedley/ada/STM32/L/L562/dac/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac/Ada_Drivers_Library/components/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/dac/Ada_Drivers_Library/middleware/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5discovery_s/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
