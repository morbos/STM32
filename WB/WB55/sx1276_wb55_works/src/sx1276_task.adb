with HAL;             use HAL;
with SX1276_API;      use SX1276_API;
with STM32.Board;     use STM32.Board;

package body Sx1276_Task is

   TxBuffer : LoRa_Packet;
   RxBuffer : LoRa_Packet;
   S : String := "Hello";
   RecLen : aliased Integer;
   RecLenPtr : Integer_Ptr := RecLen'Access;

   procedure LoRa_Start
   is
   begin
      Set_True (Send_Go);
   end LoRa_Start;

   task body LoRa_Send_Task
   is
   begin
      for I in S'Range loop
         TxBuffer (I) := Character'Pos (S (I));
      end loop;

      loop
         Suspend_Until_True (Send_Go);

         if Send_SX1276 (TxBuffer, S'Length) then
            Set_True (Receive_Go);
            Turn_On (Green_LED);
         else
            Set_True (Send_Go);
         end if;

      end loop;

   end LoRa_Send_Task;

   task body LoRa_Receive_Task
   is
      Result : UInt32;
   begin
      loop
         Suspend_Until_True (Receive_Go);
         Turn_Off (Green_LED);
         Result := Recv_SX1276 (RxBuffer, RecLenPtr);
         Set_True (Send_Go);
      end loop;
   end LoRa_Receive_Task;

end Sx1276_Task;
