--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.SYSCFG is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype MEMRMP_MEM_MODE_Field is Interfaces.Bit_Types.UInt3;

   type MEMRMP_Register is record
      MEM_MODE      : MEMRMP_MEM_MODE_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : Interfaces.Bit_Types.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MEMRMP_Register use record
      MEM_MODE      at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype CFGR1_BOOSTEN_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR1_I2C_PB6_FMP_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR1_I2C_PB7_FMP_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR1_I2C_PB8_FMP_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR1_I2C_PB9_FMP_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR1_I2C1_FMP_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR1_I2C3_FMP_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR1_FPU_IE_Field is Interfaces.Bit_Types.UInt6;

   type CFGR1_Register is record
      --  unspecified
      Reserved_0_7   : Interfaces.Bit_Types.Byte := 16#0#;
      BOOSTEN        : CFGR1_BOOSTEN_Field := 16#0#;
      --  unspecified
      Reserved_9_15  : Interfaces.Bit_Types.UInt7 := 16#0#;
      I2C_PB6_FMP    : CFGR1_I2C_PB6_FMP_Field := 16#0#;
      I2C_PB7_FMP    : CFGR1_I2C_PB7_FMP_Field := 16#0#;
      I2C_PB8_FMP    : CFGR1_I2C_PB8_FMP_Field := 16#0#;
      I2C_PB9_FMP    : CFGR1_I2C_PB9_FMP_Field := 16#0#;
      I2C1_FMP       : CFGR1_I2C1_FMP_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : Interfaces.Bit_Types.Bit := 16#0#;
      I2C3_FMP       : CFGR1_I2C3_FMP_Field := 16#0#;
      --  unspecified
      Reserved_23_25 : Interfaces.Bit_Types.UInt3 := 16#0#;
      FPU_IE         : CFGR1_FPU_IE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR1_Register use record
      Reserved_0_7   at 0 range 0 .. 7;
      BOOSTEN        at 0 range 8 .. 8;
      Reserved_9_15  at 0 range 9 .. 15;
      I2C_PB6_FMP    at 0 range 16 .. 16;
      I2C_PB7_FMP    at 0 range 17 .. 17;
      I2C_PB8_FMP    at 0 range 18 .. 18;
      I2C_PB9_FMP    at 0 range 19 .. 19;
      I2C1_FMP       at 0 range 20 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      I2C3_FMP       at 0 range 22 .. 22;
      Reserved_23_25 at 0 range 23 .. 25;
      FPU_IE         at 0 range 26 .. 31;
   end record;

   subtype EXTICR1_EXTI0_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR1_EXTI1_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR1_EXTI2_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR1_EXTI3_Field is Interfaces.Bit_Types.UInt3;

   type EXTICR1_Register is record
      EXTI0          : EXTICR1_EXTI0_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI1          : EXTICR1_EXTI1_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI2          : EXTICR1_EXTI2_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI3          : EXTICR1_EXTI3_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.Bit_Types.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR1_Register use record
      EXTI0          at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      EXTI1          at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      EXTI2          at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      EXTI3          at 0 range 12 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype EXTICR2_EXTI4_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR2_EXTI5_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR2_EXTI6_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR2_EXTI7_Field is Interfaces.Bit_Types.UInt3;

   type EXTICR2_Register is record
      EXTI4          : EXTICR2_EXTI4_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI5          : EXTICR2_EXTI5_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI6          : EXTICR2_EXTI6_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI7          : EXTICR2_EXTI7_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.Bit_Types.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR2_Register use record
      EXTI4          at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      EXTI5          at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      EXTI6          at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      EXTI7          at 0 range 12 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype EXTICR3_EXTI8_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR3_EXTI9_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR3_EXTI10_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR3_EXTI11_Field is Interfaces.Bit_Types.UInt3;

   type EXTICR3_Register is record
      EXTI8          : EXTICR3_EXTI8_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI9          : EXTICR3_EXTI9_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI10         : EXTICR3_EXTI10_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI11         : EXTICR3_EXTI11_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.Bit_Types.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR3_Register use record
      EXTI8          at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      EXTI9          at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      EXTI10         at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      EXTI11         at 0 range 12 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype EXTICR4_EXTI12_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR4_EXTI13_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR4_EXTI14_Field is Interfaces.Bit_Types.UInt3;
   subtype EXTICR4_EXTI15_Field is Interfaces.Bit_Types.UInt3;

   type EXTICR4_Register is record
      EXTI12         : EXTICR4_EXTI12_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI13         : EXTICR4_EXTI13_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI14         : EXTICR4_EXTI14_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : Interfaces.Bit_Types.Bit := 16#0#;
      EXTI15         : EXTICR4_EXTI15_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : Interfaces.Bit_Types.UInt17 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for EXTICR4_Register use record
      EXTI12         at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      EXTI13         at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      EXTI14         at 0 range 8 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      EXTI15         at 0 range 12 .. 14;
      Reserved_15_31 at 0 range 15 .. 31;
   end record;

   subtype SCSR_SRAM2ER_Field is Interfaces.Bit_Types.Bit;
   subtype SCSR_SRAM2BSY_Field is Interfaces.Bit_Types.Bit;
   subtype SCSR_C2RFD_Field is Interfaces.Bit_Types.Bit;

   type SCSR_Register is record
      SRAM2ER       : SCSR_SRAM2ER_Field := 16#0#;
      SRAM2BSY      : SCSR_SRAM2BSY_Field := 16#0#;
      --  unspecified
      Reserved_2_30 : Interfaces.Bit_Types.UInt29 := 16#0#;
      C2RFD         : SCSR_C2RFD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCSR_Register use record
      SRAM2ER       at 0 range 0 .. 0;
      SRAM2BSY      at 0 range 1 .. 1;
      Reserved_2_30 at 0 range 2 .. 30;
      C2RFD         at 0 range 31 .. 31;
   end record;

   subtype CFGR2_CLL_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR2_SPL_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR2_PVDL_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR2_ECCL_Field is Interfaces.Bit_Types.Bit;
   subtype CFGR2_SPF_Field is Interfaces.Bit_Types.Bit;

   type CFGR2_Register is record
      CLL           : CFGR2_CLL_Field := 16#0#;
      SPL           : CFGR2_SPL_Field := 16#0#;
      PVDL          : CFGR2_PVDL_Field := 16#0#;
      ECCL          : CFGR2_ECCL_Field := 16#0#;
      --  unspecified
      Reserved_4_7  : Interfaces.Bit_Types.UInt4 := 16#0#;
      SPF           : CFGR2_SPF_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : Interfaces.Bit_Types.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGR2_Register use record
      CLL           at 0 range 0 .. 0;
      SPL           at 0 range 1 .. 1;
      PVDL          at 0 range 2 .. 2;
      ECCL          at 0 range 3 .. 3;
      Reserved_4_7  at 0 range 4 .. 7;
      SPF           at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype SWPR_P0WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P1WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P2WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P3WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P4WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P5WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P6WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P7WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P8WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P9WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P10WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P11WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P12WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P13WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P14WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P15WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P16WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P17WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P18WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P19WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P20WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P21WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P22WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P23WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P24WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P25WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P26WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P27WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P28WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P29WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P30WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR_P31WP_Field is Interfaces.Bit_Types.Bit;

   type SWPR_Register is record
      P0WP  : SWPR_P0WP_Field := 16#0#;
      P1WP  : SWPR_P1WP_Field := 16#0#;
      P2WP  : SWPR_P2WP_Field := 16#0#;
      P3WP  : SWPR_P3WP_Field := 16#0#;
      P4WP  : SWPR_P4WP_Field := 16#0#;
      P5WP  : SWPR_P5WP_Field := 16#0#;
      P6WP  : SWPR_P6WP_Field := 16#0#;
      P7WP  : SWPR_P7WP_Field := 16#0#;
      P8WP  : SWPR_P8WP_Field := 16#0#;
      P9WP  : SWPR_P9WP_Field := 16#0#;
      P10WP : SWPR_P10WP_Field := 16#0#;
      P11WP : SWPR_P11WP_Field := 16#0#;
      P12WP : SWPR_P12WP_Field := 16#0#;
      P13WP : SWPR_P13WP_Field := 16#0#;
      P14WP : SWPR_P14WP_Field := 16#0#;
      P15WP : SWPR_P15WP_Field := 16#0#;
      P16WP : SWPR_P16WP_Field := 16#0#;
      P17WP : SWPR_P17WP_Field := 16#0#;
      P18WP : SWPR_P18WP_Field := 16#0#;
      P19WP : SWPR_P19WP_Field := 16#0#;
      P20WP : SWPR_P20WP_Field := 16#0#;
      P21WP : SWPR_P21WP_Field := 16#0#;
      P22WP : SWPR_P22WP_Field := 16#0#;
      P23WP : SWPR_P23WP_Field := 16#0#;
      P24WP : SWPR_P24WP_Field := 16#0#;
      P25WP : SWPR_P25WP_Field := 16#0#;
      P26WP : SWPR_P26WP_Field := 16#0#;
      P27WP : SWPR_P27WP_Field := 16#0#;
      P28WP : SWPR_P28WP_Field := 16#0#;
      P29WP : SWPR_P29WP_Field := 16#0#;
      P30WP : SWPR_P30WP_Field := 16#0#;
      P31WP : SWPR_P31WP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SWPR_Register use record
      P0WP  at 0 range 0 .. 0;
      P1WP  at 0 range 1 .. 1;
      P2WP  at 0 range 2 .. 2;
      P3WP  at 0 range 3 .. 3;
      P4WP  at 0 range 4 .. 4;
      P5WP  at 0 range 5 .. 5;
      P6WP  at 0 range 6 .. 6;
      P7WP  at 0 range 7 .. 7;
      P8WP  at 0 range 8 .. 8;
      P9WP  at 0 range 9 .. 9;
      P10WP at 0 range 10 .. 10;
      P11WP at 0 range 11 .. 11;
      P12WP at 0 range 12 .. 12;
      P13WP at 0 range 13 .. 13;
      P14WP at 0 range 14 .. 14;
      P15WP at 0 range 15 .. 15;
      P16WP at 0 range 16 .. 16;
      P17WP at 0 range 17 .. 17;
      P18WP at 0 range 18 .. 18;
      P19WP at 0 range 19 .. 19;
      P20WP at 0 range 20 .. 20;
      P21WP at 0 range 21 .. 21;
      P22WP at 0 range 22 .. 22;
      P23WP at 0 range 23 .. 23;
      P24WP at 0 range 24 .. 24;
      P25WP at 0 range 25 .. 25;
      P26WP at 0 range 26 .. 26;
      P27WP at 0 range 27 .. 27;
      P28WP at 0 range 28 .. 28;
      P29WP at 0 range 29 .. 29;
      P30WP at 0 range 30 .. 30;
      P31WP at 0 range 31 .. 31;
   end record;

   subtype SKR_KEY_Field is Interfaces.Bit_Types.Byte;

   type SKR_Register is record
      KEY           : SKR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SKR_Register use record
      KEY           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SWPR2_P32WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P33WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P34WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P35WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P36WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P37WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P38WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P39WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P40WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P41WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P42WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P43WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P44WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P45WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P46WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P47WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P48WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P49WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P50WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P51WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P52WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P53WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P54WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P55WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P56WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P57WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P58WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P59WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P60WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P61WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P62WP_Field is Interfaces.Bit_Types.Bit;
   subtype SWPR2_P63WP_Field is Interfaces.Bit_Types.Bit;

   type SWPR2_Register is record
      P32WP : SWPR2_P32WP_Field := 16#0#;
      P33WP : SWPR2_P33WP_Field := 16#0#;
      P34WP : SWPR2_P34WP_Field := 16#0#;
      P35WP : SWPR2_P35WP_Field := 16#0#;
      P36WP : SWPR2_P36WP_Field := 16#0#;
      P37WP : SWPR2_P37WP_Field := 16#0#;
      P38WP : SWPR2_P38WP_Field := 16#0#;
      P39WP : SWPR2_P39WP_Field := 16#0#;
      P40WP : SWPR2_P40WP_Field := 16#0#;
      P41WP : SWPR2_P41WP_Field := 16#0#;
      P42WP : SWPR2_P42WP_Field := 16#0#;
      P43WP : SWPR2_P43WP_Field := 16#0#;
      P44WP : SWPR2_P44WP_Field := 16#0#;
      P45WP : SWPR2_P45WP_Field := 16#0#;
      P46WP : SWPR2_P46WP_Field := 16#0#;
      P47WP : SWPR2_P47WP_Field := 16#0#;
      P48WP : SWPR2_P48WP_Field := 16#0#;
      P49WP : SWPR2_P49WP_Field := 16#0#;
      P50WP : SWPR2_P50WP_Field := 16#0#;
      P51WP : SWPR2_P51WP_Field := 16#0#;
      P52WP : SWPR2_P52WP_Field := 16#0#;
      P53WP : SWPR2_P53WP_Field := 16#0#;
      P54WP : SWPR2_P54WP_Field := 16#0#;
      P55WP : SWPR2_P55WP_Field := 16#0#;
      P56WP : SWPR2_P56WP_Field := 16#0#;
      P57WP : SWPR2_P57WP_Field := 16#0#;
      P58WP : SWPR2_P58WP_Field := 16#0#;
      P59WP : SWPR2_P59WP_Field := 16#0#;
      P60WP : SWPR2_P60WP_Field := 16#0#;
      P61WP : SWPR2_P61WP_Field := 16#0#;
      P62WP : SWPR2_P62WP_Field := 16#0#;
      P63WP : SWPR2_P63WP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SWPR2_Register use record
      P32WP at 0 range 0 .. 0;
      P33WP at 0 range 1 .. 1;
      P34WP at 0 range 2 .. 2;
      P35WP at 0 range 3 .. 3;
      P36WP at 0 range 4 .. 4;
      P37WP at 0 range 5 .. 5;
      P38WP at 0 range 6 .. 6;
      P39WP at 0 range 7 .. 7;
      P40WP at 0 range 8 .. 8;
      P41WP at 0 range 9 .. 9;
      P42WP at 0 range 10 .. 10;
      P43WP at 0 range 11 .. 11;
      P44WP at 0 range 12 .. 12;
      P45WP at 0 range 13 .. 13;
      P46WP at 0 range 14 .. 14;
      P47WP at 0 range 15 .. 15;
      P48WP at 0 range 16 .. 16;
      P49WP at 0 range 17 .. 17;
      P50WP at 0 range 18 .. 18;
      P51WP at 0 range 19 .. 19;
      P52WP at 0 range 20 .. 20;
      P53WP at 0 range 21 .. 21;
      P54WP at 0 range 22 .. 22;
      P55WP at 0 range 23 .. 23;
      P56WP at 0 range 24 .. 24;
      P57WP at 0 range 25 .. 25;
      P58WP at 0 range 26 .. 26;
      P59WP at 0 range 27 .. 27;
      P60WP at 0 range 28 .. 28;
      P61WP at 0 range 29 .. 29;
      P62WP at 0 range 30 .. 30;
      P63WP at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   type SYSCFG_Peripheral is record
      MEMRMP  : aliased MEMRMP_Register;
      CFGR1   : aliased CFGR1_Register;
      EXTICR1 : aliased EXTICR1_Register;
      EXTICR2 : aliased EXTICR2_Register;
      EXTICR3 : aliased EXTICR3_Register;
      EXTICR4 : aliased EXTICR4_Register;
      SCSR    : aliased SCSR_Register;
      CFGR2   : aliased CFGR2_Register;
      SWPR    : aliased SWPR_Register;
      SKR     : aliased SKR_Register;
      SWPR2   : aliased SWPR2_Register;
   end record
     with Volatile;

   for SYSCFG_Peripheral use record
      MEMRMP  at 16#0# range 0 .. 31;
      CFGR1   at 16#4# range 0 .. 31;
      EXTICR1 at 16#8# range 0 .. 31;
      EXTICR2 at 16#C# range 0 .. 31;
      EXTICR3 at 16#10# range 0 .. 31;
      EXTICR4 at 16#14# range 0 .. 31;
      SCSR    at 16#18# range 0 .. 31;
      CFGR2   at 16#1C# range 0 .. 31;
      SWPR    at 16#20# range 0 .. 31;
      SKR     at 16#24# range 0 .. 31;
      SWPR2   at 16#28# range 0 .. 31;
   end record;

   SYSCFG_Periph : aliased SYSCFG_Peripheral
     with Import, Address => System'To_Address (16#40010000#);

end Interfaces.STM32.SYSCFG;
