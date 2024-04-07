with HAL;           use HAL;
with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.IPCC;    use STM32.IPCC;
with Log;           use Log;
with Comm.Mbox;     use Comm.Mbox;
with Comm.BLE;      use Comm.BLE;

with System;

package body Comm.TL.Int is

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure IPCC_C1_RX_Handler
      is
      begin
         if IPCC_RX_Pending (HW_IPCC_SYSTEM_EVENT_CHANNEL) then
            IPCC_Cpu1_ClearFlag (HW_IPCC_SYSTEM_EVENT_CHANNEL);
            Set_True (IPCC_SYSTEM_EVENT_SO);
         elsif IPCC_RX_Pending (HW_IPCC_BLE_EVENT_CHANNEL) then
            Ble_Event;
            IPCC_Cpu1_ClearFlag (HW_IPCC_BLE_EVENT_CHANNEL);
         elsif IPCC_RX_Pending (HW_IPCC_TRACES_CHANNEL) then
            IPCC_Cpu1_ClearFlag (HW_IPCC_TRACES_CHANNEL);
         elsif IPCC_RX_Pending (HW_IPCC_MM_RELEASE_BUFFER_CHANNEL) then
            while True loop
               null;
            end loop;
--            IPCC_Cpu1_ClearFlag (HW_IPCC_MM_RELEASE_BUFFER_CHANNEL);
         end if;

      end IPCC_C1_RX_Handler;

      procedure IPCC_C1_TX_Handler
      is
      begin
         if IPCC_TX_Pending (HW_IPCC_SYSTEM_CMD_RSP_CHANNEL) then
            IPCC_Cpu1_DisableTransmitChannel (HW_IPCC_SYSTEM_CMD_RSP_CHANNEL);
         elsif IPCC_TX_Pending (HW_IPCC_SYSTEM_CMD_RSP_CHANNEL) then
            null;
         elsif IPCC_TX_Pending (HW_IPCC_MM_RELEASE_BUFFER_CHANNEL) then
            null;
         elsif IPCC_TX_Pending (HW_IPCC_HCI_ACL_DATA_CHANNEL) then
            null;
         end if;

      end IPCC_C1_TX_Handler;

   end Handler;

end Comm.TL.Int;
