--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.AES is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR_EN_Field is Interfaces.Bit_Types.Bit;
   subtype CR_DATATYPE_Field is Interfaces.Bit_Types.UInt2;
   subtype CR_MODE_Field is Interfaces.Bit_Types.UInt2;
   subtype CR_CHMOD_Field is Interfaces.Bit_Types.UInt2;
   subtype CR_CCFC_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ERRC_Field is Interfaces.Bit_Types.Bit;
   subtype CR_CCFIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ERRIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_DMAINEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR_DMAOUTEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR_GCMPH_Field is Interfaces.Bit_Types.UInt2;
   subtype CR_CHMOD_Field_1 is Interfaces.Bit_Types.Bit;
   subtype CR_KEYSIZE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_NPBLB_Field is Interfaces.Bit_Types.UInt4;

   type CR_Register is record
      EN             : CR_EN_Field := 16#0#;
      DATATYPE       : CR_DATATYPE_Field := 16#0#;
      MODE           : CR_MODE_Field := 16#0#;
      CHMOD          : CR_CHMOD_Field := 16#0#;
      CCFC           : CR_CCFC_Field := 16#0#;
      ERRC           : CR_ERRC_Field := 16#0#;
      CCFIE          : CR_CCFIE_Field := 16#0#;
      ERRIE          : CR_ERRIE_Field := 16#0#;
      DMAINEN        : CR_DMAINEN_Field := 16#0#;
      DMAOUTEN       : CR_DMAOUTEN_Field := 16#0#;
      GCMPH          : CR_GCMPH_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      CHMOD_1        : CR_CHMOD_Field_1 := 16#0#;
      --  unspecified
      Reserved_17_17 : Interfaces.Bit_Types.Bit := 16#0#;
      KEYSIZE        : CR_KEYSIZE_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : Interfaces.Bit_Types.Bit := 16#0#;
      NPBLB          : CR_NPBLB_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      EN             at 0 range 0 .. 0;
      DATATYPE       at 0 range 1 .. 2;
      MODE           at 0 range 3 .. 4;
      CHMOD          at 0 range 5 .. 6;
      CCFC           at 0 range 7 .. 7;
      ERRC           at 0 range 8 .. 8;
      CCFIE          at 0 range 9 .. 9;
      ERRIE          at 0 range 10 .. 10;
      DMAINEN        at 0 range 11 .. 11;
      DMAOUTEN       at 0 range 12 .. 12;
      GCMPH          at 0 range 13 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      CHMOD_1        at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      KEYSIZE        at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      NPBLB          at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SR_CCF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_RDERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_WRERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_BUSY_Field is Interfaces.Bit_Types.Bit;

   type SR_Register is record
      CCF           : SR_CCF_Field := 16#0#;
      RDERR         : SR_RDERR_Field := 16#0#;
      WRERR         : SR_WRERR_Field := 16#0#;
      BUSY          : SR_BUSY_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      CCF           at 0 range 0 .. 0;
      RDERR         at 0 range 1 .. 1;
      WRERR         at 0 range 2 .. 2;
      BUSY          at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type AES_Peripheral is record
      CR     : aliased CR_Register;
      SR     : aliased SR_Register;
      DINR   : aliased Interfaces.Bit_Types.Word;
      DOUTR  : aliased Interfaces.Bit_Types.Word;
      KEYR0  : aliased Interfaces.Bit_Types.Word;
      KEYR1  : aliased Interfaces.Bit_Types.Word;
      KEYR2  : aliased Interfaces.Bit_Types.Word;
      KEYR3  : aliased Interfaces.Bit_Types.Word;
      IVR0   : aliased Interfaces.Bit_Types.Word;
      IVR1   : aliased Interfaces.Bit_Types.Word;
      IVR2   : aliased Interfaces.Bit_Types.Word;
      IVR3   : aliased Interfaces.Bit_Types.Word;
      KEYR4  : aliased Interfaces.Bit_Types.Word;
      KEYR5  : aliased Interfaces.Bit_Types.Word;
      KEYR6  : aliased Interfaces.Bit_Types.Word;
      KEYR7  : aliased Interfaces.Bit_Types.Word;
      SUSP0R : aliased Interfaces.Bit_Types.Word;
      SUSP1R : aliased Interfaces.Bit_Types.Word;
      SUSP2R : aliased Interfaces.Bit_Types.Word;
      SUSP3R : aliased Interfaces.Bit_Types.Word;
      SUSP4R : aliased Interfaces.Bit_Types.Word;
      SUSP5R : aliased Interfaces.Bit_Types.Word;
      SUSP6R : aliased Interfaces.Bit_Types.Word;
      SUSP7R : aliased Interfaces.Bit_Types.Word;
   end record
     with Volatile;

   for AES_Peripheral use record
      CR     at 16#0# range 0 .. 31;
      SR     at 16#4# range 0 .. 31;
      DINR   at 16#8# range 0 .. 31;
      DOUTR  at 16#C# range 0 .. 31;
      KEYR0  at 16#10# range 0 .. 31;
      KEYR1  at 16#14# range 0 .. 31;
      KEYR2  at 16#18# range 0 .. 31;
      KEYR3  at 16#1C# range 0 .. 31;
      IVR0   at 16#20# range 0 .. 31;
      IVR1   at 16#24# range 0 .. 31;
      IVR2   at 16#28# range 0 .. 31;
      IVR3   at 16#2C# range 0 .. 31;
      KEYR4  at 16#30# range 0 .. 31;
      KEYR5  at 16#34# range 0 .. 31;
      KEYR6  at 16#38# range 0 .. 31;
      KEYR7  at 16#3C# range 0 .. 31;
      SUSP0R at 16#40# range 0 .. 31;
      SUSP1R at 16#44# range 0 .. 31;
      SUSP2R at 16#48# range 0 .. 31;
      SUSP3R at 16#4C# range 0 .. 31;
      SUSP4R at 16#50# range 0 .. 31;
      SUSP5R at 16#54# range 0 .. 31;
      SUSP6R at 16#58# range 0 .. 31;
      SUSP7R at 16#5C# range 0 .. 31;
   end record;

   AES1_Periph : aliased AES_Peripheral
     with Import, Address => System'To_Address (16#50050400#);

   AES2_Periph : aliased AES_Peripheral
     with Import, Address => System'To_Address (16#58001800#);

end Interfaces.STM32.AES;
