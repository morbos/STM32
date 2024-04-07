with HAL;            use HAL;
with Memory;         use Memory;
with Gen_List;
with System;

package Hci is

   HCI_MAX_PAYLOAD_SIZE    : constant Natural := 255;
   HCI_READ_PACKET_SIZE    : constant Natural := 255;
   HCI_READ_PACKET_NUM_MAX : constant Natural := 5;

   --  HCI Packet types
   HCI_COMMAND_PKT         : constant UInt8 := 16#01#;
   HCI_ACLDATA_PKT         : constant UInt8 := 16#02#;
   HCI_SCODATA_PKT         : constant UInt8 := 16#03#;
   HCI_EVENT_PKT           : constant UInt8 := 16#04#;
   HCI_VENDOR_PKT          : constant UInt8 := 16#ff#;

   type Encryption_Key_Size is range 7 .. 16;

   type Opcode_Type is record
      Ogf : UInt6;
      Ocf : UInt10;
   end record
     with Size => 16;

   for Opcode_Type use record
      Ogf   at 0 range 10 .. 15;
      Ocf   at 0 range  0 ..  9;
   end record;

   type Opcode_Field
     (As_Record : Boolean := False)
   is record
      case As_Record is
         when False =>
            Result : Opcode_Type;
         when True =>
            Val : UInt16;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   Hci_Send_Req_Opcode : Opcode_Type := (0, 0);

--   type DataBuffT is new UInt8_Array (1 .. HCI_READ_PACKET_SIZE);

   type Hci_Command_Hdr is record
      Opcode : Opcode_Type;
      Plen   : UInt8;
   end record
     with Pack;
   HCI_COMMAND_HDR_SIZE       : constant UInt8 := 16#03#;

   type Hci_Uart_Pckt is record
      Pkt_Type : UInt8;
   end record
     with Pack;

   HCI_HDR_SIZE               : constant UInt8 := 16#01#;

   type Hci_Event_Pckt is record
      Evt  : UInt8;
      Plen : UInt8;
   end record
     with Pack;
   HCI_EVENT_HDR_SIZE         : constant UInt8 := 16#02#;

   EVT_CMD_COMPLETE_CODE      : constant UInt8 := 16#0E#;
   type Evt_Cmd_Complete is record
      Ncmd   : UInt8;
      Opcode : Opcode_Type;
   end record
     with Pack;

   EVT_CMD_COMPLETE_SIZE      : constant UInt8 := 16#03#;

   EVT_CMD_STATUS_CODE        : constant UInt8 := 16#0F#;
   type Evt_Cmd_Status is record
      Status : UInt8;
      Ncmd   : UInt8;
      Opcode : Opcode_Type;
   end record
     with Pack;
   EVT_CMD_STATUS_SIZE        : constant UInt8 := 16#04#;

   EVT_HARDWARE_ERROR_CODE    : constant UInt8 := 16#10#;
   type Evt_Hardware_Error is record
      Code : UInt8;
   end record
     with Pack;
   EVT_HARDWARE_ERROR_SIZE    : constant UInt8 := 16#01#;

   EVT_DISCONN_COMPLETE_CODE  : constant UInt8 := 16#05#;
   type Evt_Disconn_Complete is record
      Status : UInt8;
      Handle : UInt16;
      Reason : UInt8;
   end record
     with Pack;

   EVT_DISCONN_COMPLETE_SIZE  : constant UInt8 := 4;

   type HciDataPacket is record
      DataBuff    : DataBuffT;
      Data_Len    : UInt8;
   end record;

   EVT_VENDOR   : constant UInt8 := 16#FF#;

   package HciDataPacketT is new Gen_List (HciDataPacket, HCI_READ_PACKET_NUM_MAX);
   use HciDataPacketT;
   HciReadPacketBuffer   : ListNode_Array;
   HciReadPktPool        : aliased ListNode;
   HciReadPktPoolPtr     : ListNodePtr := HciReadPktPool'Access;
   HciReadPktRxQueue     : aliased ListNode;
   HciReadPktRxQueuePtr  : ListNodePtr := HciReadPktRxQueue'Access;
   type Read_Local_Version_Rp is record
      Status             : UInt8;
      Hci_Version        : UInt8;
      Hci_Revision       : UInt16;
      Lmp_Pal_Version    : UInt8;
      Manufacturer_Name  : UInt16;
      Lmp_Pal_Subversion : UInt16;
   end record
     with Pack;
   READ_LOCAL_VERSION_RP_SIZE : constant UInt8 := 9;

   type Hci_Request is record
      Opcode : Opcode_Type;
      Event  : UInt8;
      Cparam : access DataBuffT;
      Clen   : UInt8;
      Rparam : access DataBuffT;
      Rlen   : UInt8;
   end record;


   procedure Hci_Timeout_Callback;
   procedure Hci_Init;
   function HCI_Verify (HciReadPacket : ListNodePtr) return Integer;
   function HCI_Queue_Empty return Boolean;
   procedure Hci_Send_Cmd
     (Opcode : Opcode_Type;
      Plen   : UInt8;
      Param  : DataBuffT);
   procedure Move_List
     (Dest_List : ListNodePtr;
      Src_List  : ListNodePtr);
   function Hci_Send_Req
     (R     : in out Hci_Request;
      Async : Boolean) return Integer;

   function Is_Hci_Send_Req_Event (Ptr : EvtQueueBufferT.ListNodePtr) return Boolean;

end Hci;
