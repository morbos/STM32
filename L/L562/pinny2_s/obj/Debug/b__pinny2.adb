pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__pinny2.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__pinny2.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E05 : Short_Integer; pragma Import (Ada, E05, "ada__real_time_E");
   E80 : Short_Integer; pragma Import (Ada, E80, "stm32__dac_E");
   E91 : Short_Integer; pragma Import (Ada, E91, "stm32__exti_E");
   E87 : Short_Integer; pragma Import (Ada, E87, "stm32__rcc_E");
   E96 : Short_Integer; pragma Import (Ada, E96, "stm32__spi_E");
   E85 : Short_Integer; pragma Import (Ada, E85, "stm32__gpio_E");
   E77 : Short_Integer; pragma Import (Ada, E77, "stm32__device_E");
   E89 : Short_Integer; pragma Import (Ada, E89, "stm32__syscfg_E");
   E70 : Short_Integer; pragma Import (Ada, E70, "stm32__board_E");

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
      E05 := E05 + 1;
      E80 := E80 + 1;
      E91 := E91 + 1;
      E87 := E87 + 1;
      E96 := E96 + 1;
      STM32.DEVICE'ELAB_SPEC;
      STM32.DEVICE'ELAB_BODY;
      E77 := E77 + 1;
      E89 := E89 + 1;
      E85 := E85 + 1;
      STM32.BOARD'ELAB_SPEC;
      E70 := E70 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_pinny2");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/L/L562/pinny2_s/obj/Debug/pinny2.o
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/obj/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/Ada_Drivers_Library/boards/lib/stm32l5discovery_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/Ada_Drivers_Library/boards/stm32l5_discovery_s/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/Ada_Drivers_Library/components/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/STM32/L/L562/pinny2_s/Ada_Drivers_Library/middleware/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5discovery_s/sfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
