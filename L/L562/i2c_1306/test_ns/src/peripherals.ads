with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;
with STM32.I2C;           use STM32.I2C;

use STM32;

package Peripherals is

   Selected_I2C_Port         : constant access I2C_Port := I2C_1'Access;
   Selected_I2C_Port_AF      : constant GPIO_Alternate_Function := GPIO_AF_I2C1_4;
   Selected_I2C_Clock_Pin    : GPIO_Point renames PB6;
   Selected_I2C_Data_Pin     : GPIO_Point renames PB7;
   Selected_RST_Pin          : GPIO_Point renames PB5;

end Peripherals;
