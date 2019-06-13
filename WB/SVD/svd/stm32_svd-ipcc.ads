--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.IPCC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   type C1CR_Register is record
      RXOIE          : Boolean := False;
      --  unspecified
      Reserved_1_15  : HAL.UInt15 := 16#0#;
      TXFIE          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1CR_Register use record
      RXOIE          at 0 range 0 .. 0;
      Reserved_1_15  at 0 range 1 .. 15;
      TXFIE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  C1MR_CHOM array
   type C1MR_CHOM_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C1MR_CHOM
   type C1MR_CHOM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHOM as a value
            Val : HAL.UInt6;
         when True =>
            --  CHOM as an array
            Arr : C1MR_CHOM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C1MR_CHOM_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  C1MR_CHFM array
   type C1MR_CHFM_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C1MR_CHFM
   type C1MR_CHFM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHFM as a value
            Val : HAL.UInt6;
         when True =>
            --  CHFM as an array
            Arr : C1MR_CHFM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C1MR_CHFM_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   type C1MR_Register is record
      CHOM           : C1MR_CHOM_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_15  : HAL.UInt10 := 16#0#;
      CHFM           : C1MR_CHFM_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1MR_Register use record
      CHOM           at 0 range 0 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      CHFM           at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  C1SCR_CHC array
   type C1SCR_CHC_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C1SCR_CHC
   type C1SCR_CHC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHC as a value
            Val : HAL.UInt6;
         when True =>
            --  CHC as an array
            Arr : C1SCR_CHC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C1SCR_CHC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  C1SCR_CHS array
   type C1SCR_CHS_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C1SCR_CHS
   type C1SCR_CHS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHS as a value
            Val : HAL.UInt6;
         when True =>
            --  CHS as an array
            Arr : C1SCR_CHS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C1SCR_CHS_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   type C1SCR_Register is record
      CHC            : C1SCR_CHC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_15  : HAL.UInt10 := 16#0#;
      CHS            : C1SCR_CHS_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1SCR_Register use record
      CHC            at 0 range 0 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      CHS            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  C1TOC2SR_CHF array
   type C1TOC2SR_CHF_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C1TOC2SR_CHF
   type C1TOC2SR_CHF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHF as a value
            Val : HAL.UInt6;
         when True =>
            --  CHF as an array
            Arr : C1TOC2SR_CHF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C1TOC2SR_CHF_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   type C1TOC2SR_Register is record
      CHF           : C1TOC2SR_CHF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C1TOC2SR_Register use record
      CHF           at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   type C2CR_Register is record
      RXOIE          : Boolean := False;
      --  unspecified
      Reserved_1_15  : HAL.UInt15 := 16#0#;
      TXFIE          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2CR_Register use record
      RXOIE          at 0 range 0 .. 0;
      Reserved_1_15  at 0 range 1 .. 15;
      TXFIE          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  C2MR_CHOM array
   type C2MR_CHOM_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C2MR_CHOM
   type C2MR_CHOM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHOM as a value
            Val : HAL.UInt6;
         when True =>
            --  CHOM as an array
            Arr : C2MR_CHOM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C2MR_CHOM_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  C2MR_CHFM array
   type C2MR_CHFM_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C2MR_CHFM
   type C2MR_CHFM_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHFM as a value
            Val : HAL.UInt6;
         when True =>
            --  CHFM as an array
            Arr : C2MR_CHFM_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C2MR_CHFM_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   type C2MR_Register is record
      CHOM           : C2MR_CHOM_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_15  : HAL.UInt10 := 16#0#;
      CHFM           : C2MR_CHFM_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2MR_Register use record
      CHOM           at 0 range 0 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      CHFM           at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  C2SCR_CHC array
   type C2SCR_CHC_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C2SCR_CHC
   type C2SCR_CHC_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHC as a value
            Val : HAL.UInt6;
         when True =>
            --  CHC as an array
            Arr : C2SCR_CHC_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C2SCR_CHC_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   --  C2SCR_CHS array
   type C2SCR_CHS_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C2SCR_CHS
   type C2SCR_CHS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHS as a value
            Val : HAL.UInt6;
         when True =>
            --  CHS as an array
            Arr : C2SCR_CHS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C2SCR_CHS_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   type C2SCR_Register is record
      CHC            : C2SCR_CHC_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_15  : HAL.UInt10 := 16#0#;
      CHS            : C2SCR_CHS_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2SCR_Register use record
      CHC            at 0 range 0 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      CHS            at 0 range 16 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  C2TOC1SR_CHF array
   type C2TOC1SR_CHF_Field_Array is array (1 .. 6) of Boolean
     with Component_Size => 1, Size => 6;

   --  Type definition for C2TOC1SR_CHF
   type C2TOC1SR_CHF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CHF as a value
            Val : HAL.UInt6;
         when True =>
            --  CHF as an array
            Arr : C2TOC1SR_CHF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 6;

   for C2TOC1SR_CHF_Field use record
      Val at 0 range 0 .. 5;
      Arr at 0 range 0 .. 5;
   end record;

   type C2TOC1SR_Register is record
      CHF           : C2TOC1SR_CHF_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for C2TOC1SR_Register use record
      CHF           at 0 range 0 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type IPCC_Peripheral is record
      C1CR     : aliased C1CR_Register;
      C1MR     : aliased C1MR_Register;
      C1SCR    : aliased C1SCR_Register;
      C1TOC2SR : aliased C1TOC2SR_Register;
      C2CR     : aliased C2CR_Register;
      C2MR     : aliased C2MR_Register;
      C2SCR    : aliased C2SCR_Register;
      C2TOC1SR : aliased C2TOC1SR_Register;
   end record
     with Volatile;

   for IPCC_Peripheral use record
      C1CR     at 16#0# range 0 .. 31;
      C1MR     at 16#4# range 0 .. 31;
      C1SCR    at 16#8# range 0 .. 31;
      C1TOC2SR at 16#C# range 0 .. 31;
      C2CR     at 16#10# range 0 .. 31;
      C2MR     at 16#14# range 0 .. 31;
      C2SCR    at 16#18# range 0 .. 31;
      C2TOC1SR at 16#1C# range 0 .. 31;
   end record;

   IPCC_Periph : aliased IPCC_Peripheral
     with Import, Address => System'To_Address (16#58000C00#);

end STM32_SVD.IPCC;
