with Interfaces;    use Interfaces;
with HAL;           use HAL;


package Utils
is
   type Four_UInt8 is new UInt8_Array (1 .. 4);

   type Two_UInt16 is new UInt16_Array (1 .. 2);

   type Union4
     (As_Array : Natural := 0)
   is record
      case As_Array is
         when 0 =>
            Val  : Integer_32;
         when 1 =>
            HArr : Two_UInt16;
         when others =>
            WArr : Four_UInt8;
      end case;
   end record
     with Unchecked_Union;

   function To_Integer_16 (MSB : UInt8;  LSB : UInt8) return Integer_16;

   function To_UInt16 (MSB : UInt8;  LSB : UInt8) return UInt16;

   procedure To_UInt8_From_UInt16 (Msb, Lsb : out UInt8; Value : UInt16);

   procedure To_UInt8_From_Integer_32 (Result : out Four_UInt8; Value : Integer_32);

   procedure To_UInt16_From_Integer_32 (Result : out Two_UInt16; Value : Integer_32);

--   function To_UInt8 (From : Integer_16) return Sensor_Data_Buffer;

end Utils;
