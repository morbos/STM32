with HAL;             use HAL;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with Utils;           use Utils;

with Ada.Real_Time; use Ada.Real_Time;


package body LoRa_Client is

   use WorklistT;

   task body LoRa_Client is
      Result   : Boolean;
   begin
      Suspend_Until_True (LoRa_Go);
      loop
         if Notify_Button then
            LoRa_Notify_Button;
            Notify_Button := False;
         end if;
         LoRa_Sweep;
         Result := LoRa_Receive;
         MS_Delay (100);
      end loop;
   end LoRa_Client;

   procedure LoRa_Notify_Button
   is
      N : ListNode;
      Notify : Notify8;
   begin
      N.Elem.Hdr.To := 0;
      N.Elem.Hdr.From := My_Id;
      N.Elem.Cmd := (Cmd => LORA_NOTIFY8, others => 0);
      Notify.Mask := 2;
      Notify.Value := 2;
      N.Elem.Payload := Notify;
      LoRa_Send (N, False);
   end LoRa_Notify_Button;

   procedure LoRa_Rcv_Notify8 (P : ListNodePtr)
   is
      Notify : Notify8 := P.Elem.Payload;
      EventMask : UInt8 := (2 ** 1);
      LEDMask : UInt8 := (2 ** 0);
   begin
      if LEDMask = (Notify.Mask and LEDMask) then
         if 1 = (Notify.Value and 1) then
            Turn_On (Green_LED);
         else
            Turn_Off (Green_LED);
         end if;
      end if;
      LoRa_Send_Notify8_Reply (P);
   end LoRa_Rcv_Notify8;

   procedure LoRa_Start
   is
      Local_Id : UInt32;
      pragma Import (C, Local_Id, "local_id");
      use WorklistT;
   begin
      My_Id := UInt8 (Local_Id);
      List_Init_Head (WorklistPoolPtr);
      List_Init_Head (WorklistQueuePtr);

      for Index in 1 .. WORKLIST_NUM_MAX loop
         List_Insert_Tail (WorklistPoolPtr, WorklistBuffer (Index)'Access);
      end loop;
      Set_True (LoRa_Go);
   end LoRa_Start;

end LoRa_Client;
