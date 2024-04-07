--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.PWR is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_LPMS_Field is Interfaces.Bit_Types.UInt3;
   subtype CR1_FPDR_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_FPDS_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_DBP_Field is Interfaces.Bit_Types.Bit;
   subtype CR1_VOS_Field is Interfaces.Bit_Types.UInt2;
   subtype CR1_LPR_Field is Interfaces.Bit_Types.Bit;

   type CR1_Register is record
      LPMS           : CR1_LPMS_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Interfaces.Bit_Types.Bit := 16#0#;
      FPDR           : CR1_FPDR_Field := 16#0#;
      FPDS           : CR1_FPDS_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      DBP            : CR1_DBP_Field := 16#0#;
      VOS            : CR1_VOS_Field := 16#0#;
      --  unspecified
      Reserved_11_13 : Interfaces.Bit_Types.UInt3 := 16#0#;
      LPR            : CR1_LPR_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.Bit_Types.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      LPMS           at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      FPDR           at 0 range 4 .. 4;
      FPDS           at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      DBP            at 0 range 8 .. 8;
      VOS            at 0 range 9 .. 10;
      Reserved_11_13 at 0 range 11 .. 13;
      LPR            at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype CR2_PVDE_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_PLS_Field is Interfaces.Bit_Types.UInt3;
   subtype CR2_PVME1_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_PVME3_Field is Interfaces.Bit_Types.Bit;
   subtype CR2_USV_Field is Interfaces.Bit_Types.Bit;

   type CR2_Register is record
      PVDE           : CR2_PVDE_Field := 16#0#;
      PLS            : CR2_PLS_Field := 16#0#;
      PVME1          : CR2_PVME1_Field := 16#0#;
      --  unspecified
      Reserved_5_5   : Interfaces.Bit_Types.Bit := 16#0#;
      PVME3          : CR2_PVME3_Field := 16#0#;
      --  unspecified
      Reserved_7_9   : Interfaces.Bit_Types.UInt3 := 16#0#;
      USV            : CR2_USV_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : Interfaces.Bit_Types.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      PVDE           at 0 range 0 .. 0;
      PLS            at 0 range 1 .. 3;
      PVME1          at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      PVME3          at 0 range 6 .. 6;
      Reserved_7_9   at 0 range 7 .. 9;
      USV            at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   --  CR3_EWUP array element
   subtype CR3_EWUP_Element is Interfaces.Bit_Types.Bit;

   --  CR3_EWUP array
   type CR3_EWUP_Field_Array is array (1 .. 5) of CR3_EWUP_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for CR3_EWUP
   type CR3_EWUP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EWUP as a value
            Val : Interfaces.Bit_Types.UInt5;
         when True =>
            --  EWUP as an array
            Arr : CR3_EWUP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for CR3_EWUP_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   subtype CR3_EBORHSMPSFB_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_RRS_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_APC_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_ECRPE_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_EBLEA_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_E802A_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_EC2H_Field is Interfaces.Bit_Types.Bit;
   subtype CR3_EIWUL_Field is Interfaces.Bit_Types.Bit;

   type CR3_Register is record
      EWUP           : CR3_EWUP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_7   : Interfaces.Bit_Types.UInt3 := 16#0#;
      EBORHSMPSFB    : CR3_EBORHSMPSFB_Field := 16#0#;
      RRS            : CR3_RRS_Field := 16#0#;
      APC            : CR3_APC_Field := 16#0#;
      ECRPE          : CR3_ECRPE_Field := 16#0#;
      EBLEA          : CR3_EBLEA_Field := 16#0#;
      E802A          : CR3_E802A_Field := 16#0#;
      EC2H           : CR3_EC2H_Field := 16#0#;
      EIWUL          : CR3_EIWUL_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR3_Register use record
      EWUP           at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      EBORHSMPSFB    at 0 range 8 .. 8;
      RRS            at 0 range 9 .. 9;
      APC            at 0 range 10 .. 10;
      ECRPE          at 0 range 11 .. 11;
      EBLEA          at 0 range 12 .. 12;
      E802A          at 0 range 13 .. 13;
      EC2H           at 0 range 14 .. 14;
      EIWUL          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  CR4_WP array element
   subtype CR4_WP_Element is Interfaces.Bit_Types.Bit;

   --  CR4_WP array
   type CR4_WP_Field_Array is array (1 .. 5) of CR4_WP_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for CR4_WP
   type CR4_WP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WP as a value
            Val : Interfaces.Bit_Types.UInt5;
         when True =>
            --  WP as an array
            Arr : CR4_WP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for CR4_WP_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   subtype CR4_VBE_Field is Interfaces.Bit_Types.Bit;
   subtype CR4_VBRS_Field is Interfaces.Bit_Types.Bit;
   subtype CR4_C2BOOT_Field is Interfaces.Bit_Types.Bit;

   type CR4_Register is record
      WP             : CR4_WP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_7   : Interfaces.Bit_Types.UInt3 := 16#0#;
      VBE            : CR4_VBE_Field := 16#0#;
      VBRS           : CR4_VBRS_Field := 16#0#;
      --  unspecified
      Reserved_10_14 : Interfaces.Bit_Types.UInt5 := 16#0#;
      C2BOOT         : CR4_C2BOOT_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR4_Register use record
      WP             at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      VBE            at 0 range 8 .. 8;
      VBRS           at 0 range 9 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      C2BOOT         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  SR1_WUF array element
   subtype SR1_WUF_Element is Interfaces.Bit_Types.Bit;

   --  SR1_WUF array
   type SR1_WUF_Field_Array is array (1 .. 5) of SR1_WUF_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for SR1_WUF
   type SR1_WUF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WUF as a value
            Val : Interfaces.Bit_Types.UInt5;
         when True =>
            --  WUF as an array
            Arr : SR1_WUF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for SR1_WUF_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   subtype SR1_SMPSFBF_Field is Interfaces.Bit_Types.Bit;
   subtype SR1_BORHF_Field is Interfaces.Bit_Types.Bit;
   subtype SR1_BLEWUF_Field is Interfaces.Bit_Types.Bit;
   subtype SR1_802WUF_Field is Interfaces.Bit_Types.Bit;
   subtype SR1_CRPEF_Field is Interfaces.Bit_Types.Bit;
   subtype SR1_BLEAF_Field is Interfaces.Bit_Types.Bit;
   subtype SR1_802AF_Field is Interfaces.Bit_Types.Bit;
   subtype SR1_C2HF_Field is Interfaces.Bit_Types.Bit;
   subtype SR1_WUFI_Field is Interfaces.Bit_Types.Bit;

   type SR1_Register is record
      WUF                 : SR1_WUF_Field :=
                             (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_6        : Interfaces.Bit_Types.UInt2 := 16#0#;
      SMPSFBF             : SR1_SMPSFBF_Field := 16#0#;
      BORHF               : SR1_BORHF_Field := 16#0#;
      BLEWUF              : SR1_BLEWUF_Field := 16#0#;
      SR1_Register_802WUF : SR1_802WUF_Field := 16#0#;
      CRPEF               : SR1_CRPEF_Field := 16#0#;
      BLEAF               : SR1_BLEAF_Field := 16#0#;
      SR1_Register_802AF  : SR1_802AF_Field := 16#0#;
      C2HF                : SR1_C2HF_Field := 16#0#;
      WUFI                : SR1_WUFI_Field := 16#0#;
      --  unspecified
      Reserved_16_31      : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR1_Register use record
      WUF                 at 0 range 0 .. 4;
      Reserved_5_6        at 0 range 5 .. 6;
      SMPSFBF             at 0 range 7 .. 7;
      BORHF               at 0 range 8 .. 8;
      BLEWUF              at 0 range 9 .. 9;
      SR1_Register_802WUF at 0 range 10 .. 10;
      CRPEF               at 0 range 11 .. 11;
      BLEAF               at 0 range 12 .. 12;
      SR1_Register_802AF  at 0 range 13 .. 13;
      C2HF                at 0 range 14 .. 14;
      WUFI                at 0 range 15 .. 15;
      Reserved_16_31      at 0 range 16 .. 31;
   end record;

   subtype SR2_SMPSBF_Field is Interfaces.Bit_Types.Bit;
   subtype SR2_SMPSF_Field is Interfaces.Bit_Types.Bit;
   subtype SR2_REGLPS_Field is Interfaces.Bit_Types.Bit;
   subtype SR2_REGLPF_Field is Interfaces.Bit_Types.Bit;
   subtype SR2_VOSF_Field is Interfaces.Bit_Types.Bit;
   subtype SR2_PVDO_Field is Interfaces.Bit_Types.Bit;
   subtype SR2_PVMO1_Field is Interfaces.Bit_Types.Bit;
   subtype SR2_PVMO3_Field is Interfaces.Bit_Types.Bit;

   type SR2_Register is record
      SMPSBF         : SR2_SMPSBF_Field := 16#0#;
      SMPSF          : SR2_SMPSF_Field := 16#0#;
      --  unspecified
      Reserved_2_7   : Interfaces.Bit_Types.UInt6 := 16#0#;
      REGLPS         : SR2_REGLPS_Field := 16#0#;
      REGLPF         : SR2_REGLPF_Field := 16#0#;
      VOSF           : SR2_VOSF_Field := 16#0#;
      PVDO           : SR2_PVDO_Field := 16#0#;
      PVMO1          : SR2_PVMO1_Field := 16#0#;
      --  unspecified
      Reserved_13_13 : Interfaces.Bit_Types.Bit := 16#0#;
      PVMO3          : SR2_PVMO3_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.Bit_Types.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR2_Register use record
      SMPSBF         at 0 range 0 .. 0;
      SMPSF          at 0 range 1 .. 1;
      Reserved_2_7   at 0 range 2 .. 7;
      REGLPS         at 0 range 8 .. 8;
      REGLPF         at 0 range 9 .. 9;
      VOSF           at 0 range 10 .. 10;
      PVDO           at 0 range 11 .. 11;
      PVMO1          at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      PVMO3          at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   --  SCR_CWUF array element
   subtype SCR_CWUF_Element is Interfaces.Bit_Types.Bit;

   --  SCR_CWUF array
   type SCR_CWUF_Field_Array is array (1 .. 5) of SCR_CWUF_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for SCR_CWUF
   type SCR_CWUF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CWUF as a value
            Val : Interfaces.Bit_Types.UInt5;
         when True =>
            --  CWUF as an array
            Arr : SCR_CWUF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for SCR_CWUF_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   subtype SCR_CSMPSFBF_Field is Interfaces.Bit_Types.Bit;
   subtype SCR_CBORHF_Field is Interfaces.Bit_Types.Bit;
   subtype SCR_CBLEWUF_Field is Interfaces.Bit_Types.Bit;
   subtype SCR_C802WUF_Field is Interfaces.Bit_Types.Bit;
   subtype SCR_CCRPEF_Field is Interfaces.Bit_Types.Bit;
   subtype SCR_CBLEAF_Field is Interfaces.Bit_Types.Bit;
   subtype SCR_C802AF_Field is Interfaces.Bit_Types.Bit;
   subtype SCR_CC2HF_Field is Interfaces.Bit_Types.Bit;

   type SCR_Register is record
      CWUF           : SCR_CWUF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_6   : Interfaces.Bit_Types.UInt2 := 16#0#;
      CSMPSFBF       : SCR_CSMPSFBF_Field := 16#0#;
      CBORHF         : SCR_CBORHF_Field := 16#0#;
      CBLEWUF        : SCR_CBLEWUF_Field := 16#0#;
      C802WUF        : SCR_C802WUF_Field := 16#0#;
      CCRPEF         : SCR_CCRPEF_Field := 16#0#;
      CBLEAF         : SCR_CBLEAF_Field := 16#0#;
      C802AF         : SCR_C802AF_Field := 16#0#;
      CC2HF          : SCR_CC2HF_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.Bit_Types.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCR_Register use record
      CWUF           at 0 range 0 .. 4;
      Reserved_5_6   at 0 range 5 .. 6;
      CSMPSFBF       at 0 range 7 .. 7;
      CBORHF         at 0 range 8 .. 8;
      CBLEWUF        at 0 range 9 .. 9;
      C802WUF        at 0 range 10 .. 10;
      CCRPEF         at 0 range 11 .. 11;
      CBLEAF         at 0 range 12 .. 12;
      C802AF         at 0 range 13 .. 13;
      CC2HF          at 0 range 14 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype CR5_SMPSVOS_Field is Interfaces.Bit_Types.UInt4;
   subtype CR5_SMPSSC_Field is Interfaces.Bit_Types.UInt3;
   subtype CR5_BORHC_Field is Interfaces.Bit_Types.Bit;
   subtype CR5_SMPSEN_Field is Interfaces.Bit_Types.Bit;

   type CR5_Register is record
      SMPSVOS        : CR5_SMPSVOS_Field := 16#0#;
      SMPSSC         : CR5_SMPSSC_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      BORHC          : CR5_BORHC_Field := 16#0#;
      --  unspecified
      Reserved_9_14  : Interfaces.Bit_Types.UInt6 := 16#0#;
      SMPSEN         : CR5_SMPSEN_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR5_Register use record
      SMPSVOS        at 0 range 0 .. 3;
      SMPSSC         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      BORHC          at 0 range 8 .. 8;
      Reserved_9_14  at 0 range 9 .. 14;
      SMPSEN         at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PUCRA_PU array element
   subtype PUCRA_PU_Element is Interfaces.Bit_Types.Bit;

   --  PUCRA_PU array
   type PUCRA_PU_Field_Array is array (0 .. 15) of PUCRA_PU_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PUCRA_PU
   type PUCRA_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.Bit_Types.Short;
         when True =>
            --  PU as an array
            Arr : PUCRA_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PUCRA_PU_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type PUCRA_Register is record
      PU             : PUCRA_PU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRA_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PDCRA_PD array element
   subtype PDCRA_PD_Element is Interfaces.Bit_Types.Bit;

   --  PDCRA_PD array
   type PDCRA_PD_Field_Array is array (0 .. 15) of PDCRA_PD_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PDCRA_PD
   type PDCRA_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.Bit_Types.Short;
         when True =>
            --  PD as an array
            Arr : PDCRA_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PDCRA_PD_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type PDCRA_Register is record
      PD             : PDCRA_PD_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRA_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PUCRB_PU array element
   subtype PUCRB_PU_Element is Interfaces.Bit_Types.Bit;

   --  PUCRB_PU array
   type PUCRB_PU_Field_Array is array (0 .. 15) of PUCRB_PU_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PUCRB_PU
   type PUCRB_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.Bit_Types.Short;
         when True =>
            --  PU as an array
            Arr : PUCRB_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PUCRB_PU_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type PUCRB_Register is record
      PU             : PUCRB_PU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRB_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PDCRB_PD array element
   subtype PDCRB_PD_Element is Interfaces.Bit_Types.Bit;

   --  PDCRB_PD array
   type PDCRB_PD_Field_Array is array (0 .. 15) of PDCRB_PD_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PDCRB_PD
   type PDCRB_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.Bit_Types.Short;
         when True =>
            --  PD as an array
            Arr : PDCRB_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PDCRB_PD_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type PDCRB_Register is record
      PD             : PDCRB_PD_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRB_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PUCRC_PU array element
   subtype PUCRC_PU_Element is Interfaces.Bit_Types.Bit;

   --  PUCRC_PU array
   type PUCRC_PU_Field_Array is array (0 .. 15) of PUCRC_PU_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PUCRC_PU
   type PUCRC_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.Bit_Types.Short;
         when True =>
            --  PU as an array
            Arr : PUCRC_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PUCRC_PU_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type PUCRC_Register is record
      PU             : PUCRC_PU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRC_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PDCRC_PD array element
   subtype PDCRC_PD_Element is Interfaces.Bit_Types.Bit;

   --  PDCRC_PD array
   type PDCRC_PD_Field_Array is array (0 .. 15) of PDCRC_PD_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PDCRC_PD
   type PDCRC_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.Bit_Types.Short;
         when True =>
            --  PD as an array
            Arr : PDCRC_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PDCRC_PD_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type PDCRC_Register is record
      PD             : PDCRC_PD_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRC_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PUCRD_PU array element
   subtype PUCRD_PU_Element is Interfaces.Bit_Types.Bit;

   --  PUCRD_PU array
   type PUCRD_PU_Field_Array is array (0 .. 15) of PUCRD_PU_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PUCRD_PU
   type PUCRD_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.Bit_Types.Short;
         when True =>
            --  PU as an array
            Arr : PUCRD_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PUCRD_PU_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type PUCRD_Register is record
      PU             : PUCRD_PU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRD_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PDCRD_PD array element
   subtype PDCRD_PD_Element is Interfaces.Bit_Types.Bit;

   --  PDCRD_PD array
   type PDCRD_PD_Field_Array is array (0 .. 15) of PDCRD_PD_Element
     with Component_Size => 1, Size => 16;

   --  Type definition for PDCRD_PD
   type PDCRD_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.Bit_Types.Short;
         when True =>
            --  PD as an array
            Arr : PDCRD_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for PDCRD_PD_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type PDCRD_Register is record
      PD             : PDCRD_PD_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRD_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PUCRE_PU array element
   subtype PUCRE_PU_Element is Interfaces.Bit_Types.Bit;

   --  PUCRE_PU array
   type PUCRE_PU_Field_Array is array (0 .. 4) of PUCRE_PU_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for PUCRE_PU
   type PUCRE_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.Bit_Types.UInt5;
         when True =>
            --  PU as an array
            Arr : PUCRE_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for PUCRE_PU_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   type PUCRE_Register is record
      PU            : PUCRE_PU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_31 : Interfaces.Bit_Types.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRE_Register use record
      PU            at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  PDCRE_PD array element
   subtype PDCRE_PD_Element is Interfaces.Bit_Types.Bit;

   --  PDCRE_PD array
   type PDCRE_PD_Field_Array is array (0 .. 4) of PDCRE_PD_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for PDCRE_PD
   type PDCRE_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.Bit_Types.UInt5;
         when True =>
            --  PD as an array
            Arr : PDCRE_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for PDCRE_PD_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   type PDCRE_Register is record
      PD            : PDCRE_PD_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_31 : Interfaces.Bit_Types.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRE_Register use record
      PD            at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  PUCRH_PU array element
   subtype PUCRH_PU_Element is Interfaces.Bit_Types.Bit;

   --  PUCRH_PU array
   type PUCRH_PU_Field_Array is array (0 .. 1) of PUCRH_PU_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PUCRH_PU
   type PUCRH_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : Interfaces.Bit_Types.UInt2;
         when True =>
            --  PU as an array
            Arr : PUCRH_PU_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PUCRH_PU_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype PUCRH_PU3_Field is Interfaces.Bit_Types.Bit;

   type PUCRH_Register is record
      PU            : PUCRH_PU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_2  : Interfaces.Bit_Types.Bit := 16#0#;
      PU3           : PUCRH_PU3_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRH_Register use record
      PU            at 0 range 0 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      PU3           at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  PDCRH_PD array element
   subtype PDCRH_PD_Element is Interfaces.Bit_Types.Bit;

   --  PDCRH_PD array
   type PDCRH_PD_Field_Array is array (0 .. 1) of PDCRH_PD_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PDCRH_PD
   type PDCRH_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : Interfaces.Bit_Types.UInt2;
         when True =>
            --  PD as an array
            Arr : PDCRH_PD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PDCRH_PD_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype PDCRH_PD3_Field is Interfaces.Bit_Types.Bit;

   type PDCRH_Register is record
      PD            : PDCRH_PD_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_2  : Interfaces.Bit_Types.Bit := 16#0#;
      PD3           : PDCRH_PD3_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : Interfaces.Bit_Types.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRH_Register use record
      PD            at 0 range 0 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      PD3           at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype C2CR1_LPMS_Field is Interfaces.Bit_Types.UInt3;
   subtype C2CR1_FPDR_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR1_FPDS_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR1_BLEEWKUP_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR1_802EWKUP_Field is Interfaces.Bit_Types.Bit;

   type C2CR1_Register is record
      LPMS                    : C2CR1_LPMS_Field := 16#0#;
      --  unspecified
      Reserved_3_3            : Interfaces.Bit_Types.Bit := 16#0#;
      FPDR                    : C2CR1_FPDR_Field := 16#0#;
      FPDS                    : C2CR1_FPDS_Field := 16#0#;
      --  unspecified
      Reserved_6_13           : Interfaces.Bit_Types.Byte := 16#0#;
      BLEEWKUP                : C2CR1_BLEEWKUP_Field := 16#0#;
      C2CR1_Register_802EWKUP : C2CR1_802EWKUP_Field := 16#0#;
      --  unspecified
      Reserved_16_31          : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2CR1_Register use record
      LPMS                    at 0 range 0 .. 2;
      Reserved_3_3            at 0 range 3 .. 3;
      FPDR                    at 0 range 4 .. 4;
      FPDS                    at 0 range 5 .. 5;
      Reserved_6_13           at 0 range 6 .. 13;
      BLEEWKUP                at 0 range 14 .. 14;
      C2CR1_Register_802EWKUP at 0 range 15 .. 15;
      Reserved_16_31          at 0 range 16 .. 31;
   end record;

   --  C2CR3_EWUP array element
   subtype C2CR3_EWUP_Element is Interfaces.Bit_Types.Bit;

   --  C2CR3_EWUP array
   type C2CR3_EWUP_Field_Array is array (1 .. 5) of C2CR3_EWUP_Element
     with Component_Size => 1, Size => 5;

   --  Type definition for C2CR3_EWUP
   type C2CR3_EWUP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EWUP as a value
            Val : Interfaces.Bit_Types.UInt5;
         when True =>
            --  EWUP as an array
            Arr : C2CR3_EWUP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 5;

   for C2CR3_EWUP_Field use record
      Val at 0 range 0 .. 4;
      Arr at 0 range 0 .. 4;
   end record;

   subtype C2CR3_EBLEWUP_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR3_E802IWUP_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR3_APC_Field is Interfaces.Bit_Types.Bit;
   subtype C2CR3_EIWUL_Field is Interfaces.Bit_Types.Bit;

   type C2CR3_Register is record
      EWUP           : C2CR3_EWUP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_8   : Interfaces.Bit_Types.UInt4 := 16#0#;
      EBLEWUP        : C2CR3_EBLEWUP_Field := 16#0#;
      E802IWUP       : C2CR3_E802IWUP_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : Interfaces.Bit_Types.Bit := 16#0#;
      APC            : C2CR3_APC_Field := 16#0#;
      --  unspecified
      Reserved_13_14 : Interfaces.Bit_Types.UInt2 := 16#0#;
      EIWUL          : C2CR3_EIWUL_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2CR3_Register use record
      EWUP           at 0 range 0 .. 4;
      Reserved_5_8   at 0 range 5 .. 8;
      EBLEWUP        at 0 range 9 .. 9;
      E802IWUP       at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      APC            at 0 range 12 .. 12;
      Reserved_13_14 at 0 range 13 .. 14;
      EIWUL          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype EXTSCR_C1CSSF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTSCR_C2CSSF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTSCR_CCRPF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTSCR_C1SBF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTSCR_C1STOPF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTSCR_C2SBF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTSCR_C2STOPF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTSCR_CRPF_Field is Interfaces.Bit_Types.Bit;
   subtype EXTSCR_C1DS_Field is Interfaces.Bit_Types.Bit;
   subtype EXTSCR_C2DS_Field is Interfaces.Bit_Types.Bit;

   type EXTSCR_Register is record
      C1CSSF         : EXTSCR_C1CSSF_Field := 16#0#;
      C2CSSF         : EXTSCR_C2CSSF_Field := 16#0#;
      CCRPF          : EXTSCR_CCRPF_Field := 16#0#;
      --  unspecified
      Reserved_3_7   : Interfaces.Bit_Types.UInt5 := 16#0#;
      C1SBF          : EXTSCR_C1SBF_Field := 16#0#;
      C1STOPF        : EXTSCR_C1STOPF_Field := 16#0#;
      C2SBF          : EXTSCR_C2SBF_Field := 16#0#;
      C2STOPF        : EXTSCR_C2STOPF_Field := 16#0#;
      --  unspecified
      Reserved_12_12 : Interfaces.Bit_Types.Bit := 16#0#;
      CRPF           : EXTSCR_CRPF_Field := 16#0#;
      C1DS           : EXTSCR_C1DS_Field := 16#0#;
      C2DS           : EXTSCR_C2DS_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : Interfaces.Bit_Types.Short := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTSCR_Register use record
      C1CSSF         at 0 range 0 .. 0;
      C2CSSF         at 0 range 1 .. 1;
      CCRPF          at 0 range 2 .. 2;
      Reserved_3_7   at 0 range 3 .. 7;
      C1SBF          at 0 range 8 .. 8;
      C1STOPF        at 0 range 9 .. 9;
      C2SBF          at 0 range 10 .. 10;
      C2STOPF        at 0 range 11 .. 11;
      Reserved_12_12 at 0 range 12 .. 12;
      CRPF           at 0 range 13 .. 13;
      C1DS           at 0 range 14 .. 14;
      C2DS           at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type PWR_Peripheral is record
      CR1    : aliased CR1_Register;
      CR2    : aliased CR2_Register;
      CR3    : aliased CR3_Register;
      CR4    : aliased CR4_Register;
      SR1    : aliased SR1_Register;
      SR2    : aliased SR2_Register;
      SCR    : aliased SCR_Register;
      CR5    : aliased CR5_Register;
      PUCRA  : aliased PUCRA_Register;
      PDCRA  : aliased PDCRA_Register;
      PUCRB  : aliased PUCRB_Register;
      PDCRB  : aliased PDCRB_Register;
      PUCRC  : aliased PUCRC_Register;
      PDCRC  : aliased PDCRC_Register;
      PUCRD  : aliased PUCRD_Register;
      PDCRD  : aliased PDCRD_Register;
      PUCRE  : aliased PUCRE_Register;
      PDCRE  : aliased PDCRE_Register;
      PUCRH  : aliased PUCRH_Register;
      PDCRH  : aliased PDCRH_Register;
      C2CR1  : aliased C2CR1_Register;
      C2CR3  : aliased C2CR3_Register;
      EXTSCR : aliased EXTSCR_Register;
   end record
     with Volatile;

   for PWR_Peripheral use record
      CR1    at 16#0# range 0 .. 31;
      CR2    at 16#4# range 0 .. 31;
      CR3    at 16#8# range 0 .. 31;
      CR4    at 16#C# range 0 .. 31;
      SR1    at 16#10# range 0 .. 31;
      SR2    at 16#14# range 0 .. 31;
      SCR    at 16#18# range 0 .. 31;
      CR5    at 16#1C# range 0 .. 31;
      PUCRA  at 16#20# range 0 .. 31;
      PDCRA  at 16#24# range 0 .. 31;
      PUCRB  at 16#28# range 0 .. 31;
      PDCRB  at 16#2C# range 0 .. 31;
      PUCRC  at 16#30# range 0 .. 31;
      PDCRC  at 16#34# range 0 .. 31;
      PUCRD  at 16#38# range 0 .. 31;
      PDCRD  at 16#3C# range 0 .. 31;
      PUCRE  at 16#40# range 0 .. 31;
      PDCRE  at 16#44# range 0 .. 31;
      PUCRH  at 16#58# range 0 .. 31;
      PDCRH  at 16#5C# range 0 .. 31;
      C2CR1  at 16#80# range 0 .. 31;
      C2CR3  at 16#84# range 0 .. 31;
      EXTSCR at 16#88# range 0 .. 31;
   end record;

   PWR_Periph : aliased PWR_Peripheral
     with Import, Address => System'To_Address (16#58000400#);

end Interfaces.STM32.PWR;
