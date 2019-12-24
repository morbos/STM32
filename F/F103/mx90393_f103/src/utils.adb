package body Utils
is
   -------------------
   -- To_Integer_16 --
   -------------------

   function To_Integer_16 (MSB : UInt8;  LSB : UInt8) return Integer_16 is
      Result : Integer_32;
   begin
      Result := Integer_32 (MSB) * 256;
      Result := Result + Integer_32 (LSB);
      if (MSB and 16#80#) /= 0 then
         Result := -((16#FFFF# - Result) + 1);
      end if;
      return Integer_16 (Result);
   end To_Integer_16;

   function To_UInt16 (MSB : UInt8;  LSB : UInt8) return UInt16 is
      Result : UInt32;
   begin
      Result := UInt32 (MSB) * 256;
      Result := Result + UInt32 (LSB);
      return UInt16 (Result);
   end To_UInt16;

   procedure To_UInt8_From_UInt16 (Msb, Lsb : out UInt8; Value : UInt16)
   is
   begin
      Msb := UInt8 (Shift_Right (Value, 8) and 16#ff#);
      Lsb := UInt8 (Value and 16#ff#);
   end To_UInt8_From_UInt16;

   procedure To_UInt8_From_Integer_32 (Result : out Four_UInt8; Value : Integer_32)
   is
      X : Union4;
   begin
      X.Val := Value;
      Result := X.WArr;
   end To_UInt8_From_Integer_32;

   procedure To_UInt16_From_Integer_32 (Result : out Two_UInt16; Value : Integer_32)
   is
      X : Union4;
   begin
      X.Val := Value;
      Result := X.HArr;
   end To_UInt16_From_Integer_32;

   -------------------
   -- To_UInt8      --
   -------------------

--   function To_UInt8 (From : Integer_16) return Sensor_Data_Buffer is
--      Tmp   : Sensor_Data_Buffer (0 .. 1);
--      Tmp16 : Unsigned_16;
--   begin
--      Tmp16   := As_Unsigned_16 (From);
--      Tmp (0) := UInt8 (Tmp16 and 16#ff#);
--      Tmp (1) := UInt8 (Shift_Right (Tmp16, 8));
--
--      return Tmp;
--   end To_UInt8;
end Utils;
