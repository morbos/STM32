--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.FPU is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype FPCCR_LSPACT_Field is Interfaces.Bit_Types.Bit;
   subtype FPCCR_USER_Field is Interfaces.Bit_Types.Bit;
   subtype FPCCR_THREAD_Field is Interfaces.Bit_Types.Bit;
   subtype FPCCR_HFRDY_Field is Interfaces.Bit_Types.Bit;
   subtype FPCCR_MMRDY_Field is Interfaces.Bit_Types.Bit;
   subtype FPCCR_BFRDY_Field is Interfaces.Bit_Types.Bit;
   subtype FPCCR_MONRDY_Field is Interfaces.Bit_Types.Bit;
   subtype FPCCR_LSPEN_Field is Interfaces.Bit_Types.Bit;
   subtype FPCCR_ASPEN_Field is Interfaces.Bit_Types.Bit;

   --  Floating-point context control register
   type FPCCR_Register is record
      --  LSPACT
      LSPACT        : FPCCR_LSPACT_Field := 16#0#;
      --  USER
      USER          : FPCCR_USER_Field := 16#0#;
      --  unspecified
      Reserved_2_2  : Interfaces.Bit_Types.Bit := 16#0#;
      --  THREAD
      THREAD        : FPCCR_THREAD_Field := 16#0#;
      --  HFRDY
      HFRDY         : FPCCR_HFRDY_Field := 16#0#;
      --  MMRDY
      MMRDY         : FPCCR_MMRDY_Field := 16#0#;
      --  BFRDY
      BFRDY         : FPCCR_BFRDY_Field := 16#0#;
      --  unspecified
      Reserved_7_7  : Interfaces.Bit_Types.Bit := 16#0#;
      --  MONRDY
      MONRDY        : FPCCR_MONRDY_Field := 16#0#;
      --  unspecified
      Reserved_9_29 : Interfaces.Bit_Types.UInt21 := 16#0#;
      --  LSPEN
      LSPEN         : FPCCR_LSPEN_Field := 16#0#;
      --  ASPEN
      ASPEN         : FPCCR_ASPEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPCCR_Register use record
      LSPACT        at 0 range 0 .. 0;
      USER          at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      THREAD        at 0 range 3 .. 3;
      HFRDY         at 0 range 4 .. 4;
      MMRDY         at 0 range 5 .. 5;
      BFRDY         at 0 range 6 .. 6;
      Reserved_7_7  at 0 range 7 .. 7;
      MONRDY        at 0 range 8 .. 8;
      Reserved_9_29 at 0 range 9 .. 29;
      LSPEN         at 0 range 30 .. 30;
      ASPEN         at 0 range 31 .. 31;
   end record;

   subtype FPCAR_ADDRESS_Field is Interfaces.Bit_Types.UInt29;

   --  Floating-point context address register
   type FPCAR_Register is record
      --  unspecified
      Reserved_0_2 : Interfaces.Bit_Types.UInt3 := 16#0#;
      --  Location of unpopulated floating-point
      ADDRESS      : FPCAR_ADDRESS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPCAR_Register use record
      Reserved_0_2 at 0 range 0 .. 2;
      ADDRESS      at 0 range 3 .. 31;
   end record;

   subtype FPSCR_IOC_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_DZC_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_OFC_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_UFC_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_IXC_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_IDC_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_RMode_Field is Interfaces.Bit_Types.UInt2;
   subtype FPSCR_FZ_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_DN_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_AHP_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_V_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_C_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_Z_Field is Interfaces.Bit_Types.Bit;
   subtype FPSCR_N_Field is Interfaces.Bit_Types.Bit;

   --  Floating-point status control register
   type FPSCR_Register is record
      --  Invalid operation cumulative exception bit
      IOC            : FPSCR_IOC_Field := 16#0#;
      --  Division by zero cumulative exception bit.
      DZC            : FPSCR_DZC_Field := 16#0#;
      --  Overflow cumulative exception bit
      OFC            : FPSCR_OFC_Field := 16#0#;
      --  Underflow cumulative exception bit
      UFC            : FPSCR_UFC_Field := 16#0#;
      --  Inexact cumulative exception bit
      IXC            : FPSCR_IXC_Field := 16#0#;
      --  unspecified
      Reserved_5_6   : Interfaces.Bit_Types.UInt2 := 16#0#;
      --  Input denormal cumulative exception bit.
      IDC            : FPSCR_IDC_Field := 16#0#;
      --  unspecified
      Reserved_8_21  : Interfaces.Bit_Types.UInt14 := 16#0#;
      --  Rounding Mode control field
      RMode          : FPSCR_RMode_Field := 16#0#;
      --  Flush-to-zero mode control bit:
      FZ             : FPSCR_FZ_Field := 16#0#;
      --  Default NaN mode control bit
      DN             : FPSCR_DN_Field := 16#0#;
      --  Alternative half-precision control bit
      AHP            : FPSCR_AHP_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : Interfaces.Bit_Types.Bit := 16#0#;
      --  Overflow condition code flag
      V              : FPSCR_V_Field := 16#0#;
      --  Carry condition code flag
      C              : FPSCR_C_Field := 16#0#;
      --  Zero condition code flag
      Z              : FPSCR_Z_Field := 16#0#;
      --  Negative condition code flag
      N              : FPSCR_N_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPSCR_Register use record
      IOC            at 0 range 0 .. 0;
      DZC            at 0 range 1 .. 1;
      OFC            at 0 range 2 .. 2;
      UFC            at 0 range 3 .. 3;
      IXC            at 0 range 4 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      IDC            at 0 range 7 .. 7;
      Reserved_8_21  at 0 range 8 .. 21;
      RMode          at 0 range 22 .. 23;
      FZ             at 0 range 24 .. 24;
      DN             at 0 range 25 .. 25;
      AHP            at 0 range 26 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      V              at 0 range 28 .. 28;
      C              at 0 range 29 .. 29;
      Z              at 0 range 30 .. 30;
      N              at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Floting point unit
   type FPU_Peripheral is record
      --  Floating-point context control register
      FPCCR : aliased FPCCR_Register;
      --  Floating-point context address register
      FPCAR : aliased FPCAR_Register;
      --  Floating-point status control register
      FPSCR : aliased FPSCR_Register;
   end record
     with Volatile;

   for FPU_Peripheral use record
      FPCCR at 16#0# range 0 .. 31;
      FPCAR at 16#4# range 0 .. 31;
      FPSCR at 16#8# range 0 .. 31;
   end record;

   --  Floting point unit
   FPU_Periph : aliased FPU_Peripheral
     with Import, Address => System'To_Address (16#E000EF34#);

end Interfaces.STM32.FPU;
