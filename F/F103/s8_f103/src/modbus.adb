with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
package body Modbus is

   function CRC16 (Input : UART_Data_8b; Len : Integer) return Boolean
   is
      Crc : UInt16 := 16#FFFF#;
   begin
      for Pos in Input'Range loop
         Crc := UInt16 (Input (Pos)) xor Crc;          --  XOR byte into least sig. byte of crc
         for I in 0 .. 7 loop
            if (Crc and 1) /= 0 then  --  If the LSB is Set
               Crc := Shift_Right (Crc, 1);
               Crc := Crc xor 16#A001#;
            else
               Crc := Shift_Right (Crc, 1);
            end if;
         end loop;
      end loop;
      return Crc = 0;
   end CRC16;

end Modbus;
