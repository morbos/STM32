pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__try_l522.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__try_l522.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E060 : Short_Integer; pragma Import (Ada, E060, "ada__tags_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__bb__timing_events_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__soft_links_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "system__exception_table_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 1;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      System.Bb.Timing_Events'Elab_Spec;
      E082 := E082 + 1;
      System.Soft_Links'Elab_Spec;
      Ada.Tags'Elab_Body;
      E060 := E060 + 1;
      System.Exception_Table'Elab_Body;
      E094 := E094 + 1;
      E096 := E096 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_try_l522");

   procedure main is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
   end;

--  BEGIN Object file/option list
   --   /home/hrainnie/ada/STM32/L/L522/try_l522/obj/Debug/try_l522.o
   --   -L/home/hrainnie/ada/STM32/L/L522/try_l522/obj/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L522/try_l522/obj/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L522/
   --   -L/home/hrainnie/ada/STM32/L/L522/try_l522/Ada_Drivers_Library/boards/lib/stm32l5nucleo/ravenscar-full/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L522/try_l522/Ada_Drivers_Library/boards/stm32l5_nucleo/lib/stm32l5nucleo/ravenscar-full/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L522/try_l522/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo/full/adalib/
   --   -L/home/hrainnie/ada/STM32/L/L522/try_l522/Ada_Drivers_Library/arch/ARM/STM32/lib/stm32l5nucleo/ravenscar-full/Debug/
   --   -L/home/hrainnie/ada/Ada_Drivers_Library/hal/lib/stm32l5nucleo/ravenscar-full/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L522/try_l522/Ada_Drivers_Library/arch/ARM/cortex_m/lib/cortex-m4f/stm32l5nucleo/ravenscar-full/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L522/try_l522/Ada_Drivers_Library/components/lib/stm32l5nucleo/ravenscar-full/Debug/
   --   -L/home/hrainnie/ada/STM32/L/L522/try_l522/Ada_Drivers_Library/middleware/lib/stm32l5nucleo/ravenscar-full/Debug/
   --   -L/home/hrainnie/ada/Ada_Drivers_Library/embedded-runtimes/ravenscar-stm32l5nucleo/full/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
