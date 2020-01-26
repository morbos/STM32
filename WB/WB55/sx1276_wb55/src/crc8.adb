package body CRC8 is

   CRC8_Table : UInt8_Array (0 .. 255);

   --  GP=0x107   # x^8 + x^2 + x + 1
   DI : constant UInt8 := 16#07#;

   procedure Gen_CRC8_Table
   is
      CRC8_Accum : UInt8;
   begin
      for I in CRC8_Table'Range loop
         CRC8_Accum := UInt8 (I);
         for j in 0 .. 7 loop
            if (CRC8_Accum and 16#80#) /= 0 then
               CRC8_Accum := Shift_Left (CRC8_Accum, 1) xor DI;
            else
               CRC8_Accum := Shift_Left (CRC8_Accum, 1);
            end if;
         end loop;
         CRC8_Table (I) := CRC8_Accum;
      end loop;
   end Gen_CRC8_Table;

   function Update_CRC8 (Initial : UInt8; Pkt : UInt8_Array; Len : UInt32) return UInt8
   is
      Elems : UInt32 := Len;
      Accum : UInt8 := Initial;
      Tmp   : UInt8;
   begin
      for I in Pkt'Range loop
         if Elems = 0 then
            exit;
         end if;
         Tmp := Accum xor Pkt (I);
         Accum := CRC8_Table (Integer (Tmp));
         Elems := Elems - 1;
      end loop;
      return Accum;
   end Update_CRC8;

end CRC8;
