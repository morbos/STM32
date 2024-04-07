with HAL;            use HAL;
with HAL.SPI;        use HAL.SPI;
with Gen_List;
with System;

with Ada.Real_Time; use Ada.Real_Time;

package LoRa_Base is

   My_Id      : UInt8;

   type Integer_Ptr is access all Integer;

   type LoRa_Packet is new SPI_Data_8b (1 .. 255);

   type LoRa_Packet_Ptr is not null access all LoRa_Packet;

   type LoRa_Header is record
      To    : UInt8;
      From  : UInt8;
   end record
     with Pack, Size => 16;

   type LoRa_CmdHeader is record
      Cmd    : UInt8;
      SeqNum : UInt4;
      Retry  : UInt4;
   end record
     with Pack, Size => 16;

   type Notify8 is record
      Mask  : UInt8;
      Value : UInt8;
   end record
     with Pack, Size => 16;

   type Worklist_Entry is record
      Timestamp : Time;
      RSSI      : UInt8;
      NeedReply : Boolean;
      ReplySeen : Boolean;
      Hdr       : LoRa_Header;
      Cmd       : LoRa_CmdHeader;
      Payload   : Notify8;
      Buffer    : LoRa_Packet;
   end record
     with Volatile;

   WORKLIST_NUM_MAX : constant := 20;

   package WorklistT is new Gen_List (Worklist_Entry, WORKLIST_NUM_MAX);
   use WorklistT;
   WorklistBuffer          : ListNode_Array;
   WorklistPool            : aliased ListNode;
   WorklistPoolPtr         : ListNodePtr := WorklistPool'Access;
   WorklistQueue           : aliased ListNode;
   WorklistQueuePtr        : ListNodePtr := WorklistQueue'Access;

   LORA_CMD_PING                 : constant UInt8 := 16#00#;
   LORA_CMD_PING_REPLY           : constant UInt8 := 16#01#;
   --  8 bit notify cmd.
   LORA_NOTIFY8                  : constant UInt8 := 16#04#;
   LORA_NOTIFY8_REPLY            : constant UInt8 := 16#05#;

   LoRa_BCAST : constant UInt8 := 16#FF#;

   LORA_RETRY_LIMIT : constant := 4;

   procedure LoRa_Ping;

   procedure LoRa_Ping (To : UInt8);

--   function LoRa_Receive return Boolean;

   procedure LoRa_Parse (P : ListNodePtr);

   procedure LoRa_Send (N : ListNode; Reply : Boolean);

   procedure LoRa_Send_Ping_Reply (P : ListNodePtr);

   procedure LoRa_Send_Notify8_Reply (P : ListNodePtr);

   procedure LoRa_Rcv_Notify8_Reply (Ptr : ListNodePtr; Notify : Notify8);

   procedure LoRa_Sweep;

   task Rcv_Task is
      pragma Storage_Size (4 * 1024);
      pragma Priority (System.Max_Priority);
   end Rcv_Task;

end LoRa_Base;
