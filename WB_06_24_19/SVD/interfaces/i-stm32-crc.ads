--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.CRC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR_RESET_Field is Interfaces.Bit_Types.Bit;
   subtype CR_POLYSIZE_Field is Interfaces.Bit_Types.UInt2;
   subtype CR_REV_IN_Field is Interfaces.Bit_Types.UInt2;
   subtype CR_REV_OUT_Field is Interfaces.Bit_Types.Bit;

   type CR_Register is record
      RESET         : CR_RESET_Field := 16#0#;
      --  unspecified
      Reserved_1_2  : Interfaces.Bit_Types.UInt2 := 16#0#;
      POLYSIZE      : CR_POLYSIZE_Field := 16#0#;
      REV_IN        : CR_REV_IN_Field := 16#0#;
      REV_OUT       : CR_REV_OUT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      RESET         at 0 range 0 .. 0;
      Reserved_1_2  at 0 range 1 .. 2;
      POLYSIZE      at 0 range 3 .. 4;
      REV_IN        at 0 range 5 .. 6;
      REV_OUT       at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type CRC_Peripheral is record
      DR   : aliased Interfaces.Bit_Types.Word;
      IDR  : aliased Interfaces.Bit_Types.Word;
      CR   : aliased CR_Register;
      INIT : aliased Interfaces.Bit_Types.Word;
      POL  : aliased Interfaces.Bit_Types.Word;
   end record
     with Volatile;

   for CRC_Peripheral use record
      DR   at 16#0# range 0 .. 31;
      IDR  at 16#4# range 0 .. 31;
      CR   at 16#8# range 0 .. 31;
      INIT at 16#10# range 0 .. 31;
      POL  at 16#14# range 0 .. 31;
   end record;

   CRC_Periph : aliased CRC_Peripheral
     with Import, Address => System'To_Address (16#40023000#);

end Interfaces.STM32.CRC;
