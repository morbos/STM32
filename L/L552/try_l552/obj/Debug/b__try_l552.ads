pragma Warnings (Off);
pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: Community 2019 (20190517-74)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_try_l552" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.unsigned_types%s
   --  hal%s
   --  stm32_svd%s
   --  stm32_svd.rcc%s
   --  stm32_svd.rng%s
   --  try_l552%b
   --  END ELABORATION ORDER

end ada_main;
