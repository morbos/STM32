--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.SPI is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_CPHA_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_CPOL_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_MSTR_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_BR_Field is Interfaces.Bit_Types.UInt3;
   subtype CR1_SPE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_LSBFIRST_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_SSI_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_SSM_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_RXONLY_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_CRCL_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_CRCNEXT_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_CRCEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_BIDIOE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_BIDIMODE_Field is Interfaces.Bit_Types.Bit;

   type CR1_Register is record
      CPHA           : CR1_CPHA_Field := 16#0#;
      CPOL           : CR1_CPOL_Field := 16#0#;
      MSTR           : CR1_MSTR_Field := 16#0#;
      BR             : CR1_BR_Field := 16#0#;
      SPE            : CR1_SPE_Field := 16#0#;
      LSBFIRST       : CR1_LSBFIRST_Field := 16#0#;
      SSI            : CR1_SSI_Field := 16#0#;
      SSM            : CR1_SSM_Field := 16#0#;
      RXONLY         : CR1_RXONLY_Field := 16#0#;
      CRCL           : CR1_CRCL_Field := 16#0#;
      CRCNEXT        : CR1_CRCNEXT_Field := 16#0#;
      CRCEN          : CR1_CRCEN_Field := 16#0#;
      BIDIOE         : CR1_BIDIOE_Field := 16#0#;
      BIDIMODE       : CR1_BIDIMODE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
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

   subtype CR2_RXDMAEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_TXDMAEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_SSOE_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_NSSP_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_FRF_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_ERRIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_RXNEIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_TXEIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_DS_Field is Interfaces.Bit_Types.UInt4;
   subtype CR2_FRXTH_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_LDMA_RX_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_LDMA_TX_Field is Interfaces.Bit_Types.Bit;

   type CR2_Register is record
      RXDMAEN        : CR2_RXDMAEN_Field := 16#0#;
      TXDMAEN        : CR2_TXDMAEN_Field := 16#0#;
      SSOE           : CR2_SSOE_Field := 16#0#;
      NSSP           : CR2_NSSP_Field := 16#0#;
      FRF            : CR2_FRF_Field := 16#0#;
      ERRIE          : CR2_ERRIE_Field := 16#0#;
      RXNEIE         : CR2_RXNEIE_Field := 16#0#;
      TXEIE          : CR2_TXEIE_Field := 16#0#;
      DS             : CR2_DS_Field := 16#0#;
      FRXTH          : CR2_FRXTH_Field := 16#0#;
      LDMA_RX        : CR2_LDMA_RX_Field := 16#0#;
      LDMA_TX        : CR2_LDMA_TX_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.Bit_Types.UInt17 := 16#0#;
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

   subtype SR_RXNE_Field is Interfaces.Bit_Types.Bit;
   subtype SR_TXE_Field is Interfaces.Bit_Types.Bit;
   subtype SR_CRCERR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_MODF_Field is Interfaces.Bit_Types.Bit;
   subtype SR_OVR_Field is Interfaces.Bit_Types.Bit;
   subtype SR_BSY_Field is Interfaces.Bit_Types.Bit;
   subtype SR_FRE_Field is Interfaces.Bit_Types.Bit;
   subtype SR_FRLVL_Field is Interfaces.Bit_Types.UInt2;
   subtype SR_FTLVL_Field is Interfaces.Bit_Types.UInt2;

   type SR_Register is record
      --  unspecified
      Reserved_0_1   : Interfaces.Bit_Types.UInt2 := 16#0#;
      RXNE           : SR_RXNE_Field := 16#0#;
      TXE            : SR_TXE_Field := 16#0#;
      CRCERR         : SR_CRCERR_Field := 16#0#;
      MODF           : SR_MODF_Field := 16#0#;
      OVR            : SR_OVR_Field := 16#0#;
      BSY            : SR_BSY_Field := 16#0#;
      FRE            : SR_FRE_Field := 16#0#;
      FRLVL          : SR_FRLVL_Field := 16#0#;
      FTLVL          : SR_FTLVL_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : Interfaces.Bit_Types.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      RXNE           at 0 range 2 .. 2;
      TXE            at 0 range 3 .. 3;
      CRCERR         at 0 range 4 .. 4;
      MODF           at 0 range 5 .. 5;
      OVR            at 0 range 6 .. 6;
      BSY            at 0 range 7 .. 7;
      FRE            at 0 range 8 .. 8;
      FRLVL          at 0 range 9 .. 10;
      FTLVL          at 0 range 11 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype DR_DR_Field is Interfaces.Bit_Types.Short;

   type DR_Register is record
      DR             : DR_DR_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DR             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CRCPR_CRCPOLY_Field is Interfaces.Bit_Types.Short;

   type CRCPR_Register is record
      CRCPOLY        : CRCPR_CRCPOLY_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CRCPR_Register use record
      CRCPOLY        at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RXCRCR_RXCRC_Field is Interfaces.Bit_Types.Short;

   type RXCRCR_Register is record
      RXCRC          : RXCRCR_RXCRC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXCRCR_Register use record
      RXCRC          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TXCRCR_TXCRC_Field is Interfaces.Bit_Types.Short;

   type TXCRCR_Register is record
      TXCRC          : TXCRCR_TXCRC_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
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

end Interfaces.STM32.SPI;
