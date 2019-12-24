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
      Read (This.Port, LSM9DS1_CTRL_REG4, Value => Result);
      Read (This.Port, LSM9DS1_WHO_AM_I, Value => Result);
      return Result;
   end Device_Id;

   function Device_Id (This : in out LSM9DS1_Mag) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM9DS1_WHO_AM_I_M, Value => Result);
      return Result;
   end Device_Id;

   procedure Set3Wire (This : in out LSM9DS1_AccGyro)
   is
   begin
      Write (This.Port, LSM9DS1_CTRL_REG8, Value => 16#c#); --  Auto inc + 3wire SPI
   end Set3Wire;

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

   function As_Unsigned_16 is new Ada.Unchecked_Conversion
     (Source => Integer_16, Target => Unsigned_16);

   procedure Check_Cal (This : in out LSM9DS1_Mag) is
      Buffer : Sensor_Data_Buffer (0 .. 5);
   begin
      Read_Buffer (This.Port, LSM9DS1_OFFSET_X_REG_L_M or 16#c0#, Buffer);
   end Check_Cal;

   procedure Calibrate (This : in out LSM9DS1_Mag) is
      type Cal_Range is range 1 .. 64;
      Source : Register_Address;
      Buffer : Sensor_Data_Buffer (0 .. 5);
      New_X  : Integer_16;
      New_Y  : Integer_16;
      New_Z  : Integer_16;
      Avg_X  : Integer_32 := 0;
      Avg_Y  : Integer_32 := 0;
      Avg_Z  : Integer_32 := 0;
      Cvert  : Four_UInt8;
   begin
      --  Set back the offsets to 0
      Write (This.Port, LSM9DS1_OFFSET_X_REG_L_M, 0);
      Write (This.Port, LSM9DS1_OFFSET_X_REG_H_M, 0);

      Write (This.Port, LSM9DS1_OFFSET_Y_REG_L_M, 0);
      Write (This.Port, LSM9DS1_OFFSET_Y_REG_H_M, 0);

      Write (This.Port, LSM9DS1_OFFSET_Z_REG_L_M, 0);
      Write (This.Port, LSM9DS1_OFFSET_Z_REG_H_M, 0);

      Source := LSM9DS1_OUT_X_L_M;

      for I in Cal_Range loop
         --  Bit 3 is an amalgam of bits 2..0. New data xyz avail
         loop
            exit when (GetStatus (This) and 2#1000#) = 2#1000#;
         end loop;

         Read_Buffer (This.Port, Source or 16#c0#, Buffer);

         New_X := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
         New_Y := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
         New_Z := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

         Avg_X := Avg_X + Integer_32 (New_X);
         Avg_Y := Avg_Y + Integer_32 (New_Y);
         Avg_Z := Avg_Z + Integer_32 (New_Z);
      end loop;

      Avg_X := Avg_X / Integer_32 (Cal_Range'Last);
      Avg_Y := Avg_Y / Integer_32 (Cal_Range'Last);
      Avg_Z := Avg_Z / Integer_32 (Cal_Range'Last);

      To_UInt8_From_Integer_32 (Cvert, Avg_X);
      Write (This.Port, LSM9DS1_OFFSET_X_REG_L_M, Cvert (1));
      Write (This.Port, LSM9DS1_OFFSET_X_REG_H_M, Cvert (2));

      To_UInt8_From_Integer_32 (Cvert, Avg_Y);
      Write (This.Port, LSM9DS1_OFFSET_Y_REG_L_M, Cvert (1));
      Write (This.Port, LSM9DS1_OFFSET_Y_REG_H_M, Cvert (2));

      To_UInt8_From_Integer_32 (Cvert, Avg_Z);
      Write (This.Port, LSM9DS1_OFFSET_Z_REG_L_M, Cvert (1));
      Write (This.Port, LSM9DS1_OFFSET_Z_REG_H_M, Cvert (2));

      Read_Buffer (This.Port, LSM9DS1_OFFSET_X_REG_L_M or 16#c0#, Buffer);
   end Calibrate;

   procedure Config (This : in out LSM9DS1_Mag) is
      Result : Sensor_Data_Raw;
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

      This.Calibrate;

   end Config;

   procedure StatusWait (This : in out LSM9DS1_AccGyro) is
      Tmp    : UInt8;
   begin
      loop
         Read (This.Port, LSM9DS1_STATUS_REG, Value => Tmp);
         exit when (Tmp and 8) = 0;
      end loop;
   end StatusWait;

   procedure Config (This : in out LSM9DS1_AccGyro) is
      Tmp    : UInt8;
   begin
--      StatusWait (This);
      --  Soft reset accl&gyro
--      Read (This.Port, LSM9DS1_CTRL_REG8, Value => Tmp);
--      Tmp := Tmp or 16#1#; -- reboot
--      Write (This.Port, LSM9DS1_CTRL_REG8, Tmp);

      StatusWait (This);

      delay until Clock + Milliseconds (100);

      --  Fifo setup
      Read (This.Port, LSM9DS1_FIFO_CTRL, Value => Tmp);
      Tmp := Tmp or 16#e0#; -- continuous
      Write (This.Port, LSM9DS1_FIFO_CTRL, Tmp);

      --  Fifo setup
      Read (This.Port, LSM9DS1_CTRL_REG9, Value => Tmp);
      Tmp := Tmp or 16#02#;
      Write (This.Port, LSM9DS1_CTRL_REG9, Tmp);

      --  Gyro setup
      Read (This.Port, LSM9DS1_CTRL_REG1_G, Value => Tmp);
      Tmp := Tmp or 16#60#; --  119Hz
      Write (This.Port, LSM9DS1_CTRL_REG1_G, Tmp);

      --  Accl setup
      Write (This.Port, LSM9DS1_CTRL_REG5_XL, 16#38#);

      --  Accl setup
--      Read (This.Port, LSM9DS1_CTRL_REG6_XL, Value => Tmp);
      Tmp := 16#60#; --  119Hz + 2g
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
      Acc_Offset (Z_Axis) := Acc_Offset (Z_Axis) - SENSORS_GRAVITY_EARTH;
      Gyro_Offset := This.GetXYZ (Gyroscope_Data);
   end Calibrate;

   function GetTemp (This : in out LSM9DS1_AccGyro) return Float
   is
      Result : Float;
      Tmp    : Integer_16;
      Buffer : Sensor_Data_Buffer (0 .. 1);
      Status : UInt8;
   begin
      loop  --  Wait for a TDA reading (bit 2).
         Status := This.GetStatus;
         exit when (Status and 2#100#) = 2#100#;
      end loop;
      Read_Buffer (This.Port, LSM9DS1_OUT_TEMP_L or 16#80#, Buffer);

      --  MSB is a signed +/- off of a 25degC reference.
      Tmp := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      Result := (Float (Tmp) / 16.0) + 25.0;

      return Result;
   end GetTemp;

   function GetTemp_Raw (This : in out LSM9DS1_AccGyro) return Integer_16
   is
      Tmp       : Integer_16;
      Buffer    : Sensor_Data_Buffer (0 .. 1);
   begin
      Read_Buffer (This.Port, LSM9DS1_OUT_TEMP_L or 16#80#, Buffer);

      --  vvvv trial and error! seems LSB is always 0
      --  MSB is a signed +/- off of a 25degC reference.
      Tmp := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      Tmp := Tmp / 256;
      Tmp := Tmp + 25;

      return Tmp;

   end GetTemp_Raw;

   function GetStatus (This : in out LSM9DS1_Mag) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM9DS1_STATUS_REG_M, Value => Result);
      return Result;
   end GetStatus;


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

      --  Bit 3 is an amalgam of bits 2..0. New data xyz avail
      loop
         exit when (GetStatus (This) and 2#1000#) = 2#1000#;
      end loop;

      Source := LSM9DS1_OUT_X_L_M;

      Read_Buffer (This.Port, Source or 16#c0#, Buffer);
      --  By reading multiple UInt8s, the device ensures data consistency,
      --  whereas reading single UInt8s individually does not have that
      --  guarantee. See the Datasheet, section 3.7 "Data register shadowing"

      New_X := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      New_Y := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
      New_Z := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

      Result (X_Axis) := Float (New_X);
      Result (Y_Axis) := Float (New_Y);
      Result (Z_Axis) := Float (New_Z);

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
            --  Bit 3 is an amalgam of bits 2..0. New data xyz avail
      loop
         exit when (GetStatus (This) and 2#1000#) = 2#1000#;
      end loop;

      Source := LSM9DS1_OUT_X_L_M;

      Read_Buffer (This.Port, Source or 16#c0#, Buffer); --  Bit 6 autoincrements

      Vals (X_Axis) := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      Vals (Y_Axis) := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
      Vals (Z_Axis) := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

      return Vals;

   end GetXYZ_Raw;

   function GetXYZ (This : in out LSM9DS1_AccGyro; Kind : Sensor_Data_Kinds) return Sensor_Data
   is
      Result    : Sensor_Data;
      Buffer    : Sensor_Data_Buffer (0 .. 5);
      New_X    : Integer_16;
      New_Y    : Integer_16;
      New_Z    : Integer_16;
      Source   : Register_Address;
      WaitFor  : UInt8;
      Status   : UInt8;
   begin
      case Kind is
         when Accelerometer_Data =>
            Source := LSM9DS1_OUT_X_L_XL;
            WaitFor := 2#01#;
         when Gyroscope_Data =>
            Source := LSM9DS1_OUT_X_L_G;
            WaitFor := 2#10#;
      end case;

      loop
         Status := This.GetStatus;
         exit when (Status and WaitFor) = WaitFor;
      end loop;

      Read_Buffer (This.Port, Source or 16#80#, Buffer);

      New_X := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      New_Y := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
      New_Z := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

      Result (X_Axis) := Float (New_X);
      Result (Y_Axis) := Float (New_Y);
      Result (Z_Axis) := Float (New_Z);

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
      WaitFor   : UInt8;
      Status    : UInt8;
   begin

      case Kind is
         when Accelerometer_Data =>
            Source := LSM9DS1_OUT_X_L_XL;
            WaitFor := 2#01#;
         when Gyroscope_Data =>
            Source := LSM9DS1_OUT_X_L_G;
            WaitFor := 2#10#;
      end case;

      loop
         Status := This.GetStatus;
         exit when (Status and WaitFor) = WaitFor;
      end loop;

      Read_Buffer (This.Port, Source or 16#80#, Buffer);

      Vals (X_Axis) := To_Integer_16 (LSB => Buffer (0), MSB => Buffer (1));
      Vals (Y_Axis) := To_Integer_16 (LSB => Buffer (2), MSB => Buffer (3));
      Vals (Z_Axis) := To_Integer_16 (LSB => Buffer (4), MSB => Buffer (5));

      return Vals;

   end GetXYZ_Raw;

end LSM9DS1;
