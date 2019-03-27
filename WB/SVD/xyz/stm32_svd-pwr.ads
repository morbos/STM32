--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.PWR is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR1_LPMS_Field is HAL.UInt3;
   subtype CR1_VOS_Field is HAL.UInt2;

   type CR1_Register is record
      LPMS           : CR1_LPMS_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      FPDR           : Boolean := False;
      FPDS           : Boolean := False;
      --  unspecified
      Reserved_6_7   : HAL.UInt2 := 16#0#;
      DBP            : Boolean := False;
      VOS            : CR1_VOS_Field := 16#0#;
      --  unspecified
      Reserved_11_13 : HAL.UInt3 := 16#0#;
      LPR            : Boolean := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
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

   subtype CR2_PLS_Field is HAL.UInt3;

   type CR2_Register is record
      PVDE           : Boolean := False;
      PLS            : CR2_PLS_Field := 16#0#;
      PVME1          : Boolean := False;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      PVME3          : Boolean := False;
      --  unspecified
      Reserved_7_9   : HAL.UInt3 := 16#0#;
      USV            : Boolean := False;
      --  unspecified
      Reserved_11_31 : HAL.UInt21 := 16#0#;
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

   --  CR3_EWUP array
   type CR3_EWUP_Field_Array is array (1 .. 5) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for CR3_EWUP
   type CR3_EWUP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EWUP as a value
            Val : HAL.UInt5;
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

   type CR3_Register is record
      EWUP           : CR3_EWUP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      EBORHSMPSFB    : Boolean := False;
      RRS            : Boolean := False;
      APC            : Boolean := False;
      ECRPE          : Boolean := False;
      EBLEA          : Boolean := False;
      E802A          : Boolean := False;
      EC2H           : Boolean := False;
      EIWUL          : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

   --  CR4_WP array
   type CR4_WP_Field_Array is array (1 .. 5) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for CR4_WP
   type CR4_WP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WP as a value
            Val : HAL.UInt5;
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

   type CR4_Register is record
      WP             : CR4_WP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      VBE            : Boolean := False;
      VBRS           : Boolean := False;
      --  unspecified
      Reserved_10_14 : HAL.UInt5 := 16#0#;
      C2BOOT         : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

   --  SR1_WUF array
   type SR1_WUF_Field_Array is array (1 .. 5) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for SR1_WUF
   type SR1_WUF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  WUF as a value
            Val : HAL.UInt5;
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

   type SR1_Register is record
      WUF                 : SR1_WUF_Field :=
                             (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_6        : HAL.UInt2 := 16#0#;
      SMPSFBF             : Boolean := False;
      BORHF               : Boolean := False;
      BLEWUF              : Boolean := False;
      SR1_Register_802WUF : Boolean := False;
      CRPEF               : Boolean := False;
      BLEAF               : Boolean := False;
      SR1_Register_802AF  : Boolean := False;
      C2HF                : Boolean := False;
      WUFI                : Boolean := False;
      --  unspecified
      Reserved_16_31      : HAL.UInt16 := 16#0#;
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

   type SR2_Register is record
      SMPSBF         : Boolean := False;
      SMPSF          : Boolean := False;
      --  unspecified
      Reserved_2_7   : HAL.UInt6 := 16#0#;
      REGLPS         : Boolean := False;
      REGLPF         : Boolean := False;
      VOSF           : Boolean := False;
      PVDO           : Boolean := False;
      PVMO1          : Boolean := False;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      PVMO3          : Boolean := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
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

   --  SCR_CWUF array
   type SCR_CWUF_Field_Array is array (1 .. 5) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for SCR_CWUF
   type SCR_CWUF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CWUF as a value
            Val : HAL.UInt5;
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

   type SCR_Register is record
      CWUF           : SCR_CWUF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_6   : HAL.UInt2 := 16#0#;
      CSMPSFBF       : Boolean := False;
      CBORHF         : Boolean := False;
      CBLEWUF        : Boolean := False;
      C802WUF        : Boolean := False;
      CCRPEF         : Boolean := False;
      CBLEAF         : Boolean := False;
      C802AF         : Boolean := False;
      CC2HF          : Boolean := False;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
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

   subtype CR5_SMPSVOS_Field is HAL.UInt4;
   subtype CR5_SMPSSC_Field is HAL.UInt3;

   type CR5_Register is record
      SMPSVOS        : CR5_SMPSVOS_Field := 16#0#;
      SMPSSC         : CR5_SMPSSC_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      BORHC          : Boolean := False;
      --  unspecified
      Reserved_9_14  : HAL.UInt6 := 16#0#;
      SMPSEN         : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

   --  PUCRA_PU array
   type PUCRA_PU_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for PUCRA_PU
   type PUCRA_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : HAL.UInt16;
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
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRA_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PDCRA_PD array
   type PDCRA_PD_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for PDCRA_PD
   type PDCRA_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : HAL.UInt16;
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
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRA_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PUCRB_PU array
   type PUCRB_PU_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for PUCRB_PU
   type PUCRB_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : HAL.UInt16;
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
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRB_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PDCRB_PD array
   type PDCRB_PD_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for PDCRB_PD
   type PDCRB_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : HAL.UInt16;
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
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRB_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PUCRC_PU array
   type PUCRC_PU_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for PUCRC_PU
   type PUCRC_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : HAL.UInt16;
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
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRC_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PDCRC_PD array
   type PDCRC_PD_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for PDCRC_PD
   type PDCRC_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : HAL.UInt16;
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
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRC_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PUCRD_PU array
   type PUCRD_PU_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for PUCRD_PU
   type PUCRD_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : HAL.UInt16;
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
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRD_Register use record
      PU             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PDCRD_PD array
   type PDCRD_PD_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for PDCRD_PD
   type PDCRD_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : HAL.UInt16;
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
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRD_Register use record
      PD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  PUCRE_PU array
   type PUCRE_PU_Field_Array is array (0 .. 4) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for PUCRE_PU
   type PUCRE_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : HAL.UInt5;
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
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRE_Register use record
      PU            at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  PDCRE_PD array
   type PDCRE_PD_Field_Array is array (0 .. 4) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for PDCRE_PD
   type PDCRE_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : HAL.UInt5;
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
      Reserved_5_31 : HAL.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRE_Register use record
      PD            at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  PUCRH_PU array
   type PUCRH_PU_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PUCRH_PU
   type PUCRH_PU_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PU as a value
            Val : HAL.UInt2;
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

   type PUCRH_Register is record
      PU            : PUCRH_PU_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_2  : HAL.Bit := 16#0#;
      PU3           : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PUCRH_Register use record
      PU            at 0 range 0 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      PU3           at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  PDCRH_PD array
   type PDCRH_PD_Field_Array is array (0 .. 1) of Boolean
     with Component_Size => 1, Size => 2;

   --  Type definition for PDCRH_PD
   type PDCRH_PD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PD as a value
            Val : HAL.UInt2;
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

   type PDCRH_Register is record
      PD            : PDCRH_PD_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_2  : HAL.Bit := 16#0#;
      PD3           : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for PDCRH_Register use record
      PD            at 0 range 0 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      PD3           at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype C2CR1_LPMS_Field is HAL.UInt3;

   type C2CR1_Register is record
      LPMS                    : C2CR1_LPMS_Field := 16#0#;
      --  unspecified
      Reserved_3_3            : HAL.Bit := 16#0#;
      FPDR                    : Boolean := False;
      FPDS                    : Boolean := False;
      --  unspecified
      Reserved_6_13           : HAL.UInt8 := 16#0#;
      BLEEWKUP                : Boolean := False;
      C2CR1_Register_802EWKUP : Boolean := False;
      --  unspecified
      Reserved_16_31          : HAL.UInt16 := 16#0#;
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

   --  C2CR3_EWUP array
   type C2CR3_EWUP_Field_Array is array (1 .. 5) of Boolean
     with Component_Size => 1, Size => 5;

   --  Type definition for C2CR3_EWUP
   type C2CR3_EWUP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  EWUP as a value
            Val : HAL.UInt5;
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

   type C2CR3_Register is record
      EWUP           : C2CR3_EWUP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_5_8   : HAL.UInt4 := 16#0#;
      EBLEWUP        : Boolean := False;
      E802IWUP       : Boolean := False;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      APC            : Boolean := False;
      --  unspecified
      Reserved_13_14 : HAL.UInt2 := 16#0#;
      EIWUL          : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

   type EXTSCR_Register is record
      C1CSSF         : Boolean := False;
      C2CSSF         : Boolean := False;
      CCRPF          : Boolean := False;
      --  unspecified
      Reserved_3_7   : HAL.UInt5 := 16#0#;
      C1SBF          : Boolean := False;
      C1STOPF        : Boolean := False;
      C2SBF          : Boolean := False;
      C2STOPF        : Boolean := False;
      --  unspecified
      Reserved_12_12 : HAL.Bit := 16#0#;
      CRPF           : Boolean := False;
      C1DS           : Boolean := False;
      C2DS           : Boolean := False;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
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

end STM32_SVD.PWR;
