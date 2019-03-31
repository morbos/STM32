--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.USART1 is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_DEDT_Field is HAL.UInt5;
   subtype CR1_DEAT_Field is HAL.UInt5;

   type CR1_Register is record
      UE      : Boolean := False;
      UESM    : Boolean := False;
      RE      : Boolean := False;
      TE      : Boolean := False;
      IDLEIE  : Boolean := False;
      RXFNEIE : Boolean := False;
      TCIE    : Boolean := False;
      TXFNFIE : Boolean := False;
      PEIE    : Boolean := False;
      PS      : Boolean := False;
      PCE     : Boolean := False;
      WAKE    : Boolean := False;
      M0      : Boolean := False;
      MME     : Boolean := False;
      CMIE    : Boolean := False;
      OVER8   : Boolean := False;
      DEDT    : CR1_DEDT_Field := 16#0#;
      DEAT    : CR1_DEAT_Field := 16#0#;
      RTOIE   : Boolean := False;
      EOBIE   : Boolean := False;
      M1      : Boolean := False;
      FIFOEN  : Boolean := False;
      TXFEIE  : Boolean := False;
      RXFFIE  : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      UE      at 0 range 0 .. 0;
      UESM    at 0 range 1 .. 1;
      RE      at 0 range 2 .. 2;
      TE      at 0 range 3 .. 3;
      IDLEIE  at 0 range 4 .. 4;
      RXFNEIE at 0 range 5 .. 5;
      TCIE    at 0 range 6 .. 6;
      TXFNFIE at 0 range 7 .. 7;
      PEIE    at 0 range 8 .. 8;
      PS      at 0 range 9 .. 9;
      PCE     at 0 range 10 .. 10;
      WAKE    at 0 range 11 .. 11;
      M0      at 0 range 12 .. 12;
      MME     at 0 range 13 .. 13;
      CMIE    at 0 range 14 .. 14;
      OVER8   at 0 range 15 .. 15;
      DEDT    at 0 range 16 .. 20;
      DEAT    at 0 range 21 .. 25;
      RTOIE   at 0 range 26 .. 26;
      EOBIE   at 0 range 27 .. 27;
      M1      at 0 range 28 .. 28;
      FIFOEN  at 0 range 29 .. 29;
      TXFEIE  at 0 range 30 .. 30;
      RXFFIE  at 0 range 31 .. 31;
   end record;

   subtype CR2_STOP_Field is HAL.UInt2;
   subtype CR2_ABRMOD_Field is HAL.UInt2;
   subtype CR2_ADD_Field is HAL.UInt8;

   type CR2_Register is record
      SLVEN        : Boolean := False;
      --  unspecified
      Reserved_1_2 : HAL.UInt2 := 16#0#;
      DIS_NSS      : Boolean := False;
      ADDM7        : Boolean := False;
      LBDL         : Boolean := False;
      LBDIE        : Boolean := False;
      --  unspecified
      Reserved_7_7 : HAL.Bit := 16#0#;
      LBCL         : Boolean := False;
      CPHA         : Boolean := False;
      CPOL         : Boolean := False;
      CLKEN        : Boolean := False;
      STOP         : CR2_STOP_Field := 16#0#;
      LINEN        : Boolean := False;
      SWAP         : Boolean := False;
      RXINV        : Boolean := False;
      TXINV        : Boolean := False;
      DATAINV      : Boolean := False;
      MSBFIRST     : Boolean := False;
      ABREN        : Boolean := False;
      ABRMOD       : CR2_ABRMOD_Field := 16#0#;
      RTOEN        : Boolean := False;
      ADD          : CR2_ADD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      SLVEN        at 0 range 0 .. 0;
      Reserved_1_2 at 0 range 1 .. 2;
      DIS_NSS      at 0 range 3 .. 3;
      ADDM7        at 0 range 4 .. 4;
      LBDL         at 0 range 5 .. 5;
      LBDIE        at 0 range 6 .. 6;
      Reserved_7_7 at 0 range 7 .. 7;
      LBCL         at 0 range 8 .. 8;
      CPHA         at 0 range 9 .. 9;
      CPOL         at 0 range 10 .. 10;
      CLKEN        at 0 range 11 .. 11;
      STOP         at 0 range 12 .. 13;
      LINEN        at 0 range 14 .. 14;
      SWAP         at 0 range 15 .. 15;
      RXINV        at 0 range 16 .. 16;
      TXINV        at 0 range 17 .. 17;
      DATAINV      at 0 range 18 .. 18;
      MSBFIRST     at 0 range 19 .. 19;
      ABREN        at 0 range 20 .. 20;
      ABRMOD       at 0 range 21 .. 22;
      RTOEN        at 0 range 23 .. 23;
      ADD          at 0 range 24 .. 31;
   end record;

   subtype CR3_SCARCNT_Field is HAL.UInt3;
   subtype CR3_WUS_Field is HAL.UInt2;
   subtype CR3_RXFTCFG_Field is HAL.UInt3;
   subtype CR3_TXFTCFG_Field is HAL.UInt3;

   type CR3_Register is record
      EIE            : Boolean := False;
      IREN           : Boolean := False;
      IRLP           : Boolean := False;
      HDSEL          : Boolean := False;
      NACK           : Boolean := False;
      SCEN           : Boolean := False;
      DMAR           : Boolean := False;
      DMAT           : Boolean := False;
      RTSE           : Boolean := False;
      CTSE           : Boolean := False;
      CTSIE          : Boolean := False;
      ONEBIT         : Boolean := False;
      OVRDIS         : Boolean := False;
      DDRE           : Boolean := False;
      DEM            : Boolean := False;
      DEP            : Boolean := False;
      --  unspecified
      Reserved_16_16 : HAL.Bit := 16#0#;
      SCARCNT        : CR3_SCARCNT_Field := 16#0#;
      WUS            : CR3_WUS_Field := 16#0#;
      WUFIE          : Boolean := False;
      TXFTIE         : Boolean := False;
      TCBGTIE        : Boolean := False;
      RXFTCFG        : CR3_RXFTCFG_Field := 16#0#;
      RXFTIE         : Boolean := False;
      TXFTCFG        : CR3_TXFTCFG_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR3_Register use record
      EIE            at 0 range 0 .. 0;
      IREN           at 0 range 1 .. 1;
      IRLP           at 0 range 2 .. 2;
      HDSEL          at 0 range 3 .. 3;
      NACK           at 0 range 4 .. 4;
      SCEN           at 0 range 5 .. 5;
      DMAR           at 0 range 6 .. 6;
      DMAT           at 0 range 7 .. 7;
      RTSE           at 0 range 8 .. 8;
      CTSE           at 0 range 9 .. 9;
      CTSIE          at 0 range 10 .. 10;
      ONEBIT         at 0 range 11 .. 11;
      OVRDIS         at 0 range 12 .. 12;
      DDRE           at 0 range 13 .. 13;
      DEM            at 0 range 14 .. 14;
      DEP            at 0 range 15 .. 15;
      Reserved_16_16 at 0 range 16 .. 16;
      SCARCNT        at 0 range 17 .. 19;
      WUS            at 0 range 20 .. 21;
      WUFIE          at 0 range 22 .. 22;
      TXFTIE         at 0 range 23 .. 23;
      TCBGTIE        at 0 range 24 .. 24;
      RXFTCFG        at 0 range 25 .. 27;
      RXFTIE         at 0 range 28 .. 28;
      TXFTCFG        at 0 range 29 .. 31;
   end record;

   subtype BRR_DIV_Fraction_Field is HAL.UInt4;
   subtype BRR_DIV_Mantissa_Field is HAL.UInt12;

   type BRR_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      DIV_Fraction   : BRR_DIV_Fraction_Field := 16#0#;
      DIV_Mantissa   : BRR_DIV_Mantissa_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BRR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      DIV_Fraction   at 0 range 1 .. 4;
      DIV_Mantissa   at 0 range 5 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype GTPR_PSC_Field is HAL.UInt8;
   subtype GTPR_GT_Field is HAL.UInt8;

   type GTPR_Register is record
      PSC            : GTPR_PSC_Field := 16#0#;
      GT             : GTPR_GT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for GTPR_Register use record
      PSC            at 0 range 0 .. 7;
      GT             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RTOR_RTO_Field is HAL.UInt24;
   subtype RTOR_BLEN_Field is HAL.UInt8;

   type RTOR_Register is record
      RTO  : RTOR_RTO_Field := 16#0#;
      BLEN : RTOR_BLEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RTOR_Register use record
      RTO  at 0 range 0 .. 23;
      BLEN at 0 range 24 .. 31;
   end record;

   type RQR_Register is record
      ABRRQ         : Boolean := False;
      SBKRQ         : Boolean := False;
      MMRQ          : Boolean := False;
      RXFRQ         : Boolean := False;
      TXFRQ         : Boolean := False;
      --  unspecified
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RQR_Register use record
      ABRRQ         at 0 range 0 .. 0;
      SBKRQ         at 0 range 1 .. 1;
      MMRQ          at 0 range 2 .. 2;
      RXFRQ         at 0 range 3 .. 3;
      TXFRQ         at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   type ISR_Register is record
      PE             : Boolean := False;
      FE             : Boolean := False;
      NE             : Boolean := False;
      ORE            : Boolean := False;
      IDLE           : Boolean := False;
      RXNE           : Boolean := False;
      TC             : Boolean := False;
      TXE            : Boolean := False;
      LBDF           : Boolean := False;
      CTSIF          : Boolean := False;
      CTS            : Boolean := False;
      RTOF           : Boolean := False;
      EOBF           : Boolean := False;
      UDR            : Boolean := False;
      ABRE           : Boolean := False;
      ABRF           : Boolean := False;
      BUSY           : Boolean := False;
      CMF            : Boolean := False;
      SBKF           : Boolean := False;
      RWU            : Boolean := False;
      WUF            : Boolean := False;
      TEACK          : Boolean := False;
      REACK          : Boolean := False;
      TXFE           : Boolean := False;
      RXFF           : Boolean := False;
      TCBGT          : Boolean := False;
      RXFT           : Boolean := False;
      TXFT           : Boolean := False;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      PE             at 0 range 0 .. 0;
      FE             at 0 range 1 .. 1;
      NE             at 0 range 2 .. 2;
      ORE            at 0 range 3 .. 3;
      IDLE           at 0 range 4 .. 4;
      RXNE           at 0 range 5 .. 5;
      TC             at 0 range 6 .. 6;
      TXE            at 0 range 7 .. 7;
      LBDF           at 0 range 8 .. 8;
      CTSIF          at 0 range 9 .. 9;
      CTS            at 0 range 10 .. 10;
      RTOF           at 0 range 11 .. 11;
      EOBF           at 0 range 12 .. 12;
      UDR            at 0 range 13 .. 13;
      ABRE           at 0 range 14 .. 14;
      ABRF           at 0 range 15 .. 15;
      BUSY           at 0 range 16 .. 16;
      CMF            at 0 range 17 .. 17;
      SBKF           at 0 range 18 .. 18;
      RWU            at 0 range 19 .. 19;
      WUF            at 0 range 20 .. 20;
      TEACK          at 0 range 21 .. 21;
      REACK          at 0 range 22 .. 22;
      TXFE           at 0 range 23 .. 23;
      RXFF           at 0 range 24 .. 24;
      TCBGT          at 0 range 25 .. 25;
      RXFT           at 0 range 26 .. 26;
      TXFT           at 0 range 27 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   type ICR_Register is record
      PECF           : Boolean := False;
      FECF           : Boolean := False;
      NECF           : Boolean := False;
      ORECF          : Boolean := False;
      IDLECF         : Boolean := False;
      TXFECF         : Boolean := False;
      TCCF           : Boolean := False;
      TCBGTCF        : Boolean := False;
      LBDCF          : Boolean := False;
      CTSCF          : Boolean := False;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      RTOCF          : Boolean := False;
      EOBCF          : Boolean := False;
      UDRCF          : Boolean := False;
      --  unspecified
      Reserved_14_16 : HAL.UInt3 := 16#0#;
      CMCF           : Boolean := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      WUCF           : Boolean := False;
      --  unspecified
      Reserved_21_31 : HAL.UInt11 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICR_Register use record
      PECF           at 0 range 0 .. 0;
      FECF           at 0 range 1 .. 1;
      NECF           at 0 range 2 .. 2;
      ORECF          at 0 range 3 .. 3;
      IDLECF         at 0 range 4 .. 4;
      TXFECF         at 0 range 5 .. 5;
      TCCF           at 0 range 6 .. 6;
      TCBGTCF        at 0 range 7 .. 7;
      LBDCF          at 0 range 8 .. 8;
      CTSCF          at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      RTOCF          at 0 range 11 .. 11;
      EOBCF          at 0 range 12 .. 12;
      UDRCF          at 0 range 13 .. 13;
      Reserved_14_16 at 0 range 14 .. 16;
      CMCF           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      WUCF           at 0 range 20 .. 20;
      Reserved_21_31 at 0 range 21 .. 31;
   end record;

   subtype RDR_RDR_Field is HAL.UInt9;

   type RDR_Register is record
      RDR           : RDR_RDR_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RDR_Register use record
      RDR           at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype TDR_TDR_Field is HAL.UInt9;

   type TDR_Register is record
      TDR           : TDR_TDR_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TDR_Register use record
      TDR           at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype PRESC_PRESCALER_Field is HAL.UInt4;

   type PRESC_Register is record
      PRESCALER     : PRESC_PRESCALER_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRESC_Register use record
      PRESCALER     at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type USART1_Peripheral is record
      CR1   : aliased CR1_Register;
      CR2   : aliased CR2_Register;
      CR3   : aliased CR3_Register;
      BRR   : aliased BRR_Register;
      GTPR  : aliased GTPR_Register;
      RTOR  : aliased RTOR_Register;
      RQR   : aliased RQR_Register;
      ISR   : aliased ISR_Register;
      ICR   : aliased ICR_Register;
      RDR   : aliased RDR_Register;
      TDR   : aliased TDR_Register;
      PRESC : aliased PRESC_Register;
   end record
     with Volatile;

   for USART1_Peripheral use record
      CR1   at 16#0# range 0 .. 31;
      CR2   at 16#4# range 0 .. 31;
      CR3   at 16#8# range 0 .. 31;
      BRR   at 16#C# range 0 .. 31;
      GTPR  at 16#10# range 0 .. 31;
      RTOR  at 16#14# range 0 .. 31;
      RQR   at 16#18# range 0 .. 31;
      ISR   at 16#1C# range 0 .. 31;
      ICR   at 16#20# range 0 .. 31;
      RDR   at 16#24# range 0 .. 31;
      TDR   at 16#28# range 0 .. 31;
      PRESC at 16#2C# range 0 .. 31;
   end record;

   USART1_Periph : aliased USART1_Peripheral
     with Import, Address => System'To_Address (16#40013800#);

end STM32_SVD.USART1;
