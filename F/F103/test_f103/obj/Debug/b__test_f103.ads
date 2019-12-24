pragma Ada_95;
pragma Warnings (Off);
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2016 (20160515-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_test_f103" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#cbacf7ac#;
   pragma Export (C, u00001, "test_f103B");
   u00002 : constant Version_32 := 16#0bedc8d1#;
   pragma Export (C, u00002, "systemS");
   u00003 : constant Version_32 := 16#71f79a66#;
   pragma Export (C, u00003, "halS");
   u00004 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00004, "interfacesS");
   --  BEGIN ELABORATION ORDER
   --  interfaces%s
   --  system%s
   --  hal%s
   --  test_f103%b
   --  END ELABORATION ORDER


end ada_main;
