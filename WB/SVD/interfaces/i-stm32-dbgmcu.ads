--
--  Copyright (C) 2019, AdaCore
--

--  This spec has been automatically generated from STM32WB55x.svd

pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.Bit_Types;
with System;

package Interfaces.STM32.DBGMCU is
   pragma Preelaborate;
   pragma No_Elaboration_Code_All;

   ---------------
   -- Registers --
   ---------------

   subtype IDCODE_DEV_ID_Field is Interfaces.Bit_Types.UInt12;
   subtype IDCODE_REV_ID_Field is Interfaces.Bit_Types.Short;

   --  DBGMCU_IDCODE
   type IDCODE_Register is record
      --  Read-only. Device identifier
      DEV_ID         : IDCODE_DEV_ID_Field;
      --  unspecified
      Reserved_12_15 : Interfaces.Bit_Types.UInt4;
      --  Read-only. Revision identifie
      REV_ID         : IDCODE_REV_ID_Field;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for IDCODE_Register use record
      DEV_ID         at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      REV_ID         at 0 range 16 .. 31;
   end record;

   subtype CR_DBG_SLEEP_Field is Interfaces.Bit_Types.Bit;
   subtype CR_DBG_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype CR_DBG_STANDBY_Field is Interfaces.Bit_Types.Bit;
   subtype CR_TRACE_IOEN_Field is Interfaces.Bit_Types.Bit;
   subtype CR_TRACE_MODE_Field is Interfaces.Bit_Types.UInt2;

   --  Debug MCU configuration register
   type CR_Register is record
      --  Debug Sleep mode
      DBG_SLEEP     : CR_DBG_SLEEP_Field := 16#0#;
      --  Debug Stop mode
      DBG_STOP      : CR_DBG_STOP_Field := 16#0#;
      --  Debug Standby mode
      DBG_STANDBY   : CR_DBG_STANDBY_Field := 16#0#;
      --  unspecified
      Reserved_3_4  : Interfaces.Bit_Types.UInt2 := 16#0#;
      --  Trace pin assignment control
      TRACE_IOEN    : CR_TRACE_IOEN_Field := 16#0#;
      --  Trace pin assignment control
      TRACE_MODE    : CR_TRACE_MODE_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : Interfaces.Bit_Types.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR_Register use record
      DBG_SLEEP     at 0 range 0 .. 0;
      DBG_STOP      at 0 range 1 .. 1;
      DBG_STANDBY   at 0 range 2 .. 2;
      Reserved_3_4  at 0 range 3 .. 4;
      TRACE_IOEN    at 0 range 5 .. 5;
      TRACE_MODE    at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype APB1FZR1_DBG_TIM2_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_TIM6_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_TIM7_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_RTC_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_WWDG_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_IWDG_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_I2C1_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_I2C2_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_I2C3_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_CAN_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB1FZR1_DBG_LPTIM1_STOP_Field is Interfaces.Bit_Types.Bit;

   --  Debug MCU APB1 freeze register1
   type APB1FZR1_Register is record
      --  TIM2 counter stopped when core is halted
      DBG_TIM2_STOP   : APB1FZR1_DBG_TIM2_STOP_Field := 16#0#;
      --  unspecified
      Reserved_1_3    : Interfaces.Bit_Types.UInt3 := 16#0#;
      --  TIM6 counter stopped when core is halted
      DBG_TIM6_STOP   : APB1FZR1_DBG_TIM6_STOP_Field := 16#0#;
      --  TIM7 counter stopped when core is halted
      DBG_TIM7_STOP   : APB1FZR1_DBG_TIM7_STOP_Field := 16#0#;
      --  unspecified
      Reserved_6_9    : Interfaces.Bit_Types.UInt4 := 16#0#;
      --  RTC counter stopped when core is halted
      DBG_RTC_STOP    : APB1FZR1_DBG_RTC_STOP_Field := 16#0#;
      --  Window watchdog counter stopped when core is halted
      DBG_WWDG_STOP   : APB1FZR1_DBG_WWDG_STOP_Field := 16#0#;
      --  Independent watchdog counter stopped when core is halted
      DBG_IWDG_STOP   : APB1FZR1_DBG_IWDG_STOP_Field := 16#0#;
      --  unspecified
      Reserved_13_20  : Interfaces.Bit_Types.Byte := 16#0#;
      --  I2C1 SMBUS timeout counter stopped when core is halted
      DBG_I2C1_STOP   : APB1FZR1_DBG_I2C1_STOP_Field := 16#0#;
      --  I2C2 SMBUS timeout counter stopped when core is halted
      DBG_I2C2_STOP   : APB1FZR1_DBG_I2C2_STOP_Field := 16#0#;
      --  I2C3 SMBUS timeout counter stopped when core is halted
      DBG_I2C3_STOP   : APB1FZR1_DBG_I2C3_STOP_Field := 16#0#;
      --  unspecified
      Reserved_24_24  : Interfaces.Bit_Types.Bit := 16#0#;
      --  bxCAN stopped when core is halted
      DBG_CAN_STOP    : APB1FZR1_DBG_CAN_STOP_Field := 16#0#;
      --  unspecified
      Reserved_26_30  : Interfaces.Bit_Types.UInt5 := 16#0#;
      --  LPTIM1 counter stopped when core is halted
      DBG_LPTIM1_STOP : APB1FZR1_DBG_LPTIM1_STOP_Field := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1FZR1_Register use record
      DBG_TIM2_STOP   at 0 range 0 .. 0;
      Reserved_1_3    at 0 range 1 .. 3;
      DBG_TIM6_STOP   at 0 range 4 .. 4;
      DBG_TIM7_STOP   at 0 range 5 .. 5;
      Reserved_6_9    at 0 range 6 .. 9;
      DBG_RTC_STOP    at 0 range 10 .. 10;
      DBG_WWDG_STOP   at 0 range 11 .. 11;
      DBG_IWDG_STOP   at 0 range 12 .. 12;
      Reserved_13_20  at 0 range 13 .. 20;
      DBG_I2C1_STOP   at 0 range 21 .. 21;
      DBG_I2C2_STOP   at 0 range 22 .. 22;
      DBG_I2C3_STOP   at 0 range 23 .. 23;
      Reserved_24_24  at 0 range 24 .. 24;
      DBG_CAN_STOP    at 0 range 25 .. 25;
      Reserved_26_30  at 0 range 26 .. 30;
      DBG_LPTIM1_STOP at 0 range 31 .. 31;
   end record;

   subtype APB1FZR2_DBG_LPTIM2_STOP_Field is Interfaces.Bit_Types.Bit;

   --  Debug MCU APB1 freeze register 2
   type APB1FZR2_Register is record
      --  unspecified
      Reserved_0_4    : Interfaces.Bit_Types.UInt5 := 16#0#;
      --  LPTIM2 counter stopped when core is halted
      DBG_LPTIM2_STOP : APB1FZR2_DBG_LPTIM2_STOP_Field := 16#0#;
      --  unspecified
      Reserved_6_31   : Interfaces.Bit_Types.UInt26 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB1FZR2_Register use record
      Reserved_0_4    at 0 range 0 .. 4;
      DBG_LPTIM2_STOP at 0 range 5 .. 5;
      Reserved_6_31   at 0 range 6 .. 31;
   end record;

   subtype APB2FZR_DBG_TIM1_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB2FZR_DBG_TIM15_STOP_Field is Interfaces.Bit_Types.Bit;
   subtype APB2FZR_DBG_TIM16_STOP_Field is Interfaces.Bit_Types.Bit;

   --  Debug MCU APB2 freeze register
   type APB2FZR_Register is record
      --  unspecified
      Reserved_0_10  : Interfaces.Bit_Types.UInt11 := 16#0#;
      --  TIM1 counter stopped when core is halted
      DBG_TIM1_STOP  : APB2FZR_DBG_TIM1_STOP_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : Interfaces.Bit_Types.UInt4 := 16#0#;
      --  TIM15 counter stopped when core is halted
      DBG_TIM15_STOP : APB2FZR_DBG_TIM15_STOP_Field := 16#0#;
      --  TIM16 counter stopped when core is halted
      DBG_TIM16_STOP : APB2FZR_DBG_TIM16_STOP_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : Interfaces.Bit_Types.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for APB2FZR_Register use record
      Reserved_0_10  at 0 range 0 .. 10;
      DBG_TIM1_STOP  at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      DBG_TIM15_STOP at 0 range 16 .. 16;
      DBG_TIM16_STOP at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  MCU debug component
   type DBGMCU_Peripheral is record
      --  DBGMCU_IDCODE
      IDCODE   : aliased IDCODE_Register;
      --  Debug MCU configuration register
      CR       : aliased CR_Register;
      --  Debug MCU APB1 freeze register1
      APB1FZR1 : aliased APB1FZR1_Register;
      --  Debug MCU APB1 freeze register 2
      APB1FZR2 : aliased APB1FZR2_Register;
      --  Debug MCU APB2 freeze register
      APB2FZR  : aliased APB2FZR_Register;
   end record
     with Volatile;

   for DBGMCU_Peripheral use record
      IDCODE   at 16#0# range 0 .. 31;
      CR       at 16#4# range 0 .. 31;
      APB1FZR1 at 16#8# range 0 .. 31;
      APB1FZR2 at 16#C# range 0 .. 31;
      APB2FZR  at 16#10# range 0 .. 31;
   end record;

   --  MCU debug component
   DBGMCU_Periph : aliased DBGMCU_Peripheral
     with Import, Address => System'To_Address (16#E0042000#);

end Interfaces.STM32.DBGMCU;
