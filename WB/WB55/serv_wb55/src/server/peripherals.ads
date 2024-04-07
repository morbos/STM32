with STM32.Device;          use STM32.Device;
with STM32.GPIO;            use STM32.GPIO;
with STM32.EXTI;            use STM32.EXTI;
with Ada.Interrupts.Names;  use Ada.Interrupts;

use STM32;

package Peripherals is
   --  User button(s)

   Blue_LED      : GPIO_Point renames PB5;

   SW1_Point      : GPIO_Point renames PC4;
   SW1_Line       : constant External_Line_Number := EXTI_Line_4;
   SW1_Interrupt  : constant Interrupt_ID := Names.EXTI4_Interrupt;

   SW2_Point     : GPIO_Point renames PD0;
   SW2_Line      : constant External_Line_Number := EXTI_Line_0;
   SW2_Interrupt : constant Interrupt_ID := Names.EXTI0_Interrupt;

   SW3_Point     : GPIO_Point renames PD1;
   SW3_Line      : constant External_Line_Number := EXTI_Line_1;
   SW3_Interrupt : constant Interrupt_ID := Names.EXTI1_Interrupt;

end Peripherals;
