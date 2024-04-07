pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__adcdma_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__adcdma_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "stm32__adc_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "stm32__dac_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "stm32__exti_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "stm32__spi_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "stm32__gpio_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "stm32__i2c_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "stm32__i2s_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__usarts_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "stm32__device_E");

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
      STM32.ADC'ELAB_SPEC;
      E070 := E070 + 1;
      E089 := E089 + 1;
      E121 := E121 + 1;
      E107 := E107 + 1;
      E079 := E079 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E083 := E083 + 1;
      E095 := E095 + 1;
      E101 := E101 + 1;
      E112 := E112 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_adcdma_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/F/F103/adcdma_f103/obj/Debug/adcdma_f103.o
   --   -L/home/hedley/ada/STM32/F/F103/adcdma_f103/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/adcdma_f103/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/
   --   -L/home/hedley/ada/STM32/F/F103/adcdma_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/adcdma_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/adcdma_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/F/F103/adcdma_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/adcdma_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/adcdma_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/adcdma_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
