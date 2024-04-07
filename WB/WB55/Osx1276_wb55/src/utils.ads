with Interfaces;    use Interfaces;
with HAL;           use HAL;


package Utils
is
   MAX_BASEPRI : constant := 16#40#; --  Group 3. Any group lower can get in
   MIN_BASEPRI : constant := 16#20#; --  Group 2. Our ISR serve base.
   DMA_BASEPRI : constant := 16#10#; --  Group 1. The highest pri
   type Four_UInt8 is new UInt8_Array (1 .. 4);

   type Two_UInt16 is new UInt16_Array (1 .. 2);

   type Integer_16_Array is array (Natural range <>) of Integer_16;

   type Two_Integer_16 is new Integer_16_Array (1 .. 2);

   type Union4
     (As_Array : Natural := 0)
   is record
      case As_Array is
         when 0 =>
            Val  : Integer_32;
         when 1 =>
            UVal : UInt32;
         when 2 =>
            IArr : Two_Integer_16;
         when 3 =>
            HArr : Two_UInt16;
         when others =>
            BArr : Four_UInt8;
      end case;
   end record
     with Unchecked_Union;

   function To_Integer_16 (MSB : UInt8;  LSB : UInt8) return Integer_16;

   function To_UInt16 (MSB : UInt8;  LSB : UInt8) return UInt16;

   procedure To_UInt8_From_UInt16 (Msb, Lsb : out UInt8; Value : UInt16);

   procedure To_UInt8_From_Integer_32 (Result : out Four_UInt8; Value : Integer_32);

   procedure To_UInt16_From_Integer_32 (Result : out Two_UInt16; Value : Integer_32);

   procedure To_UInt32_From_UInt8 (Dat : Four_UInt8; Result : out UInt32);

   procedure To_String_From_UInt16 (S : out String; Value : UInt16);

   procedure To_UInt16_From_Integer_16 (Result : out UInt16; Value : Integer_16);

   function Swap (X : UInt16) return UInt16;

   function Get_Basepri return UInt32;

   procedure Set_Basepri (Pri : UInt32);

   function GetSetMIN_Basepri return UInt32;

   function Htobs (X : UInt16) return UInt16;

   function Btohs (X : UInt16) return UInt16;

   procedure GetWaferXY (X : out UInt8; Y : out UInt8);

   procedure IrqPrep;

   procedure MS_Delay (Units : Integer);

end Utils;
