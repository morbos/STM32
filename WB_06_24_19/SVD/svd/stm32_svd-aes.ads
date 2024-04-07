--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.AES is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_DATATYPE_Field is HAL.UInt2;
   subtype CR_MODE_Field is HAL.UInt2;
   subtype CR_CHMOD_Field is HAL.UInt2;
   subtype CR_GCMPH_Field is HAL.UInt2;
   subtype CR_NPBLB_Field is HAL.UInt4;

   type CR_Register is record
      EN             : Boolean := False;
      DATATYPE       : CR_DATATYPE_Field := 16#0#;
      MODE           : CR_MODE_Field := 16#0#;
      CHMOD          : CR_CHMOD_Field := 16#0#;
      CCFC           : Boolean := False;
      ERRC           : Boolean := False;
      CCFIE          : Boolean := False;
      ERRIE          : Boolean := False;
      DMAINEN        : Boolean := False;
      DMAOUTEN       : Boolean := False;
      GCMPH          : CR_GCMPH_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      CHMOD_1        : Boolean := False;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      KEYSIZE        : Boolean := False;
      --  unspecified
      Reserved_19_19 : HAL.Bit := 16#0#;
      NPBLB          : CR_NPBLB_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
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

   type SR_Register is record
      CCF           : Boolean := False;
      RDERR         : Boolean := False;
      WRERR         : Boolean := False;
      BUSY          : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
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
      DINR   : aliased HAL.UInt32;
      DOUTR  : aliased HAL.UInt32;
      KEYR0  : aliased HAL.UInt32;
      KEYR1  : aliased HAL.UInt32;
      KEYR2  : aliased HAL.UInt32;
      KEYR3  : aliased HAL.UInt32;
      IVR0   : aliased HAL.UInt32;
      IVR1   : aliased HAL.UInt32;
      IVR2   : aliased HAL.UInt32;
      IVR3   : aliased HAL.UInt32;
      KEYR4  : aliased HAL.UInt32;
      KEYR5  : aliased HAL.UInt32;
      KEYR6  : aliased HAL.UInt32;
      KEYR7  : aliased HAL.UInt32;
      SUSP0R : aliased HAL.UInt32;
      SUSP1R : aliased HAL.UInt32;
      SUSP2R : aliased HAL.UInt32;
      SUSP3R : aliased HAL.UInt32;
      SUSP4R : aliased HAL.UInt32;
      SUSP5R : aliased HAL.UInt32;
      SUSP6R : aliased HAL.UInt32;
      SUSP7R : aliased HAL.UInt32;
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

end STM32_SVD.AES;
