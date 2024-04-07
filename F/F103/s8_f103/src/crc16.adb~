package body CRC16 is

   function CalculateCRC16 (Input : UInt8_Array) return UInt16
   is
      CRC16 : UInt16 := 0;
      Index : Integer;
      Val   : UInt16;
   begin
      for Ch of Input loop
         Index := Integer (Shift_Right (CRC16, 8) xor UInt16 (Ch));
         Val := CRC16Table (Index);
         CRC16 := Shift_Left (CRC16, 8) xor Val;
      end loop;
      return CRC16;
   end CalculateCRC16;

end CRC16;
