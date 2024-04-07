--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.IWDG is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype KR_KEY_Field is Interfaces.Bit_Types.Short;

   type KR_Register is record
      KEY            : KR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for KR_Register use record
      KEY            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype PR_PR_Field is Interfaces.Bit_Types.UInt3;

   type PR_Register is record
      PR            : PR_PR_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : Interfaces.Bit_Types.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PR_Register use record
      PR            at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype RLR_RL_Field is Interfaces.Bit_Types.UInt12;

   type RLR_Register is record
      RL             : RLR_RL_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RLR_Register use record
      RL             at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype SR_PVU_Field is Interfaces.Bit_Types.Bit;
   subtype SR_RVU_Field is Interfaces.Bit_Types.Bit;
   subtype SR_WVU_Field is Interfaces.Bit_Types.Bit;

   type SR_Register is record
      PVU           : SR_PVU_Field := 16#0#;
      RVU           : SR_RVU_Field := 16#0#;
      WVU           : SR_WVU_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : Interfaces.Bit_Types.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      PVU           at 0 range 0 .. 0;
      RVU           at 0 range 1 .. 1;
      WVU           at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype WINR_WIN_Field is Interfaces.Bit_Types.UInt12;

   type WINR_Register is record
      WIN            : WINR_WIN_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : Interfaces.Bit_Types.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WINR_Register use record
      WIN            at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type IWDG_Peripheral is record
      KR   : aliased KR_Register;
      PR   : aliased PR_Register;
      RLR  : aliased RLR_Register;
      SR   : aliased SR_Register;
      WINR : aliased WINR_Register;
   end record
     with Volatile;

   for IWDG_Peripheral use record
      KR   at 16#0# range 0 .. 31;
      PR   at 16#4# range 0 .. 31;
      RLR  at 16#8# range 0 .. 31;
      SR   at 16#C# range 0 .. 31;
      WINR at 16#10# range 0 .. 31;
   end record;

   IWDG_Periph : aliased IWDG_Peripheral
     with Import, Address => System'To_Address (16#40003000#);

end Interfaces.STM32.IWDG;
