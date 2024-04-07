
with HAL; use HAL;
with STM32.Device;    use STM32.Device;
with STM32.GPIO;      use STM32.GPIO;
with STM32.Board;     use STM32.Board;
with Ada.Text_IO;     use Ada.Text_IO;
with STM32_SVD.GPDMA; use STM32_SVD.GPDMA;
with STM32_SVD.RCC;   use STM32_SVD.RCC;
with Semihosting;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time; use Ada.Real_Time;

procedure Try is
   procedure My_Delay;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;
   X : Boolean;
begin
   Initialize_Board;
   --  Enable GPDMA
   RCC_Periph.RCC_AHB1ENR.GPDMA1EN := True;
   --  Setup a mem-mem gpdma

--  /* USER CODE END GPDMA1_Init 1 */
--  handle_GPDMA1_Channel12.Instance = GPDMA1_Channel12;
--  handle_GPDMA1_Channel12.Init.Request = DMA_REQUEST_SW;
--  handle_GPDMA1_Channel12.Init.BlkHWRequest = DMA_BREQ_SINGLE_BURST;
--  handle_GPDMA1_Channel12.Init.Direction = DMA_MEMORY_TO_MEMORY;
--  handle_GPDMA1_Channel12.Init.SrcInc = DMA_SINC_INCREMENTED;
--  handle_GPDMA1_Channel12.Init.DestInc = DMA_DINC_INCREMENTED;
--  handle_GPDMA1_Channel12.Init.SrcDataWidth = DMA_SRC_DATAWIDTH_WORD;
--  handle_GPDMA1_Channel12.Init.DestDataWidth = DMA_DEST_DATAWIDTH_WORD;
--  handle_GPDMA1_Channel12.Init.Priority = DMA_LOW_PRIORITY_HIGH_WEIGHT;
--  handle_GPDMA1_Channel12.Init.SrcBurstLength = 1;
--  handle_GPDMA1_Channel12.Init.DestBurstLength = 1;
--  handle_GPDMA1_Channel12.Init.TransferAllocatedPort = DMA_SRC_ALLOCATED_PORT0|DMA_DEST_ALLOCATED_PORT1;
--  handle_GPDMA1_Channel12.Init.TransferEventMode = DMA_TCEM_BLOCK_TRANSFER;
--  handle_GPDMA1_Channel12.Init.Mode = DMA_NORMAL;

   loop
      Turn_On (Green_LED);
      My_Delay;
      Turn_Off (Green_LED);
      My_Delay;
   end loop;
end Try;
