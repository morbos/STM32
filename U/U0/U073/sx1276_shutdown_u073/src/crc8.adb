with Uart; use Uart;
package body Crc8
is
   Crc8_Table : UInt8_Array (0 .. 255);
   procedure Gen_Crc8_Table
   is
      Crc_Accum : UInt8;
      DI : constant UInt8 := 16#07#;
   begin
      for I in Crc8_Table'Range loop
         Crc_Accum := UInt8 (I);
         for J in 0 .. 7 loop
            if (Crc_Accum and 16#80#) /= 0 then
               Crc_Accum := Shift_Left (Crc_Accum, 1) xor DI;
            else
               Crc_Accum := Shift_Left (Crc_Accum, 1);
            end if;
         end loop;
         Crc8_Table (I) := Crc_Accum;
      end loop;
   end Gen_Crc8_Table;
   procedure Update_Crc8 (Crc_Accum : in out UInt8; Data : UInt8_Array)
   is
      I : UInt8;
   begin
      for J in Data'Range loop
         I := Crc_Accum xor Data (J);
         Crc_Accum := Crc8_Table (Integer (I));
      end loop;
   end Update_Crc8;

   procedure Update_Crc8 (Crc_Accum : in out UInt8; Data : SPI_Data_8b)
   is
      I : UInt8;
   begin
      for J in Data'Range loop
         I := Crc_Accum xor Data (J);
         Crc_Accum := Crc8_Table (Integer (I));
      end loop;
   end Update_Crc8;

end Crc8;
