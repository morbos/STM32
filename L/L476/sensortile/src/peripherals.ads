--  Sensortile peripheral layout.

with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;
with STM32.SPI;           use STM32.SPI;
with STM32.I2C;           use STM32.I2C;
with STM32.DFSDM;         use STM32.DFSDM;
with LPS22HB_SPI_IO;      use LPS22HB_SPI_IO;
with LSM303AGR_SPI_IO;    use LSM303AGR_SPI_IO;
with LSM6DSM_SPI_IO;      use LSM6DSM_SPI_IO;
with BlueNRG_SPI_IO;      use BlueNRG_SPI_IO;
with HTS221_I2C_IO;
with STC3115_I2C_IO;
with PCM1774_I2C_IO;

use STM32;

package Peripherals is

   --  Common 3-wire SPI i/face
   Sensors_SPI_Port        : constant access SPI_Port := SPI_2'Access;
   Sensors_SPI_Port_AF     : constant GPIO_Alternate_Function := GPIO_AF_SPI2_5;
   Sensors_SPI_Clock_Pin   : GPIO_Point renames PB13;
   Sensors_SPI_Mosi_Pin    : GPIO_Point renames PB15;

   --  LPS22HB Pressure + Temp1
   LPS22HB_CS_Pin          : GPIO_Point renames PA3;
   LPS22HB_Port            : aliased LPS22HB_SPI_IO.IO_Port :=
     (Sensors_SPI_Port,
      LPS22HB_CS_Pin);

   --  LSM303AGR Acc + Mag
   LSM303AGR_CS_A_Pin      : GPIO_Point renames PC4;
   LSM303AGR_CS_M_Pin      : GPIO_Point renames PB1;
   LSM303AGR_Acc_Port      : aliased LSM303AGR_SPI_IO.IO_Port :=
     (Sensors_SPI_Port,
      LSM303AGR_CS_A_Pin);
   LSM303AGR_Mag_Port      : aliased LSM303AGR_SPI_IO.IO_Port :=
     (Sensors_SPI_Port,
      LSM303AGR_CS_M_Pin);

   LED_Pin                 : GPIO_Point renames PG12;

   --  LSM6DSM Acc + Gyro
   LSM6DSM_CS_AG_Pin       : GPIO_Point renames PB12;
   LSM6DSM_AccGyro_Port    : aliased LSM6DSM_SPI_IO.IO_Port :=
     (Sensors_SPI_Port,
      LSM6DSM_CS_AG_Pin);

   --  BlueNRG-MS. Regular 4wire SPI
   BlueNRG_SPI_Port        : constant access SPI_Port := SPI_1'Access;
   BlueNRG_SPI_Port_AF     : constant GPIO_Alternate_Function := GPIO_AF_SPI1_5;
   BlueNRG_SPI_Clock_Pin   : GPIO_Point renames PA5;
   BlueNRG_SPI_Miso_Pin    : GPIO_Point renames PA6;
   BlueNRG_SPI_Mosi_Pin    : GPIO_Point renames PA7;
   BlueNRG_CS_Pin          : GPIO_Point renames PB2;
   BlueNRG_IRQ_Pin         : GPIO_Point renames PC5;
   BlueNRG_RST_Pin         : GPIO_Point renames PH0;
   BlueNRG_Port : aliased BlueNRG_SPI_IO.IO_Port :=
     (BlueNRG_SPI_Port,
      BlueNRG_CS_Pin,
      BlueNRG_RST_Pin);

   --  Humidity + Temp2
   HTS221_I2C_Port         : constant access I2C_Port := I2C_3'Access;
   HTS221_Address          : constant I2C_Address := 16#BE#;
   HTS221_I2C_Port_AF      : constant GPIO_Alternate_Function := GPIO_AF_I2C3_4;
   HTS221_I2C_Clock_Pin    : GPIO_Point renames PC0;
   HTS221_I2C_Data_Pin     : GPIO_Point renames PC1;
   HTS221_Port             : aliased HTS221_I2C_IO.IO_Port :=
     (HTS221_I2C_Port,
      HTS221_Address);

   --  Battery gauge
   STC3115_I2C_Port         : constant access I2C_Port := I2C_3'Access;
   STC3115_Address          : constant I2C_Address := 16#E0#;
   STC3115_I2C_Port_AF      : constant GPIO_Alternate_Function := GPIO_AF_I2C3_4;
   STC3115_I2C_Clock_Pin    : GPIO_Point renames PC0;
   STC3115_I2C_Data_Pin     : GPIO_Point renames PC1;
   STC3115_Port             : aliased STC3115_I2C_IO.IO_Port :=
     (STC3115_I2C_Port,
      STC3115_Address);

   --  PCM1774 codec
   PCM1774_I2C_Port         : constant access I2C_Port := I2C_3'Access;
   PCM1774_Address          : constant I2C_Address := 16#8C#;
   PCM1774_I2C_Port_AF      : constant GPIO_Alternate_Function := GPIO_AF_I2C3_4;
   PCM1774_I2C_Clock_Pin    : GPIO_Point renames PC0;
   PCM1774_I2C_Data_Pin     : GPIO_Point renames PC1;
   PCM1774_Port             : aliased PCM1774_I2C_IO.IO_Port :=
     (PCM1774_I2C_Port,
      PCM1774_Address);

   --  MP34DT05  Mems microphone
   MP34DT05_Port           : constant access DFSDM_Block := DFSDM1'Access;
   MP34DT05_Data_Pin       : GPIO_Point renames PB6;
   MP34DT05_Clock_Pin      : GPIO_Point renames PC2;
   MP34DT05_AF             : constant GPIO_Alternate_Function := GPIO_AF_DFSDM1_5;

   --  SAI
   SAI2_MCLK_A   : GPIO_Point renames PG11;
   SAI2_SCK_A    : GPIO_Point renames PG9;
   SAI2_SD_A     : GPIO_Point renames PG12; --  On top of the LED. Client cannot use as LED
   SAI2_FS_A     : GPIO_Point renames PG10;
   SAI_Pins_AF   : GPIO_Alternate_Function renames GPIO_AF_SAI2_13;

end Peripherals;
