with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;
with STM32.I2C;           use STM32.I2C;
with IIS2MDC_I2C_IO;

use STM32;

package Peripherals is

   IIS2MDC_I2C_Port         : constant access I2C_Port := I2C_2'Access;
   IIS2MDC_I2C_Port_AF      : constant GPIO_Alternate_Function := GPIO_AF_I2C2_4;
   IIS2MDC_Address          : constant I2C_Address := 16#3C#;
   IIS2MDC_I2C_Clock_Pin    : GPIO_Point renames PH4;
   IIS2MDC_I2C_Data_Pin     : GPIO_Point renames PH5;
   IIS2MDC_Port              : aliased IIS2MDC_I2C_IO.IO_Port :=
     (IIS2MDC_I2C_Port,
      IIS2MDC_Address);

end Peripherals;
