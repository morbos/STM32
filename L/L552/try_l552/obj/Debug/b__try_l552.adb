pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__try_l552.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__try_l552.adb");
pragma Suppress (Overflow_Check);

package body ada_main is



   procedure adainit is
   begin
      null;

   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_try_l552");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/hrainnie/ada/STM32/L/L552/try_l552/obj/Debug/try_l552.o
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/obj/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/obj/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/Ada_Drivers_Library/boards/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/Ada_Drivers_Library/boards/stm32l5_nucleo_s/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hrainnie/ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/Ada_Drivers_Library/components/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L552/try_l552/Ada_Drivers_Library/middleware/lib/stm32l5nucleo_s/ravenscar-sfp/Debug/
   --   -L/home/hrainnie/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo_s/sfp/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
