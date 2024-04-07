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


package LSM303AGR is

   type LSM303AGR_Acc (Port : not null Any_IO_Port) is tagged limited private;

   type LSM303AGR_Mag (Port : not null Any_IO_Port) is tagged limited private;

   function Device_Id (This : in out LSM303AGR_Acc) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LSM303AGR-specific value

   function Device_Id (This : in out LSM303AGR_Mag) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LSM303AGR-specific value


   procedure Configure (This : in out LSM303AGR_Acc);

   procedure Configure (This : in out LSM303AGR_Mag);

   I_Am_LSM303AGR : constant := 16#68#;
   --  The value expected to be returned from Device_Id

   I_Am_LSM303AGR_M : constant := 16#3d#;
   --  The value expected to be returned from Device_Id

private
   type LSM303AGR_Acc (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   type LSM303AGR_Mag (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   LSM303AGR_STATUS_REG_AUX_A         : constant := 16#07#;
   LSM303AGR_OUT_TEMP_L_A             : constant := 16#0C#;
   LSM303AGR_OUT_TEMP_H_A             : constant := 16#0D#;
   LSM303AGR_INT_COUNTER_REG_A        : constant := 16#0E#;
   LSM303AGR_WHO_AM_I_A               : constant := 16#0F#;
   LSM303AGR_TEMP_CFG_REG_A           : constant := 16#1F#;
   LSM303AGR_CTRL_REG1_A              : constant := 16#20#;
   LSM303AGR_CTRL_REG2_A              : constant := 16#21#;
   LSM303AGR_CTRL_REG3_A              : constant := 16#22#;
   LSM303AGR_CTRL_REG4_A              : constant := 16#23#;
   LSM303AGR_CTRL_REG5_A              : constant := 16#24#;
   LSM303AGR_CTRL_REG6_A              : constant := 16#25#;
   LSM303AGR_DATACAPTURE_A            : constant := 16#26#;
   LSM303AGR_STATUS_REG_A             : constant := 16#27#;
   LSM303AGR_OUT_X_L_A                : constant := 16#28#;
   LSM303AGR_OUT_X_H_A                : constant := 16#29#;
   LSM303AGR_OUT_Y_L_A                : constant := 16#2A#;
   LSM303AGR_OUT_Y_H_A                : constant := 16#2B#;
   LSM303AGR_OUT_Z_L_A                : constant := 16#2C#;
   LSM303AGR_OUT_Z_H_A                : constant := 16#2D#;
   LSM303AGR_FIFO_CTRL_REG_A          : constant := 16#2E#;
   LSM303AGR_FIFO_SRC_REG_A           : constant := 16#2F#;
   LSM303AGR_INT1_CFG_A               : constant := 16#30#;
   LSM303AGR_INT1_SRC_A               : constant := 16#31#;
   LSM303AGR_INT1_THS_A               : constant := 16#32#;
   LSM303AGR_INT1_DURATION_A          : constant := 16#33#;
   LSM303AGR_INT2_CFG_A               : constant := 16#34#;
   LSM303AGR_INT2_SRC_A               : constant := 16#35#;
   LSM303AGR_INT2_THS_A               : constant := 16#36#;
   LSM303AGR_INT2_DURATION_A          : constant := 16#37#;
   LSM303AGR_CLICK_CFG_A              : constant := 16#38#;
   LSM303AGR_CLICK_SRC_A              : constant := 16#39#;
   LSM303AGR_CLICK_THS_A              : constant := 16#3A#;
   LSM303AGR_TIME_LIMIT_A             : constant := 16#3B#;
   LSM303AGR_TIME_LATENCY_A           : constant := 16#3C#;
   LSM303AGR_TIME_WINDOW_A            : constant := 16#3D#;
   LSM303AGR_Act_THS_A                : constant := 16#3E#;
   LSM303AGR_Act_DUR_A                : constant := 16#3F#;
   LSM303AGR_OFFSET_X_REG_L_M         : constant := 16#45#;
   LSM303AGR_OFFSET_X_REG_H_M         : constant := 16#46#;
   LSM303AGR_OFFSET_Y_REG_L_M         : constant := 16#47#;
   LSM303AGR_OFFSET_Y_REG_H_M         : constant := 16#48#;
   LSM303AGR_OFFSET_Z_REG_L_M         : constant := 16#49#;
   LSM303AGR_OFFSET_Z_REG_H_M         : constant := 16#4A#;
   LSM303AGR_WHO_AM_I_M               : constant := 16#4F#;
   LSM303AGR_CFG_REG_A_M              : constant := 16#60#;
   LSM303AGR_CFG_REG_B_M              : constant := 16#61#;
   LSM303AGR_CFG_REG_C_M              : constant := 16#62#;
   LSM303AGR_INT_CRTL_REG_M           : constant := 16#63#;
   LSM303AGR_INT_SOURCE_REG_M         : constant := 16#64#;
   LSM303AGR_INT_THS_L_REG_M          : constant := 16#65#;
   LSM303AGR_INT_THS_H_REG_M          : constant := 16#66#;
   LSM303AGR_STATUS_REG_M             : constant := 16#67#;
   LSM303AGR_OUTX_L_REG_M             : constant := 16#68#;
   LSM303AGR_OUTX_H_REG_M             : constant := 16#69#;
   LSM303AGR_OUTY_L_REG_M             : constant := 16#6A#;
   LSM303AGR_OUTY_H_REG_M             : constant := 16#6B#;
   LSM303AGR_OUTZ_L_REG_M             : constant := 16#6C#;
   LSM303AGR_OUTZ_H_REG_M             : constant := 16#6D#;

end LSM303AGR;
