--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.GPIO is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  MODER_MODE array element
   subtype MODER_MODE_Element is HAL.UInt2;

   --  MODER_MODE array
   type MODER_MODE_Field_Array is array (0 .. 15) of MODER_MODE_Element
     with Component_Size => 2, Size => 32;

   type MODER_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  MODE as a value
            Val : HAL.UInt32;
         when True =>
            --  MODE as an array
            Arr : MODER_MODE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for MODER_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  OTYPER_OT array
   type OTYPER_OT_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for OTYPER_OT
   type OTYPER_OT_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OT as a value
            Val : HAL.UInt16;
         when True =>
            --  OT as an array
            Arr : OTYPER_OT_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for OTYPER_OT_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type OTYPER_Register is record
      OT             : OTYPER_OT_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for OTYPER_Register use record
      OT             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  OSPEEDR_OSPEED array element
   subtype OSPEEDR_OSPEED_Element is HAL.UInt2;

   --  OSPEEDR_OSPEED array
   type OSPEEDR_OSPEED_Field_Array is array (0 .. 15)
     of OSPEEDR_OSPEED_Element
     with Component_Size => 2, Size => 32;

   type OSPEEDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OSPEED as a value
            Val : HAL.UInt32;
         when True =>
            --  OSPEED as an array
            Arr : OSPEEDR_OSPEED_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for OSPEEDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  PUPDR_PUPD array element
   subtype PUPDR_PUPD_Element is HAL.UInt2;

   --  PUPDR_PUPD array
   type PUPDR_PUPD_Field_Array is array (0 .. 15) of PUPDR_PUPD_Element
     with Component_Size => 2, Size => 32;

   type PUPDR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  PUPD as a value
            Val : HAL.UInt32;
         when True =>
            --  PUPD as an array
            Arr : PUPDR_PUPD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for PUPDR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  IDR_ID array
   type IDR_ID_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for IDR_ID
   type IDR_ID_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ID as a value
            Val : HAL.UInt16;
         when True =>
            --  ID as an array
            Arr : IDR_ID_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for IDR_ID_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type IDR_Register is record
      ID             : IDR_ID_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDR_Register use record
      ID             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  ODR_OD array
   type ODR_OD_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for ODR_OD
   type ODR_OD_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  OD as a value
            Val : HAL.UInt16;
         when True =>
            --  OD as an array
            Arr : ODR_OD_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for ODR_OD_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type ODR_Register is record
      OD             : ODR_OD_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for ODR_Register use record
      OD             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  BSRR_BS array
   type BSRR_BS_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for BSRR_BS
   type BSRR_BS_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BS as a value
            Val : HAL.UInt16;
         when True =>
            --  BS as an array
            Arr : BSRR_BS_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for BSRR_BS_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  BSRR_BR array
   type BSRR_BR_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for BSRR_BR
   type BSRR_BR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BR as a value
            Val : HAL.UInt16;
         when True =>
            --  BR as an array
            Arr : BSRR_BR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for BSRR_BR_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type BSRR_Register is record
      BS : BSRR_BS_Field := (As_Array => False, Val => 16#0#);
      BR : BSRR_BR_Field := (As_Array => False, Val => 16#0#);
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BSRR_Register use record
      BS at 0 range 0 .. 15;
      BR at 0 range 16 .. 31;
   end record;

   --  LCKR_LCK array
   type LCKR_LCK_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for LCKR_LCK
   type LCKR_LCK_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  LCK as a value
            Val : HAL.UInt16;
         when True =>
            --  LCK as an array
            Arr : LCKR_LCK_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for LCKR_LCK_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type LCKR_Register is record
      LCK            : LCKR_LCK_Field := (As_Array => False, Val => 16#0#);
      LCKK           : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for LCKR_Register use record
      LCK            at 0 range 0 .. 15;
      LCKK           at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  AFRL_AFSEL array element
   subtype AFRL_AFSEL_Element is HAL.UInt4;

   --  AFRL_AFSEL array
   type AFRL_AFSEL_Field_Array is array (0 .. 7) of AFRL_AFSEL_Element
     with Component_Size => 4, Size => 32;

   type AFRL_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  AFSEL as a value
            Val : HAL.UInt32;
         when True =>
            --  AFSEL as an array
            Arr : AFRL_AFSEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for AFRL_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  AFRH_AFSEL array element
   subtype AFRH_AFSEL_Element is HAL.UInt4;

   --  AFRH_AFSEL array
   type AFRH_AFSEL_Field_Array is array (8 .. 15) of AFRH_AFSEL_Element
     with Component_Size => 4, Size => 32;

   type AFRH_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  AFSEL as a value
            Val : HAL.UInt32;
         when True =>
            --  AFSEL as an array
            Arr : AFRH_AFSEL_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for AFRH_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  BRR_BR array
   type BRR_BR_Field_Array is array (0 .. 15) of Boolean
     with Component_Size => 1, Size => 16;

   --  Type definition for BRR_BR
   type BRR_BR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  BR as a value
            Val : HAL.UInt16;
         when True =>
            --  BR as an array
            Arr : BRR_BR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for BRR_BR_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   type BRR_Register is record
      BR             : BRR_BR_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for BRR_Register use record
      BR             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type GPIO_Peripheral is record
      MODER   : aliased MODER_Register;
      OTYPER  : aliased OTYPER_Register;
      OSPEEDR : aliased OSPEEDR_Register;
      PUPDR   : aliased PUPDR_Register;
      IDR     : aliased IDR_Register;
      ODR     : aliased ODR_Register;
      BSRR    : aliased BSRR_Register;
      LCKR    : aliased LCKR_Register;
      AFRL    : aliased AFRL_Register;
      AFRH    : aliased AFRH_Register;
      BRR     : aliased BRR_Register;
   end record
     with Volatile;

   for GPIO_Peripheral use record
      MODER   at 16#0# range 0 .. 31;
      OTYPER  at 16#4# range 0 .. 31;
      OSPEEDR at 16#8# range 0 .. 31;
      PUPDR   at 16#C# range 0 .. 31;
      IDR     at 16#10# range 0 .. 31;
      ODR     at 16#14# range 0 .. 31;
      BSRR    at 16#18# range 0 .. 31;
      LCKR    at 16#1C# range 0 .. 31;
      AFRL    at 16#20# range 0 .. 31;
      AFRH    at 16#24# range 0 .. 31;
      BRR     at 16#28# range 0 .. 31;
   end record;

   GPIOA_Periph : aliased GPIO_Peripheral
     with Import, Address => System'To_Address (16#48000000#);

   GPIOB_Periph : aliased GPIO_Peripheral
     with Import, Address => System'To_Address (16#48000400#);

   GPIOC_Periph : aliased GPIO_Peripheral
     with Import, Address => System'To_Address (16#48000800#);

   GPIOD_Periph : aliased GPIO_Peripheral
     with Import, Address => System'To_Address (16#48000C00#);

   GPIOE_Periph : aliased GPIO_Peripheral
     with Import, Address => System'To_Address (16#48001000#);

   GPIOH_Periph : aliased GPIO_Peripheral
     with Import, Address => System'To_Address (16#48001C00#);

end STM32_SVD.GPIO;
