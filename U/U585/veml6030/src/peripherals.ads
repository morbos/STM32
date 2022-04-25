with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;
with STM32.I2C;           use STM32.I2C;
with VEML6030_I2C_IO;

use STM32;

package Peripherals is

   VEML6030_I2C_Port         : constant access I2C_Port := I2C_2'Access;
   VEML6030_I2C_Port_AF      : constant GPIO_Alternate_Function := GPIO_AF_I2C2_4;
   VEML6030_Address          : constant I2C_Address := 16#20#;
   VEML6030_I2C_Clock_Pin    : GPIO_Point renames PH4;
   VEML6030_I2C_Data_Pin     : GPIO_Point renames PH5;
   VEML6030_Port              : aliased VEML6030_I2C_IO.IO_Port :=
     (VEML6030_I2C_Port,
      VEML6030_Address);

end Peripherals;
