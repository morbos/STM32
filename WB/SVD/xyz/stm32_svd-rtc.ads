--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.RTC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype TR_SU_Field is HAL.UInt4;
   subtype TR_ST_Field is HAL.UInt3;
   subtype TR_MNU_Field is HAL.UInt4;
   subtype TR_MNT_Field is HAL.UInt3;
   subtype TR_HU_Field is HAL.UInt4;
   subtype TR_HT_Field is HAL.UInt2;

   type TR_Register is record
      SU             : TR_SU_Field := 16#0#;
      ST             : TR_ST_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      MNU            : TR_MNU_Field := 16#0#;
      MNT            : TR_MNT_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      HU             : TR_HU_Field := 16#0#;
      HT             : TR_HT_Field := 16#0#;
      PM             : Boolean := False;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype DR_DU_Field is HAL.UInt4;
   subtype DR_DT_Field is HAL.UInt2;
   subtype DR_MU_Field is HAL.UInt4;
   subtype DR_WDU_Field is HAL.UInt3;
   subtype DR_YU_Field is HAL.UInt4;
   subtype DR_YT_Field is HAL.UInt4;

   type DR_Register is record
      DU             : DR_DU_Field := 16#0#;
      DT             : DR_DT_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      MU             : DR_MU_Field := 16#0#;
      MT             : Boolean := False;
      WDU            : DR_WDU_Field := 16#0#;
      YU             : DR_YU_Field := 16#0#;
      YT             : DR_YT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for DR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      YU             at 0 range 16 .. 19;
      YT             at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype CR_WUCKSEL_Field is HAL.UInt3;
   subtype CR_OSEL_Field is HAL.UInt2;

   type CR_Register is record
      WUCKSEL        : CR_WUCKSEL_Field := 16#0#;
      TSEDGE         : Boolean := False;
      REFCKON        : Boolean := False;
      BYPSHAD        : Boolean := False;
      FMT            : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      ALRAE          : Boolean := False;
      ALRBE          : Boolean := False;
      WUTE           : Boolean := False;
      TSE            : Boolean := False;
      ALRAIE         : Boolean := False;
      ALRBIE         : Boolean := False;
      WUTIE          : Boolean := False;
      TSIE           : Boolean := False;
      ADD1H          : Boolean := False;
      SUB1H          : Boolean := False;
      BKP            : Boolean := False;
      COSEL          : Boolean := False;
      POL            : Boolean := False;
      OSEL           : CR_OSEL_Field := 16#0#;
      COE            : Boolean := False;
      ITSE           : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      WUCKSEL        at 0 range 0 .. 2;
      TSEDGE         at 0 range 3 .. 3;
      REFCKON        at 0 range 4 .. 4;
      BYPSHAD        at 0 range 5 .. 5;
      FMT            at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      ALRAE          at 0 range 8 .. 8;
      ALRBE          at 0 range 9 .. 9;
      WUTE           at 0 range 10 .. 10;
      TSE            at 0 range 11 .. 11;
      ALRAIE         at 0 range 12 .. 12;
      ALRBIE         at 0 range 13 .. 13;
      WUTIE          at 0 range 14 .. 14;
      TSIE           at 0 range 15 .. 15;
      ADD1H          at 0 range 16 .. 16;
      SUB1H          at 0 range 17 .. 17;
      BKP            at 0 range 18 .. 18;
      COSEL          at 0 range 19 .. 19;
      POL            at 0 range 20 .. 20;
      OSEL           at 0 range 21 .. 22;
      COE            at 0 range 23 .. 23;
      ITSE           at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   type ISR_Register is record
      ALRAWF         : Boolean := False;
      ALRBWF         : Boolean := False;
      WUTWF          : Boolean := False;
      SHPF           : Boolean := False;
      INITS          : Boolean := False;
      RSF            : Boolean := False;
      INITF          : Boolean := False;
      INIT           : Boolean := False;
      ALRAF          : Boolean := False;
      ALRBF          : Boolean := False;
      WUTF           : Boolean := False;
      TSF            : Boolean := False;
      TSOVF          : Boolean := False;
      TAMP1F         : Boolean := False;
      TAMP2F         : Boolean := False;
      TAMP3F         : Boolean := False;
      RECALPF        : Boolean := False;
      ITSF           : Boolean := False;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ISR_Register use record
      ALRAWF         at 0 range 0 .. 0;
      ALRBWF         at 0 range 1 .. 1;
      WUTWF          at 0 range 2 .. 2;
      SHPF           at 0 range 3 .. 3;
      INITS          at 0 range 4 .. 4;
      RSF            at 0 range 5 .. 5;
      INITF          at 0 range 6 .. 6;
      INIT           at 0 range 7 .. 7;
      ALRAF          at 0 range 8 .. 8;
      ALRBF          at 0 range 9 .. 9;
      WUTF           at 0 range 10 .. 10;
      TSF            at 0 range 11 .. 11;
      TSOVF          at 0 range 12 .. 12;
      TAMP1F         at 0 range 13 .. 13;
      TAMP2F         at 0 range 14 .. 14;
      TAMP3F         at 0 range 15 .. 15;
      RECALPF        at 0 range 16 .. 16;
      ITSF           at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype PRER_PREDIV_S_Field is HAL.UInt15;
   subtype PRER_PREDIV_A_Field is HAL.UInt7;

   type PRER_Register is record
      --  unspecified
      Reserved_0_0   : HAL.Bit := 16#0#;
      PREDIV_S       : PRER_PREDIV_S_Field := 16#0#;
      PREDIV_A       : PRER_PREDIV_A_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRER_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      PREDIV_S       at 0 range 1 .. 15;
      PREDIV_A       at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype WUTR_WUT_Field is HAL.UInt16;

   type WUTR_Register is record
      WUT            : WUTR_WUT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WUTR_Register use record
      WUT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ALRMAR_SU_Field is HAL.UInt4;
   subtype ALRMAR_ST_Field is HAL.UInt3;
   subtype ALRMAR_MNU_Field is HAL.UInt4;
   subtype ALRMAR_MNT_Field is HAL.UInt3;
   subtype ALRMAR_HU_Field is HAL.UInt4;
   subtype ALRMAR_HT_Field is HAL.UInt2;
   subtype ALRMAR_DU_Field is HAL.UInt4;
   subtype ALRMAR_DT_Field is HAL.UInt2;

   type ALRMAR_Register is record
      SU    : ALRMAR_SU_Field := 16#0#;
      ST    : ALRMAR_ST_Field := 16#0#;
      MSK1  : Boolean := False;
      MNU   : ALRMAR_MNU_Field := 16#0#;
      MNT   : ALRMAR_MNT_Field := 16#0#;
      MSK2  : Boolean := False;
      HU    : ALRMAR_HU_Field := 16#0#;
      HT    : ALRMAR_HT_Field := 16#0#;
      PM    : Boolean := False;
      MSK3  : Boolean := False;
      DU    : ALRMAR_DU_Field := 16#0#;
      DT    : ALRMAR_DT_Field := 16#0#;
      WDSEL : Boolean := False;
      MSK4  : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMAR_Register use record
      SU    at 0 range 0 .. 3;
      ST    at 0 range 4 .. 6;
      MSK1  at 0 range 7 .. 7;
      MNU   at 0 range 8 .. 11;
      MNT   at 0 range 12 .. 14;
      MSK2  at 0 range 15 .. 15;
      HU    at 0 range 16 .. 19;
      HT    at 0 range 20 .. 21;
      PM    at 0 range 22 .. 22;
      MSK3  at 0 range 23 .. 23;
      DU    at 0 range 24 .. 27;
      DT    at 0 range 28 .. 29;
      WDSEL at 0 range 30 .. 30;
      MSK4  at 0 range 31 .. 31;
   end record;

   subtype ALRMBR_SU_Field is HAL.UInt4;
   subtype ALRMBR_ST_Field is HAL.UInt3;
   subtype ALRMBR_MNU_Field is HAL.UInt4;
   subtype ALRMBR_MNT_Field is HAL.UInt3;
   subtype ALRMBR_HU_Field is HAL.UInt4;
   subtype ALRMBR_HT_Field is HAL.UInt2;
   subtype ALRMBR_DU_Field is HAL.UInt4;
   subtype ALRMBR_DT_Field is HAL.UInt2;

   type ALRMBR_Register is record
      SU     : ALRMBR_SU_Field := 16#0#;
      ST     : ALRMBR_ST_Field := 16#0#;
      MSK2   : Boolean := False;
      MNU    : ALRMBR_MNU_Field := 16#0#;
      MNT    : ALRMBR_MNT_Field := 16#0#;
      MSK2_1 : Boolean := False;
      HU     : ALRMBR_HU_Field := 16#0#;
      HT     : ALRMBR_HT_Field := 16#0#;
      PM     : Boolean := False;
      MSK3   : Boolean := False;
      DU     : ALRMBR_DU_Field := 16#0#;
      DT     : ALRMBR_DT_Field := 16#0#;
      WDSEL  : Boolean := False;
      MSK4   : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMBR_Register use record
      SU     at 0 range 0 .. 3;
      ST     at 0 range 4 .. 6;
      MSK2   at 0 range 7 .. 7;
      MNU    at 0 range 8 .. 11;
      MNT    at 0 range 12 .. 14;
      MSK2_1 at 0 range 15 .. 15;
      HU     at 0 range 16 .. 19;
      HT     at 0 range 20 .. 21;
      PM     at 0 range 22 .. 22;
      MSK3   at 0 range 23 .. 23;
      DU     at 0 range 24 .. 27;
      DT     at 0 range 28 .. 29;
      WDSEL  at 0 range 30 .. 30;
      MSK4   at 0 range 31 .. 31;
   end record;

   subtype WPR_KEY_Field is HAL.UInt8;

   type WPR_Register is record
      KEY           : WPR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPR_Register use record
      KEY           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSR_SS_Field is HAL.UInt16;

   type SSR_Register is record
      SS             : SSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SHIFTR_SUBFS_Field is HAL.UInt15;

   type SHIFTR_Register is record
      SUBFS          : SHIFTR_SUBFS_Field := 16#0#;
      --  unspecified
      Reserved_15_30 : HAL.UInt16 := 16#0#;
      ADD1S          : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHIFTR_Register use record
      SUBFS          at 0 range 0 .. 14;
      Reserved_15_30 at 0 range 15 .. 30;
      ADD1S          at 0 range 31 .. 31;
   end record;

   subtype TSTR_SU_Field is HAL.UInt4;
   subtype TSTR_ST_Field is HAL.UInt3;
   subtype TSTR_MNU_Field is HAL.UInt4;
   subtype TSTR_MNT_Field is HAL.UInt3;
   subtype TSTR_HU_Field is HAL.UInt4;
   subtype TSTR_HT_Field is HAL.UInt2;

   type TSTR_Register is record
      SU             : TSTR_SU_Field := 16#0#;
      ST             : TSTR_ST_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      MNU            : TSTR_MNU_Field := 16#0#;
      MNT            : TSTR_MNT_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      HU             : TSTR_HU_Field := 16#0#;
      HT             : TSTR_HT_Field := 16#0#;
      PM             : Boolean := False;
      --  unspecified
      Reserved_23_31 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSTR_Register use record
      SU             at 0 range 0 .. 3;
      ST             at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      MNU            at 0 range 8 .. 11;
      MNT            at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      HU             at 0 range 16 .. 19;
      HT             at 0 range 20 .. 21;
      PM             at 0 range 22 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype TSDR_DU_Field is HAL.UInt4;
   subtype TSDR_DT_Field is HAL.UInt2;
   subtype TSDR_MU_Field is HAL.UInt4;
   subtype TSDR_WDU_Field is HAL.UInt3;

   type TSDR_Register is record
      DU             : TSDR_DU_Field := 16#0#;
      DT             : TSDR_DT_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      MU             : TSDR_MU_Field := 16#0#;
      MT             : Boolean := False;
      WDU            : TSDR_WDU_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSDR_Register use record
      DU             at 0 range 0 .. 3;
      DT             at 0 range 4 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      MU             at 0 range 8 .. 11;
      MT             at 0 range 12 .. 12;
      WDU            at 0 range 13 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TSSSR_SS_Field is HAL.UInt16;

   type TSSSR_Register is record
      SS             : TSSSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSSSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CALR_CALM_Field is HAL.UInt9;

   type CALR_Register is record
      CALM           : CALR_CALM_Field := 16#0#;
      --  unspecified
      Reserved_9_12  : HAL.UInt4 := 16#0#;
      CALW16         : Boolean := False;
      CALW8          : Boolean := False;
      CALP           : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CALR_Register use record
      CALM           at 0 range 0 .. 8;
      Reserved_9_12  at 0 range 9 .. 12;
      CALW16         at 0 range 13 .. 13;
      CALW8          at 0 range 14 .. 14;
      CALP           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TAMPCR_TAMPFREQ_Field is HAL.UInt3;
   subtype TAMPCR_TAMPFLT_Field is HAL.UInt2;
   subtype TAMPCR_TAMPPRCH_Field is HAL.UInt2;

   type TAMPCR_Register is record
      TAMP1E         : Boolean := False;
      TAMP1TRG       : Boolean := False;
      TAMPIE         : Boolean := False;
      TAMP2E         : Boolean := False;
      TAMP2TRG       : Boolean := False;
      TAMP3E         : Boolean := False;
      TAMP3TRG       : Boolean := False;
      TAMPTS         : Boolean := False;
      TAMPFREQ       : TAMPCR_TAMPFREQ_Field := 16#0#;
      TAMPFLT        : TAMPCR_TAMPFLT_Field := 16#0#;
      TAMPPRCH       : TAMPCR_TAMPPRCH_Field := 16#0#;
      TAMPPUDIS      : Boolean := False;
      TAMP1IE        : Boolean := False;
      TAMP1NOERASE   : Boolean := False;
      TAMP1MF        : Boolean := False;
      TAMP2IE        : Boolean := False;
      TAMP2NOERASE   : Boolean := False;
      TAMP2MF        : Boolean := False;
      TAMP3IE        : Boolean := False;
      TAMP3NOERASE   : Boolean := False;
      TAMP3MF        : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TAMPCR_Register use record
      TAMP1E         at 0 range 0 .. 0;
      TAMP1TRG       at 0 range 1 .. 1;
      TAMPIE         at 0 range 2 .. 2;
      TAMP2E         at 0 range 3 .. 3;
      TAMP2TRG       at 0 range 4 .. 4;
      TAMP3E         at 0 range 5 .. 5;
      TAMP3TRG       at 0 range 6 .. 6;
      TAMPTS         at 0 range 7 .. 7;
      TAMPFREQ       at 0 range 8 .. 10;
      TAMPFLT        at 0 range 11 .. 12;
      TAMPPRCH       at 0 range 13 .. 14;
      TAMPPUDIS      at 0 range 15 .. 15;
      TAMP1IE        at 0 range 16 .. 16;
      TAMP1NOERASE   at 0 range 17 .. 17;
      TAMP1MF        at 0 range 18 .. 18;
      TAMP2IE        at 0 range 19 .. 19;
      TAMP2NOERASE   at 0 range 20 .. 20;
      TAMP2MF        at 0 range 21 .. 21;
      TAMP3IE        at 0 range 22 .. 22;
      TAMP3NOERASE   at 0 range 23 .. 23;
      TAMP3MF        at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype ALRMASSR_SS_Field is HAL.UInt15;
   subtype ALRMASSR_MASKSS_Field is HAL.UInt4;

   type ALRMASSR_Register is record
      SS             : ALRMASSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : HAL.UInt9 := 16#0#;
      MASKSS         : ALRMASSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMASSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ALRMBSSR_SS_Field is HAL.UInt15;
   subtype ALRMBSSR_MASKSS_Field is HAL.UInt4;

   type ALRMBSSR_Register is record
      SS             : ALRMBSSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : HAL.UInt9 := 16#0#;
      MASKSS         : ALRMBSSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMBSSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   type OR_Register is record
      RTC_ALARM_TYPE : Boolean := False;
      RTC_OUT_RMP    : Boolean := False;
      --  unspecified
      Reserved_2_31  : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR_Register use record
      RTC_ALARM_TYPE at 0 range 0 .. 0;
      RTC_OUT_RMP    at 0 range 1 .. 1;
      Reserved_2_31  at 0 range 2 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type RTC_Peripheral is record
      TR       : aliased TR_Register;
      DR       : aliased DR_Register;
      CR       : aliased CR_Register;
      ISR      : aliased ISR_Register;
      PRER     : aliased PRER_Register;
      WUTR     : aliased WUTR_Register;
      ALRMAR   : aliased ALRMAR_Register;
      ALRMBR   : aliased ALRMBR_Register;
      WPR      : aliased WPR_Register;
      SSR      : aliased SSR_Register;
      SHIFTR   : aliased SHIFTR_Register;
      TSTR     : aliased TSTR_Register;
      TSDR     : aliased TSDR_Register;
      TSSSR    : aliased TSSSR_Register;
      CALR     : aliased CALR_Register;
      TAMPCR   : aliased TAMPCR_Register;
      ALRMASSR : aliased ALRMASSR_Register;
      ALRMBSSR : aliased ALRMBSSR_Register;
      OR_k     : aliased OR_Register;
      BKP0R    : aliased HAL.UInt32;
      RKP1R    : aliased HAL.UInt32;
      RKP2R    : aliased HAL.UInt32;
      RKP3R    : aliased HAL.UInt32;
      RKP4R    : aliased HAL.UInt32;
      RKP5R    : aliased HAL.UInt32;
      RKP6R    : aliased HAL.UInt32;
      RKP7R    : aliased HAL.UInt32;
      RKP8R    : aliased HAL.UInt32;
      RKP9R    : aliased HAL.UInt32;
      RKP10R   : aliased HAL.UInt32;
      RKP11R   : aliased HAL.UInt32;
      RKP12R   : aliased HAL.UInt32;
      RKP13R   : aliased HAL.UInt32;
      RKP14R   : aliased HAL.UInt32;
      RKP15R   : aliased HAL.UInt32;
      RKP16R   : aliased HAL.UInt32;
      RKP17R   : aliased HAL.UInt32;
      RKP18R   : aliased HAL.UInt32;
      BKP19R   : aliased HAL.UInt32;
   end record
     with Volatile;

   for RTC_Peripheral use record
      TR       at 16#0# range 0 .. 31;
      DR       at 16#4# range 0 .. 31;
      CR       at 16#8# range 0 .. 31;
      ISR      at 16#C# range 0 .. 31;
      PRER     at 16#10# range 0 .. 31;
      WUTR     at 16#14# range 0 .. 31;
      ALRMAR   at 16#1C# range 0 .. 31;
      ALRMBR   at 16#20# range 0 .. 31;
      WPR      at 16#24# range 0 .. 31;
      SSR      at 16#28# range 0 .. 31;
      SHIFTR   at 16#2C# range 0 .. 31;
      TSTR     at 16#30# range 0 .. 31;
      TSDR     at 16#34# range 0 .. 31;
      TSSSR    at 16#38# range 0 .. 31;
      CALR     at 16#3C# range 0 .. 31;
      TAMPCR   at 16#40# range 0 .. 31;
      ALRMASSR at 16#44# range 0 .. 31;
      ALRMBSSR at 16#48# range 0 .. 31;
      OR_k     at 16#4C# range 0 .. 31;
      BKP0R    at 16#50# range 0 .. 31;
      RKP1R    at 16#54# range 0 .. 31;
      RKP2R    at 16#58# range 0 .. 31;
      RKP3R    at 16#5C# range 0 .. 31;
      RKP4R    at 16#60# range 0 .. 31;
      RKP5R    at 16#64# range 0 .. 31;
      RKP6R    at 16#68# range 0 .. 31;
      RKP7R    at 16#6C# range 0 .. 31;
      RKP8R    at 16#70# range 0 .. 31;
      RKP9R    at 16#74# range 0 .. 31;
      RKP10R   at 16#78# range 0 .. 31;
      RKP11R   at 16#7C# range 0 .. 31;
      RKP12R   at 16#80# range 0 .. 31;
      RKP13R   at 16#84# range 0 .. 31;
      RKP14R   at 16#88# range 0 .. 31;
      RKP15R   at 16#8C# range 0 .. 31;
      RKP16R   at 16#90# range 0 .. 31;
      RKP17R   at 16#94# range 0 .. 31;
      RKP18R   at 16#98# range 0 .. 31;
      BKP19R   at 16#9C# range 0 .. 31;
   end record;

   RTC_Periph : aliased RTC_Peripheral
     with Import, Address => System'To_Address (16#40002800#);

end STM32_SVD.RTC;
