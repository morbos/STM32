
with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;
use STM32;

package Peripherals is
   PMS3003_RST_Pin    : GPIO_Point renames PA4;
   PMS3003_SET_Pin    : GPIO_Point renames PA5;

   RX_Pin             : GPIO_Point renames PA10;
   TX_Pin             : GPIO_Point renames PA9;

end Peripherals;
