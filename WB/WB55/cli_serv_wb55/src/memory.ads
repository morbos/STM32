with HAL; use HAL;
with Gen_List;
with System;

package Memory is

   SYSTEM_MEMORY_BASE      : constant := 16#1FFF0000#;  --  System Memory : 28Kb 1FFF0000 : 1FFF6FFF
   OTP_AREA_BASE           : constant := 16#1FFF7000#;  --  OTP area : 1kB 1FFF70000:1FFF73FF
   OPTION_BYTE_BASE        : constant := 16#1FFF8000#;  --  Option Bytes : 4kB 1FFF8000:1FFF8FFF
   ENGI_BYTE_BASE          : constant := 16#1FFF7400#;  --  Engi Bytes : 3kB 1FFF7400:1FFF7FFF
   SYSTEM_MEMORY_END_ADDR  : constant := 16#1FFF6FFF#;
   OTP_AREA_END_ADDR       : constant := 16#1FFF73FF#;
   OPTION_BYTE_END_ADDR    : constant := 16#1FFF8FFF#;
   ENGI_BYTE_END_ADDR      : constant := 16#1FFF7FFF#;


   HCI_READ_PACKET_SIZE    : constant Natural := 256;
   type DataBuffT is new UInt8_Array (1 .. HCI_READ_PACKET_SIZE);

   type BleCmdBuffer is record
      DataBuff    : DataBuffT;
      Data_Len    : UInt8;
   end record
     with Volatile, Pack;

   type EvtQueueBuffer is record
      DataBuff    : DataBuffT;
      Data_Len    : UInt8;
   end record
     with Volatile, Pack;

   package BleCmdBufferT is new Gen_List (BleCmdBuffer, 1);
   BleCmdPool            : aliased BleCmdBufferT.ListNode
     with Volatile, Address => System'To_Address (16#2003_0020#);
   pragma Import (Ada, BleCmdPool);
   BleCmdPoolPtr         : BleCmdBufferT.ListNodePtr := BleCmdPool'Access;

   package EvtQueueBufferT is new Gen_List (EvtQueueBuffer, 1);
   EvtQueuePool            : aliased EvtQueueBufferT.ListNode
     with Volatile, Address => System'To_Address (16#2003_0a1c#);

   pragma Import (Ada, EvtQueuePool);
   EvtQueuePoolPtr         : EvtQueueBufferT.ListNodePtr := EvtQueuePool'Access;

--   package HostTxQueueBufferT is new Gen_List (HostTxQueueBuffer, 1);
--   HostTxQueuePool            : aliased HostTxQueueBufferT.ListNode;
--   HostTxQueuePoolPtr         : HostTxQueueBufferT.ListNodePtr := HostTxQueuePool'Access;

   HostTxQueuePool            : aliased EvtQueueBufferT.ListNode;
   HostTxQueuePoolPtr         : EvtQueueBufferT.ListNodePtr := HostTxQueuePool'Access;

   HostEvtQueuePool            : aliased EvtQueueBufferT.ListNode;
   HostEvtQueuePoolPtr         : EvtQueueBufferT.ListNodePtr := HostEvtQueuePool'Access;

   FreeBufPool                 : aliased EvtQueueBufferT.ListNode
     with Volatile, Address => System'To_Address (16#2003_019c#);

   pragma Import (Ada, FreeBufPool);
   FreeBufPoolPtr              : EvtQueueBufferT.ListNodePtr := FreeBufPool'Access;

   type MB_SafeBootInfoTable_T is record
      Version : UInt32;
   end record
     with Pack;

   type MB_FusInfoTable_T is record
      Version     : UInt32;
      MemorySize  : UInt32;
      FusInfo     : UInt32;
   end record
     with Pack;

   type MB_WirelessFwInfoTable_T is record
      Version    : UInt32;
      MemorySize : UInt32;
      InfoStack  : UInt32;
      Reserved   : UInt32;
   end record
     with Pack;

   type MB_DeviceInfoTable_T is record
         SafeBootInfoTable   : MB_SafeBootInfoTable_T;
         FusInfoTable        : MB_FusInfoTable_T;
         WirelessFwInfoTable : MB_WirelessFwInfoTable_T;
   end record
     with Volatile, Pack;

   type MB_DeviceInfoTable_Ptr is access all MB_DeviceInfoTable_T;

   type MB_Ble_Table_T is record
      Pcmd_Buffer          : UInt32;
      Pcs_Buffer           : UInt32;
      Pevt_Queue           : UInt32;
      Phci_Acl_Data_Buffer : UInt32;
   end record
     with Volatile, Pack;

   type MB_Ble_Table_Ptr is access all MB_Ble_Table_T;

   type MB_ThreadTable_T is record
      Notack_Buffer        : UInt32;
      Clicmdrsp_Buffer     : UInt32;
      Otcmdrsp_Buffer      : UInt32;
   end record
     with Volatile, Pack;

   type MB_ThreadTable_Ptr is access all MB_ThreadTable_T;

   type MB_SysQueue_T is record
      Next : UInt32;
      Prev : UInt32;
   end record
     with Volatile, Pack;

   type MB_SysQueue_Ptr is access all MB_SysQueue_T;

   type MB_FreeBufQueue_T is record
      Next : UInt32;
      Prev : UInt32;
   end record
     with Volatile, Pack;

   type MB_FreeBufQueue_Ptr is access all MB_FreeBufQueue_T;

   type MB_TraceEventQueue_T is record
      Next : UInt32;
      Prev : UInt32;
   end record
     with Volatile, Pack;

   type MB_TraceEventQueue_Ptr is access all MB_TraceEventQueue_T;

   type MB_CsBuf_T is record
      Val1 : UInt32;
      Val2 : UInt32;
      Val3 : UInt32;
      Val4 : UInt32;
   end record
     with Volatile, Pack;

   type MB_CsBuf_Ptr is access all MB_CsBuf_T;

   type MB_SysTable_T is record
     Pcmd_Buffer            : UInt32;
     Sys_Queue              : UInt32;
   end record
     with Volatile, Pack;

   type MB_SysTable_Ptr is access all MB_SysTable_T;

   type MB_TracesTable_T is record
      Addr : UInt32;
   end record
     with Volatile, Pack;

   type MB_TracesTable_Ptr is access all MB_TracesTable_T;

   type MB_MemManagerTable_T is record
      Spare_Ble_Buffer        : UInt32;
      Spare_Sys_Buffer        : UInt32;
      Blepool                 : UInt32;
      Blepoolsize             : UInt32;
      Pevt_Free_Buffer_Queue  : UInt32;
      Traces_Evt_Pool         : UInt32;
      Tracespoolsize          : UInt32;
   end record
     with Volatile, Pack;

   type MB_MemManagerTable_Ptr is access all MB_MemManagerTable_T;

   type MB_Mac_802_15_4_T is record
      P_Cmdrsp_Buffer        : UInt32;
      P_Notack_Buffer        : UInt32;
      Evt_Queue              : UInt32;
   end record
     with Volatile, Pack;

   type MB_Mac_802_15_4_Ptr is access all MB_Mac_802_15_4_T;

   type MB_ZigbeeTable_T is record
      NotifM0toM4_Buffer      : UInt32;
      CliCmdM4toM0_Buffer     : UInt32;
      AppliCmdM4toM0_Buffer   : UInt32;
   end record
     with Volatile, Pack;

   type MB_ZigbeeTable_Ptr is access all MB_ZigbeeTable_T;

   type TL_RefTable is record
      Device_Info_Table  : MB_DeviceInfoTable_Ptr;
      Ble_Table          : MB_Ble_Table_Ptr;
      Thread_Table       : MB_ThreadTable_Ptr;
      Sys_Table          : MB_SysTable_Ptr;
      Mem_Manager_Table  : MB_MemManagerTable_Ptr;
      Traces_Table       : MB_TracesTable_Ptr;
      Mac_802_15_4_Table : MB_Mac_802_15_4_Ptr;
      Zigbee_Table       : MB_ZigbeeTable_Ptr;
   end record
     with Pack;

   procedure Initialize_Memory;

end Memory;
