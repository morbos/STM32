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


package LPS22HB is

   type LPS22HB_Sensor (Port : not null Any_IO_Port) is tagged limited private;

   function Device_Id (This : in out LPS22HB_Sensor) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a LPS22HB-specific value

   function Get_Status (This : in out LPS22HB_Sensor) return UInt8;

   procedure Get_Data (This : in out LPS22HB_Sensor; Pressure : out Float; Temp : out Float);

   procedure Configure (This : in out LPS22HB_Sensor);

   I_Am_LPS22HB : constant := 16#b1#;
   --  The value expected to be returned from Device_Id

private
   type LPS22HB_Sensor (Port : not null Any_IO_Port) is
     tagged limited record
      Mode : Natural;
   end record;

   --  r 0F 00001111 10110001
   LPS22HB_WHO_AM_I    : constant := 16#0F#;
   LPS22HB_CTRL_REG1   : constant := 16#10#;
   LPS22HB_CTRL_REG2   : constant := 16#11#;
   LPS22HB_FIFO_CTRL   : constant := 16#14#;
   LPS22HB_REF_P       : constant := 16#15#;

   LPS22HB_RES_CONF     : constant := 16#1a#;

   LPS22HB_FIFO_STATUS  : constant := 16#26#;
   LPS22HB_STATUS       : constant := 16#27#;
   LPS22HB_PRESS_OUT    : constant := 16#28#;
   LPS22HB_PRESS_OUT_XL : constant := 16#28#;
   LPS22HB_PRESS_OUT_L  : constant := 16#29#;
   LPS22HB_PRESS_OUT_H  : constant := 16#2a#;
   LPS22HB_TEMP_OUT     : constant := 16#2b#;
   LPS22HB_TEMP_OUT_L   : constant := 16#2b#;
   LPS22HB_TEMP_OUT_H   : constant := 16#2c#;

end LPS22HB;
