pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__try_l073.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__try_l073.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E05 : Short_Integer; pragma Import (Ada, E05, "ada__real_time_E");
   E82 : Short_Integer; pragma Import (Ada, E82, "stm32__exti_E");
   E78 : Short_Integer; pragma Import (Ada, E78, "stm32__rcc_E");
   E90 : Short_Integer; pragma Import (Ada, E90, "stm32__spi_E");
   E76 : Short_Integer; pragma Import (Ada, E76, "stm32__gpio_E");
   E74 : Short_Integer; pragma Import (Ada, E74, "stm32__device_E");
   E80 : Short_Integer; pragma Import (Ada, E80, "stm32__syscfg_E");

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
      E82 := E82 + 1;
      E78 := E78 + 1;
      E90 := E90 + 1;
      STM32.DEVICE'ELAB_SPEC;
      E74 := E74 + 1;
      E80 := E80 + 1;
      E76 := E76 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_try_l073");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /backup/ada/STM32/L/L073/try_l073/obj/Debug/try_l073.o
   --   -L/backup/ada/STM32/L/L073/try_l073/obj/Debug/
   --   -L/backup/ada/STM32/L/L073/try_l073/obj/Debug/
   --   -L/backup/ada/STM32/L/L073/
   --   -L/backup/ada/STM32/L/L073/try_l073/Ada_Drivers_Library/boards/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/try_l073/Ada_Drivers_Library/boards/stm32l073_Lodev/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/try_l073/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l073lodev/ssfp/adalib/
   --   -L/backup/ada/STM32/L/L073/try_l073/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/hal/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/try_l073/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m0/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/try_l073/Ada_Drivers_Library/components/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/STM32/L/L073/try_l073/Ada_Drivers_Library/middleware/lib/stm32l073lodev/ravenscar-ssfp/Debug/
   --   -L/backup/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l073lodev/ssfp/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
