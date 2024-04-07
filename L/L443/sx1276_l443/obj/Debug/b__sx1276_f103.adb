pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__sx1276_f103.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__sx1276_f103.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__tasking__protected_objects_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "system__tasking__protected_objects__multiprocessors_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "system__tasking__restricted__stages_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "stm32__adc_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "stm32__dac_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "stm32__exti_E");
   E115 : Short_Integer; pragma Import (Ada, E115, "stm32__spi_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "stm32__gpio_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32__i2c_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "stm32__i2s_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "stm32__usarts_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "stm32__device_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "sx1276_spi_io_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "peripherals_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "utils_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "exti_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "sx1276_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "sx1276_spi_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "motion_E");

   Sec_Default_Sized_Stacks : array (1 .. 2) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


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
      Binder_Sec_Stacks_Count := 2;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E133 := E133 + 1;
      System.Tasking.Protected_Objects.Multiprocessors'Elab_Body;
      E137 := E137 + 1;
      System.Tasking.Restricted.Stages'Elab_Body;
      E142 := E142 + 1;
      STM32.ADC'ELAB_SPEC;
      E077 := E077 + 1;
      E085 := E085 + 1;
      E100 := E100 + 1;
      E115 := E115 + 1;
      E091 := E091 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E071 := E071 + 1;
      E103 := E103 + 1;
      E109 := E109 + 1;
      E120 := E120 + 1;
      E124 := E124 + 1;
      Peripherals'Elab_Spec;
      E068 := E068 + 1;
      E146 := E146 + 1;
      Exti'Elab_Spec;
      E144 := E144 + 1;
      SX1276_SPI'ELAB_SPEC;
      E129 := E129 + 1;
      Exti'Elab_Body;
      E066 := E066 + 1;
      Motion'Elab_Spec;
      Motion'Elab_Body;
      E153 := E153 + 1;
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
   --   /home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/sx1276_spi_io.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/peripherals.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/utils.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/sx1276.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/sx1276_spi.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/exti.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/motion.o
   --   /home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/sx1276_f103.o
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_f103/obj/Debug/
   --   -L/home/hedley/ada/STM32/F/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_f103/Ada_Drivers_Library/boards/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_f103/Ada_Drivers_Library/boards/stm32f103_bluepill/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_f103/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_f103/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/hal/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_f103/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m3/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_f103/Ada_Drivers_Library/components/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/STM32/F/F103/sx1276_f103/Ada_Drivers_Library/middleware/lib/stm32f103bluepill/ravenscar-ssfp/Debug/
   --   -L/home/hedley/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32f103bluepill/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
