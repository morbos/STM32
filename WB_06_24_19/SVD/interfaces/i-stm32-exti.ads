--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.EXTI is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype RTSR1_RT_Field is Interfaces.Bit_Types.UInt22;
   subtype RTSR1_RT_Field_1 is Interfaces.Bit_Types.Bit;

   type RTSR1_Register is record
      RT             : RTSR1_RT_Field := 16#0#;
      --  unspecified
      Reserved_22_30 : Interfaces.Bit_Types.UInt9 := 16#0#;
      RT_1           : RTSR1_RT_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTSR1_Register use record
      RT             at 0 range 0 .. 21;
      Reserved_22_30 at 0 range 22 .. 30;
      RT_1           at 0 range 31 .. 31;
   end record;

   subtype FTSR1_FT_Field is Interfaces.Bit_Types.UInt22;
   subtype FTSR1_FT_Field_1 is Interfaces.Bit_Types.Bit;

   type FTSR1_Register is record
      FT             : FTSR1_FT_Field := 16#0#;
      --  unspecified
      Reserved_22_30 : Interfaces.Bit_Types.UInt9 := 16#0#;
      FT_1           : FTSR1_FT_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FTSR1_Register use record
      FT             at 0 range 0 .. 21;
      Reserved_22_30 at 0 range 22 .. 30;
      FT_1           at 0 range 31 .. 31;
   end record;

   subtype SWIER1_SWI_Field is Interfaces.Bit_Types.UInt22;
   subtype SWIER1_SWI_Field_1 is Interfaces.Bit_Types.Bit;

   type SWIER1_Register is record
      SWI            : SWIER1_SWI_Field := 16#0#;
      --  unspecified
      Reserved_22_30 : Interfaces.Bit_Types.UInt9 := 16#0#;
      SWI_1          : SWIER1_SWI_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SWIER1_Register use record
      SWI            at 0 range 0 .. 21;
      Reserved_22_30 at 0 range 22 .. 30;
      SWI_1          at 0 range 31 .. 31;
   end record;

   subtype PR1_PIF_Field is Interfaces.Bit_Types.UInt22;
   subtype PR1_PIF_Field_1 is Interfaces.Bit_Types.Bit;

   type PR1_Register is record
      PIF            : PR1_PIF_Field := 16#0#;
      --  unspecified
      Reserved_22_30 : Interfaces.Bit_Types.UInt9 := 16#0#;
      PIF_1          : PR1_PIF_Field_1 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PR1_Register use record
      PIF            at 0 range 0 .. 21;
      Reserved_22_30 at 0 range 22 .. 30;
      PIF_1          at 0 range 31 .. 31;
   end record;

   subtype RTSR2_RT33_Field is Interfaces.Bit_Types.Bit;
   subtype RTSR2_RT_Field is Interfaces.Bit_Types.UInt2;

   type RTSR2_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      RT33           : RTSR2_RT33_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.Bit_Types.UInt6 := 16#0#;
      RT             : RTSR2_RT_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTSR2_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      RT33           at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      RT             at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype FTSR2_FT33_Field is Interfaces.Bit_Types.Bit;
   subtype FTSR2_FT_Field is Interfaces.Bit_Types.UInt2;

   type FTSR2_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      FT33           : FTSR2_FT33_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.Bit_Types.UInt6 := 16#0#;
      FT             : FTSR2_FT_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FTSR2_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      FT33           at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      FT             at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype SWIER2_SWI33_Field is Interfaces.Bit_Types.Bit;
   subtype SWIER2_SWI_Field is Interfaces.Bit_Types.UInt2;

   type SWIER2_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      SWI33          : SWIER2_SWI33_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.Bit_Types.UInt6 := 16#0#;
      SWI            : SWIER2_SWI_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SWIER2_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      SWI33          at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      SWI            at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype PR2_PIF33_Field is Interfaces.Bit_Types.Bit;
   subtype PR2_PIF_Field is Interfaces.Bit_Types.UInt2;

   type PR2_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      PIF33          : PR2_PIF33_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.Bit_Types.UInt6 := 16#0#;
      PIF            : PR2_PIF_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PR2_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      PIF33          at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      PIF            at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype EMR1_EM_Field is Interfaces.Bit_Types.Short;
   subtype EMR1_EM_Field_1 is Interfaces.Bit_Types.UInt5;

   type EMR1_Register is record
      EM             : EMR1_EM_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Interfaces.Bit_Types.Bit := 16#0#;
      EM_1           : EMR1_EM_Field_1 := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EMR1_Register use record
      EM             at 0 range 0 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      EM_1           at 0 range 17 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype IMR2_IM_Field is Interfaces.Bit_Types.UInt17;

   type IMR2_Register is record
      IM             : IMR2_IM_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IMR2_Register use record
      IM             at 0 range 0 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype EMR2_EM33_Field is Interfaces.Bit_Types.Bit;
   subtype EMR2_EM_Field is Interfaces.Bit_Types.UInt2;

   type EMR2_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      EM33           : EMR2_EM33_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.Bit_Types.UInt6 := 16#0#;
      EM             : EMR2_EM_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EMR2_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      EM33           at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      EM             at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype C2EMR1_EM_Field is Interfaces.Bit_Types.Short;
   subtype C2EMR1_EM_Field_1 is Interfaces.Bit_Types.UInt5;

   type C2EMR1_Register is record
      EM             : C2EMR1_EM_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Interfaces.Bit_Types.Bit := 16#0#;
      EM_1           : C2EMR1_EM_Field_1 := 16#0#;
      --  unspecified
      Reserved_22_31 : Interfaces.Bit_Types.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2EMR1_Register use record
      EM             at 0 range 0 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      EM_1           at 0 range 17 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype C2IMR2_IM_Field is Interfaces.Bit_Types.UInt17;

   type C2IMR2_Register is record
      IM             : C2IMR2_IM_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2IMR2_Register use record
      IM             at 0 range 0 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype C2EMR2_EM33_Field is Interfaces.Bit_Types.Bit;
   subtype C2EMR2_EM_Field is Interfaces.Bit_Types.UInt2;

   type C2EMR2_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      EM33           : C2EMR2_EM33_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.Bit_Types.UInt6 := 16#0#;
      EM             : C2EMR2_EM_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : Interfaces.Bit_Types.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2EMR2_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      EM33           at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      EM             at 0 range 8 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type EXTI_Peripheral is record
      RTSR1  : aliased RTSR1_Register;
      FTSR1  : aliased FTSR1_Register;
      SWIER1 : aliased SWIER1_Register;
      PR1    : aliased PR1_Register;
      RTSR2  : aliased RTSR2_Register;
      FTSR2  : aliased FTSR2_Register;
      SWIER2 : aliased SWIER2_Register;
      PR2    : aliased PR2_Register;
      IMR1   : aliased Interfaces.Bit_Types.Word;
      EMR1   : aliased EMR1_Register;
      IMR2   : aliased IMR2_Register;
      EMR2   : aliased EMR2_Register;
      C2IMR1 : aliased Interfaces.Bit_Types.Word;
      C2EMR1 : aliased C2EMR1_Register;
      C2IMR2 : aliased C2IMR2_Register;
      C2EMR2 : aliased C2EMR2_Register;
   end record
     with Volatile;

   for EXTI_Peripheral use record
      RTSR1  at 16#0# range 0 .. 31;
      FTSR1  at 16#4# range 0 .. 31;
      SWIER1 at 16#8# range 0 .. 31;
      PR1    at 16#C# range 0 .. 31;
      RTSR2  at 16#20# range 0 .. 31;
      FTSR2  at 16#24# range 0 .. 31;
      SWIER2 at 16#28# range 0 .. 31;
      PR2    at 16#2C# range 0 .. 31;
      IMR1   at 16#80# range 0 .. 31;
      EMR1   at 16#84# range 0 .. 31;
      IMR2   at 16#90# range 0 .. 31;
      EMR2   at 16#94# range 0 .. 31;
      C2IMR1 at 16#C0# range 0 .. 31;
      C2EMR1 at 16#C4# range 0 .. 31;
      C2IMR2 at 16#D0# range 0 .. 31;
      C2EMR2 at 16#D4# range 0 .. 31;
   end record;

   EXTI_Periph : aliased EXTI_Peripheral
     with Import, Address => System'To_Address (16#58000800#);

end Interfaces.STM32.EXTI;
