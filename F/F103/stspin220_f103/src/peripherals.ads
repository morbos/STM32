with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;

use STM32;

package Peripherals is

   Ena     : GPIO_Point renames PB3;
   Step    : GPIO_Point renames PB4;
   Dir     : GPIO_Point renames PB5;
   MS1     : GPIO_Point renames PB6;
   MS2     : GPIO_Point renames PB7;
   Rst     : GPIO_Point renames PB8;
end Peripherals;
