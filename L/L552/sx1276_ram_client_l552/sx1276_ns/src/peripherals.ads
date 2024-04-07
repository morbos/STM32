with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;
use STM32;

package Peripherals is

   User_Button       : GPIO_Point renames PC13;

end Peripherals;
