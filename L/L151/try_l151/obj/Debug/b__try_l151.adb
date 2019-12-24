pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__try_l151.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__try_l151.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__text_io_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "stm32__dac_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32__exti_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "stm32__rcc_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "stm32__spi_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32__gpio_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "stm32__device_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "stm32__syscfg_E");

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
      E091 := E091 + 1;
      E103 := E103 + 1;
      E099 := E099 + 1;
      E114 := E114 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E082 := E082 + 1;
      E101 := E101 + 1;
      E097 := E097 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_try_l151");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/L/L151/try_l151/obj/Debug/try_l151.o
   --   -L/backup/ada/STM32/L/L151/try_l151/obj/Debug/
   --   -L/backup/ada/STM32/L/L151/try_l151/obj/Debug/
   --   -L/backup/ada/STM32/L/L151/
   --   -L/backup/ada/STM32/L/L151/try_l151/Ada_Drivers_Library/boards/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/try_l151/Ada_Drivers_Library/boards/stm32l151_Heltec/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/try_l151/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l151heltec/ssfp/adalib/
   --   -L/backup/ada/STM32/L/L151/try_l151/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/try_l151/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/try_l151/Ada_Drivers_Library/components/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L151/try_l151/Ada_Drivers_Library/middleware/lib/stm32l151heltec/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l151heltec/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
