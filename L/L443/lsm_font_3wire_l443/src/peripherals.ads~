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
with LSM9DS1_SPI_IO;      use LSM9DS1_SPI_IO;

use STM32;

package Peripherals is

   SSD1306_SPI_Port      : constant access SPI_Port := SPI_1'Access;
   SSD1306_SPI_Port_AF   : constant GPIO_Alternate_Function := GPIO_AF_SPI1_5;
   SSD1306_SPI_Clock_Pin : GPIO_Point renames PA5;
   SSD1306_SPI_Miso_Pin  : GPIO_Point renames PA6;
   SSD1306_SPI_Mosi_Pin  : GPIO_Point renames PA7;
   SSD1306_CS_Pin        : GPIO_Point renames PA4;
   SSD1306_RST_Pin       : GPIO_Point renames PA3;
   SSD1306_DC_Pin        : GPIO_Point renames PA2;

   Lsm9ds1_SPI_Port        : constant access SPI_Port := SPI_2'Access;
   Lsm9ds1_SPI_Port_AF     : constant GPIO_Alternate_Function := GPIO_AF_SPI2_5;
   Lsm9ds1_SPI_Clock_Pin   : GPIO_Point renames PB13;
   Lsm9ds1_SPI_Miso_Pin    : GPIO_Point renames PB14; --  Mag & Acc/G on same pin(!)
   Lsm9ds1_SPI_Mosi_Pin    : GPIO_Point renames PB15;
   Lsm9ds1_CSAG_Pin        : GPIO_Point renames PB0;
   Lsm9ds1_CSM_Pin         : GPIO_Point renames PB1;

   AccGyro_Port : aliased LSM9DS1_SPI_IO.IO_Port := (Lsm9ds1_SPI_Port, Lsm9ds1_CSAG_Pin);
   Mag_Port     : aliased LSM9DS1_SPI_IO.IO_Port := (Lsm9ds1_SPI_Port, Lsm9ds1_CSM_Pin);

end Peripherals;
