--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.I2C is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_PE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_TXIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_RXIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_ADDRIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_NACKIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_STOPIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_TCIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_ERRIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_DNF_Field is Interfaces.Bit_Types.UInt4;
   subtype CR1_ANFOFF_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_TXDMAEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_RXDMAEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_SBC_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_NOSTRETCH_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_WUPEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_GCEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_SMBHEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_SMBDEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_ALERTEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_PECEN_Field is Interfaces.Bit_Types.Bit;

   type CR1_Register is record
      PE             : CR1_PE_Field := 16#0#;
      TXIE           : CR1_TXIE_Field := 16#0#;
      RXIE           : CR1_RXIE_Field := 16#0#;
      ADDRIE         : CR1_ADDRIE_Field := 16#0#;
      NACKIE         : CR1_NACKIE_Field := 16#0#;
      STOPIE         : CR1_STOPIE_Field := 16#0#;
      TCIE           : CR1_TCIE_Field := 16#0#;
      ERRIE          : CR1_ERRIE_Field := 16#0#;
      DNF            : CR1_DNF_Field := 16#0#;
      ANFOFF         : CR1_ANFOFF_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.Bit_Types.Bit := 16#0#;
      TXDMAEN        : CR1_TXDMAEN_Field := 16#0#;
      RXDMAEN        : CR1_RXDMAEN_Field := 16#0#;
      SBC            : CR1_SBC_Field := 16#0#;
      NOSTRETCH      : CR1_NOSTRETCH_Field := 16#0#;
      WUPEN          : CR1_WUPEN_Field := 16#0#;
      GCEN           : CR1_GCEN_Field := 16#0#;
      SMBHEN         : CR1_SMBHEN_Field := 16#0#;
      SMBDEN         : CR1_SMBDEN_Field := 16#0#;
      ALERTEN        : CR1_ALERTEN_Field := 16#0#;
      PECEN          : CR1_PECEN_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      PE             at 0 range 0 .. 0;
      TXIE           at 0 range 1 .. 1;
      RXIE           at 0 range 2 .. 2;
      ADDRIE         at 0 range 3 .. 3;
      NACKIE         at 0 range 4 .. 4;
      STOPIE         at 0 range 5 .. 5;
      TCIE           at 0 range 6 .. 6;
      ERRIE          at 0 range 7 .. 7;
      DNF            at 0 range 8 .. 11;
      ANFOFF         at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      TXDMAEN        at 0 range 14 .. 14;
      RXDMAEN        at 0 range 15 .. 15;
      SBC            at 0 range 16 .. 16;
      NOSTRETCH      at 0 range 17 .. 17;
      WUPEN          at 0 range 18 .. 18;
      GCEN           at 0 range 19 .. 19;
      SMBHEN         at 0 range 20 .. 20;
      SMBDEN         at 0 range 21 .. 21;
      ALERTEN        at 0 range 22 .. 22;
      PECEN          at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CR2_SADD_Field is Interfaces.Bit_Types.UInt10;
   subtype CR2_RD_WRN_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_ADD10_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_HEAD10R_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_START_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_NACK_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_NBYTES_Field is Interfaces.Bit_Types.Byte;
   subtype CR2_RELOAD_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_AUTOEND_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_PECBYTE_Field is Interfaces.Bit_Types.Bit;

   type CR2_Register is record
      SADD           : CR2_SADD_Field := 16#0#;
      RD_WRN         : CR2_RD_WRN_Field := 16#0#;
      ADD10          : CR2_ADD10_Field := 16#0#;
      HEAD10R        : CR2_HEAD10R_Field := 16#0#;
      START          : CR2_START_Field := 16#0#;
      STOP           : CR2_STOP_Field := 16#0#;
      NACK           : CR2_NACK_Field := 16#0#;
      NBYTES         : CR2_NBYTES_Field := 16#0#;
      RELOAD         : CR2_RELOAD_Field := 16#0#;
      AUTOEND        : CR2_AUTOEND_Field := 16#0#;
      PECBYTE        : CR2_PECBYTE_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : Interfaces.Bit_Types.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      SADD           at 0 range 0 .. 9;
      RD_WRN         at 0 range 10 .. 10;
      ADD10          at 0 range 11 .. 11;
      HEAD10R        at 0 range 12 .. 12;
      START          at 0 range 13 .. 13;
      STOP           at 0 range 14 .. 14;
      NACK           at 0 range 15 .. 15;
      NBYTES         at 0 range 16 .. 23;
      RELOAD         at 0 range 24 .. 24;
      AUTOEND        at 0 range 25 .. 25;
      PECBYTE        at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype OAR1_OA1_Field is Interfaces.Bit_Types.UInt10;
   subtype OAR1_OA1MODE_Field is Interfaces.Bit_Types.Bit;
   subtype OAR1_OA1EN_Field is Interfaces.Bit_Types.Bit;

   type OAR1_Register is record
      OA1            : OAR1_OA1_Field := 16#0#;
      OA1MODE        : OAR1_OA1MODE_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : Interfaces.Bit_Types.UInt4 := 16#0#;
      OA1EN          : OAR1_OA1EN_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OAR1_Register use record
      OA1            at 0 range 0 .. 9;
      OA1MODE        at 0 range 10 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      OA1EN          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype OAR2_OA2_Field is Interfaces.Bit_Types.UInt7;
   subtype OAR2_OA2MSK_Field is Interfaces.Bit_Types.UInt3;
   subtype OAR2_OA2EN_Field is Interfaces.Bit_Types.Bit;

   type OAR2_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      OA2            : OAR2_OA2_Field := 16#0#;
      OA2MSK         : OAR2_OA2MSK_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : Interfaces.Bit_Types.UInt4 := 16#0#;
      OA2EN          : OAR2_OA2EN_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OAR2_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      OA2            at 0 range 1 .. 7;
      OA2MSK         at 0 range 8 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      OA2EN          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TIMINGR_SCLL_Field is Interfaces.Bit_Types.Byte;
   subtype TIMINGR_SCLH_Field is Interfaces.Bit_Types.Byte;
   subtype TIMINGR_SDADEL_Field is Interfaces.Bit_Types.UInt4;
   subtype TIMINGR_SCLDEL_Field is Interfaces.Bit_Types.UInt4;
   subtype TIMINGR_PRESC_Field is Interfaces.Bit_Types.UInt4;

   type TIMINGR_Register is record
      SCLL           : TIMINGR_SCLL_Field := 16#0#;
      SCLH           : TIMINGR_SCLH_Field := 16#0#;
      SDADEL         : TIMINGR_SDADEL_Field := 16#0#;
      SCLDEL         : TIMINGR_SCLDEL_Field := 16#0#;
      --  unspecified
      Reserved_24_27 : Interfaces.Bit_Types.UInt4 := 16#0#;
      PRESC          : TIMINGR_PRESC_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMINGR_Register use record
      SCLL           at 0 range 0 .. 7;
      SCLH           at 0 range 8 .. 15;
      SDADEL         at 0 range 16 .. 19;
      SCLDEL         at 0 range 20 .. 23;
      Reserved_24_27 at 0 range 24 .. 27;
      PRESC          at 0 range 28 .. 31;
   end record;

   subtype TIMEOUTR_TIMEOUTA_Field is Interfaces.Bit_Types.UInt12;
   subtype TIMEOUTR_TIDLE_Field is Interfaces.Bit_Types.Bit;
   subtype TIMEOUTR_TIMOUTEN_Field is Interfaces.Bit_Types.Bit;
   subtype TIMEOUTR_TIMEOUTB_Field is Interfaces.Bit_Types.UInt12;
   subtype TIMEOUTR_TEXTEN_Field is Interfaces.Bit_Types.Bit;

   type TIMEOUTR_Register is record
      TIMEOUTA       : TIMEOUTR_TIMEOUTA_Field := 16#0#;
      TIDLE          : TIMEOUTR_TIDLE_Field := 16#0#;
      --  unspecified
      Reserved_13_14 : Interfaces.Bit_Types.UInt2 := 16#0#;
      TIMOUTEN       : TIMEOUTR_TIMOUTEN_Field := 16#0#;
      TIMEOUTB       : TIMEOUTR_TIMEOUTB_Field := 16#0#;
      --  unspecified
      Reserved_28_30 : Interfaces.Bit_Types.UInt3 := 16#0#;
      TEXTEN         : TIMEOUTR_TEXTEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMEOUTR_Register use record
      TIMEOUTA       at 0 range 0 .. 11;
      TIDLE          at 0 range 12 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      TIMOUTEN       at 0 range 15 .. 15;
      TIMEOUTB       at 0 range 16 .. 27;
      Reserved_28_30 at 0 range 28 .. 30;
      TEXTEN         at 0 range 31 .. 31;
   end record;

   subtype ISR_TXE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TXIS_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_RXNE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ADDR_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_NACKF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_STOPF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TC_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TCR_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_BERR_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ARLO_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_OVR_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_PECERR_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TIMEOUT_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ALERT_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_BUSY_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_DIR_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ADDCODE_Field is Interfaces.Bit_Types.UInt7;

   type ISR_Register is record
      TXE            : ISR_TXE_Field := 16#0#;
      TXIS           : ISR_TXIS_Field := 16#0#;
      RXNE           : ISR_RXNE_Field := 16#0#;
      ADDR           : ISR_ADDR_Field := 16#0#;
      NACKF          : ISR_NACKF_Field := 16#0#;
      STOPF          : ISR_STOPF_Field := 16#0#;
      TC             : ISR_TC_Field := 16#0#;
      TCR            : ISR_TCR_Field := 16#0#;
      BERR           : ISR_BERR_Field := 16#0#;
      ARLO           : ISR_ARLO_Field := 16#0#;
      OVR            : ISR_OVR_Field := 16#0#;
      PECERR         : ISR_PECERR_Field := 16#0#;
      TIMEOUT        : ISR_TIMEOUT_Field := 16#0#;
      ALERT          : ISR_ALERT_Field := 16#0#;
      --  unspecified
      Reserved_14_14 : Interfaces.Bit_Types.Bit := 16#0#;
      BUSY           : ISR_BUSY_Field := 16#0#;
      DIR            : ISR_DIR_Field := 16#0#;
      ADDCODE        : ISR_ADDCODE_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      TXE            at 0 range 0 .. 0;
      TXIS           at 0 range 1 .. 1;
      RXNE           at 0 range 2 .. 2;
      ADDR           at 0 range 3 .. 3;
      NACKF          at 0 range 4 .. 4;
      STOPF          at 0 range 5 .. 5;
      TC             at 0 range 6 .. 6;
      TCR            at 0 range 7 .. 7;
      BERR           at 0 range 8 .. 8;
      ARLO           at 0 range 9 .. 9;
      OVR            at 0 range 10 .. 10;
      PECERR         at 0 range 11 .. 11;
      TIMEOUT        at 0 range 12 .. 12;
      ALERT          at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      BUSY           at 0 range 15 .. 15;
      DIR            at 0 range 16 .. 16;
      ADDCODE        at 0 range 17 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype ICR_ADDRCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_NACKCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_STOPCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_BERRCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_ARLOCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_OVRCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_PECCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_TIMOUTCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_ALERTCF_Field is Interfaces.Bit_Types.Bit;

   type ICR_Register is record
      --  unspecified
      Reserved_0_2   : Interfaces.Bit_Types.UInt3 := 16#0#;
      ADDRCF         : ICR_ADDRCF_Field := 16#0#;
      NACKCF         : ICR_NACKCF_Field := 16#0#;
      STOPCF         : ICR_STOPCF_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      BERRCF         : ICR_BERRCF_Field := 16#0#;
      ARLOCF         : ICR_ARLOCF_Field := 16#0#;
      OVRCF          : ICR_OVRCF_Field := 16#0#;
      PECCF          : ICR_PECCF_Field := 16#0#;
      TIMOUTCF       : ICR_TIMOUTCF_Field := 16#0#;
      ALERTCF        : ICR_ALERTCF_Field := 16#0#;
      --  unspecified
      Reserved_14_31 : Interfaces.Bit_Types.UInt18 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      ADDRCF         at 0 range 3 .. 3;
      NACKCF         at 0 range 4 .. 4;
      STOPCF         at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      BERRCF         at 0 range 8 .. 8;
      ARLOCF         at 0 range 9 .. 9;
      OVRCF          at 0 range 10 .. 10;
      PECCF          at 0 range 11 .. 11;
      TIMOUTCF       at 0 range 12 .. 12;
      ALERTCF        at 0 range 13 .. 13;
      Reserved_14_31 at 0 range 14 .. 31;
   end record;

   subtype PECR_PEC_Field is Interfaces.Bit_Types.Byte;

   type PECR_Register is record
      PEC           : PECR_PEC_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PECR_Register use record
      PEC           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RXDR_RXDATA_Field is Interfaces.Bit_Types.Byte;

   type RXDR_Register is record
      RXDATA        : RXDR_RXDATA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXDR_Register use record
      RXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TXDR_TXDATA_Field is Interfaces.Bit_Types.Byte;

   type TXDR_Register is record
      TXDATA        : TXDR_TXDATA_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXDR_Register use record
      TXDATA        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type I2C_Peripheral is record
      CR1      : aliased CR1_Register;
      CR2      : aliased CR2_Register;
      OAR1     : aliased OAR1_Register;
      OAR2     : aliased OAR2_Register;
      TIMINGR  : aliased TIMINGR_Register;
      TIMEOUTR : aliased TIMEOUTR_Register;
      ISR      : aliased ISR_Register;
      ICR      : aliased ICR_Register;
      PECR     : aliased PECR_Register;
      RXDR     : aliased RXDR_Register;
      TXDR     : aliased TXDR_Register;
   end record
     with Volatile;

   for I2C_Peripheral use record
      CR1      at 16#0# range 0 .. 31;
      CR2      at 16#4# range 0 .. 31;
      OAR1     at 16#8# range 0 .. 31;
      OAR2     at 16#C# range 0 .. 31;
      TIMINGR  at 16#10# range 0 .. 31;
      TIMEOUTR at 16#14# range 0 .. 31;
      ISR      at 16#18# range 0 .. 31;
      ICR      at 16#1C# range 0 .. 31;
      PECR     at 16#20# range 0 .. 31;
      RXDR     at 16#24# range 0 .. 31;
      TXDR     at 16#28# range 0 .. 31;
   end record;

   I2C1_Periph : aliased I2C_Peripheral
     with Import, Address => System'To_Address (16#40005400#);

   I2C3_Periph : aliased I2C_Peripheral
     with Import, Address => System'To_Address (16#40005C00#);

end Interfaces.STM32.I2C;
