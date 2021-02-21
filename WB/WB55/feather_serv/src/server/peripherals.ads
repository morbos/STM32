with STM32.Device;          use STM32.Device;
with STM32.GPIO;            use STM32.GPIO;
with STM32.EXTI;            use STM32.EXTI;
with Ada.Interrupts.Names;  use Ada.Interrupts;

use STM32;

package Peripherals is

   SW1_Point      : GPIO_Point renames PH3;
   SW1_Line       : constant External_Line_Number := EXTI_Line_3;
   SW1_Interrupt  : constant Interrupt_ID := Names.EXTI3_Interrupt;

end Peripherals;
