with STM32.IPCC;    use STM32.IPCC;

package Comm.Mbox is

   --  CPU1
   HW_IPCC_BLE_CMD_CHANNEL                       : constant IPCC_Channel_Range := IPCC_Channel_1;
   HW_IPCC_SYSTEM_CMD_RSP_CHANNEL                : constant IPCC_Channel_Range := IPCC_Channel_2;
   HW_IPCC_THREAD_OT_CMD_RSP_CHANNEL             : constant IPCC_Channel_Range := IPCC_Channel_3;
   HW_IPCC_MAC_802_15_4_CMD_RSP_CHANNEL          : constant IPCC_Channel_Range := IPCC_Channel_3;
   HW_IPCC_THREAD_CLI_CMD_CHANNEL                : constant IPCC_Channel_Range := IPCC_Channel_5;
   HW_IPCC_MM_RELEASE_BUFFER_CHANNEL             : constant IPCC_Channel_Range := IPCC_Channel_4;
   HW_IPCC_HCI_ACL_DATA_CHANNEL                  : constant IPCC_Channel_Range := IPCC_Channel_6;

   --  CPU2
   HW_IPCC_BLE_EVENT_CHANNEL                     : constant IPCC_Channel_Range := IPCC_Channel_1;
   HW_IPCC_SYSTEM_EVENT_CHANNEL                  : constant IPCC_Channel_Range := IPCC_Channel_2;
   HW_IPCC_THREAD_NOTIFICATION_ACK_CHANNEL       : constant IPCC_Channel_Range := IPCC_Channel_3;
   HW_IPCC_MAC_802_15_4_NOTIFICATION_ACK_CHANNEL : constant IPCC_Channel_Range := IPCC_Channel_3;
   HW_IPCC_TRACES_CHANNEL                        : constant IPCC_Channel_Range := IPCC_Channel_4;
   HW_IPCC_THREAD_CLI_NOTIFICATION_ACK_CHANNEL   : constant IPCC_Channel_Range := IPCC_Channel_5;

end Comm.Mbox;
