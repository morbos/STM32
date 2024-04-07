------------------------------------------------------------------------------
--                                                                          --
--                    Copyright (C) 2016, AdaCore                           --
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
--     3. Neither the name of the copyright holder nor the names of its     --
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

pragma Restrictions (No_Streams);

with System;
with Interfaces; use Interfaces;
with HAL.SPI;    use HAL.SPI;
with Utils;      use Utils;

use HAL;

generic

   type IO_Port (<>) is abstract tagged limited private;

   type Any_IO_Port is access all IO_Port'Class;

   with procedure Read
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out UInt8) is <>;
   --  Get the Value at the address specified in Register via This port.

   with procedure Write
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : UInt8) is <>;
   --  Write the Value to the address specified in Register via This port.

   type Sensor_Data_Buffer is array (Natural range <>) of UInt8;
   --   pragma Unreferenced (Sensor_Data_Buffer);

   with procedure Read_Buffer
     (This     : Any_IO_Port;
      Register : UInt8;
      Value    : out Sensor_Data_Buffer) is <>;
   --  Get the multiple Values at the address specified in Register via This
   --  port.


package LSM6DSM is

   type LSM6DSM_AccGyro (Port : not null Any_IO_Port) is tagged limited private;

   function Device_Id (This : in out LSM6DSM_AccGyro) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LSM6DSM-specific value

   procedure Configure (This : in out LSM6DSM_AccGyro);

   I_Am_LSM6DSM : constant := 16#6a#;
   --  The value expected to be returned from Device_Id

private
   type LSM6DSM_AccGyro (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   LSM6DSM_FUNC_CFG_ACCESS          : constant := 16#01#;
   LSM6DSM_SENSOR_SYNC_TIME_FRAME   : constant := 16#04#;
   LSM6DSM_SENSOR_SYNC_RES_RATIO    : constant := 16#05#;
   LSM6DSM_FIFO_CTRL1               : constant := 16#06#;
   LSM6DSM_FIFO_CTRL2               : constant := 16#07#;
   LSM6DSM_FIFO_CTRL3               : constant := 16#08#;
   LSM6DSM_FIFO_CTRL4               : constant := 16#09#;
   LSM6DSM_FIFO_CTRL5               : constant := 16#0A#;
   LSM6DSM_DRDY_PULSE_CFG           : constant := 16#0B#;
   LSM6DSM_INT1_CTRL                : constant := 16#0D#;
   LSM6DSM_INT2_CTRL                : constant := 16#0E#;
   LSM6DSM_WHO_AM_I                 : constant := 16#0F#;
   LSM6DSM_CTRL1_XL                 : constant := 16#10#;
   LSM6DSM_CTRL2_G                  : constant := 16#11#;
   LSM6DSM_CTRL3_C                  : constant := 16#12#;
   LSM6DSM_CTRL4_C                  : constant := 16#13#;
   LSM6DSM_CTRL5_C                  : constant := 16#14#;
   LSM6DSM_CTRL6_C                  : constant := 16#15#;
   LSM6DSM_CTRL7_G                  : constant := 16#16#;
   LSM6DSM_CTRL8_XL                 : constant := 16#17#;
   LSM6DSM_CTRL9_XL                 : constant := 16#18#;
   LSM6DSM_CTRL10_C                 : constant := 16#19#;
   LSM6DSM_MASTER_CONFIG            : constant := 16#1A#;
   LSM6DSM_WAKE_UP_SRC              : constant := 16#1B#;
   LSM6DSM_TAP_SRC                  : constant := 16#1C#;
   LSM6DSM_D6D_SRC                  : constant := 16#1D#;
   LSM6DSM_STATUS_REG               : constant := 16#1E#;
   LSM6DSM_OUT_TEMP_L               : constant := 16#20#;
   LSM6DSM_OUT_TEMP_H               : constant := 16#21#;
   LSM6DSM_OUTX_L_G                 : constant := 16#22#;
   LSM6DSM_OUTX_H_G                 : constant := 16#23#;
   LSM6DSM_OUTY_L_G                 : constant := 16#24#;
   LSM6DSM_OUTY_H_G                 : constant := 16#25#;
   LSM6DSM_OUTZ_L_G                 : constant := 16#26#;
   LSM6DSM_OUTZ_H_G                 : constant := 16#27#;
   LSM6DSM_OUTX_L_XL                : constant := 16#28#;
   LSM6DSM_OUTX_H_XL                : constant := 16#29#;
   LSM6DSM_OUTY_L_XL                : constant := 16#2A#;
   LSM6DSM_OUTY_H_XL                : constant := 16#2B#;
   LSM6DSM_OUTZ_L_XL                : constant := 16#2C#;
   LSM6DSM_OUTZ_H_XL                : constant := 16#2D#;
   LSM6DSM_SENSORHUB1_REG           : constant := 16#2E#;
   LSM6DSM_SENSORHUB2_REG           : constant := 16#2F#;
   LSM6DSM_SENSORHUB3_REG           : constant := 16#30#;
   LSM6DSM_SENSORHUB4_REG           : constant := 16#31#;
   LSM6DSM_SENSORHUB5_REG           : constant := 16#32#;
   LSM6DSM_SENSORHUB6_REG           : constant := 16#33#;
   LSM6DSM_SENSORHUB7_REG           : constant := 16#34#;
   LSM6DSM_SENSORHUB8_REG           : constant := 16#35#;
   LSM6DSM_SENSORHUB9_REG           : constant := 16#36#;
   LSM6DSM_SENSORHUB10_REG          : constant := 16#37#;
   LSM6DSM_SENSORHUB11_REG          : constant := 16#38#;
   LSM6DSM_SENSORHUB12_REG          : constant := 16#39#;
   LSM6DSM_FIFO_STATUS1             : constant := 16#3A#;
   LSM6DSM_FIFO_STATUS2             : constant := 16#3B#;
   LSM6DSM_FIFO_STATUS3             : constant := 16#3C#;
   LSM6DSM_FIFO_STATUS4             : constant := 16#3D#;
   LSM6DSM_FIFO_DATA_OUT_L          : constant := 16#3E#;
   LSM6DSM_FIFO_DATA_OUT_H          : constant := 16#3F#;
   LSM6DSM_TIMESTAMP0_REG           : constant := 16#40#;
   LSM6DSM_TIMESTAMP1_REG           : constant := 16#41#;
   LSM6DSM_TIMESTAMP2_REG           : constant := 16#42#;
   LSM6DSM_STEP_TIMESTAMP_L         : constant := 16#49#;
   LSM6DSM_STEP_TIMESTAMP_H         : constant := 16#4A#;
   LSM6DSM_STEP_COUNTER_L           : constant := 16#4B#;
   LSM6DSM_STEP_COUNTER_H           : constant := 16#4C#;
   LSM6DSM_SENSORHUB13_REG          : constant := 16#4D#;
   LSM6DSM_SENSORHUB14_REG          : constant := 16#4E#;
   LSM6DSM_SENSORHUB15_REG          : constant := 16#4F#;
   LSM6DSM_SENSORHUB16_REG          : constant := 16#50#;
   LSM6DSM_SENSORHUB17_REG          : constant := 16#51#;
   LSM6DSM_SENSORHUB18_REG          : constant := 16#52#;
   LSM6DSM_FUNC_SRC1                : constant := 16#53#;
   LSM6DSM_FUNC_SRC2                : constant := 16#54#;
   LSM6DSM_WRIST_TILT_IA            : constant := 16#55#;
   LSM6DSM_TAP_CFG                  : constant := 16#58#;
   LSM6DSM_TAP_THS_6D               : constant := 16#59#;
   LSM6DSM_INT_DUR2                 : constant := 16#5A#;
   LSM6DSM_WAKE_UP_THS              : constant := 16#5B#;
   LSM6DSM_WAKE_UP_DUR              : constant := 16#5C#;
   LSM6DSM_FREE_FALL                : constant := 16#5D#;
   LSM6DSM_MD1_CFG                  : constant := 16#5E#;
   LSM6DSM_MD2_CFG                  : constant := 16#5F#;
   LSM6DSM_MASTER_CMD_CODE          : constant := 16#60#;
   LSM6DSM_SENS_SYNC_SPI_ERROR_CODE : constant := 16#61#;
   LSM6DSM_OUT_MAG_RAW_X_L          : constant := 16#66#;
   LSM6DSM_OUT_MAG_RAW_X_H          : constant := 16#67#;
   LSM6DSM_OUT_MAG_RAW_Y_L          : constant := 16#68#;
   LSM6DSM_OUT_MAG_RAW_Y_H          : constant := 16#69#;
   LSM6DSM_OUT_MAG_RAW_Z_L          : constant := 16#6A#;
   LSM6DSM_OUT_MAG_RAW_Z_H          : constant := 16#6B#;
   LSM6DSM_INT_OIS                  : constant := 16#6F#;
   LSM6DSM_CTRL1_OIS                : constant := 16#70#;
   LSM6DSM_CTRL2_OIS                : constant := 16#71#;
   LSM6DSM_CTRL3_OIS                : constant := 16#72#;
   LSM6DSM_X_OFS_USR                : constant := 16#73#;
   LSM6DSM_Y_OFS_USR                : constant := 16#74#;
   LSM6DSM_Z_OFS_USR                : constant := 16#75#;

end LSM6DSM;
