--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.USART1 is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_UE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_UESM_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_RE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_TE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_IDLEIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_RXFNEIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_TCIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_TXFNFIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_PEIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_PS_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_PCE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_WAKE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_M0_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_MME_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_CMIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_OVER8_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_DEDT_Field is Interfaces.Bit_Types.UInt5;
   subtype CR1_DEAT_Field is Interfaces.Bit_Types.UInt5;
   subtype CR1_RTOIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_EOBIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_M1_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_FIFOEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_TXFEIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_RXFFIE_Field is Interfaces.Bit_Types.Bit;

   type CR1_Register is record
      UE      : CR1_UE_Field := 16#0#;
      UESM    : CR1_UESM_Field := 16#0#;
      RE      : CR1_RE_Field := 16#0#;
      TE      : CR1_TE_Field := 16#0#;
      IDLEIE  : CR1_IDLEIE_Field := 16#0#;
      RXFNEIE : CR1_RXFNEIE_Field := 16#0#;
      TCIE    : CR1_TCIE_Field := 16#0#;
      TXFNFIE : CR1_TXFNFIE_Field := 16#0#;
      PEIE    : CR1_PEIE_Field := 16#0#;
      PS      : CR1_PS_Field := 16#0#;
      PCE     : CR1_PCE_Field := 16#0#;
      WAKE    : CR1_WAKE_Field := 16#0#;
      M0      : CR1_M0_Field := 16#0#;
      MME     : CR1_MME_Field := 16#0#;
      CMIE    : CR1_CMIE_Field := 16#0#;
      OVER8   : CR1_OVER8_Field := 16#0#;
      DEDT    : CR1_DEDT_Field := 16#0#;
      DEAT    : CR1_DEAT_Field := 16#0#;
      RTOIE   : CR1_RTOIE_Field := 16#0#;
      EOBIE   : CR1_EOBIE_Field := 16#0#;
      M1      : CR1_M1_Field := 16#0#;
      FIFOEN  : CR1_FIFOEN_Field := 16#0#;
      TXFEIE  : CR1_TXFEIE_Field := 16#0#;
      RXFFIE  : CR1_RXFFIE_Field := 16#0#;
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

   subtype CR2_SLVEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_DIS_NSS_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_ADDM7_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_LBDL_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_LBDIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_LBCL_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_CPHA_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_CPOL_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_CLKEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_STOP_Field is Interfaces.Bit_Types.UInt2;
   subtype CR2_LINEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_SWAP_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_RXINV_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_TXINV_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_DATAINV_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_MSBFIRST_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_ABREN_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_ABRMOD_Field is Interfaces.Bit_Types.UInt2;
   subtype CR2_RTOEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_ADD_Field is Interfaces.Bit_Types.Byte;

   type CR2_Register is record
      SLVEN        : CR2_SLVEN_Field := 16#0#;
      --  unspecified
      Reserved_1_2 : Interfaces.Bit_Types.UInt2 := 16#0#;
      DIS_NSS      : CR2_DIS_NSS_Field := 16#0#;
      ADDM7        : CR2_ADDM7_Field := 16#0#;
      LBDL         : CR2_LBDL_Field := 16#0#;
      LBDIE        : CR2_LBDIE_Field := 16#0#;
      --  unspecified
      Reserved_7_7 : Interfaces.Bit_Types.Bit := 16#0#;
      LBCL         : CR2_LBCL_Field := 16#0#;
      CPHA         : CR2_CPHA_Field := 16#0#;
      CPOL         : CR2_CPOL_Field := 16#0#;
      CLKEN        : CR2_CLKEN_Field := 16#0#;
      STOP         : CR2_STOP_Field := 16#0#;
      LINEN        : CR2_LINEN_Field := 16#0#;
      SWAP         : CR2_SWAP_Field := 16#0#;
      RXINV        : CR2_RXINV_Field := 16#0#;
      TXINV        : CR2_TXINV_Field := 16#0#;
      DATAINV      : CR2_DATAINV_Field := 16#0#;
      MSBFIRST     : CR2_MSBFIRST_Field := 16#0#;
      ABREN        : CR2_ABREN_Field := 16#0#;
      ABRMOD       : CR2_ABRMOD_Field := 16#0#;
      RTOEN        : CR2_RTOEN_Field := 16#0#;
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

   subtype CR3_EIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_IREN_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_IRLP_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_HDSEL_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_NACK_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_SCEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_DMAR_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_DMAT_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_RTSE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_CTSE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_CTSIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_ONEBIT_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_OVRDIS_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_DDRE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_DEM_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_DEP_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_SCARCNT_Field is Interfaces.Bit_Types.UInt3;
   subtype CR3_WUS_Field is Interfaces.Bit_Types.UInt2;
   subtype CR3_WUFIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_TXFTIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_TCBGTIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_RXFTCFG_Field is Interfaces.Bit_Types.UInt3;
   subtype CR3_RXFTIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_TXFTCFG_Field is Interfaces.Bit_Types.UInt3;

   type CR3_Register is record
      EIE            : CR3_EIE_Field := 16#0#;
      IREN           : CR3_IREN_Field := 16#0#;
      IRLP           : CR3_IRLP_Field := 16#0#;
      HDSEL          : CR3_HDSEL_Field := 16#0#;
      NACK           : CR3_NACK_Field := 16#0#;
      SCEN           : CR3_SCEN_Field := 16#0#;
      DMAR           : CR3_DMAR_Field := 16#0#;
      DMAT           : CR3_DMAT_Field := 16#0#;
      RTSE           : CR3_RTSE_Field := 16#0#;
      CTSE           : CR3_CTSE_Field := 16#0#;
      CTSIE          : CR3_CTSIE_Field := 16#0#;
      ONEBIT         : CR3_ONEBIT_Field := 16#0#;
      OVRDIS         : CR3_OVRDIS_Field := 16#0#;
      DDRE           : CR3_DDRE_Field := 16#0#;
      DEM            : CR3_DEM_Field := 16#0#;
      DEP            : CR3_DEP_Field := 16#0#;
      --  unspecified
      Reserved_16_16 : Interfaces.Bit_Types.Bit := 16#0#;
      SCARCNT        : CR3_SCARCNT_Field := 16#0#;
      WUS            : CR3_WUS_Field := 16#0#;
      WUFIE          : CR3_WUFIE_Field := 16#0#;
      TXFTIE         : CR3_TXFTIE_Field := 16#0#;
      TCBGTIE        : CR3_TCBGTIE_Field := 16#0#;
      RXFTCFG        : CR3_RXFTCFG_Field := 16#0#;
      RXFTIE         : CR3_RXFTIE_Field := 16#0#;
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

   subtype BRR_DIV_Fraction_Field is Interfaces.Bit_Types.UInt4;
   subtype BRR_DIV_Mantissa_Field is Interfaces.Bit_Types.UInt12;

   type BRR_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      DIV_Fraction   : BRR_DIV_Fraction_Field := 16#0#;
      DIV_Mantissa   : BRR_DIV_Mantissa_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : Interfaces.Bit_Types.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BRR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      DIV_Fraction   at 0 range 1 .. 4;
      DIV_Mantissa   at 0 range 5 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype GTPR_PSC_Field is Interfaces.Bit_Types.Byte;
   subtype GTPR_GT_Field is Interfaces.Bit_Types.Byte;

   type GTPR_Register is record
      PSC            : GTPR_PSC_Field := 16#0#;
      GT             : GTPR_GT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for GTPR_Register use record
      PSC            at 0 range 0 .. 7;
      GT             at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype RTOR_RTO_Field is Interfaces.Bit_Types.UInt24;
   subtype RTOR_BLEN_Field is Interfaces.Bit_Types.Byte;

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

   subtype RQR_ABRRQ_Field is Interfaces.Bit_Types.Bit;
   subtype RQR_SBKRQ_Field is Interfaces.Bit_Types.Bit;
   subtype RQR_MMRQ_Field is Interfaces.Bit_Types.Bit;
   subtype RQR_RXFRQ_Field is Interfaces.Bit_Types.Bit;
   subtype RQR_TXFRQ_Field is Interfaces.Bit_Types.Bit;

   type RQR_Register is record
      ABRRQ         : RQR_ABRRQ_Field := 16#0#;
      SBKRQ         : RQR_SBKRQ_Field := 16#0#;
      MMRQ          : RQR_MMRQ_Field := 16#0#;
      RXFRQ         : RQR_RXFRQ_Field := 16#0#;
      TXFRQ         : RQR_TXFRQ_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : Interfaces.Bit_Types.UInt27 := 16#0#;
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

   subtype ISR_PE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_FE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_NE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ORE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_IDLE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_RXNE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TC_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TXE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_LBDF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_CTSIF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_CTS_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_RTOF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_EOBF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_UDR_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ABRE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ABRF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_BUSY_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_CMF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_SBKF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_RWU_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_WUF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TEACK_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_REACK_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TXFE_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_RXFF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TCBGT_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_RXFT_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TXFT_Field is Interfaces.Bit_Types.Bit;

   type ISR_Register is record
      PE             : ISR_PE_Field := 16#0#;
      FE             : ISR_FE_Field := 16#0#;
      NE             : ISR_NE_Field := 16#0#;
      ORE            : ISR_ORE_Field := 16#0#;
      IDLE           : ISR_IDLE_Field := 16#0#;
      RXNE           : ISR_RXNE_Field := 16#0#;
      TC             : ISR_TC_Field := 16#0#;
      TXE            : ISR_TXE_Field := 16#0#;
      LBDF           : ISR_LBDF_Field := 16#0#;
      CTSIF          : ISR_CTSIF_Field := 16#0#;
      CTS            : ISR_CTS_Field := 16#0#;
      RTOF           : ISR_RTOF_Field := 16#0#;
      EOBF           : ISR_EOBF_Field := 16#0#;
      UDR            : ISR_UDR_Field := 16#0#;
      ABRE           : ISR_ABRE_Field := 16#0#;
      ABRF           : ISR_ABRF_Field := 16#0#;
      BUSY           : ISR_BUSY_Field := 16#0#;
      CMF            : ISR_CMF_Field := 16#0#;
      SBKF           : ISR_SBKF_Field := 16#0#;
      RWU            : ISR_RWU_Field := 16#0#;
      WUF            : ISR_WUF_Field := 16#0#;
      TEACK          : ISR_TEACK_Field := 16#0#;
      REACK          : ISR_REACK_Field := 16#0#;
      TXFE           : ISR_TXFE_Field := 16#0#;
      RXFF           : ISR_RXFF_Field := 16#0#;
      TCBGT          : ISR_TCBGT_Field := 16#0#;
      RXFT           : ISR_RXFT_Field := 16#0#;
      TXFT           : ISR_TXFT_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.Bit_Types.UInt4 := 16#0#;
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

   subtype ICR_PECF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_FECF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_NECF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_ORECF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_IDLECF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_TXFECF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_TCCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_TCBGTCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_LBDCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_CTSCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_RTOCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_EOBCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_UDRCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_CMCF_Field is Interfaces.Bit_Types.Bit;
   subtype ICR_WUCF_Field is Interfaces.Bit_Types.Bit;

   type ICR_Register is record
      PECF           : ICR_PECF_Field := 16#0#;
      FECF           : ICR_FECF_Field := 16#0#;
      NECF           : ICR_NECF_Field := 16#0#;
      ORECF          : ICR_ORECF_Field := 16#0#;
      IDLECF         : ICR_IDLECF_Field := 16#0#;
      TXFECF         : ICR_TXFECF_Field := 16#0#;
      TCCF           : ICR_TCCF_Field := 16#0#;
      TCBGTCF        : ICR_TCBGTCF_Field := 16#0#;
      LBDCF          : ICR_LBDCF_Field := 16#0#;
      CTSCF          : ICR_CTSCF_Field := 16#0#;
      --  unspecified
      Reserved_10_10 : Interfaces.Bit_Types.Bit := 16#0#;
      RTOCF          : ICR_RTOCF_Field := 16#0#;
      EOBCF          : ICR_EOBCF_Field := 16#0#;
      UDRCF          : ICR_UDRCF_Field := 16#0#;
      --  unspecified
      Reserved_14_16 : Interfaces.Bit_Types.UInt3 := 16#0#;
      CMCF           : ICR_CMCF_Field := 16#0#;
      --  unspecified
      Reserved_18_19 : Interfaces.Bit_Types.UInt2 := 16#0#;
      WUCF           : ICR_WUCF_Field := 16#0#;
      --  unspecified
      Reserved_21_31 : Interfaces.Bit_Types.UInt11 := 16#0#;
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

   subtype RDR_RDR_Field is Interfaces.Bit_Types.UInt9;

   type RDR_Register is record
      RDR           : RDR_RDR_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.Bit_Types.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RDR_Register use record
      RDR           at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype TDR_TDR_Field is Interfaces.Bit_Types.UInt9;

   type TDR_Register is record
      TDR           : TDR_TDR_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.Bit_Types.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TDR_Register use record
      TDR           at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype PRESC_PRESCALER_Field is Interfaces.Bit_Types.UInt4;

   type PRESC_Register is record
      PRESCALER     : PRESC_PRESCALER_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
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

end Interfaces.STM32.USART1;
