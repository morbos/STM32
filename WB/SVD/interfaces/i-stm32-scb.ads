--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.SCB is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CPUID_Revision_Field is Interfaces.Bit_Types.UInt4;
   subtype CPUID_PartNo_Field is Interfaces.Bit_Types.UInt12;
   subtype CPUID_Constant_Field is Interfaces.Bit_Types.UInt4;
   subtype CPUID_Variant_Field is Interfaces.Bit_Types.UInt4;
   subtype CPUID_Implementer_Field is Interfaces.Bit_Types.Byte;

   --  CPUID base register
   type CPUID_Register is record
      --  Read-only. Revision number
      Revision    : CPUID_Revision_Field;
      --  Read-only. Part number of the processor
      PartNo      : CPUID_PartNo_Field;
      --  Read-only. Reads as 0xF
      Constant_k  : CPUID_Constant_Field;
      --  Read-only. Variant number
      Variant     : CPUID_Variant_Field;
      --  Read-only. Implementer code
      Implementer : CPUID_Implementer_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CPUID_Register use record
      Revision    at 0 range 0 .. 3;
      PartNo      at 0 range 4 .. 15;
      Constant_k  at 0 range 16 .. 19;
      Variant     at 0 range 20 .. 23;
      Implementer at 0 range 24 .. 31;
   end record;

   subtype ICSR_VECTACTIVE_Field is Interfaces.Bit_Types.UInt9;
   subtype ICSR_RETTOBASE_Field is Interfaces.Bit_Types.Bit;
   subtype ICSR_VECTPENDING_Field is Interfaces.Bit_Types.UInt7;
   subtype ICSR_ISRPENDING_Field is Interfaces.Bit_Types.Bit;
   subtype ICSR_PENDSTCLR_Field is Interfaces.Bit_Types.Bit;
   subtype ICSR_PENDSTSET_Field is Interfaces.Bit_Types.Bit;
   subtype ICSR_PENDSVCLR_Field is Interfaces.Bit_Types.Bit;
   subtype ICSR_PENDSVSET_Field is Interfaces.Bit_Types.Bit;
   subtype ICSR_NMIPENDSET_Field is Interfaces.Bit_Types.Bit;

   --  Interrupt control and state register
   type ICSR_Register is record
      --  Active vector
      VECTACTIVE     : ICSR_VECTACTIVE_Field := 16#0#;
      --  unspecified
      Reserved_9_10  : Interfaces.Bit_Types.UInt2 := 16#0#;
      --  Return to base level
      RETTOBASE      : ICSR_RETTOBASE_Field := 16#0#;
      --  Pending vector
      VECTPENDING    : ICSR_VECTPENDING_Field := 16#0#;
      --  unspecified
      Reserved_19_21 : Interfaces.Bit_Types.UInt3 := 16#0#;
      --  Interrupt pending flag
      ISRPENDING     : ICSR_ISRPENDING_Field := 16#0#;
      --  unspecified
      Reserved_23_24 : Interfaces.Bit_Types.UInt2 := 16#0#;
      --  SysTick exception clear-pending bit
      PENDSTCLR      : ICSR_PENDSTCLR_Field := 16#0#;
      --  SysTick exception set-pending bit
      PENDSTSET      : ICSR_PENDSTSET_Field := 16#0#;
      --  PendSV clear-pending bit
      PENDSVCLR      : ICSR_PENDSVCLR_Field := 16#0#;
      --  PendSV set-pending bit
      PENDSVSET      : ICSR_PENDSVSET_Field := 16#0#;
      --  unspecified
      Reserved_29_30 : Interfaces.Bit_Types.UInt2 := 16#0#;
      --  NMI set-pending bit.
      NMIPENDSET     : ICSR_NMIPENDSET_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICSR_Register use record
      VECTACTIVE     at 0 range 0 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      RETTOBASE      at 0 range 11 .. 11;
      VECTPENDING    at 0 range 12 .. 18;
      Reserved_19_21 at 0 range 19 .. 21;
      ISRPENDING     at 0 range 22 .. 22;
      Reserved_23_24 at 0 range 23 .. 24;
      PENDSTCLR      at 0 range 25 .. 25;
      PENDSTSET      at 0 range 26 .. 26;
      PENDSVCLR      at 0 range 27 .. 27;
      PENDSVSET      at 0 range 28 .. 28;
      Reserved_29_30 at 0 range 29 .. 30;
      NMIPENDSET     at 0 range 31 .. 31;
   end record;

   subtype VTOR_TBLOFF_Field is Interfaces.Bit_Types.UInt21;

   --  Vector table offset register
   type VTOR_Register is record
      --  unspecified
      Reserved_0_8   : Interfaces.Bit_Types.UInt9 := 16#0#;
      --  Vector table base offset field
      TBLOFF         : VTOR_TBLOFF_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : Interfaces.Bit_Types.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for VTOR_Register use record
      Reserved_0_8   at 0 range 0 .. 8;
      TBLOFF         at 0 range 9 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype AIRCR_VECTRESET_Field is Interfaces.Bit_Types.Bit;
   subtype AIRCR_VECTCLRACTIVE_Field is Interfaces.Bit_Types.Bit;
   subtype AIRCR_SYSRESETREQ_Field is Interfaces.Bit_Types.Bit;
   subtype AIRCR_PRIGROUP_Field is Interfaces.Bit_Types.UInt3;
   subtype AIRCR_ENDIANESS_Field is Interfaces.Bit_Types.Bit;
   subtype AIRCR_VECTKEYSTAT_Field is Interfaces.Bit_Types.Short;

   --  Application interrupt and reset control register
   type AIRCR_Register is record
      --  VECTRESET
      VECTRESET      : AIRCR_VECTRESET_Field := 16#0#;
      --  VECTCLRACTIVE
      VECTCLRACTIVE  : AIRCR_VECTCLRACTIVE_Field := 16#0#;
      --  SYSRESETREQ
      SYSRESETREQ    : AIRCR_SYSRESETREQ_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : Interfaces.Bit_Types.UInt5 := 16#0#;
      --  PRIGROUP
      PRIGROUP       : AIRCR_PRIGROUP_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : Interfaces.Bit_Types.UInt4 := 16#0#;
      --  ENDIANESS
      ENDIANESS      : AIRCR_ENDIANESS_Field := 16#0#;
      --  Register key
      VECTKEYSTAT    : AIRCR_VECTKEYSTAT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for AIRCR_Register use record
      VECTRESET      at 0 range 0 .. 0;
      VECTCLRACTIVE  at 0 range 1 .. 1;
      SYSRESETREQ    at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      PRIGROUP       at 0 range 8 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      ENDIANESS      at 0 range 15 .. 15;
      VECTKEYSTAT    at 0 range 16 .. 31;
   end record;

   subtype SCR_SLEEPONEXIT_Field is Interfaces.Bit_Types.Bit;
   subtype SCR_SLEEPDEEP_Field is Interfaces.Bit_Types.Bit;
   subtype SCR_SEVEONPEND_Field is Interfaces.Bit_Types.Bit;

   --  System control register
   type SCR_Register is record
      --  unspecified
      Reserved_0_0  : Interfaces.Bit_Types.Bit := 16#0#;
      --  SLEEPONEXIT
      SLEEPONEXIT   : SCR_SLEEPONEXIT_Field := 16#0#;
      --  SLEEPDEEP
      SLEEPDEEP     : SCR_SLEEPDEEP_Field := 16#0#;
      --  unspecified
      Reserved_3_3  : Interfaces.Bit_Types.Bit := 16#0#;
      --  Send Event on Pending bit
      SEVEONPEND    : SCR_SEVEONPEND_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : Interfaces.Bit_Types.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      SLEEPONEXIT   at 0 range 1 .. 1;
      SLEEPDEEP     at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      SEVEONPEND    at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype CCR_NONBASETHRDENA_Field is Interfaces.Bit_Types.Bit;
   subtype CCR_USERSETMPEND_Field is Interfaces.Bit_Types.Bit;
   subtype CCR_UNALIGN_TRP_Field is Interfaces.Bit_Types.Bit;
   subtype CCR_DIV_0_TRP_Field is Interfaces.Bit_Types.Bit;
   subtype CCR_BFHFNMIGN_Field is Interfaces.Bit_Types.Bit;
   subtype CCR_STKALIGN_Field is Interfaces.Bit_Types.Bit;

   --  Configuration and control register
   type CCR_Register is record
      --  Configures how the processor enters Thread mode
      NONBASETHRDENA : CCR_NONBASETHRDENA_Field := 16#0#;
      --  USERSETMPEND
      USERSETMPEND   : CCR_USERSETMPEND_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.Bit_Types.Bit := 16#0#;
      --  UNALIGN_ TRP
      UNALIGN_TRP    : CCR_UNALIGN_TRP_Field := 16#0#;
      --  DIV_0_TRP
      DIV_0_TRP      : CCR_DIV_0_TRP_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : Interfaces.Bit_Types.UInt3 := 16#0#;
      --  BFHFNMIGN
      BFHFNMIGN      : CCR_BFHFNMIGN_Field := 16#0#;
      --  STKALIGN
      STKALIGN       : CCR_STKALIGN_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      NONBASETHRDENA at 0 range 0 .. 0;
      USERSETMPEND   at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      UNALIGN_TRP    at 0 range 3 .. 3;
      DIV_0_TRP      at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      BFHFNMIGN      at 0 range 8 .. 8;
      STKALIGN       at 0 range 9 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype SHPR1_PRI_4_Field is Interfaces.Bit_Types.Byte;
   subtype SHPR1_PRI_5_Field is Interfaces.Bit_Types.Byte;
   subtype SHPR1_PRI_6_Field is Interfaces.Bit_Types.Byte;

   --  System handler priority registers
   type SHPR1_Register is record
      --  Priority of system handler 4
      PRI_4          : SHPR1_PRI_4_Field := 16#0#;
      --  Priority of system handler 5
      PRI_5          : SHPR1_PRI_5_Field := 16#0#;
      --  Priority of system handler 6
      PRI_6          : SHPR1_PRI_6_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR1_Register use record
      PRI_4          at 0 range 0 .. 7;
      PRI_5          at 0 range 8 .. 15;
      PRI_6          at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SHPR2_PRI_11_Field is Interfaces.Bit_Types.Byte;

   --  System handler priority registers
   type SHPR2_Register is record
      --  unspecified
      Reserved_0_23 : Interfaces.Bit_Types.UInt24 := 16#0#;
      --  Priority of system handler 11
      PRI_11        : SHPR2_PRI_11_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR2_Register use record
      Reserved_0_23 at 0 range 0 .. 23;
      PRI_11        at 0 range 24 .. 31;
   end record;

   subtype SHPR3_PRI_14_Field is Interfaces.Bit_Types.Byte;
   subtype SHPR3_PRI_15_Field is Interfaces.Bit_Types.Byte;

   --  System handler priority registers
   type SHPR3_Register is record
      --  unspecified
      Reserved_0_15 : Interfaces.Bit_Types.Short := 16#0#;
      --  Priority of system handler 14
      PRI_14        : SHPR3_PRI_14_Field := 16#0#;
      --  Priority of system handler 15
      PRI_15        : SHPR3_PRI_15_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR3_Register use record
      Reserved_0_15 at 0 range 0 .. 15;
      PRI_14        at 0 range 16 .. 23;
      PRI_15        at 0 range 24 .. 31;
   end record;

   subtype SHCRS_MEMFAULTACT_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_BUSFAULTACT_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_USGFAULTACT_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_SVCALLACT_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_MONITORACT_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_PENDSVACT_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_SYSTICKACT_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_USGFAULTPENDED_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_MEMFAULTPENDED_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_BUSFAULTPENDED_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_SVCALLPENDED_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_MEMFAULTENA_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_BUSFAULTENA_Field is Interfaces.Bit_Types.Bit;
   subtype SHCRS_USGFAULTENA_Field is Interfaces.Bit_Types.Bit;

   --  System handler control and state register
   type SHCRS_Register is record
      --  Memory management fault exception active bit
      MEMFAULTACT    : SHCRS_MEMFAULTACT_Field := 16#0#;
      --  Bus fault exception active bit
      BUSFAULTACT    : SHCRS_BUSFAULTACT_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.Bit_Types.Bit := 16#0#;
      --  Usage fault exception active bit
      USGFAULTACT    : SHCRS_USGFAULTACT_Field := 16#0#;
      --  unspecified
      Reserved_4_6   : Interfaces.Bit_Types.UInt3 := 16#0#;
      --  SVC call active bit
      SVCALLACT      : SHCRS_SVCALLACT_Field := 16#0#;
      --  Debug monitor active bit
      MONITORACT     : SHCRS_MONITORACT_Field := 16#0#;
      --  unspecified
      Reserved_9_9   : Interfaces.Bit_Types.Bit := 16#0#;
      --  PendSV exception active bit
      PENDSVACT      : SHCRS_PENDSVACT_Field := 16#0#;
      --  SysTick exception active bit
      SYSTICKACT     : SHCRS_SYSTICKACT_Field := 16#0#;
      --  Usage fault exception pending bit
      USGFAULTPENDED : SHCRS_USGFAULTPENDED_Field := 16#0#;
      --  Memory management fault exception pending bit
      MEMFAULTPENDED : SHCRS_MEMFAULTPENDED_Field := 16#0#;
      --  Bus fault exception pending bit
      BUSFAULTPENDED : SHCRS_BUSFAULTPENDED_Field := 16#0#;
      --  SVC call pending bit
      SVCALLPENDED   : SHCRS_SVCALLPENDED_Field := 16#0#;
      --  Memory management fault enable bit
      MEMFAULTENA    : SHCRS_MEMFAULTENA_Field := 16#0#;
      --  Bus fault enable bit
      BUSFAULTENA    : SHCRS_BUSFAULTENA_Field := 16#0#;
      --  Usage fault enable bit
      USGFAULTENA    : SHCRS_USGFAULTENA_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : Interfaces.Bit_Types.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHCRS_Register use record
      MEMFAULTACT    at 0 range 0 .. 0;
      BUSFAULTACT    at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      USGFAULTACT    at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      SVCALLACT      at 0 range 7 .. 7;
      MONITORACT     at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      PENDSVACT      at 0 range 10 .. 10;
      SYSTICKACT     at 0 range 11 .. 11;
      USGFAULTPENDED at 0 range 12 .. 12;
      MEMFAULTPENDED at 0 range 13 .. 13;
      BUSFAULTPENDED at 0 range 14 .. 14;
      SVCALLPENDED   at 0 range 15 .. 15;
      MEMFAULTENA    at 0 range 16 .. 16;
      BUSFAULTENA    at 0 range 17 .. 17;
      USGFAULTENA    at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype CFSR_UFSR_BFSR_MMFSR_IACCVIOL_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_MUNSTKERR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_MSTKERR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_MLSPERR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_MMARVALID_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_IBUSERR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_PRECISERR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_IMPRECISERR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_UNSTKERR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_STKERR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_LSPERR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_BFARVALID_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_UNDEFINSTR_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_INVSTATE_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_INVPC_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_NOCP_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_UNALIGNED_Field is Interfaces.Bit_Types.Bit;
   subtype CFSR_UFSR_BFSR_MMFSR_DIVBYZERO_Field is Interfaces.Bit_Types.Bit;

   --  Configurable fault status register
   type CFSR_UFSR_BFSR_MMFSR_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      --  Instruction access violation flag
      IACCVIOL       : CFSR_UFSR_BFSR_MMFSR_IACCVIOL_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : Interfaces.Bit_Types.Bit := 16#0#;
      --  Memory manager fault on unstacking for a return from exception
      MUNSTKERR      : CFSR_UFSR_BFSR_MMFSR_MUNSTKERR_Field := 16#0#;
      --  Memory manager fault on stacking for exception entry.
      MSTKERR        : CFSR_UFSR_BFSR_MMFSR_MSTKERR_Field := 16#0#;
      --  MLSPERR
      MLSPERR        : CFSR_UFSR_BFSR_MMFSR_MLSPERR_Field := 16#0#;
      --  unspecified
      Reserved_6_6   : Interfaces.Bit_Types.Bit := 16#0#;
      --  Memory Management Fault Address Register (MMAR) valid flag
      MMARVALID      : CFSR_UFSR_BFSR_MMFSR_MMARVALID_Field := 16#0#;
      --  Instruction bus error
      IBUSERR        : CFSR_UFSR_BFSR_MMFSR_IBUSERR_Field := 16#0#;
      --  Precise data bus error
      PRECISERR      : CFSR_UFSR_BFSR_MMFSR_PRECISERR_Field := 16#0#;
      --  Imprecise data bus error
      IMPRECISERR    : CFSR_UFSR_BFSR_MMFSR_IMPRECISERR_Field := 16#0#;
      --  Bus fault on unstacking for a return from exception
      UNSTKERR       : CFSR_UFSR_BFSR_MMFSR_UNSTKERR_Field := 16#0#;
      --  Bus fault on stacking for exception entry
      STKERR         : CFSR_UFSR_BFSR_MMFSR_STKERR_Field := 16#0#;
      --  Bus fault on floating-point lazy state preservation
      LSPERR         : CFSR_UFSR_BFSR_MMFSR_LSPERR_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : Interfaces.Bit_Types.Bit := 16#0#;
      --  Bus Fault Address Register (BFAR) valid flag
      BFARVALID      : CFSR_UFSR_BFSR_MMFSR_BFARVALID_Field := 16#0#;
      --  Undefined instruction usage fault
      UNDEFINSTR     : CFSR_UFSR_BFSR_MMFSR_UNDEFINSTR_Field := 16#0#;
      --  Invalid state usage fault
      INVSTATE       : CFSR_UFSR_BFSR_MMFSR_INVSTATE_Field := 16#0#;
      --  Invalid PC load usage fault
      INVPC          : CFSR_UFSR_BFSR_MMFSR_INVPC_Field := 16#0#;
      --  No coprocessor usage fault.
      NOCP           : CFSR_UFSR_BFSR_MMFSR_NOCP_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : Interfaces.Bit_Types.UInt4 := 16#0#;
      --  Unaligned access usage fault
      UNALIGNED      : CFSR_UFSR_BFSR_MMFSR_UNALIGNED_Field := 16#0#;
      --  Divide by zero usage fault
      DIVBYZERO      : CFSR_UFSR_BFSR_MMFSR_DIVBYZERO_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : Interfaces.Bit_Types.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFSR_UFSR_BFSR_MMFSR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      IACCVIOL       at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      MUNSTKERR      at 0 range 3 .. 3;
      MSTKERR        at 0 range 4 .. 4;
      MLSPERR        at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      MMARVALID      at 0 range 7 .. 7;
      IBUSERR        at 0 range 8 .. 8;
      PRECISERR      at 0 range 9 .. 9;
      IMPRECISERR    at 0 range 10 .. 10;
      UNSTKERR       at 0 range 11 .. 11;
      STKERR         at 0 range 12 .. 12;
      LSPERR         at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      BFARVALID      at 0 range 15 .. 15;
      UNDEFINSTR     at 0 range 16 .. 16;
      INVSTATE       at 0 range 17 .. 17;
      INVPC          at 0 range 18 .. 18;
      NOCP           at 0 range 19 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      UNALIGNED      at 0 range 24 .. 24;
      DIVBYZERO      at 0 range 25 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   subtype HFSR_VECTTBL_Field is Interfaces.Bit_Types.Bit;
   subtype HFSR_FORCED_Field is Interfaces.Bit_Types.Bit;
   subtype HFSR_DEBUG_VT_Field is Interfaces.Bit_Types.Bit;

   --  Hard fault status register
   type HFSR_Register is record
      --  unspecified
      Reserved_0_0  : Interfaces.Bit_Types.Bit := 16#0#;
      --  Vector table hard fault
      VECTTBL       : HFSR_VECTTBL_Field := 16#0#;
      --  unspecified
      Reserved_2_29 : Interfaces.Bit_Types.UInt28 := 16#0#;
      --  Forced hard fault
      FORCED        : HFSR_FORCED_Field := 16#0#;
      --  Reserved for Debug use
      DEBUG_VT      : HFSR_DEBUG_VT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for HFSR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      VECTTBL       at 0 range 1 .. 1;
      Reserved_2_29 at 0 range 2 .. 29;
      FORCED        at 0 range 30 .. 30;
      DEBUG_VT      at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  System control block
   type SCB_Peripheral is record
      --  CPUID base register
      CPUID                : aliased CPUID_Register;
      --  Interrupt control and state register
      ICSR                 : aliased ICSR_Register;
      --  Vector table offset register
      VTOR                 : aliased VTOR_Register;
      --  Application interrupt and reset control register
      AIRCR                : aliased AIRCR_Register;
      --  System control register
      SCR                  : aliased SCR_Register;
      --  Configuration and control register
      CCR                  : aliased CCR_Register;
      --  System handler priority registers
      SHPR1                : aliased SHPR1_Register;
      --  System handler priority registers
      SHPR2                : aliased SHPR2_Register;
      --  System handler priority registers
      SHPR3                : aliased SHPR3_Register;
      --  System handler control and state register
      SHCRS                : aliased SHCRS_Register;
      --  Configurable fault status register
      CFSR_UFSR_BFSR_MMFSR : aliased CFSR_UFSR_BFSR_MMFSR_Register;
      --  Hard fault status register
      HFSR                 : aliased HFSR_Register;
      --  Memory management fault address register
      MMFAR                : aliased Interfaces.Bit_Types.Word;
      --  Bus fault address register
      BFAR                 : aliased Interfaces.Bit_Types.Word;
      --  Auxiliary fault status register
      AFSR                 : aliased Interfaces.Bit_Types.Word;
   end record
     with Volatile;

   for SCB_Peripheral use record
      CPUID                at 16#0# range 0 .. 31;
      ICSR                 at 16#4# range 0 .. 31;
      VTOR                 at 16#8# range 0 .. 31;
      AIRCR                at 16#C# range 0 .. 31;
      SCR                  at 16#10# range 0 .. 31;
      CCR                  at 16#14# range 0 .. 31;
      SHPR1                at 16#18# range 0 .. 31;
      SHPR2                at 16#1C# range 0 .. 31;
      SHPR3                at 16#20# range 0 .. 31;
      SHCRS                at 16#24# range 0 .. 31;
      CFSR_UFSR_BFSR_MMFSR at 16#28# range 0 .. 31;
      HFSR                 at 16#2C# range 0 .. 31;
      MMFAR                at 16#34# range 0 .. 31;
      BFAR                 at 16#38# range 0 .. 31;
      AFSR                 at 16#3C# range 0 .. 31;
   end record;

   --  System control block
   SCB_Periph : aliased SCB_Peripheral
     with Import, Address => System'To_Address (16#E000ED00#);

end Interfaces.STM32.SCB;
