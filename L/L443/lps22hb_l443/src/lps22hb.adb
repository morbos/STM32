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

with Utils;         use Utils;
with Ada.Real_Time; use Ada.Real_Time;

--  with Ada.Unchecked_Conversion;

package body LPS22HB is
   ---------------
   -- Device_Id --
   ---------------

   function Device_Id (This : in out LPS22HB_Sensor) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LPS22HB_WHO_AM_I, Value => Result);
      return Result;
   end Device_Id;

   function Get_Status (This : in out LPS22HB_Sensor) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LPS22HB_STATUS, Value => Result);
      return Result;
   end Get_Status;

   procedure Configure (This : in out LPS22HB_Sensor)
   is
      Result8 : UInt8;
   begin

--      Write (This.Port, LPS22HB_RES_CONF,  16#01#); --  Low power mode
      Write (This.Port, LPS22HB_CTRL_REG2, 16#5c#); --  FIFO on, auto inc, I2C disabled+SWRESET
      delay until Clock + Milliseconds (100);
--      Write (This.Port, LPS22HB_CTRL_REG1, 16#5f#); --  3 wire SPI+BDU+LPF, 75hz datarate
--      Write (This.Port, LPS22HB_FIFO_CTRL, 16#20#); --  FIFO Mode

      Write (This.Port, LPS22HB_CTRL_REG1, 16#01#); --  one-shot mode, 3 wire SPI
--      Write (This.Port, LPS22HB_CTRL_REG1, 16#00#); --  one-shot mode

--      Write (This.Port, LPS22HB_CTRL_REG1, 16#3b#); --  ODR25hz, 3wire SPI+BDU+LPF

--      Read (This.Port, LPS22HB_CTRL_REG2, Value => Result8);

--      Write (This.Port, LPS22HB_CTRL_REG2, 16#10#); --  FIFO ena, auto inc, I2C disabled

--      Write (This.Port, LPS22HB_CTRL_REG2, 16#50#); --  FIFO ena, auto inc, I2C disabled

--      Write (This.Port, LPS22HB_FIFO_CTRL, 16#00#); --  FIFO Mode
--      Write (This.Port, LPS22HB_FIFO_CTRL, 16#40#); --  FIFO Mode

   end Configure;

   procedure Get_Data (This : in out LPS22HB_Sensor; Pressure : out Float; Temp : out Float)
   is
      Buffer   : Sensor_Data_Buffer (0 .. 4);  --  3 pressure, 2 temp
      Result   : UInt16 := 0;
      Result8  : UInt8;
      Raw_Temp : Integer_16;
      Result32 : UInt32;
--      Miss     : UInt32 := 0;
      Dat      : Four_UInt8;
   begin
--      Write (This.Port, LPS22HB_CTRL_REG1, 16#3b#); --  ODR25hz, 3wire SPI+BDU+LPF
--      Read (This.Port, LPS22HB_WHO_AM_I, Value => Result8);
--      Write (This.Port, LPS22HB_CTRL_REG2, 16#19#); -- auto inc, I2C disabled+oneshot
      Write (This.Port, LPS22HB_CTRL_REG2, 16#19#); --  auto inc, I2C disabled, One-shot
--      loop
--         Read (This.Port, LPS22HB_CTRL_REG2, Value => Result8);
--         exit when (Result8 and 16#1#) = 0;
--         Miss := Miss + 1;
--         exit when (This.Get_Status and 3) /= 0;
--      end loop;
      delay until Clock + Milliseconds (100);
      Read_Buffer (This.Port, LPS22HB_PRESS_OUT, Buffer);
      Dat (1) := Buffer (0);
      Dat (2) := Buffer (1);
      Dat (3) := Buffer (2);
      Dat (4) := 0;
      To_UInt32_From_UInt8 (Dat, Result32);
      Pressure := Float (Result32) / 4096.0;
      Raw_Temp := To_Integer_16 (LSB => Buffer (3), MSB => Buffer (4));
      Temp := Float (Raw_Temp) / 100.0;
--      Read (This.Port, LPS22HB_PRESS_OUT_XL, Value => Result8);
--      Read (This.Port, LPS22HB_PRESS_OUT_L, Value => Result8);
--      Read (This.Port, LPS22HB_PRESS_OUT_H, Value => Result8);
--      Read (This.Port, LPS22HB_TEMP_OUT_L, Value => Result8);
--      Read (This.Port, LPS22HB_TEMP_OUT_H, Value => Result8);
   end Get_Data;

end LPS22HB;
