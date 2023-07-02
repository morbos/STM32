
with HAL.SPI;         use HAL.SPI;
with STM32.SubGhzPhy; use STM32.SubGhzPhy;
with STM32.SubGhzRF;  use STM32.SubGhzRF;
with STM32.GPIO;      use STM32.GPIO;
with Peripherals;     use Peripherals;
with Ada.Real_Time;   use Ada.Real_Time;

package body Radio_Tasks is

   task body Radio_Task_Manager
   is
      Buffer    : LoRa_Message;
      Goal      : Time;
      P         : ListNodePtr;
      State     : Subghz_States;
   begin
      --  15.625us
      Set_Rx (Timeout => 128_000); --  > ~2secs
      loop
         Suspend_Until_True (Radio_Event_Go);
         State := Get_State;
         if Stat.Timeout then  --  rx or tx?
            if State = RX then
               --  RX timeout
               --  check the TX list for work to do
               null;
            elsif State = TX then
               null;
            else
               raise Program_Error with "Unknown timeout";
            end if;
         elsif Stat.RxDone then
            --  Add to incoming work Q
            null;
         elsif Stat.TxDone then
            null;
         elsif Stat.HeaderErr or Stat.Misc_Err then
            null;
         end if;
      end loop;
   end Radio_Task_Manager;

   procedure Radio_Tasks_Init
   is
   begin

      List_Init_Head (Radio_Queue_Ptr);

      --  Initialize the queue of free hci data packets
      for Index in 1 .. HCI_READ_PACKET_NUM_MAX loop
         List_Insert_Tail (HciReadPktPoolPtr, HciReadPacketBuffer (Index)'Access);
      end loop;
   end Radio_Tasks_Init;

end Radio_Tasks;
