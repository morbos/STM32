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
      Result := X.BArr;
   end To_UInt8_From_Integer_32;

   procedure To_UInt16_From_Integer_32 (Result : out Two_UInt16; Value : Integer_32)
   is
      X : Union4;
   begin
      X.Val := Value;
      Result := X.HArr;
   end To_UInt16_From_Integer_32;

   procedure To_UInt32_From_UInt8 (Dat : Four_UInt8; Result : out UInt32)
   is
      X : Union4;
   begin
      X.BArr := Dat;
      Result := X.UVal;
   end To_UInt32_From_UInt8;

   procedure To_String_From_UInt16 (S : out String; Value : UInt16)
   is
      Idx  : UInt16;
      C    : Character;
   begin
      --  Idx := Character'Pos ('0');
      for I in S'Range loop
         Idx := Shift_Right (Value, (3 - (I - 1)) * 4) and 16#F#;
         case Idx is
            when 0 .. 9 =>
               C := Character'Val (Character'Pos ('0') + Idx);
            when others =>
               C := Character'Val (Character'Pos ('A') + (Idx - 10));
         end case;
         S (I) := C;
      end loop;
   end To_String_From_UInt16;

   procedure To_UInt16_From_Integer_16 (Result : out UInt16; Value : Integer_16)
   is
      X : Union4;
   begin
      X.IArr (1) := Value;
      Result := X.HArr (1);
   end To_UInt16_From_Integer_16;

end Utils;
