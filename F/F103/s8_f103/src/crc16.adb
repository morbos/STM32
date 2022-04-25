package body CRC16 is

   function CalculateCRC16 (Input : UART_Data_8b; Len : Integer) return UInt16
   is
      CRC16 : UInt16 := 16#ffff#;
      Index : Integer;
      Val   : UInt16;
   begin
      for I in 0 .. Len - 1 loop
         Index := Integer (Shift_Right (CRC16, 8) xor UInt16 (Input (I)));
         Val := CRC16Table (Index);
         CRC16 := Shift_Left (CRC16, 8) xor Val;
      end loop;
      return CRC16;
   end CalculateCRC16;

end CRC16;
