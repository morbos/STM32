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
         X : UInt32
           with Volatile, Address => System'To_Address (16#5800_0c14#);
         Y : UInt32
           with Volatile, Address => System'To_Address (16#5800_0c1c#);
      begin
         Logger (16#20#);
--         Logger (UInt8 (X and 16#ff#));
--         Logger (UInt8 (Y and 16#ff#));
         if IPCC_RX_Pending (HW_IPCC_SYSTEM_EVENT_CHANNEL) then
            Logger (16#21#);
            IPCC_Cpu1_ClearFlag (HW_IPCC_SYSTEM_EVENT_CHANNEL);
            Set_True (IPCC_SYSTEM_EVENT_SO);
--          HW_IPCC_SYS_EvtHandler;
         elsif IPCC_RX_Pending (HW_IPCC_BLE_EVENT_CHANNEL) then
            Logger (16#22#);
            Ble_Event;
--            Set_True (IPCC_BLE_EVENT_SO);
--            HW_IPCC_BLE_EvtHandler;
            IPCC_Cpu1_ClearFlag (HW_IPCC_BLE_EVENT_CHANNEL);
         elsif IPCC_RX_Pending (HW_IPCC_TRACES_CHANNEL) then
            Logger (16#23#);
            --  HW_IPCC_BLE_AclDataEvtHandler();
            IPCC_Cpu1_ClearFlag (HW_IPCC_TRACES_CHANNEL);
--         else
--            Logger (16#2f#);
--            while True loop
--               null;
--            end loop;
         end if;

      end IPCC_C1_RX_Handler;

      procedure IPCC_C1_TX_Handler
      is
      begin
         Logger (16#30#);
         if IPCC_TX_Pending (HW_IPCC_SYSTEM_CMD_RSP_CHANNEL) then
            Logger (16#31#);
            IPCC_Cpu1_DisableTransmitChannel (HW_IPCC_SYSTEM_CMD_RSP_CHANNEL);
--            HW_IPCC_SYS_CmdEvtHandler;
         elsif IPCC_TX_Pending (HW_IPCC_SYSTEM_CMD_RSP_CHANNEL) then
            Logger (16#32#);
--          HW_IPCC_SYS_CmdEvtHandler();
         elsif IPCC_TX_Pending (HW_IPCC_MM_RELEASE_BUFFER_CHANNEL) then
            Logger (16#33#);
            --  HW_IPCC_MM_FreeBufHandler();
         elsif IPCC_TX_Pending (HW_IPCC_HCI_ACL_DATA_CHANNEL) then
            Logger (16#34#);
            --  HW_IPCC_BLE_AclDataEvtHandler();
         end if;

      end IPCC_C1_TX_Handler;

   end Handler;

end Comm.TL.Int;
