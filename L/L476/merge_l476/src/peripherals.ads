------------------------------------------------------------------------------
--                                                                          --
--                  Copyright (C) 2015-2016, AdaCore                        --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of STMicroelectronics nor the names of its       --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with STM32.Device;        use STM32.Device;
with STM32.GPIO;          use STM32.GPIO;
with STM32.SPI;           use STM32.SPI;
with LPS22HB_SPI_IO;      use LPS22HB_SPI_IO;
with LSM303AGR_SPI_IO;    use LSM303AGR_SPI_IO;
with LSM6DSM_SPI_IO;      use LSM6DSM_SPI_IO;
with BlueNRG_SPI_IO;      use BlueNRG_SPI_IO;

use STM32;

package Peripherals is

   --  Common 3-wire SPI i/face
   Sensors_SPI_Port        : constant access SPI_Port := SPI_2'Access;
   Sensors_SPI_Port_AF     : constant GPIO_Alternate_Function := GPIO_AF_SPI2_5;
   Sensors_SPI_Clock_Pin   : GPIO_Point renames PB13;
   Sensors_SPI_Mosi_Pin    : GPIO_Point renames PB15;

   --  LPS22HB Pressure+Temp
   LPS22HB_CS_Pin          : GPIO_Point renames PA3;
   LPS22HB_Port            : aliased LPS22HB_SPI_IO.IO_Port := (Sensors_SPI_Port, LPS22HB_CS_Pin);

   --  LSM303AGR Acc+Mag
   LSM303AGR_CS_A_Pin      : GPIO_Point renames PC4;
   LSM303AGR_CS_M_Pin      : GPIO_Point renames PB1;
   LSM303AGR_Acc_Port      : aliased LSM303AGR_SPI_IO.IO_Port := (Sensors_SPI_Port, LSM303AGR_CS_A_Pin);
   LSM303AGR_Mag_Port      : aliased LSM303AGR_SPI_IO.IO_Port := (Sensors_SPI_Port, LSM303AGR_CS_M_Pin);

   --  LSM6DSM Acc+Gyro
   LSM6DSM_CS_AG_Pin       : GPIO_Point renames PB12;
   LSM6DSM_AccGyro_Port    : aliased LSM6DSM_SPI_IO.IO_Port := (Sensors_SPI_Port, LSM6DSM_CS_AG_Pin);

   --  MP34DT04  Mems microphone
   MP34DT04_Clock          : GPIO_Point renames PC2;
   MP34DT04_Data           : GPIO_Point renames PB6;

   --  BlueNRG-MS. Regular 4wire SPI
   BlueNRG_SPI_Port        : constant access SPI_Port := SPI_1'Access;
   BlueNRG_SPI_Port_AF     : constant GPIO_Alternate_Function := GPIO_AF_SPI1_5;
   BlueNRG_SPI_Clock_Pin   : GPIO_Point renames PA5;
   BlueNRG_SPI_Miso_Pin    : GPIO_Point renames PA6;
   BlueNRG_SPI_Mosi_Pin    : GPIO_Point renames PA7;
   BlueNRG_CS_Pin          : GPIO_Point renames PB2;
   BlueNRG_Irq_Pin         : GPIO_Point renames PC5;
   BlueNRG_RST_Pin         : GPIO_Point renames PH0;

   BlueNRG_Port : aliased BlueNRG_SPI_IO.IO_Port := (BlueNRG_SPI_Port, BlueNRG_CS_Pin, BlueNRG_RST_Pin);

end Peripherals;
