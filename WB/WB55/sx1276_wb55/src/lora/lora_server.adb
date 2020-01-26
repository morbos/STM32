with HAL;             use HAL;
with SX1276_API;      use SX1276_API;
with LoRa_Base;       use LoRa_Base;
with CRC8;            use CRC8;
with STM32.Board;     use STM32.Board;

--  Bridge to BLE vvvv
with Comm;            use Comm;
with Comm.Run;        use Comm.Run;
with Utils;           use Utils;
with Main;

with Ada.Real_Time; use Ada.Real_Time;

package body LoRa_Server is

   task body LoRa_Server is
      Ping_Timeout  : constant := 5000;
      Ping_Start  : Time;
      Start       : Time;
      use WorklistT;
   begin
      Suspend_Until_True (LoRa_Go);
      Ping_Start := Clock;
      Start := Clock;
      SetRxMode;
      loop
         if (Clock - Ping_Start) > Milliseconds (Ping_Timeout) then
            LoRa_Ping;
            Ping_Start := Clock;
         end if;
         LoRa_Sweep;
         MS_Delay (100);
      end loop;

   end LoRa_Server;

   task body LoRa_Notifier is
   begin
      loop
         Suspend_Until_True (LoRa_Notify_Go);
         LoRa_Notify_LED (LoRa_LED_State);
      end loop;
   end LoRa_Notifier;

   procedure LoRa_Rcv_Notify8 (P : ListNodePtr)
   is
      Notify : Notify8 := P.Elem.Payload;
      EventMask : UInt8 := (2 ** 1);
      LEDMask : UInt8 := (2 ** 0);
   begin
      if EventMask = (Notify.Mask and EventMask) then
         Set_True (Main.SW1_Go);
      end if;
      LoRa_Send_Notify8_Reply (P);
   end LoRa_Rcv_Notify8;

   procedure LoRa_Notify_LED (On : Boolean)
   is
      N : ListNodePtr;
      Notify : Notify8;
   begin
      Turn_Off (Red_LED);
      for I in LoRa_Actives'Range loop
         if LoRa_Actives (Integer (I)).Seen then
            List_Remove_Head (WorklistPoolPtr, N);
            N.Elem.Hdr.To := UInt8 (I);
--            N.Elem.Hdr.To := 2;
            N.Elem.Hdr.From := My_Id;
            N.Elem.Cmd := (Cmd => LORA_NOTIFY8, others => 0);
            N.Elem.NeedReply := True;
            N.Elem.ReplySeen := False;
            Notify.Mask := 1; --  Bit0 will be for the LED
            Notify.Value := (if On then 1 else 0); --  Set the button
            N.Elem.Payload := Notify;
            if not LoRa_InQueue (N) then
               List_Insert_Tail (WorklistQueuePtr, N);
               LoRa_Send (N, False);
            else
               --  Put it back. We dont start another one
               --  until all retries are exhausted
               List_Insert_Tail (WorklistPoolPtr, N);
            end if;
            MS_Delay (50 + (5 * I));
         end if;
      end loop;
   end LoRa_Notify_LED;

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

end LoRa_Server;
