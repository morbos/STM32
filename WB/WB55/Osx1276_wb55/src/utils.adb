with System.Machine_Code; use System.Machine_Code;
private with STM32_SVD.NVIC;
private with Cortex_M_SVD.SCB;
private with Ada.Interrupts;
private with Ada.Interrupts.Names;
pragma Warnings (Off);
private with System.BB.Parameters;
private with System.Interrupts;
private with System.BB.Interrupts;
pragma Warnings (On);

with Ada.Real_Time; use Ada.Real_Time;

package body Utils
is
   NL : constant String := ASCII.LF & ASCII.HT;

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

   function Get_Basepri return UInt32
   is
      R : UInt32;
   begin
      Asm ("mrs %0, BASEPRI", Outputs => UInt32'Asm_Output ("=r", R),
           Volatile => True);
      return R;
   end Get_Basepri;

   procedure Set_Basepri (Pri : UInt32)
   is
   begin
      Asm ("msr BASEPRI, %0", Inputs => UInt32'Asm_Input ("r", Pri),
           Volatile => True);
   end Set_Basepri;
   function GetSetMIN_Basepri return UInt32
   is
      R : UInt32;
   begin
      Asm ("mrs %0, BASEPRI", Outputs => UInt32'Asm_Output ("=r", R),
           Volatile => True);
      Set_Basepri (MIN_BASEPRI);
      return R;
   end GetSetMIN_Basepri;

   function Htobs (X : UInt16) return UInt16
   is
   begin
      return X;
   end Htobs;
   function Btohs (X : UInt16) return UInt16
   is
   begin
      --      return Shift_Right (X, 8) or Shift_Left (X, 8);
      return X;
   end Btohs;

   function Swap (X : UInt16) return UInt16
   is
   begin
      return Shift_Right (X, 8) or Shift_Left (X, 8);
   end Swap;

   --  We us this as a method to get a chip unique#. Its possible that
   --  two chips will have the same X&Y on 2 wafers. I will take that
   --  chance for now...
   procedure GetWaferXY (X : out UInt8; Y : out UInt8)
   is
      ID_Base : constant System.Address :=
        System'To_Address (16#1FFF_7590#);
      Buffer : UInt8_Array (1 .. 4) with Volatile, Address => ID_Base;
   begin
      X := Buffer (1);
      Y := Buffer (3);
   end GetWaferXY;

   --  Setup the IRQ priorities we need for *single cycle wave* DMA audio switching
   --  IRQs can go up to 3000ips with single cyle wave DMA. We need to take special
   --  measures...
   procedure IrqPrep
   is
      --  vvvv Decls lifted from s-bbbosu.adb
      type PRI is mod 2**8;
      IP : array (0 .. Ada.Interrupts.Interrupt_ID'Last) of PRI
        with Volatile, Address => System'To_Address (16#E000_E400#);
   begin
      Set_Basepri (MAX_BASEPRI); --  < Nothing blocked
      --  vvvvv hackery vvvvv hackery vvvvvv
      --  Sweep the IRQ pri's moving all IRQs up to Group2.
      --  Group1 is now taken by DMA1_CH6 and SYSTICK
      for I in IP'Range loop
         if IP (I) /= 0 then
            IP (I) := PRI (MIN_BASEPRI);
         end if;
      end loop;
      IP (Ada.Interrupts.Names.DMA1_CH6_Interrupt) := DMA_BASEPRI; --  group1
      Cortex_M_SVD.SCB.SCB_Periph.SHPR3.PRI_15 := MIN_BASEPRI; --  SYSTICK lower than DMA1
      --  ^^^^^ hackery ^^^^^ hackery ^^^^^^
   end IrqPrep;

--     function OTP_Read (Id : UInt8) return UInt8
--     is
--     begin
--        return 0;
--     end OTP_Read;

--  uint8_t * OTP_Read( uint8_t id )
--  {
--    uint8_t *p_id;
--
--    p_id = (uint8_t*)(CFG_OTP_END_ADRESS - 7) ;
--
--    while( ((*( p_id + 7 )) != id) && ( p_id != (uint8_t*)CFG_OTP_BASE_ADDRESS) )
--    {
--      p_id -= 8 ;
--    }
--
--    if((*( p_id + 7 )) != id)
--    {
--      p_id = 0 ;
--    }
--
--    return p_id ;
--  }

   procedure MS_Delay (Units : Integer) is
   begin
      delay until Clock + Milliseconds (Units);
   end MS_Delay;

end Utils;
