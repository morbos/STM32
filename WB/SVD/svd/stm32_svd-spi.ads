--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.SPI is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_BR_Field is HAL.UInt3;

   type CR1_Register is record
      CPHA           : Boolean := False;
      CPOL           : Boolean := False;
      MSTR           : Boolean := False;
      BR             : CR1_BR_Field := 16#0#;
      SPE            : Boolean := False;
      LSBFIRST       : Boolean := False;
      SSI            : Boolean := False;
      SSM            : Boolean := False;
      RXONLY         : Boolean := False;
      CRCL           : Boolean := False;
      CRCNEXT        : Boolean := False;
      CRCEN          : Boolean := False;
      BIDIOE         : Boolean := False;
      BIDIMODE       : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      CPHA           at 0 range 0 .. 0;
      CPOL           at 0 range 1 .. 1;
      MSTR           at 0 range 2 .. 2;
      BR             at 0 range 3 .. 5;
      SPE            at 0 range 6 .. 6;
      LSBFIRST       at 0 range 7 .. 7;
      SSI            at 0 range 8 .. 8;
      SSM            at 0 range 9 .. 9;
      RXONLY         at 0 range 10 .. 10;
      CRCL           at 0 range 11 .. 11;
      CRCNEXT        at 0 range 12 .. 12;
      CRCEN          at 0 range 13 .. 13;
      BIDIOE         at 0 range 14 .. 14;
      BIDIMODE       at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CR2_DS_Field is HAL.UInt4;

   type CR2_Register is record
      RXDMAEN        : Boolean := False;
      TXDMAEN        : Boolean := False;
      SSOE           : Boolean := False;
      NSSP           : Boolean := False;
      FRF            : Boolean := False;
      ERRIE          : Boolean := False;
      RXNEIE         : Boolean := False;
      TXEIE          : Boolean := False;
      DS             : CR2_DS_Field := 16#0#;
      FRXTH          : Boolean := False;
      LDMA_RX        : Boolean := False;
      LDMA_TX        : Boolean := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      RXDMAEN        at 0 range 0 .. 0;
      TXDMAEN        at 0 range 1 .. 1;
      SSOE           at 0 range 2 .. 2;
      NSSP           at 0 range 3 .. 3;
      FRF            at 0 range 4 .. 4;
      ERRIE          at 0 range 5 .. 5;
      RXNEIE         at 0 range 6 .. 6;
      TXEIE          at 0 range 7 .. 7;
      DS             at 0 range 8 .. 11;
      FRXTH          at 0 range 12 .. 12;
      LDMA_RX        at 0 range 13 .. 13;
      LDMA_TX        at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype SR_FRLVL_Field is HAL.UInt2;
   subtype SR_FTLVL_Field is HAL.UInt2;

   type SR_Register is record
      RXNE           : Boolean := False;
      TXE            : Boolean := False;
      --  unspecified
      Reserved_2_3   : HAL.UInt2 := 16#0#;
      CRCERR         : Boolean := False;
      MODF           : Boolean := False;
      OVR            : Boolean := False;
      BSY            : Boolean := False;
      FRE            : Boolean := False;
      FRLVL          : SR_FRLVL_Field := 16#0#;
      FTLVL          : SR_FTLVL_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : HAL.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      RXNE           at 0 range 0 .. 0;
      TXE            at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      CRCERR         at 0 range 4 .. 4;
      MODF           at 0 range 5 .. 5;
      OVR            at 0 range 6 .. 6;
      BSY            at 0 range 7 .. 7;
      FRE            at 0 range 8 .. 8;
      FRLVL          at 0 range 9 .. 10;
      FTLVL          at 0 range 11 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype DR_DR_Field is HAL.UInt16;

   type DR_Register is record
      DR             : DR_DR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DR             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CRCPR_CRCPOLY_Field is HAL.UInt16;

   type CRCPR_Register is record
      CRCPOLY        : CRCPR_CRCPOLY_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRCPR_Register use record
      CRCPOLY        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RXCRCR_RXCRC_Field is HAL.UInt16;

   type RXCRCR_Register is record
      RXCRC          : RXCRCR_RXCRC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXCRCR_Register use record
      RXCRC          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TXCRCR_TXCRC_Field is HAL.UInt16;

   type TXCRCR_Register is record
      TXCRC          : TXCRCR_TXCRC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXCRCR_Register use record
      TXCRC          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SPI_Peripheral is record
      CR1    : aliased CR1_Register;
      CR2    : aliased CR2_Register;
      SR     : aliased SR_Register;
      DR     : aliased DR_Register;
      CRCPR  : aliased CRCPR_Register;
      RXCRCR : aliased RXCRCR_Register;
      TXCRCR : aliased TXCRCR_Register;
   end record
     with Volatile;

   for SPI_Peripheral use record
      CR1    at 16#0# range 0 .. 31;
      CR2    at 16#4# range 0 .. 31;
      SR     at 16#8# range 0 .. 31;
      DR     at 16#C# range 0 .. 31;
      CRCPR  at 16#10# range 0 .. 31;
      RXCRCR at 16#14# range 0 .. 31;
      TXCRCR at 16#18# range 0 .. 31;
   end record;

   SPI1_Periph : aliased SPI_Peripheral
     with Import, Address => System'To_Address (16#40013000#);

   SPI2_Periph : aliased SPI_Peripheral
     with Import, Address => System'To_Address (16#40003800#);

end STM32_SVD.SPI;
