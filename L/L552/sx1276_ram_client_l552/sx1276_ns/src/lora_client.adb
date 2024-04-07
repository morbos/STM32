with HAL;             use HAL;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with Utils;           use Utils;

with Ada.Real_Time; use Ada.Real_Time;


package body LoRa_Client is

   use WorklistT;

   function Who_Am_I_SX1276 return UInt32;
   pragma Import (C, Who_Am_I_SX1276, "who_am_i_SX1276_from_ns");

   task body LoRa_Client is
      Result   : Boolean;
      Timeout  : constant := 2000;
   begin
      Suspend_Until_True (LoRa_Go);
      loop
         LoRa_Sweep;
         Result := LoRa_Receive;
         if Notify_Button then
            LoRa_Notify_Button;
            Notify_Button := False;
         end if;
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

   procedure LoRa_Rcv_Notify8 (P : in out ListNodePtr)
   is
      Notify : Notify8 := P.Elem.Payload;
      EventMask : UInt8 := (2 ** 1);
      LEDMask : UInt8 := (2 ** 0);
   begin
      if LEDMask = (Notify.Mask and LEDMask) then
         if 1 = (Notify.Value and 1) then
            Turn_On (Blue_LED);
         else
            Turn_Off (Blue_LED);
         end if;
      end if;
      MS_Delay (200);
      Turn_Off (Green_LED);
      Turn_Off (Red_LED);
      LoRa_Send_Notify8_Reply (P);
   end LoRa_Rcv_Notify8;

   procedure LoRa_Start
   is
      use WorklistT;
   begin
      My_Id := UInt8 (Who_Am_I_SX1276 and 16#ff#);
      List_Init_Head (WorklistPoolPtr);
      List_Init_Head (WorklistQueuePtr);

      for Index in 1 .. WORKLIST_NUM_MAX loop
         List_Insert_Tail (WorklistPoolPtr, WorklistBuffer (Index)'Access);
      end loop;
      Set_True (LoRa_Go);
   end LoRa_Start;

end LoRa_Client;
