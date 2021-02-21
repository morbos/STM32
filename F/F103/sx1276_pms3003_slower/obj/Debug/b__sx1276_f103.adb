pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E135 : Short_Integer; pragma Import (Ada, E135, "system__tasking__protected_objects_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__tasking__protected_objects__multiprocessors_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "system__tasking__restricted__stages_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "bitmap_color_conversion_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "crc8_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "soft_drawing_bitmap_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "st7735r_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "stm32__adc_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "stm32__dac_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32__exti_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "stm32__spi_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "stm32__gpio_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "stm32__i2c_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "stm32__i2s_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "stm32__usarts_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "stm32__device_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "sx1276_spi_io_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "peripherals_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "hw_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "utils_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "exti_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "sx1276_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "sx1276_spi_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      procedure Install_Restricted_Handlers_Sequential;
      pragma Import (C,Install_Restricted_Handlers_Sequential, "__gnat_attach_all_handlers");

      Partition_Elaboration_Policy : Character;
      pragma Import (C, Partition_Elaboration_Policy, "__gnat_partition_elaboration_policy");

      procedure Activate_All_Tasks_Sequential;
      pragma Import (C, Activate_All_Tasks_Sequential, "__gnat_activate_all_tasks");

      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      Partition_Elaboration_Policy := 'S';

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E135 := E135 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E139 := E139 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E144 := E144 + 1;
      E164 := E164 + 1;
      E066 := E066 + 1;
      E162 := E162 + 1;
      E157 := E157 + 1;
      STM32.ADC'ELAB_SPEC;
      E080 := E080 + 1;
      E088 := E088 + 1;
      E103 := E103 + 1;
      E118 := E118 + 1;
      E094 := E094 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E074 := E074 + 1;
      E106 := E106 + 1;
      E112 := E112 + 1;
      E122 := E122 + 1;
      E126 := E126 + 1;
      Peripherals'Elab_Spec;
      E071 := E071 + 1;
      E155 := E155 + 1;
      E148 := E148 + 1;
      Exti'Elab_Spec;
      E146 := E146 + 1;
      SX1276_SPI'ELAB_SPEC;
      E131 := E131 + 1;
      Exti'Elab_Body;
      E070 := E070 + 1;
      Install_Restricted_Handlers_Sequential;
      Activate_All_Tasks_Sequential;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_sx1276_f103");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/crc8.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/sx1276_spi_io.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/hw.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/utils.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/sx1276.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/sx1276_spi.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/exti.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/sx1276_f103.o
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_pms3003_slower/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
