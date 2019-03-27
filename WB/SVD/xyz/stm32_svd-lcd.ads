--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.LCD is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype CR_DUTY_Field is HAL.UInt3;
   subtype CR_BIAS_Field is HAL.UInt2;

   type CR_Register is record
      LCDEN         : Boolean := False;
      VSEL          : Boolean := False;
      DUTY          : CR_DUTY_Field := 16#0#;
      BIAS          : CR_BIAS_Field := 16#0#;
      MUX_SEG       : Boolean := False;
      BUFEN         : Boolean := False;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      LCDEN         at 0 range 0 .. 0;
      VSEL          at 0 range 1 .. 1;
      DUTY          at 0 range 2 .. 4;
      BIAS          at 0 range 5 .. 6;
      MUX_SEG       at 0 range 7 .. 7;
      BUFEN         at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype FCR_PON_Field is HAL.UInt3;
   subtype FCR_DEAD_Field is HAL.UInt3;
   subtype FCR_CC_Field is HAL.UInt3;
   subtype FCR_BLINKF_Field is HAL.UInt3;
   subtype FCR_BLINK_Field is HAL.UInt2;
   subtype FCR_DIV_Field is HAL.UInt4;
   subtype FCR_PS_Field is HAL.UInt4;

   type FCR_Register is record
      HD             : Boolean := False;
      SOFIE          : Boolean := False;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      UDDIE          : Boolean := False;
      PON            : FCR_PON_Field := 16#0#;
      DEAD           : FCR_DEAD_Field := 16#0#;
      CC             : FCR_CC_Field := 16#0#;
      BLINKF         : FCR_BLINKF_Field := 16#0#;
      BLINK          : FCR_BLINK_Field := 16#0#;
      DIV            : FCR_DIV_Field := 16#0#;
      PS             : FCR_PS_Field := 16#0#;
      --  unspecified
      Reserved_26_31 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for FCR_Register use record
      HD             at 0 range 0 .. 0;
      SOFIE          at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      UDDIE          at 0 range 3 .. 3;
      PON            at 0 range 4 .. 6;
      DEAD           at 0 range 7 .. 9;
      CC             at 0 range 10 .. 12;
      BLINKF         at 0 range 13 .. 15;
      BLINK          at 0 range 16 .. 17;
      DIV            at 0 range 18 .. 21;
      PS             at 0 range 22 .. 25;
      Reserved_26_31 at 0 range 26 .. 31;
   end record;

   type SR_Register is record
      ENS           : Boolean := False;
      SOF           : Boolean := False;
      UDR           : Boolean := False;
      UDD           : Boolean := False;
      RDY           : Boolean := False;
      FCRSF         : Boolean := False;
      --  unspecified
      Reserved_6_31 : HAL.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      ENS           at 0 range 0 .. 0;
      SOF           at 0 range 1 .. 1;
      UDR           at 0 range 2 .. 2;
      UDD           at 0 range 3 .. 3;
      RDY           at 0 range 4 .. 4;
      FCRSF         at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   type CLR_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      SOFC          : Boolean := False;
      --  unspecified
      Reserved_2_2  : HAL.Bit := 16#0#;
      UDDC          : Boolean := False;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      SOFC          at 0 range 1 .. 1;
      Reserved_2_2  at 0 range 2 .. 2;
      UDDC          at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  RAM0A_S array
   type RAM0A_S_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   type RAM0A_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt32;
         when True =>
            --  S as an array
            Arr : RAM0A_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for RAM0A_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  RAM0B_S array
   type RAM0B_S_Field_Array is array (32 .. 43) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for RAM0B_S
   type RAM0B_S_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt12;
         when True =>
            --  S as an array
            Arr : RAM0B_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for RAM0B_S_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   type RAM0B_Register is record
      S              : RAM0B_S_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM0B_Register use record
      S              at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  RAM1A_S array
   type RAM1A_S_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   type RAM1A_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt32;
         when True =>
            --  S as an array
            Arr : RAM1A_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for RAM1A_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  RAM1B_S array
   type RAM1B_S_Field_Array is array (32 .. 43) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for RAM1B_S
   type RAM1B_S_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt12;
         when True =>
            --  S as an array
            Arr : RAM1B_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for RAM1B_S_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   type RAM1B_Register is record
      S              : RAM1B_S_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM1B_Register use record
      S              at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  RAM2A_S array
   type RAM2A_S_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   type RAM2A_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt32;
         when True =>
            --  S as an array
            Arr : RAM2A_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for RAM2A_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  RAM2B_S array
   type RAM2B_S_Field_Array is array (32 .. 43) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for RAM2B_S
   type RAM2B_S_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt12;
         when True =>
            --  S as an array
            Arr : RAM2B_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for RAM2B_S_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   type RAM2B_Register is record
      S              : RAM2B_S_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM2B_Register use record
      S              at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  RAM3A_S array
   type RAM3A_S_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   type RAM3A_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt32;
         when True =>
            --  S as an array
            Arr : RAM3A_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for RAM3A_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  RAM3B_S array
   type RAM3B_S_Field_Array is array (32 .. 43) of Boolean
     with Component_Size => 1, Size => 12;

   --  Type definition for RAM3B_S
   type RAM3B_S_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt12;
         when True =>
            --  S as an array
            Arr : RAM3B_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 12;

   for RAM3B_S_Field use record
      Val at 0 range 0 .. 11;
      Arr at 0 range 0 .. 11;
   end record;

   type RAM3B_Register is record
      S              : RAM3B_S_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM3B_Register use record
      S              at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  RAM4A_S array
   type RAM4A_S_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   type RAM4A_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt32;
         when True =>
            --  S as an array
            Arr : RAM4A_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for RAM4A_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  RAM4B_S array
   type RAM4B_S_Field_Array is array (32 .. 39) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RAM4B_S
   type RAM4B_S_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt8;
         when True =>
            --  S as an array
            Arr : RAM4B_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RAM4B_S_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   type RAM4B_Register is record
      S             : RAM4B_S_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM4B_Register use record
      S             at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  RAM5A_S array
   type RAM5A_S_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   type RAM5A_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt32;
         when True =>
            --  S as an array
            Arr : RAM5A_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for RAM5A_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  RAM5B_S array
   type RAM5B_S_Field_Array is array (32 .. 39) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RAM5B_S
   type RAM5B_S_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt8;
         when True =>
            --  S as an array
            Arr : RAM5B_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RAM5B_S_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   type RAM5B_Register is record
      S             : RAM5B_S_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM5B_Register use record
      S             at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  RAM6A_S array
   type RAM6A_S_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   type RAM6A_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt32;
         when True =>
            --  S as an array
            Arr : RAM6A_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for RAM6A_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  RAM6B_S array
   type RAM6B_S_Field_Array is array (32 .. 39) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RAM6B_S
   type RAM6B_S_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt8;
         when True =>
            --  S as an array
            Arr : RAM6B_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RAM6B_S_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   type RAM6B_Register is record
      S             : RAM6B_S_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM6B_Register use record
      S             at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   --  RAM7A_S array
   type RAM7A_S_Field_Array is array (0 .. 31) of Boolean
     with Component_Size => 1, Size => 32;

   type RAM7A_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt32;
         when True =>
            --  S as an array
            Arr : RAM7A_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access,
          Bit_Order => System.Low_Order_First;

   for RAM7A_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  RAM7B_S array
   type RAM7B_S_Field_Array is array (32 .. 39) of Boolean
     with Component_Size => 1, Size => 8;

   --  Type definition for RAM7B_S
   type RAM7B_S_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  S as a value
            Val : HAL.UInt8;
         when True =>
            --  S as an array
            Arr : RAM7B_S_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for RAM7B_S_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   type RAM7B_Register is record
      S             : RAM7B_S_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RAM7B_Register use record
      S             at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type LCD_Peripheral is record
      CR    : aliased CR_Register;
      FCR   : aliased FCR_Register;
      SR    : aliased SR_Register;
      CLR   : aliased CLR_Register;
      RAM0A : aliased RAM0A_Register;
      RAM0B : aliased RAM0B_Register;
      RAM1A : aliased RAM1A_Register;
      RAM1B : aliased RAM1B_Register;
      RAM2A : aliased RAM2A_Register;
      RAM2B : aliased RAM2B_Register;
      RAM3A : aliased RAM3A_Register;
      RAM3B : aliased RAM3B_Register;
      RAM4A : aliased RAM4A_Register;
      RAM4B : aliased RAM4B_Register;
      RAM5A : aliased RAM5A_Register;
      RAM5B : aliased RAM5B_Register;
      RAM6A : aliased RAM6A_Register;
      RAM6B : aliased RAM6B_Register;
      RAM7A : aliased RAM7A_Register;
      RAM7B : aliased RAM7B_Register;
   end record
     with Volatile;

   for LCD_Peripheral use record
      CR    at 16#0# range 0 .. 31;
      FCR   at 16#4# range 0 .. 31;
      SR    at 16#8# range 0 .. 31;
      CLR   at 16#C# range 0 .. 31;
      RAM0A at 16#14# range 0 .. 31;
      RAM0B at 16#18# range 0 .. 31;
      RAM1A at 16#1C# range 0 .. 31;
      RAM1B at 16#20# range 0 .. 31;
      RAM2A at 16#24# range 0 .. 31;
      RAM2B at 16#28# range 0 .. 31;
      RAM3A at 16#2C# range 0 .. 31;
      RAM3B at 16#30# range 0 .. 31;
      RAM4A at 16#34# range 0 .. 31;
      RAM4B at 16#38# range 0 .. 31;
      RAM5A at 16#3C# range 0 .. 31;
      RAM5B at 16#40# range 0 .. 31;
      RAM6A at 16#44# range 0 .. 31;
      RAM6B at 16#48# range 0 .. 31;
      RAM7A at 16#4C# range 0 .. 31;
      RAM7B at 16#50# range 0 .. 31;
   end record;

   LCD_Periph : aliased LCD_Peripheral
     with Import, Address => System'To_Address (16#40002400#);

end STM32_SVD.LCD;
