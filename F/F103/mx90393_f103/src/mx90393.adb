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

with Ada.Real_Time; use Ada.Real_Time;

--  with Ada.Real_Time; use Ada.Real_Time;

package body MX90393 is

   Offsets : Sensor_Data_Raw;

   subtype Register_Address is UInt8;

   procedure Config (This : in out MX90393_Mag)
   is
      type Cal_Range is range 1 .. 16;
      Data    : Sensor_Data_Raw;
      Error   : Boolean;
      Xavg    : Integer_32 := 0;
      Yavg    : Integer_32 := 0;
      Zavg    : Integer_32 := 0;
      --      Val     : Four_UInt8;
      Status  : UInt8;
      Regval  : UInt16;
   begin

      This.Reset;

      --  Start a 'cal'
      --  X:  1448 Y:  419 Z:  3898 (saved avg)

      for I in Cal_Range loop
         Data := GetXYZ_Raw (This, Error);
         if Error then
            This.Reset;
         else
            Xavg := Xavg + Integer_32 (Data (X));
            Yavg := Yavg + Integer_32 (Data (Y));
            Zavg := Zavg + Integer_32 (Data (Z));
         end if;
      end loop;
      Xavg := Xavg / Integer_32 (Cal_Range'Last);
      Yavg := Yavg / Integer_32 (Cal_Range'Last);
      Zavg := Zavg / Integer_32 (Cal_Range'Last);

--      To_UInt16_From_Integer_32 (Val, -Xavg);
      Offsets (X)  := Integer_16 (-Xavg);
--      To_UInt16_From_Integer_32 (Val, -Yavg);
      Offsets (Y)  := Integer_16 (-Yavg);
--      To_UInt16_From_Integer_32 (Val, -Zavg);
      Offsets (Z)  := Integer_16 (-Zavg);
--      ReadReg (This.Port, 4, Status, Regval);
--      ReadReg (This.Port, 5, Status, Regval);
--      ReadReg (This.Port, 6, Status, Regval);

--      To_UInt8_From_Integer_32 (Val, Xavg);
--      WriteReg (This.Port, 16#4#, Status, Val (2), Val (1));
--      To_UInt8_From_Integer_32 (Val, Yavg);
--      WriteReg (This.Port, 16#5#, Status, Val (2), Val (1));
--      To_UInt8_From_Integer_32 (Val, Zavg);
--      WriteReg (This.Port, 16#6#, Status, Val (2), Val (1));

--      ReadReg (This.Port, 4, Status, Regval);
--      ReadReg (This.Port, 5, Status, Regval);
--      ReadReg (This.Port, 6, Status, Regval);

--   Put_Line ("X: " & Integer_32'Image (Xavg)
--               & " Y: " & Integer_32'Image (Yavg)
--               & " Z: " & Integer_32'Image (Zavg));

   end Config;

   procedure Reset (This : in out MX90393_Mag)
   is
      Status : UInt8;
      Val    : UInt16;
   begin
      WriteReg (This.Port, 16#4#, Status, 0, 0);
      WriteReg (This.Port, 16#5#, Status, 0, 0);
      WriteReg (This.Port, 16#6#, Status, 0, 0);
      ReadReg (This.Port, 4, Status, Val);
      ReadReg (This.Port, 5, Status, Val);
      ReadReg (This.Port, 6, Status, Val);

      Read (This.Port, 16#f0#, Status);

      delay until Clock + Milliseconds (1000);
      ReadReg (This.Port, 0, Status, Val);
   end Reset;

   function GetXYZ_Raw (This : in out MX90393_Mag; Error : out Boolean) return Sensor_Data_Raw
   is
      Status : UInt8;
      Data   : Sensor_Data_Buffer (1 .. 9); --  1 + (4 * 2)
   begin
      Read (This.Port, 16#3e#, Status); --  Start a measurement. Skip Temp (bit0)
      if Status /= 16#22# then
         Error := True;
      else
         Error := False;
      end if;
      delay until Clock + Milliseconds (100);
      Read_Buffer (This.Port, 16#4e#, Data);
      return (To_Integer_16 (Data (2), Data (3)) + Offsets (X),
              To_Integer_16 (Data (4), Data (5)) + Offsets (Y),
              To_Integer_16 (Data (6), Data (7)) + Offsets (Z));
   end GetXYZ_Raw;

end MX90393;
