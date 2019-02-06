with HAL;             use HAL;
with HAL.SPI;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
with STM32.SPI;       use STM32.SPI;
with STM32.I2C;       use STM32.I2C;
with STM32.EXTI;      use STM32.EXTI;
with STM32.SYSCFG;    use STM32.SYSCFG;
with STM32.DFSDM;     use STM32.DFSDM;
with LPS22HB_SPI;     use LPS22HB_SPI;
with LSM303AGR_SPI;   use LSM303AGR_SPI;
with LSM6DSM_SPI;     use LSM6DSM_SPI;
with BlueNRG_SPI;     use BlueNRG_SPI;
with HTS221_I2C;      use HTS221_I2C;
with STC3115_I2C;     use STC3115_I2C;
with PCM1774_I2C;     use PCM1774_I2C;
with Interfaces.STM32.RCC;       use Interfaces.STM32.RCC;

use STM32;

package Sensors
is

   type Env_Data is record
      TimeVal  : UInt16;
      Pressure : UInt32;
      Humid    : UInt16;
      Temp1    : Integer_16;
      Temp2    : Integer_16;
   end record
     with Pack;

   type AccGyroMag_Data is record
      TimeVal  : UInt16;
      Ax : Integer_16;
      Ay : Integer_16;
      Az : Integer_16;
      Gx : Integer_16;
      Gy : Integer_16;
      Gz : Integer_16;
      Mx : Integer_16;
      My : Integer_16;
      Mz : Integer_16;
   end record
     with Pack;

   type GG_Data is record
      TimeVal  : UInt16;
      SoC      : UInt16;
      Voltage  : UInt16;
      Current  : Integer_16;
      Stat     : UInt8;
   end record
     with Pack;

   procedure Initialize_Sensors;
   procedure Initialize_DFSDM;
   procedure Initialize_CS_Hardware (CS : in out GPIO_Point; Resistor : Internal_Pin_Resistors);
   procedure Initialize_CS_Hardware (CSs : in out GPIO_Points; Resistor : Internal_Pin_Resistors);

   procedure Initialize_Sensor_Hardware
     (Port     : access SPI_Port;
      SPI_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      MOSI     : GPIO_Point
     );

   procedure Initialize_I2C
     (Port     : access I2C_Port;
      I2C_AF   : GPIO_Alternate_Function;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point
     );

   procedure Reset_I2C;

   procedure Update_Environmental;
   procedure Update_AccGyroMag;
   procedure Update_Battery;

end Sensors;
