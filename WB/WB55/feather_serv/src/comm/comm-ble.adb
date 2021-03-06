with System;
with HAL;           use HAL;
with STM32.Device;  use STM32.Device;
with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with BLE_Status;    use BLE_Status;
with Hci;           use Hci;
with Hci_Le;        use Hci_Le;
with Comm.TL;       use Comm.TL;
with Comm.Mbox;     use Comm.Mbox;
with STM32.IPCC;    use STM32.IPCC;
with Memory;        use Memory;
with Log;           use Log;

package body Comm.BLE is

   procedure Ble_Event
   is
      use EvtQueueBufferT;
      Ptr  : ListNodePtr;
   begin
      while not List_Is_Empty (EvtQueuePoolPtr) loop
         List_Remove_Head (EvtQueuePoolPtr, Ptr);
         Log_Event (Ptr);
         if Is_Hci_Send_Req_Event (Ptr) then
            List_Insert_Tail (HostTxQueuePoolPtr, Ptr);
            Set_True (IPCC_HCI_SEND_REQ_SO);
         else
            List_Insert_Tail (HostEvtQueuePoolPtr, Ptr);
            Set_True (IPCC_BLE_EVENT_SO);
         end if;
      end loop;
   end Ble_Event;

   procedure Initialize_BLE
   is
   begin
      IPCC_Cpu1_EnableReceiveChannel (HW_IPCC_BLE_EVENT_CHANNEL);

      if Hci_Reset /= BLE_STATUS_OK then
         raise Program_Error with "Hci_Reset";
      end if;
   end Initialize_BLE;

end Comm.BLE;
