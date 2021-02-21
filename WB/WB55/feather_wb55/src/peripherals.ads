with STM32.Device;          use STM32.Device;
with STM32.GPIO;            use STM32.GPIO;
with Ada.Interrupts.Names;  use Ada.Interrupts;

use STM32;

package Peripherals is
   --  User button

   SW1_Point     : GPIO_Point renames PH3;
   SW1_Interrupt : constant Interrupt_ID := Names.EXTI3_Interrupt;

end Peripherals;
