--  This spec has been automatically generated from STM32WB55x.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package STM32_SVD.SYSCFG is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype MEMRMP_MEM_MODE_Field is HAL.UInt3;

   type MEMRMP_Register is record
      MEM_MODE      : MEMRMP_MEM_MODE_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MEMRMP_Register use record
      MEM_MODE      at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype CFGR1_FPU_IE_Field is HAL.UInt6;

   type CFGR1_Register is record
      --  unspecified
      Reserved_0_7   : HAL.UInt8 := 16#0#;
      BOOSTEN        : Boolean := False;
      --  unspecified
      Reserved_9_15  : HAL.UInt7 := 16#0#;
      I2C_PB6_FMP    : Boolean := False;
      I2C_PB7_FMP    : Boolean := False;
      I2C_PB8_FMP    : Boolean := False;
      I2C_PB9_FMP    : Boolean := False;
      I2C1_FMP       : Boolean := False;
      --  unspecified
      Reserved_21_21 : HAL.Bit := 16#0#;
      I2C3_FMP       : Boolean := False;
      --  unspecified
      Reserved_23_25 : HAL.UInt3 := 16#0#;
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

   subtype EXTICR1_EXTI0_Field is HAL.UInt3;
   subtype EXTICR1_EXTI1_Field is HAL.UInt3;
   subtype EXTICR1_EXTI2_Field is HAL.UInt3;
   subtype EXTICR1_EXTI3_Field is HAL.UInt3;

   type EXTICR1_Register is record
      EXTI0          : EXTICR1_EXTI0_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      EXTI1          : EXTICR1_EXTI1_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      EXTI2          : EXTICR1_EXTI2_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      EXTI3          : EXTICR1_EXTI3_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
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

   subtype EXTICR2_EXTI4_Field is HAL.UInt3;
   subtype EXTICR2_EXTI5_Field is HAL.UInt3;
   subtype EXTICR2_EXTI6_Field is HAL.UInt3;
   subtype EXTICR2_EXTI7_Field is HAL.UInt3;

   type EXTICR2_Register is record
      EXTI4          : EXTICR2_EXTI4_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      EXTI5          : EXTICR2_EXTI5_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      EXTI6          : EXTICR2_EXTI6_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      EXTI7          : EXTICR2_EXTI7_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
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

   subtype EXTICR3_EXTI8_Field is HAL.UInt3;
   subtype EXTICR3_EXTI9_Field is HAL.UInt3;
   subtype EXTICR3_EXTI10_Field is HAL.UInt3;
   subtype EXTICR3_EXTI11_Field is HAL.UInt3;

   type EXTICR3_Register is record
      EXTI8          : EXTICR3_EXTI8_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      EXTI9          : EXTICR3_EXTI9_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      EXTI10         : EXTICR3_EXTI10_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      EXTI11         : EXTICR3_EXTI11_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
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

   subtype EXTICR4_EXTI12_Field is HAL.UInt3;
   subtype EXTICR4_EXTI13_Field is HAL.UInt3;
   subtype EXTICR4_EXTI14_Field is HAL.UInt3;
   subtype EXTICR4_EXTI15_Field is HAL.UInt3;

   type EXTICR4_Register is record
      EXTI12         : EXTICR4_EXTI12_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      EXTI13         : EXTICR4_EXTI13_Field := 16#0#;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      EXTI14         : EXTICR4_EXTI14_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : HAL.Bit := 16#0#;
      EXTI15         : EXTICR4_EXTI15_Field := 16#0#;
      --  unspecified
      Reserved_15_31 : HAL.UInt17 := 16#0#;
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

   type SCSR_Register is record
      SRAM2ER       : Boolean := False;
      SRAM2BSY      : Boolean := False;
      --  unspecified
      Reserved_2_30 : HAL.UInt29 := 16#0#;
      C2RFD         : Boolean := False;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCSR_Register use record
      SRAM2ER       at 0 range 0 .. 0;
      SRAM2BSY      at 0 range 1 .. 1;
      Reserved_2_30 at 0 range 2 .. 30;
      C2RFD         at 0 range 31 .. 31;
   end record;

   type CFGR2_Register is record
      CLL           : Boolean := False;
      SPL           : Boolean := False;
      PVDL          : Boolean := False;
      ECCL          : Boolean := False;
      --  unspecified
      Reserved_4_7  : HAL.UInt4 := 16#0#;
      SPF           : Boolean := False;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
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

   type SWPR_Register is record
      P0WP  : Boolean := False;
      P1WP  : Boolean := False;
      P2WP  : Boolean := False;
      P3WP  : Boolean := False;
      P4WP  : Boolean := False;
      P5WP  : Boolean := False;
      P6WP  : Boolean := False;
      P7WP  : Boolean := False;
      P8WP  : Boolean := False;
      P9WP  : Boolean := False;
      P10WP : Boolean := False;
      P11WP : Boolean := False;
      P12WP : Boolean := False;
      P13WP : Boolean := False;
      P14WP : Boolean := False;
      P15WP : Boolean := False;
      P16WP : Boolean := False;
      P17WP : Boolean := False;
      P18WP : Boolean := False;
      P19WP : Boolean := False;
      P20WP : Boolean := False;
      P21WP : Boolean := False;
      P22WP : Boolean := False;
      P23WP : Boolean := False;
      P24WP : Boolean := False;
      P25WP : Boolean := False;
      P26WP : Boolean := False;
      P27WP : Boolean := False;
      P28WP : Boolean := False;
      P29WP : Boolean := False;
      P30WP : Boolean := False;
      P31WP : Boolean := False;
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

   subtype SKR_KEY_Field is HAL.UInt8;

   type SKR_Register is record
      KEY           : SKR_KEY_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SKR_Register use record
      KEY           at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   type SWPR2_Register is record
      P32WP : Boolean := False;
      P33WP : Boolean := False;
      P34WP : Boolean := False;
      P35WP : Boolean := False;
      P36WP : Boolean := False;
      P37WP : Boolean := False;
      P38WP : Boolean := False;
      P39WP : Boolean := False;
      P40WP : Boolean := False;
      P41WP : Boolean := False;
      P42WP : Boolean := False;
      P43WP : Boolean := False;
      P44WP : Boolean := False;
      P45WP : Boolean := False;
      P46WP : Boolean := False;
      P47WP : Boolean := False;
      P48WP : Boolean := False;
      P49WP : Boolean := False;
      P50WP : Boolean := False;
      P51WP : Boolean := False;
      P52WP : Boolean := False;
      P53WP : Boolean := False;
      P54WP : Boolean := False;
      P55WP : Boolean := False;
      P56WP : Boolean := False;
      P57WP : Boolean := False;
      P58WP : Boolean := False;
      P59WP : Boolean := False;
      P60WP : Boolean := False;
      P61WP : Boolean := False;
      P62WP : Boolean := False;
      P63WP : Boolean := False;
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

end STM32_SVD.SYSCFG;
