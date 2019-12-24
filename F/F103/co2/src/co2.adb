with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with HAL.UART;        use HAL.UART;
with Interfaces;      use Interfaces;
with Peripherals;     use Peripherals;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.USARTs;    use STM32.USARTs;
with Hw;              use Hw;
with Utils;           use Utils;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Co2 is

   type State_Type is (Send_Gas_Cmd, Receive_Data);

   type Empty3 is array (1 .. 3) of UInt8;
   type Co2_Frame is record
      Start         : UInt8;      --  0
      Command       : UInt8;      --  1
      Concentration : UInt16;     --  2
      Temp          : Integer_8;  --  4
      Rest          : Empty3;     --  5
      Check         : UInt8;      --  8
   end record
     with Pack;

   TxZeroPt : UART_Data_8b := (16#ff#, 16#01#, 16#87#, 16#00#,
                               16#00#, 16#00#, 16#00#, 16#00#,
                               16#78#);

   TxBuff  : UART_Data_8b := (16#ff#, 16#01#, 16#86#, 16#00#,
                              16#00#, 16#00#, 16#00#, 16#00#,
                              16#79#);
   RxBuff      : UART_Data_8b (1 .. 9);
   Co2_Reading : Co2_Frame;
   for Co2_Reading'Alignment use 1;
   for Co2_Reading'Address use RxBuff'Address;
   State   : State_Type := Send_Gas_Cmd;
   Status  : UART_Status;
   procedure Swap (X : in out UInt16);

   procedure Swap (X : in out UInt16)
   is
      Result : UInt16 := X;
   begin
      Result := Shift_Left (X, 8) or (Shift_Right (X, 8));
      X := Result;
   end Swap;
   function Check_Valid return Boolean;

   --  Validate the checksum. We already checked the magic# prior.
   function Check_Valid return Boolean
   is
      Sum : UInt8 := 0;
   begin
      for I in 1 .. 8 loop
         Sum := Sum + RxBuff (I);
      end loop;
      Sum := 16#ff# - Sum;
      if Sum = RxBuff (9) then
         return True;
      else
         return False;
      end if;
   end Check_Valid;
begin
   Initialize_Board;

   Turn_Off (Green_LED);

   Initialize_UART;

   Transmit (USART_3, TxZeroPt, Status);

   loop
      case State is
         when Send_Gas_Cmd =>
            Transmit (USART_3, TxBuff, Status);
            if Status = Ok then
               State := Receive_Data;
            end if;
         when Receive_Data =>
            if Rx_Ready (USART_3) then
               RxBuff := (1 => 0, others => 0);
               Receive (USART_3, RxBuff, Status);
               if Status = Ok then
                  if Check_Valid then
                     if Co2_Reading.Temp >= 0 then
                        Co2_Reading.Temp := Co2_Reading.Temp - 40;
                        Swap (Co2_Reading.Concentration);
                        Put_Line ("CO2: " & Co2_Reading.Concentration'Image & " T: " & Co2_Reading.Temp'Image);
                        State := Send_Gas_Cmd;
                     end if;
                  end if;
               end if;
            end if;
      end case;
   end loop;
end Co2;
