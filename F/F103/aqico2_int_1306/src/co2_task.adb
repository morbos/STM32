with HAL;             use HAL;
with Ada.Real_Time;   use Ada.Real_Time;
with Hw;              use Hw;
package body Co2_Task is

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

   procedure Init_Co2
   is
   begin
      Transmit (USART_3, TxZeroPt, Status);
   end Init_Co2;
   procedure Get_Reading
   is
      Stamp : Time := Clock;
   begin
      Reading_Valid := False;
      loop
         exit when Clock > Stamp + Milliseconds (500); --  Can't stay here forever
         case State is
            when Send_Gas_Cmd =>
               Transmit (USART_3, TxBuff, Status);
               if Status = Ok then
                  State := Receive_Data;
               else
                  exit;
               end if;
            when Receive_Data =>
               if Rx_Ready (USART_3) then
                  RxBuff := (1 => 0, others => 0);
                  Receive (USART_3, RxBuff, Status, 10);
                  if Status = Ok then
                     if Check_Valid then
                        if Co2_Reading.Temp >= 0 then
                           Co2_Reading.Temp := Co2_Reading.Temp - 40;
                           Co2_Reading.Concentration := Swap (Co2_Reading.Concentration);
                           Curr_Co2_Reading := Co2_Reading;
                           Reading_Valid := True;
                           Set_True (Update_Ready);
                        end if;
                        exit;
                     else
                        exit;
                     end if;
                  else
                     exit;
                  end if;
               end if;
         end case;
      end loop;
   end Get_Reading;
   task body New_Co2 is
   begin
      loop
         Suspend_Until_True (Co2_Ready);
         State := Send_Gas_Cmd;
         Get_Reading;
      end loop;
   end New_Co2;
end Co2_Task;
