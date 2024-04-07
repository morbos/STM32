with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;

use STM32;

package Peripherals is

   Wakeup_Pin             : GPIO_Point renames PA0;

   Hold_Pin               : GPIO_Point renames PB0;

end Peripherals;
