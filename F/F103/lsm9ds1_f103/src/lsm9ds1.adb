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

with Ada.Unchecked_Conversion;
with Ada.Real_Time; use Ada.Real_Time;

--  with Ada.Real_Time; use Ada.Real_Time;

package body LSM9DS1 is

   subtype Register_Address is UInt8;

   Accel_Mg_Lsb   : Float;
   Gyro_Dps_Digit : Float;
   Mag_Gauss_Lsb  : Float;
   Acc_Offset     : Sensor_Data;
   Gyro_Offset    : Sensor_Data;
   ---------------
   -- Device_Id --
   ---------------

   function Device_Id (This : in out LSM9DS1_AccGyro) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM9DS1_WHO_AM_I, Value => Result);
      return Result;
   end Device_Id;

   function Device_Id_M (This : in out LSM9DS1_Mag) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM9DS1_WHO_AM_I_M, Value => Result);
      return Result;
   end Device_Id_M;

   function GetStatus (This : in out LSM9DS1_AccGyro) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM9DS1_STATUS_REG, Value => Result);
      return Result;

   end GetStatus;

   function GetFifoStatus (This : in out LSM9DS1_AccGyro) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM9DS1_FIFO_SRC, Value => Result);
      return Result;

   end GetFifoStatus;

   function GetFifoCtrl (This : in out LSM9DS1_AccGyro) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM9DS1_FIFO_CTRL, Value => Result);
      return Result;

   end GetFifoCtrl;

   function To_UInt8 (From : Integer_16) return Sensor_Data_Buffer with Inline;

   function As_Unsigned_16 is new Ada.Unchecked_Conversion
     (Source => Integer_16, Target => Unsigned_16);

   procedure Config (This : in out LSM9DS1_Mag) is
      Result : Sensor_Data_Raw;
      Cvert  : Sensor_Data_Buffer (0 .. 1);
      Tmp    : UInt8;
   begin

      --  Soft reset mag
      Read (This.Port, LSM9DS1_CTRL_REG2_M, Value => Tmp);
      Tmp := Tmp or 16#4#; -- reboot
      Write (This.Port, LSM9DS1_CTRL_REG2_M, Tmp);

      delay until Clock + Milliseconds (100);

      Write (This.Port, LSM9DS1_CTRL_REG3_M, 0); -- Continuous
      Result := This.GetXYZ_Raw;

      --  X&Y ultra high perf
      Read (This.Port, LSM9DS1_CTRL_REG1_M, Value => Tmp);
      Tmp := Tmp or 16#60#;
      Write (This.Port, LSM9DS1_CTRL_REG1_M, Tmp);

      --  Z ultra high perf
      Read (This.Port, LSM9DS1_CTRL_REG4_M, Value => Tmp);
      Tmp := Tmp or 16#0c#;
      Write (This.Port, LSM9DS1_CTRL_REG4_M, Tmp);

--      for I in Axis loop
--      Result (I) := -Result (I);
--      end loop;

--      Cvert := To_UInt8 (Result (X));
--      Write (This.Port, LSM9DS1_OFFSET_X_REG_L_M, Cvert (0));
--      Write (This.Port, LSM9DS1_OFFSET_X_REG_H_M, Cvert (1));

--      Cvert := To_UInt8 (Result (Y));
--      Write (This.Port, LSM9DS1_OFFSET_Y_REG_L_M, Cvert (0));
--      Write (This.Port, LSM9DS1_OFFSET_Y_REG_H_M, Cvert (1));

--      Cvert := To_UInt8 (Result (Z));
--      Write (This.Port, LSM9DS1_OFFSET_Z_REG_L_M, Cvert (0));
--      Write (This.Port, LSM9DS1_OFFSET_Z_REG_H_M, Cvert (1));

   end Config;

   procedure Config (This : in out LSM9DS1_AccGyro) is
      Result : Sensor_Data_Raw;
      Cvert  : Sensor_Data_Buffer (0 .. 1);
      Tmp    : UInt8;
   begin

      --  Soft reset accl&gyro
      Read (This.Port, LSM9DS1_CTRL_REG8, Value => Tmp);
      Tmp := Tmp or 16#1#; -- reboot
      Write (This.Port, LSM9DS1_CTRL_REG8, Tmp);

      delay until Clock + Milliseconds (100);

      --  Fifo setup
      Read (This.Port, LSM9DS1_FIFO_CTRL, Value => Tmp);
      Tmp := Tmp or 16#e0#; -- continuous
      Write (This.Port, LSM9DS1_FIFO_CTRL, Tmp);
      Read (This.Port, LSM9DS1_FIFO_CTRL, Value => Tmp);

      --  Fifo setup
      Read (This.Port, LSM9DS1_CTRL_REG9, Value => Tmp);
      Tmp := Tmp or 16#02#;
      Write (This.Port, LSM9DS1_CTRL_REG9, Tmp);

      --  Gyro setup
      Read (This.Port, LSM9DS1_CTRL_REG1_G, Value => Tmp);
      Tmp := Tmp or 16#60#; --  119Hz
      Write (This.Port, LSM9DS1_CTRL_REG1_G, Tmp);

      --  Accl setup
      Read (This.Port, LSM9DS1_CTRL_REG6_XL, Value => Tmp);
      Tmp := Tmp or 16#60#; --  119Hz + 2g
--      Tmp := Tmp or 16#68#; --  119Hz + 16g
      Write (This.Port, LSM9DS1_CTRL_REG6_XL, Tmp);

      Accel_Mg_Lsb   := 0.061;
      Gyro_Dps_Digit := 0.00875;
      Mag_Gauss_Lsb  := 0.14;

      for I in Axis loop
         Acc_Offset (I) := 0.0;
         Gyro_Offset (I) := 0.0;
      end loop;

   end Config;

   procedure Calibrate (This : in out LSM9DS1_AccGyro)
   is
   begin
      Acc_Offset  := This.GetXYZ (Accelerometer_Data);
      Acc_Offset (Z) := Acc_Offset (Z) - SENSORS_GRAVITY_EARTH;
      Gyro_Offset := This.GetXYZ (Gyroscope_Data);
   end Calibrate;

   function To_Integer_16 (LSB, MSB : UInt8) return Integer_16 with Inline;
   --  returns a signed value, possibly negative based on high-order bit of MSB

   function GetTemp (This : in out LSM9DS1_AccGyro) return Float
   is
      Result : float;
      Tmp    : Integer_16;
      Tmp32  : Integer_32;
      Buffer : Sensor_Data_Buffer (0 .. 1);
   begin
      Read_Buffer (This.Port, LSM9DS1_OUT_TEMP_L or 16#80#, Buffer);

      if Buffer (0) /= 0 then
         raise Program_Error with "misunderstanding";
      end if;

      --  vvvv trial and error! seems LSB is always 0
      --  MSB is a signed +/- off of a 25degC reference.
      Tmp := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      Tmp := Tmp / 256;
      Tmp := Tmp + 25;

      Result := Float (Tmp);

      return Result;
   end GetTemp;

   function GetTemp_Raw (This : in out LSM9DS1_AccGyro) return Integer_16
   is
      Tmp   : Integer_16;
      Tmp32 : Integer_32;
      Buffer    : Sensor_Data_Buffer (0 .. 1);
   begin
      Read_Buffer (This.Port, LSM9DS1_OUT_TEMP_L or 16#80#, Buffer);

      Tmp := 0;

      return Tmp;

   end GetTemp_Raw;

   function GetXYZ (This : in out LSM9DS1_Mag) return Sensor_Data
   is
      Result    : Sensor_Data;
      Buffer    : Sensor_Data_Buffer (0 .. 5);
      New_X     : Integer_16;
      New_Y     : Integer_16;
      New_Z     : Integer_16;
      --  LSB      : Float;
      Source    : Register_Address;
   begin

      Source := LSM9DS1_OUT_X_L_M;

      Read_Buffer (This.Port, Source or 16#80#, Buffer);
      --  By reading multiple UInt8s, the device ensures data consistency,
      --  whereas reading single UInt8s individually does not have that
      --  guarantee. See the Datasheet, section 3.7 "Data register shadowing"

      New_X := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      New_Y := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
      New_Z := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

      Result (X) := Float (New_X);
      Result (Y) := Float (New_Y);
      Result (Z) := Float (New_Z);

      for I in Axis loop
         Result (I) := Result (I) * Mag_Gauss_Lsb;
         Result (I) := Result (I) / 1000.0;
      end loop;

      return Result;

   end GetXYZ;

   function GetXYZ_Raw (This : in out LSM9DS1_Mag) return Sensor_Data_Raw
   is
      Buffer    : Sensor_Data_Buffer (0 .. 5);
      Vals      : Sensor_Data_Raw;
      Source    : Register_Address;
   begin

      Source := LSM9DS1_OUT_X_L_M;

      Read_Buffer (This.Port, Source or 16#80#, Buffer); --  Bit 7 autoincrements

      Vals (X) := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      Vals (Y) := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
      Vals (Z) := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

      return Vals;

   end GetXYZ_Raw;

   function GetXYZ (This : in out LSM9DS1_AccGyro; Kind : Sensor_Data_Kinds) return Sensor_Data
   is
      Result    : Sensor_Data;
      Buffer    : Sensor_Data_Buffer (0 .. 5);
      New_X    : Integer_16;
      New_Y    : Integer_16;
      New_Z    : Integer_16;
      --  LSB      : Float;
      Source   : Register_Address;
   begin

      case Kind is
         when Accelerometer_Data =>
            Source := LSM9DS1_OUT_X_L_XL;

         when Gyroscope_Data =>
            Source := LSM9DS1_OUT_X_L_G;

      end case;

      Read_Buffer (This.Port, Source or 16#80#, Buffer);

      New_X := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      New_Y := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
      New_Z := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

      Result (X) := Float (New_X);
      Result (Y) := Float (New_Y);
      Result (Z) := Float (New_Z);

      case Kind is
         when Accelerometer_Data =>
            for I in Axis loop
               Result (I) := Result (I) * Accel_Mg_Lsb;
               Result (I) := Result (I) / 1000.0;
               Result (I) := Result (I) * SENSORS_GRAVITY_EARTH;
               Result (I) := Result (I) - Acc_Offset (I);
            end loop;
         when Gyroscope_Data =>
            for I in Axis loop
               Result (I) := Result (I) * Gyro_Dps_Digit;
               Result (I) := Result (I) - Gyro_Offset (I);
            end loop;
      end case;


      return Result;

   end GetXYZ;

   function GetXYZ_Raw (This : in out LSM9DS1_AccGyro; Kind : Sensor_Data_Kinds) return Sensor_Data_Raw
   is
      Buffer    : Sensor_Data_Buffer (0 .. 5);
      Vals      : Sensor_Data_Raw;
      Source    : Register_Address;
   begin

      case Kind is
         when Accelerometer_Data =>
            Source := LSM9DS1_OUT_X_L_XL;

         when Gyroscope_Data =>
            Source := LSM9DS1_OUT_X_L_G;

      end case;

      Read_Buffer (This.Port, Source or 16#80#, Buffer); --  Bit 7 autoincrements

      Vals (X) := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      Vals (Y) := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
      Vals (Z) := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

      return Vals;

   end GetXYZ_Raw;


   -------------------
   -- To_Integer_16 --
   -------------------

   function To_Integer_16 (LSB : UInt8;  MSB : UInt8) return Integer_16 is
      Result : Integer_32;
   begin
      Result := Integer_32 (MSB) * 256;
      Result := Result + Integer_32 (LSB);
      if (MSB and 16#80#) /= 0 then
         Result := -((16#FFFF# - Result) + 1);
      end if;
      return Integer_16 (Result);
   end To_Integer_16;

   -------------------
   -- To_UInt8      --
   -------------------

   function To_UInt8 (From : Integer_16) return Sensor_Data_Buffer is
      Tmp   : Sensor_Data_Buffer (0 .. 1);
      Tmp16 : Unsigned_16;
   begin
      Tmp16   := As_Unsigned_16 (From);
      Tmp (0) := UInt8 ( Tmp16 and 16#ff#);
      Tmp (1) := UInt8 (Shift_Right (Tmp16, 8));

      return Tmp;
   end To_UInt8;

end LSM9DS1;
