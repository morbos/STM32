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


package LSM9DS1 is

   type LSM9DS1_AccGyro (Port : not null Any_IO_Port) is tagged limited private;

   type LSM9DS1_Mag (Port : not null Any_IO_Port) is tagged limited private;

   function Device_Id (This : in out LSM9DS1_AccGyro) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LSM9DS1-specific value

   function Device_Id (This : in out LSM9DS1_Mag) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LSM9DS1-specific value

   procedure Set3Wire (This : in out LSM9DS1_AccGyro);

   function GetStatus (This : in out LSM9DS1_AccGyro) return UInt8;

   function GetFifoStatus (This : in out LSM9DS1_AccGyro) return UInt8;

   function GetFifoCtrl (This : in out LSM9DS1_AccGyro) return UInt8;

   function GetTemp (This : in out LSM9DS1_AccGyro) return Float;

   function GetTemp_Raw (This : in out LSM9DS1_AccGyro) return Integer_16;

   procedure Config (This : in out LSM9DS1_Mag);

   procedure Config (This : in out LSM9DS1_AccGyro);

   procedure Calibrate (This : in out LSM9DS1_AccGyro);

   procedure Check_Cal (This : in out LSM9DS1_Mag);

   procedure Calibrate (This : in out LSM9DS1_Mag);

   type Axis is (X_Axis, Y_Axis, Z_Axis);

   type Sensor_Data is array (Axis) of Float;

   type Sensor_Data_Raw is array (Axis) of Integer_16;

   type Sensor_Data_Kinds is
     (Accelerometer_Data,
      Gyroscope_Data);

   function GetStatus (This : in out LSM9DS1_Mag) return UInt8;

   function GetXYZ (This : in out LSM9DS1_Mag) return Sensor_Data;

   function GetXYZ_Raw (This : in out LSM9DS1_Mag) return Sensor_Data_Raw;

   function GetXYZ (This : in out LSM9DS1_AccGyro; Kind : Sensor_Data_Kinds) return Sensor_Data;

   function GetXYZ_Raw (This : in out LSM9DS1_AccGyro; Kind : Sensor_Data_Kinds) return Sensor_Data_Raw;

   procedure StatusWait (This : in out LSM9DS1_AccGyro);

   SENSORS_GRAVITY_EARTH : constant := 9.80665;

   I_Am_LSM9DS1 : constant := 16#68#;
   --  The value expected to be returned from Device_Id

   I_Am_LSM9DS1_M : constant := 16#3d#;
   --  The value expected to be returned from Device_Id

private
   type LSM9DS1_AccGyro (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   type LSM9DS1_Mag (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;
   --  r/w 04 00000100 00000000
   LSM9DS1_ACT_THS : constant := 16#04#;
   --  r/w 05 00000101 00000000
   LSM9DS1_ACT_DUR : constant := 16#05#;
   --  r/w 06 00000110 00000000
   LSM9DS1_INT_GEN_CFG_XL : constant := 16#06#;
   --  r/w 07 00000111 00000000
   LSM9DS1_INT_GEN_THS_X_XL : constant := 16#07#;
   --  r/w 08 00001000 00000000
   LSM9DS1_INT_GEN_THS_Y_XL : constant := 16#08#;
   --  r/w 09 00001001 00000000
   LSM9DS1_INT_GEN_THS_Z_XL : constant := 16#09#;
   --  r/w 0A 00001010 00000000
   LSM9DS1_INT_GEN_DUR_XL : constant := 16#0A#;
   --  r/w 0B 00001011 00000000
   LSM9DS1_REFERENCE_G : constant := 16#0B#;
   --  r/w 0C 00001100 00000000
   LSM9DS1_INT1_CTRL : constant := 16#0C#;
   --  r/w 0D 00001101 00000000
   LSM9DS1_INT2_CTRL : constant := 16#0D#;
   --  r 0F 00001111 01101000
   LSM9DS1_WHO_AM_I : constant := 16#0F#;
   --  r/w 10 00010000 00000000
   LSM9DS1_CTRL_REG1_G : constant := 16#10#;
   --  r/w 11 00010001 00000000
   LSM9DS1_CTRL_REG2_G : constant := 16#11#;
   --  r/w 12 00010010 00000000
   LSM9DS1_CTRL_REG3_G : constant := 16#12#;
   --  r/w 13 00010011 00000000
   LSM9DS1_ORIENT_CFG_G : constant := 16#13#;
   --  r 14 00010100 output
   LSM9DS1_INT_GEN_SRC_G : constant := 16#14#;
   --  r 15 00010101 output
   LSM9DS1_OUT_TEMP_L : constant := 16#15#;
   --  r 16 00010110 output
   LSM9DS1_OUT_TEMP_H : constant := 16#16#;
   --  r 17 00010111 output
   LSM9DS1_STATUS_REG : constant := 16#17#;
   --  r 18 00011000 output
   LSM9DS1_OUT_X_L_G : constant := 16#18#;
   --  r 19 00011001 output
   LSM9DS1_OUT_X_H_G : constant := 16#19#;
   --  r 1A 00011010 output
   LSM9DS1_OUT_Y_L_G : constant := 16#1A#;
   --  r 1B 00011011 output
   LSM9DS1_OUT_Y_H_G : constant := 16#1B#;
   --  r 1C 00011100 output
   LSM9DS1_OUT_Z_L_G : constant := 16#1C#;
   --  r 1D 00011101 output
   LSM9DS1_OUT_Z_H_G : constant := 16#1D#;
   --  r/w 1E 00011110 00111000
   LSM9DS1_CTRL_REG4 : constant := 16#1E#;
   --  r/w 1F 00011111 00111000
   LSM9DS1_CTRL_REG5_XL : constant := 16#1F#;
   --  r/w 20 00100000 00000000
   LSM9DS1_CTRL_REG6_XL : constant := 16#20#;
   --  r/w 21 00100001 00000000
   LSM9DS1_CTRL_REG7_XL : constant := 16#21#;
   --  r/w 22 00100010 00000100
   LSM9DS1_CTRL_REG8 : constant := 16#22#;
   --  r/w 23 00100011 00000000
   LSM9DS1_CTRL_REG9 : constant := 16#23#;
   --  r/w 24 00100100 00000000
   LSM9DS1_CTRL_REG10 : constant := 16#24#;
   --  r 26 00100110 output
   LSM9DS1_INT_GEN_SRC_XL : constant := 16#26#;
   --  r 27 00100111 output
   --  LSM9DS1_STATUS_REG : constant := 16#27#; Duplicate?
   --  r 28 00101000 output
   LSM9DS1_OUT_X_L_XL : constant := 16#28#;
   --  r 29 00101001 output
   LSM9DS1_OUT_X_H_XL : constant := 16#29#;
   --  r 2A 00101010 output
   LSM9DS1_OUT_Y_L_XL : constant := 16#2A#;
   --  r 2B 00101011 output
   LSM9DS1_OUT_Y_H_XL : constant := 16#2B#;
   --  r 2C 00101100 output
   LSM9DS1_OUT_Z_L_XL : constant := 16#2C#;
   --  r 2D 00101101 output
   LSM9DS1_OUT_Z_H_XL : constant := 16#2D#;
   --  r/w 2E 00101110 00000000
   LSM9DS1_FIFO_CTRL : constant := 16#2E#;
   --  r 2F 00101111 output
   LSM9DS1_FIFO_SRC : constant := 16#2F#;
   --  r/w 30 00110000 00000000
   LSM9DS1_INT_GEN_CFG_G : constant := 16#30#;
   --  r/w 31 00110001 00000000
   LSM9DS1_INT_GEN_THS_XH_G : constant := 16#31#;
   --  r/w 32 00110010 00000000
   LSM9DS1_INT_GEN_THS_XL_G : constant := 16#32#;
   --  r/w 33 00110011 00000000
   LSM9DS1_INT_GEN_THS_YH_G : constant := 16#33#;
   --  r/w 34 00110100 00000000
   LSM9DS1_INT_GEN_THS_YL_G : constant := 16#34#;
   --  r/w 35 00110101 00000000
   LSM9DS1_INT_GEN_THS_ZH_G : constant := 16#35#;
   --  r/w 36 00110110 00000000
   LSM9DS1_INT_GEN_THS_ZL_G : constant := 16#36#;
   --  r/w 37 00110111 00000000
   LSM9DS1_INT_GEN_DUR_G : constant := 16#37#;
   --  Offset in order to Compensate environmental effects

   --  Magnetomer

   --  r/w 05 00000000
   LSM9DS1_OFFSET_X_REG_L_M : constant := 16#05#;
   --  r/w 06 00000000
   LSM9DS1_OFFSET_X_REG_H_M : constant := 16#06#;
   --  r/w 07 00000000
   LSM9DS1_OFFSET_Y_REG_L_M : constant := 16#07#;
   --  r/w 08 00000000
   LSM9DS1_OFFSET_Y_REG_H_M : constant := 16#08#;
   --  r/w 09 00000000
   LSM9DS1_OFFSET_Z_REG_L_M : constant := 16#09#;
   --  r/w 0A 00000000
   LSM9DS1_OFFSET_Z_REG_H_M : constant := 16#0A#;
   --  Magnetic Who I am ID
   --  r 0F 0000 1111 00111101
   LSM9DS1_WHO_AM_I_M : constant := 16#0F#;
   --  r/w 20 0010 0000 00010000
   LSM9DS1_CTRL_REG1_M : constant := 16#20#;
   --  r/w 21 0010 0001 00000000
   LSM9DS1_CTRL_REG2_M : constant := 16#21#;
   --  r/w 22 0010 0010 00000011
   LSM9DS1_CTRL_REG3_M : constant := 16#22#;
   --  r/w 23 0010 0011 00000000
   LSM9DS1_CTRL_REG4_M : constant := 16#23#;
   --  r/w 24 0010 0100 00000000
   LSM9DS1_CTRL_REG5_M : constant := 16#24#;
   --  r 27 0010 0111 Output
   LSM9DS1_STATUS_REG_M : constant := 16#27#;
   --  r 28 0010 1000 Output
   LSM9DS1_OUT_X_L_M : constant := 16#28#;
   --  r 29 0010 1001 Output
   LSM9DS1_OUT_X_H_M : constant := 16#29#;
   --  r 2A 0010 1010 Output
   LSM9DS1_OUT_Y_L_M : constant := 16#2A#;
   --  r 2B 0010 1011 Output
   LSM9DS1_OUT_Y_H_M : constant := 16#2B#;
   --  r 2C 0010 1100 Output
   LSM9DS1_OUT_Z_L_M : constant := 16#2C#;
   --  r 2D 0010 1101 Output
   LSM9DS1_OUT_Z_H_M : constant := 16#2D#;
   --  Magnetic interrupt Configuration register
   --  rw 30 00110000 00001000
   LSM9DS1_INT_CFG_M : constant := 16#30#;
   --  Magnetic interrupt Generator status register
   --  r 31 00110001 00000000
   LSM9DS1_INT_SRC_M : constant := 16#31#;
   --  Magnetic interrupt generator
   --  r 32 00110010 00000000
   LSM9DS1_INT_THS_L_M : constant := 16#32#;
   --  r 33 00110011 00000000
   LSM9DS1_INT_THS_H_M : constant := 16#33#;

   --  Magnetic Field Strength: gauss range
   LSM9DS1_MAG_MGAUSS_4GAUSS  : constant   := 2#00#;
   LSM9DS1_MAG_MGAUSS_8GAUSS  : constant   := 2#01#;
   LSM9DS1_MAG_MGAUSS_12GAUSS : constant   := 2#10#;
   LSM9DS1_MAG_MGAUSS_16GAUSS : constant   := 2#11#;

end LSM9DS1;
