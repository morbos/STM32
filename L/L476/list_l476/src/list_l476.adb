
with HAL; use HAL;
with HAL.SPI;
with Gen_List;

--  use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure List_l476
is
   HCI_READ_PACKET_SIZE    : constant Natural := 128;
   HCI_READ_PACKET_NUM_MAX : constant Natural := 5;

   type HciDataPacket is record
      DataBuff : UInt8_Array (1 .. HCI_READ_PACKET_SIZE);
      Data_Len : UInt8;
   end record;
   package HciDataPacketT is new Gen_List (HciDataPacket, HCI_READ_PACKET_NUM_MAX);
   use HciDataPacketT;
   HciReadPacketBuffer : ListNode_Array;
   HciReadPktPool      : aliased ListNode;
   HciReadPktPoolPtr   : ListNodePtr := HciReadPktPool'Access;
   Size                : Natural;
begin
   List_Init_Head (HciReadPktPoolPtr);
--  List_Insert_Head (HeadP, TryP);
--  Initialize the queue of free hci data packets */
   for Index in HciReadPacketBuffer'Range loop
      List_Insert_Tail (HciReadPktPoolPtr, HciReadPacketBuffer (Index)'Access);
   end loop;
   Size := List_Get_Size (HciReadPktPoolPtr);
   loop
      null;
   end loop;
end List_l476;
