
with HAL;             use HAL;
with STM32.Board;     use STM32.Board;
with STM32.Device;    use STM32.Device;
with STM32.GPIO;      use STM32.GPIO;
with STM32.DMA;       use STM32.DMA;
with STM32.CRC;       use STM32.CRC;
with STM32.CRC.DMA;   use STM32.CRC.DMA;
with Memory_Transfer; use Memory_Transfer;

with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

with Ada.Unchecked_Conversion;
with System;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Crc_F103 is

   Checksum_CPU : UInt32 := 0;
   --  the checksum obtained by calling a routine that uses the CPU to transfer
   --  the memory block to the CRC processor

   Checksum_DMA : UInt32 := 0;
   --  the checksum obtained by calling a routine that uses DMA to transfer the
   --  memory block to the CRC processor

   Section1 : constant Block_32 :=
   (16#00001021#, 16#20423063#, 16#408450A5#, 16#60C670E7#, 16#9129A14A#, 16#B16BC18C#,
    16#D1ADE1CE#, 16#F1EF1231#, 16#32732252#, 16#52B54294#, 16#72F762D6#, 16#93398318#,
    16#A35AD3BD#, 16#C39CF3FF#, 16#E3DE2462#, 16#34430420#, 16#64E674C7#, 16#44A45485#,
    16#A56AB54B#, 16#85289509#, 16#F5CFC5AC#, 16#D58D3653#, 16#26721611#, 16#063076D7#,
    16#569546B4#, 16#B75BA77A#, 16#97198738#, 16#F7DFE7FE#, 16#C7BC48C4#, 16#58E56886#,
    16#78A70840#, 16#18612802#, 16#C9CCD9ED#, 16#E98EF9AF#, 16#89489969#, 16#A90AB92B#,
    16#4AD47AB7#, 16#6A961A71#, 16#0A503A33#, 16#2A12DBFD#, 16#FBBFEB9E#, 16#9B798B58#,
    16#BB3BAB1A#, 16#6CA67C87#, 16#5CC52C22#, 16#3C030C60#, 16#1C41EDAE#, 16#FD8FCDEC#,
    16#AD2ABD0B#, 16#8D689D49#, 16#7E976EB6#, 16#5ED54EF4#, 16#2E321E51#, 16#0E70FF9F#);

   Section2 : constant Block_32 :=
   (16#EFBEDFDD#, 16#CFFCBF1B#, 16#9F598F78#, 16#918881A9#, 16#B1CAA1EB#, 16#D10CC12D#,
    16#E16F1080#, 16#00A130C2#, 16#20E35004#, 16#40257046#, 16#83B99398#, 16#A3FBB3DA#,
    16#C33DD31C#, 16#E37FF35E#, 16#129022F3#, 16#32D24235#, 16#52146277#, 16#7256B5EA#,
    16#95A88589#, 16#F56EE54F#, 16#D52CC50D#, 16#34E224C3#, 16#04817466#, 16#64475424#,
    16#4405A7DB#, 16#B7FA8799#, 16#E75FF77E#, 16#C71DD73C#, 16#26D336F2#, 16#069116B0#,
    16#76764615#, 16#5634D94C#, 16#C96DF90E#, 16#E92F99C8#, 16#B98AA9AB#, 16#58444865#,
    16#78066827#, 16#18C008E1#, 16#28A3CB7D#, 16#DB5CEB3F#, 16#FB1E8BF9#, 16#9BD8ABBB#,
    16#4A755A54#, 16#6A377A16#, 16#0AF11AD0#, 16#2AB33A92#, 16#ED0FDD6C#, 16#CD4DBDAA#,
    16#AD8B9DE8#, 16#8DC97C26#, 16#5C644C45#, 16#3CA22C83#, 16#1CE00CC1#, 16#EF1FFF3E#,
    16#DF7CAF9B#, 16#BFBA8FD9#, 16#9FF86E17#, 16#7E364E55#, 16#2E933EB2#, 16#0ED11EF0#);

   --  expected CRC value for the data above is 379E9F06 hex, or 933142278 dec
   Expected_Checksum : constant UInt32 := 933142278;

   Next_DMA_Interrupt : DMA_Interrupt;

   procedure Panic with No_Return;
   --  flash the on-board LEDs, indefinitely, to indicate a failure

   procedure Panic is
   begin
      loop
         Turn_On (Green_LED);
         delay until Clock + Milliseconds (100);
         Turn_Off (Green_LED);
         delay until Clock + Milliseconds (100);
      end loop;
   end Panic;

begin
   Initialize_Board;

   Enable_Clock (CRC_Unit);

   --  get the checksum using the CPU to transfer memory to the CRC processor;
   --  verify it is the expected value

   Update_CRC (CRC_Unit, Input => Section1, Output => Checksum_CPU);
   Update_CRC (CRC_Unit, Input => Section2, Output => Checksum_CPU);

   if Checksum_CPU /= Expected_Checksum then
      Panic;
   end if;

   --  get the checksum using DMA to transfer memory to the CRC processor

   Enable_Clock (Controller);

   Reset (Controller);

   Reset_Calculator (CRC_Unit);

   Update_CRC (CRC_Unit, Controller'Access, Channel, Input => Section1);

   DMA_IRQ_Handler.Await_Event (Next_DMA_Interrupt);

   if Next_DMA_Interrupt /= Transfer_Complete_Interrupt then
      Panic;
   end if;

   --  In this code fragment we use the approach suited for the case in which
   --  we are calculating the CRC for a section of system memory rather than a
   --  block of application data. We pretend that Section2 is a memory section.
   --  All we need is a known starting address and a known length. Given that,
   --  we can create a view of it as if it is an object of type Block_32 (or
   --  whichever block type is appropriate).
   declare
      subtype Memory_Section is Block_32 (1 .. Section2'Length);
      type Section_Pointer is access all Memory_Section with Storage_Size => 0;
      function As_Memory_Section_Reference is new Ada.Unchecked_Conversion
        (Source   => System.Address, Target => Section_Pointer);
   begin
      Update_CRC
        (CRC_Unit,
         Controller'Access,
         Channel,
         Input => As_Memory_Section_Reference (Section2'Address).all);
   end;

   DMA_IRQ_Handler.Await_Event (Next_DMA_Interrupt);

   if Next_DMA_Interrupt /= Transfer_Complete_Interrupt then
      Panic;
   end if;

   Checksum_DMA := Value (CRC_Unit);

   --  verify the two checksums are identical (one of which is already verified
   --  as the expected value)

   if Checksum_CPU /= Checksum_DMA then
      Panic;
   end if;

   loop
      null;
   end loop;

end Crc_F103;
