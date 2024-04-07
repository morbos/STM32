--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.MPU is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype MPU_TYPER_SEPARATE_Field is Interfaces.Bit_Types.Bit;
   subtype MPU_TYPER_DREGION_Field is Interfaces.Bit_Types.Byte;
   subtype MPU_TYPER_IREGION_Field is Interfaces.Bit_Types.Byte;

   --  MPU type register
   type MPU_TYPER_Register is record
      --  Read-only. Separate flag
      SEPARATE_k     : MPU_TYPER_SEPARATE_Field;
      --  unspecified
      Reserved_1_7   : Interfaces.Bit_Types.UInt7;
      --  Read-only. Number of MPU data regions
      DREGION        : MPU_TYPER_DREGION_Field;
      --  Read-only. Number of MPU instruction regions
      IREGION        : MPU_TYPER_IREGION_Field;
      --  unspecified
      Reserved_24_31 : Interfaces.Bit_Types.Byte;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_TYPER_Register use record
      SEPARATE_k     at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      DREGION        at 0 range 8 .. 15;
      IREGION        at 0 range 16 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype MPU_CTRL_ENABLE_Field is Interfaces.Bit_Types.Bit;
   subtype MPU_CTRL_HFNMIENA_Field is Interfaces.Bit_Types.Bit;
   subtype MPU_CTRL_PRIVDEFENA_Field is Interfaces.Bit_Types.Bit;

   --  MPU control register
   type MPU_CTRL_Register is record
      --  Read-only. Enables the MPU
      ENABLE        : MPU_CTRL_ENABLE_Field;
      --  Read-only. Enables the operation of MPU during hard fault
      HFNMIENA      : MPU_CTRL_HFNMIENA_Field;
      --  Read-only. Enable priviliged software access to default memory map
      PRIVDEFENA    : MPU_CTRL_PRIVDEFENA_Field;
      --  unspecified
      Reserved_3_31 : Interfaces.Bit_Types.UInt29;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      HFNMIENA      at 0 range 1 .. 1;
      PRIVDEFENA    at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype MPU_RNR_REGION_Field is Interfaces.Bit_Types.Byte;

   --  MPU region number register
   type MPU_RNR_Register is record
      --  MPU region
      REGION        : MPU_RNR_REGION_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RNR_Register use record
      REGION        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype MPU_RBAR_REGION_Field is Interfaces.Bit_Types.UInt4;
   subtype MPU_RBAR_VALID_Field is Interfaces.Bit_Types.Bit;
   subtype MPU_RBAR_ADDR_Field is Interfaces.Bit_Types.UInt27;

   --  MPU region base address register
   type MPU_RBAR_Register is record
      --  MPU region field
      REGION : MPU_RBAR_REGION_Field := 16#0#;
      --  MPU region number valid
      VALID  : MPU_RBAR_VALID_Field := 16#0#;
      --  Region base address field
      ADDR   : MPU_RBAR_ADDR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RBAR_Register use record
      REGION at 0 range 0 .. 3;
      VALID  at 0 range 4 .. 4;
      ADDR   at 0 range 5 .. 31;
   end record;

   subtype MPU_RASR_ENABLE_Field is Interfaces.Bit_Types.Bit;
   subtype MPU_RASR_SIZE_Field is Interfaces.Bit_Types.UInt5;
   subtype MPU_RASR_SRD_Field is Interfaces.Bit_Types.Byte;
   subtype MPU_RASR_B_Field is Interfaces.Bit_Types.Bit;
   subtype MPU_RASR_C_Field is Interfaces.Bit_Types.Bit;
   subtype MPU_RASR_S_Field is Interfaces.Bit_Types.Bit;
   subtype MPU_RASR_TEX_Field is Interfaces.Bit_Types.UInt3;
   subtype MPU_RASR_AP_Field is Interfaces.Bit_Types.UInt3;
   subtype MPU_RASR_XN_Field is Interfaces.Bit_Types.Bit;

   --  MPU region attribute and size register
   type MPU_RASR_Register is record
      --  Region enable bit.
      ENABLE         : MPU_RASR_ENABLE_Field := 16#0#;
      --  Size of the MPU protection region
      SIZE           : MPU_RASR_SIZE_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : Interfaces.Bit_Types.UInt2 := 16#0#;
      --  Subregion disable bits
      SRD            : MPU_RASR_SRD_Field := 16#0#;
      --  memory attribute
      B              : MPU_RASR_B_Field := 16#0#;
      --  memory attribute
      C              : MPU_RASR_C_Field := 16#0#;
      --  Shareable memory attribute
      S              : MPU_RASR_S_Field := 16#0#;
      --  memory attribute
      TEX            : MPU_RASR_TEX_Field := 16#0#;
      --  unspecified
      Reserved_22_23 : Interfaces.Bit_Types.UInt2 := 16#0#;
      --  Access permission
      AP             : MPU_RASR_AP_Field := 16#0#;
      --  unspecified
      Reserved_27_27 : Interfaces.Bit_Types.Bit := 16#0#;
      --  Instruction access disable bit
      XN             : MPU_RASR_XN_Field := 16#0#;
      --  unspecified
      Reserved_29_31 : Interfaces.Bit_Types.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RASR_Register use record
      ENABLE         at 0 range 0 .. 0;
      SIZE           at 0 range 1 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      SRD            at 0 range 8 .. 15;
      B              at 0 range 16 .. 16;
      C              at 0 range 17 .. 17;
      S              at 0 range 18 .. 18;
      TEX            at 0 range 19 .. 21;
      Reserved_22_23 at 0 range 22 .. 23;
      AP             at 0 range 24 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      XN             at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Memory protection unit
   type MPU_Peripheral is record
      --  MPU type register
      MPU_TYPER : aliased MPU_TYPER_Register;
      --  MPU control register
      MPU_CTRL  : aliased MPU_CTRL_Register;
      --  MPU region number register
      MPU_RNR   : aliased MPU_RNR_Register;
      --  MPU region base address register
      MPU_RBAR  : aliased MPU_RBAR_Register;
      --  MPU region attribute and size register
      MPU_RASR  : aliased MPU_RASR_Register;
   end record
     with Volatile;

   for MPU_Peripheral use record
      MPU_TYPER at 16#0# range 0 .. 31;
      MPU_CTRL  at 16#4# range 0 .. 31;
      MPU_RNR   at 16#8# range 0 .. 31;
      MPU_RBAR  at 16#C# range 0 .. 31;
      MPU_RASR  at 16#10# range 0 .. 31;
   end record;

   --  Memory protection unit
   MPU_Periph : aliased MPU_Peripheral
     with Import, Address => System'To_Address (16#E000ED90#);

end Interfaces.STM32.MPU;
