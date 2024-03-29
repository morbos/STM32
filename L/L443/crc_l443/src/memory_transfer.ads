------------------------------------------------------------------------------
--                                                                          --
--                    Copyright (C) 2017, AdaCore                           --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

--  This package declares the DMA objects that will be used to transfer the
--  block of data to the CRC unit (instead of requiring the CPU to do the
--  transfer). It also provides the interrupt handler that recognizes all the
--  DMA interrupts and blocks callers until the next interrupt occurs. Callers
--  will use this mechanism to await the completion of the DMA transfer to the
--  CRC unit.

with Ada.Interrupts.Names;   use Ada.Interrupts.Names;
with DMA_Interrupt_Handling; use DMA_Interrupt_Handling;
with STM32.Device;           use STM32.Device;
with STM32.DMA;              use STM32.DMA;

package Memory_Transfer is

   Controller : DMA_Controller renames DMA_1;

   Channel : constant DMA_Channel_Selector := Channel_1;

   IRQ_Id : constant Ada.Interrupts.Interrupt_ID := DMA1_Channel1_Interrupt;
   --  must match that of the selected controller and stream number!

   DMA_IRQ_Handler : DMA_Unit_IRQ_Handler (Controller'Access, Channel, IRQ_Id);

end Memory_Transfer;
