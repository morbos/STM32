--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.RTC is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype TR_SU_Field is Interfaces.Bit_Types.UInt4;
   subtype TR_ST_Field is Interfaces.Bit_Types.UInt3;
   subtype TR_MNU_Field is Interfaces.Bit_Types.UInt4;
   subtype TR_MNT_Field is Interfaces.Bit_Types.UInt3;
   subtype TR_HU_Field is Interfaces.Bit_Types.UInt4;
   subtype TR_HT_Field is Interfaces.Bit_Types.UInt2;
   subtype TR_PM_Field is Interfaces.Bit_Types.Bit;

   type TR_Register is record
      SU             : TR_SU_Field := 16#0#;
      ST             : TR_ST_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      MNU            : TR_MNU_Field := 16#0#;
      MNT            : TR_MNT_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      HU             : TR_HU_Field := 16#0#;
      HT             : TR_HT_Field := 16#0#;
      PM             : TR_PM_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : Interfaces.Bit_Types.UInt9 := 16#0#;
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

   subtype DR_DU_Field is Interfaces.Bit_Types.UInt4;
   subtype DR_DT_Field is Interfaces.Bit_Types.UInt2;
   subtype DR_MU_Field is Interfaces.Bit_Types.UInt4;
   subtype DR_MT_Field is Interfaces.Bit_Types.Bit;
   subtype DR_WDU_Field is Interfaces.Bit_Types.UInt3;
   subtype DR_YU_Field is Interfaces.Bit_Types.UInt4;
   subtype DR_YT_Field is Interfaces.Bit_Types.UInt4;

   type DR_Register is record
      DU             : DR_DU_Field := 16#0#;
      DT             : DR_DT_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      MU             : DR_MU_Field := 16#0#;
      MT             : DR_MT_Field := 16#0#;
      WDU            : DR_WDU_Field := 16#0#;
      YU             : DR_YU_Field := 16#0#;
      YT             : DR_YT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte := 16#0#;
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

   subtype CR_WUCKSEL_Field is Interfaces.Bit_Types.UInt3;
   subtype CR_TSEDGE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_REFCKON_Field is Interfaces.Bit_Types.Bit;
   subtype CR_BYPSHAD_Field is Interfaces.Bit_Types.Bit;
   subtype CR_FMT_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ALRAE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ALRBE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_WUTE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_TSE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ALRAIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ALRBIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_WUTIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_TSIE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ADD1H_Field is Interfaces.Bit_Types.Bit;
   subtype CR_SUB1H_Field is Interfaces.Bit_Types.Bit;
   subtype CR_BKP_Field is Interfaces.Bit_Types.Bit;
   subtype CR_COSEL_Field is Interfaces.Bit_Types.Bit;
   subtype CR_POL_Field is Interfaces.Bit_Types.Bit;
   subtype CR_OSEL_Field is Interfaces.Bit_Types.UInt2;
   subtype CR_COE_Field is Interfaces.Bit_Types.Bit;
   subtype CR_ITSE_Field is Interfaces.Bit_Types.Bit;

   type CR_Register is record
      WUCKSEL        : CR_WUCKSEL_Field := 16#0#;
      TSEDGE         : CR_TSEDGE_Field := 16#0#;
      REFCKON        : CR_REFCKON_Field := 16#0#;
      BYPSHAD        : CR_BYPSHAD_Field := 16#0#;
      FMT            : CR_FMT_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      ALRAE          : CR_ALRAE_Field := 16#0#;
      ALRBE          : CR_ALRBE_Field := 16#0#;
      WUTE           : CR_WUTE_Field := 16#0#;
      TSE            : CR_TSE_Field := 16#0#;
      ALRAIE         : CR_ALRAIE_Field := 16#0#;
      ALRBIE         : CR_ALRBIE_Field := 16#0#;
      WUTIE          : CR_WUTIE_Field := 16#0#;
      TSIE           : CR_TSIE_Field := 16#0#;
      ADD1H          : CR_ADD1H_Field := 16#0#;
      SUB1H          : CR_SUB1H_Field := 16#0#;
      BKP            : CR_BKP_Field := 16#0#;
      COSEL          : CR_COSEL_Field := 16#0#;
      POL            : CR_POL_Field := 16#0#;
      OSEL           : CR_OSEL_Field := 16#0#;
      COE            : CR_COE_Field := 16#0#;
      ITSE           : CR_ITSE_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : Interfaces.Bit_Types.UInt7 := 16#0#;
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

   subtype ISR_ALRAWF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ALRBWF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_WUTWF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_SHPF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_INITS_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_RSF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_INITF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_INIT_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ALRAF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ALRBF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_WUTF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TSF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TSOVF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TAMP1F_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TAMP2F_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_TAMP3F_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_RECALPF_Field is Interfaces.Bit_Types.Bit;
   subtype ISR_ITSF_Field is Interfaces.Bit_Types.Bit;

   type ISR_Register is record
      ALRAWF         : ISR_ALRAWF_Field := 16#0#;
      ALRBWF         : ISR_ALRBWF_Field := 16#0#;
      WUTWF          : ISR_WUTWF_Field := 16#0#;
      SHPF           : ISR_SHPF_Field := 16#0#;
      INITS          : ISR_INITS_Field := 16#0#;
      RSF            : ISR_RSF_Field := 16#0#;
      INITF          : ISR_INITF_Field := 16#0#;
      INIT           : ISR_INIT_Field := 16#0#;
      ALRAF          : ISR_ALRAF_Field := 16#0#;
      ALRBF          : ISR_ALRBF_Field := 16#0#;
      WUTF           : ISR_WUTF_Field := 16#0#;
      TSF            : ISR_TSF_Field := 16#0#;
      TSOVF          : ISR_TSOVF_Field := 16#0#;
      TAMP1F         : ISR_TAMP1F_Field := 16#0#;
      TAMP2F         : ISR_TAMP2F_Field := 16#0#;
      TAMP3F         : ISR_TAMP3F_Field := 16#0#;
      RECALPF        : ISR_RECALPF_Field := 16#0#;
      ITSF           : ISR_ITSF_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : Interfaces.Bit_Types.UInt14 := 16#0#;
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

   subtype PRER_PREDIV_S_Field is Interfaces.Bit_Types.UInt15;
   subtype PRER_PREDIV_A_Field is Interfaces.Bit_Types.UInt7;

   type PRER_Register is record
      --  unspecified
      Reserved_0_0   : Interfaces.Bit_Types.Bit := 16#0#;
      PREDIV_S       : PRER_PREDIV_S_Field := 16#0#;
      PREDIV_A       : PRER_PREDIV_A_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : Interfaces.Bit_Types.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PRER_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      PREDIV_S       at 0 range 1 .. 15;
      PREDIV_A       at 0 range 16 .. 22;
      Reserved_23_31 at 0 range 23 .. 31;
   end record;

   subtype WUTR_WUT_Field is Interfaces.Bit_Types.Short;

   type WUTR_Register is record
      WUT            : WUTR_WUT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WUTR_Register use record
      WUT            at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ALRMAR_SU_Field is Interfaces.Bit_Types.UInt4;
   subtype ALRMAR_ST_Field is Interfaces.Bit_Types.UInt3;
   subtype ALRMAR_MSK1_Field is Interfaces.Bit_Types.Bit;
   subtype ALRMAR_MNU_Field is Interfaces.Bit_Types.UInt4;
   subtype ALRMAR_MNT_Field is Interfaces.Bit_Types.UInt3;
   subtype ALRMAR_MSK2_Field is Interfaces.Bit_Types.Bit;
   subtype ALRMAR_HU_Field is Interfaces.Bit_Types.UInt4;
   subtype ALRMAR_HT_Field is Interfaces.Bit_Types.UInt2;
   subtype ALRMAR_PM_Field is Interfaces.Bit_Types.Bit;
   subtype ALRMAR_MSK3_Field is Interfaces.Bit_Types.Bit;
   subtype ALRMAR_DU_Field is Interfaces.Bit_Types.UInt4;
   subtype ALRMAR_DT_Field is Interfaces.Bit_Types.UInt2;
   subtype ALRMAR_WDSEL_Field is Interfaces.Bit_Types.Bit;
   subtype ALRMAR_MSK4_Field is Interfaces.Bit_Types.Bit;

   type ALRMAR_Register is record
      SU    : ALRMAR_SU_Field := 16#0#;
      ST    : ALRMAR_ST_Field := 16#0#;
      MSK1  : ALRMAR_MSK1_Field := 16#0#;
      MNU   : ALRMAR_MNU_Field := 16#0#;
      MNT   : ALRMAR_MNT_Field := 16#0#;
      MSK2  : ALRMAR_MSK2_Field := 16#0#;
      HU    : ALRMAR_HU_Field := 16#0#;
      HT    : ALRMAR_HT_Field := 16#0#;
      PM    : ALRMAR_PM_Field := 16#0#;
      MSK3  : ALRMAR_MSK3_Field := 16#0#;
      DU    : ALRMAR_DU_Field := 16#0#;
      DT    : ALRMAR_DT_Field := 16#0#;
      WDSEL : ALRMAR_WDSEL_Field := 16#0#;
      MSK4  : ALRMAR_MSK4_Field := 16#0#;
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

   subtype ALRMBR_SU_Field is Interfaces.Bit_Types.UInt4;
   subtype ALRMBR_ST_Field is Interfaces.Bit_Types.UInt3;
   subtype ALRMBR_MSK2_Field is Interfaces.Bit_Types.Bit;
   subtype ALRMBR_MNU_Field is Interfaces.Bit_Types.UInt4;
   subtype ALRMBR_MNT_Field is Interfaces.Bit_Types.UInt3;
   subtype ALRMBR_HU_Field is Interfaces.Bit_Types.UInt4;
   subtype ALRMBR_HT_Field is Interfaces.Bit_Types.UInt2;
   subtype ALRMBR_PM_Field is Interfaces.Bit_Types.Bit;
   subtype ALRMBR_MSK3_Field is Interfaces.Bit_Types.Bit;
   subtype ALRMBR_DU_Field is Interfaces.Bit_Types.UInt4;
   subtype ALRMBR_DT_Field is Interfaces.Bit_Types.UInt2;
   subtype ALRMBR_WDSEL_Field is Interfaces.Bit_Types.Bit;
   subtype ALRMBR_MSK4_Field is Interfaces.Bit_Types.Bit;

   type ALRMBR_Register is record
      SU     : ALRMBR_SU_Field := 16#0#;
      ST     : ALRMBR_ST_Field := 16#0#;
      MSK2   : ALRMBR_MSK2_Field := 16#0#;
      MNU    : ALRMBR_MNU_Field := 16#0#;
      MNT    : ALRMBR_MNT_Field := 16#0#;
      MSK2_1 : ALRMBR_MSK2_Field := 16#0#;
      HU     : ALRMBR_HU_Field := 16#0#;
      HT     : ALRMBR_HT_Field := 16#0#;
      PM     : ALRMBR_PM_Field := 16#0#;
      MSK3   : ALRMBR_MSK3_Field := 16#0#;
      DU     : ALRMBR_DU_Field := 16#0#;
      DT     : ALRMBR_DT_Field := 16#0#;
      WDSEL  : ALRMBR_WDSEL_Field := 16#0#;
      MSK4   : ALRMBR_MSK4_Field := 16#0#;
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

   subtype WPR_KEY_Field is Interfaces.Bit_Types.Byte;

   type WPR_Register is record
      KEY           : WPR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for WPR_Register use record
      KEY           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SSR_SS_Field is Interfaces.Bit_Types.Short;

   type SSR_Register is record
      SS             : SSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype SHIFTR_SUBFS_Field is Interfaces.Bit_Types.UInt15;
   subtype SHIFTR_ADD1S_Field is Interfaces.Bit_Types.Bit;

   type SHIFTR_Register is record
      SUBFS          : SHIFTR_SUBFS_Field := 16#0#;
      --  unspecified
      Reserved_15_30 : Interfaces.Bit_Types.Short := 16#0#;
      ADD1S          : SHIFTR_ADD1S_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHIFTR_Register use record
      SUBFS          at 0 range 0 .. 14;
      Reserved_15_30 at 0 range 15 .. 30;
      ADD1S          at 0 range 31 .. 31;
   end record;

   subtype TSTR_SU_Field is Interfaces.Bit_Types.UInt4;
   subtype TSTR_ST_Field is Interfaces.Bit_Types.UInt3;
   subtype TSTR_MNU_Field is Interfaces.Bit_Types.UInt4;
   subtype TSTR_MNT_Field is Interfaces.Bit_Types.UInt3;
   subtype TSTR_HU_Field is Interfaces.Bit_Types.UInt4;
   subtype TSTR_HT_Field is Interfaces.Bit_Types.UInt2;
   subtype TSTR_PM_Field is Interfaces.Bit_Types.Bit;

   type TSTR_Register is record
      SU             : TSTR_SU_Field := 16#0#;
      ST             : TSTR_ST_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      MNU            : TSTR_MNU_Field := 16#0#;
      MNT            : TSTR_MNT_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : Interfaces.Bit_Types.Bit := 16#0#;
      HU             : TSTR_HU_Field := 16#0#;
      HT             : TSTR_HT_Field := 16#0#;
      PM             : TSTR_PM_Field := 16#0#;
      --  unspecified
      Reserved_23_31 : Interfaces.Bit_Types.UInt9 := 16#0#;
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

   subtype TSDR_DU_Field is Interfaces.Bit_Types.UInt4;
   subtype TSDR_DT_Field is Interfaces.Bit_Types.UInt2;
   subtype TSDR_MU_Field is Interfaces.Bit_Types.UInt4;
   subtype TSDR_MT_Field is Interfaces.Bit_Types.Bit;
   subtype TSDR_WDU_Field is Interfaces.Bit_Types.UInt3;

   type TSDR_Register is record
      DU             : TSDR_DU_Field := 16#0#;
      DT             : TSDR_DT_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      MU             : TSDR_MU_Field := 16#0#;
      MT             : TSDR_MT_Field := 16#0#;
      WDU            : TSDR_WDU_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
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

   subtype TSSSR_SS_Field is Interfaces.Bit_Types.Short;

   type TSSSR_Register is record
      SS             : TSSSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TSSSR_Register use record
      SS             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype CALR_CALM_Field is Interfaces.Bit_Types.UInt9;
   subtype CALR_CALW16_Field is Interfaces.Bit_Types.Bit;
   subtype CALR_CALW8_Field is Interfaces.Bit_Types.Bit;
   subtype CALR_CALP_Field is Interfaces.Bit_Types.Bit;

   type CALR_Register is record
      CALM           : CALR_CALM_Field := 16#0#;
      --  unspecified
      Reserved_9_12  : Interfaces.Bit_Types.UInt4 := 16#0#;
      CALW16         : CALR_CALW16_Field := 16#0#;
      CALW8          : CALR_CALW8_Field := 16#0#;
      CALP           : CALR_CALP_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
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

   subtype TAMPCR_TAMP1E_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP1TRG_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMPIE_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP2E_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP2TRG_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP3E_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP3TRG_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMPTS_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMPFREQ_Field is Interfaces.Bit_Types.UInt3;
   subtype TAMPCR_TAMPFLT_Field is Interfaces.Bit_Types.UInt2;
   subtype TAMPCR_TAMPPRCH_Field is Interfaces.Bit_Types.UInt2;
   subtype TAMPCR_TAMPPUDIS_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP1IE_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP1NOERASE_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP1MF_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP2IE_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP2NOERASE_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP2MF_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP3IE_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP3NOERASE_Field is Interfaces.Bit_Types.Bit;
   subtype TAMPCR_TAMP3MF_Field is Interfaces.Bit_Types.Bit;

   type TAMPCR_Register is record
      TAMP1E         : TAMPCR_TAMP1E_Field := 16#0#;
      TAMP1TRG       : TAMPCR_TAMP1TRG_Field := 16#0#;
      TAMPIE         : TAMPCR_TAMPIE_Field := 16#0#;
      TAMP2E         : TAMPCR_TAMP2E_Field := 16#0#;
      TAMP2TRG       : TAMPCR_TAMP2TRG_Field := 16#0#;
      TAMP3E         : TAMPCR_TAMP3E_Field := 16#0#;
      TAMP3TRG       : TAMPCR_TAMP3TRG_Field := 16#0#;
      TAMPTS         : TAMPCR_TAMPTS_Field := 16#0#;
      TAMPFREQ       : TAMPCR_TAMPFREQ_Field := 16#0#;
      TAMPFLT        : TAMPCR_TAMPFLT_Field := 16#0#;
      TAMPPRCH       : TAMPCR_TAMPPRCH_Field := 16#0#;
      TAMPPUDIS      : TAMPCR_TAMPPUDIS_Field := 16#0#;
      TAMP1IE        : TAMPCR_TAMP1IE_Field := 16#0#;
      TAMP1NOERASE   : TAMPCR_TAMP1NOERASE_Field := 16#0#;
      TAMP1MF        : TAMPCR_TAMP1MF_Field := 16#0#;
      TAMP2IE        : TAMPCR_TAMP2IE_Field := 16#0#;
      TAMP2NOERASE   : TAMPCR_TAMP2NOERASE_Field := 16#0#;
      TAMP2MF        : TAMPCR_TAMP2MF_Field := 16#0#;
      TAMP3IE        : TAMPCR_TAMP3IE_Field := 16#0#;
      TAMP3NOERASE   : TAMPCR_TAMP3NOERASE_Field := 16#0#;
      TAMP3MF        : TAMPCR_TAMP3MF_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : Interfaces.Bit_Types.UInt7 := 16#0#;
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

   subtype ALRMASSR_SS_Field is Interfaces.Bit_Types.UInt15;
   subtype ALRMASSR_MASKSS_Field is Interfaces.Bit_Types.UInt4;

   type ALRMASSR_Register is record
      SS             : ALRMASSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : Interfaces.Bit_Types.UInt9 := 16#0#;
      MASKSS         : ALRMASSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.Bit_Types.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMASSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ALRMBSSR_SS_Field is Interfaces.Bit_Types.UInt15;
   subtype ALRMBSSR_MASKSS_Field is Interfaces.Bit_Types.UInt4;

   type ALRMBSSR_Register is record
      SS             : ALRMBSSR_SS_Field := 16#0#;
      --  unspecified
      Reserved_15_23 : Interfaces.Bit_Types.UInt9 := 16#0#;
      MASKSS         : ALRMBSSR_MASKSS_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : Interfaces.Bit_Types.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ALRMBSSR_Register use record
      SS             at 0 range 0 .. 14;
      Reserved_15_23 at 0 range 15 .. 23;
      MASKSS         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype OR_RTC_ALARM_TYPE_Field is Interfaces.Bit_Types.Bit;
   subtype OR_RTC_OUT_RMP_Field is Interfaces.Bit_Types.Bit;

   type OR_Register is record
      RTC_ALARM_TYPE : OR_RTC_ALARM_TYPE_Field := 16#0#;
      RTC_OUT_RMP    : OR_RTC_OUT_RMP_Field := 16#0#;
      --  unspecified
      Reserved_2_31  : Interfaces.Bit_Types.UInt30 := 16#0#;
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
      BKP0R    : aliased Interfaces.Bit_Types.Word;
      RKP1R    : aliased Interfaces.Bit_Types.Word;
      RKP2R    : aliased Interfaces.Bit_Types.Word;
      RKP3R    : aliased Interfaces.Bit_Types.Word;
      RKP4R    : aliased Interfaces.Bit_Types.Word;
      RKP5R    : aliased Interfaces.Bit_Types.Word;
      RKP6R    : aliased Interfaces.Bit_Types.Word;
      RKP7R    : aliased Interfaces.Bit_Types.Word;
      RKP8R    : aliased Interfaces.Bit_Types.Word;
      RKP9R    : aliased Interfaces.Bit_Types.Word;
      RKP10R   : aliased Interfaces.Bit_Types.Word;
      RKP11R   : aliased Interfaces.Bit_Types.Word;
      RKP12R   : aliased Interfaces.Bit_Types.Word;
      RKP13R   : aliased Interfaces.Bit_Types.Word;
      RKP14R   : aliased Interfaces.Bit_Types.Word;
      RKP15R   : aliased Interfaces.Bit_Types.Word;
      RKP16R   : aliased Interfaces.Bit_Types.Word;
      RKP17R   : aliased Interfaces.Bit_Types.Word;
      RKP18R   : aliased Interfaces.Bit_Types.Word;
      BKP19R   : aliased Interfaces.Bit_Types.Word;
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

end Interfaces.STM32.RTC;
