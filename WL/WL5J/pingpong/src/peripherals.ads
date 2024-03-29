with STM32.Device;          use STM32.Device;
with STM32.GPIO;            use STM32.GPIO;
with Ada.Interrupts.Names;  use Ada.Interrupts;

use STM32;

package Peripherals is

   DBG_Line1_Pin                 : GPIO_Point renames PB12;
   DBG_Line2_Pin                 : GPIO_Point renames PB13;

end Peripherals;
