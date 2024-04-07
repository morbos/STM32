------------------------------------------------------------------------------
--                                                                          --
--                    Copyright (C) 2015, AdaCore                           --
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

with HAL.SPI;         use HAL.SPI;
with STM32.Board;     use STM32.Board;
with STM32.Device;    use STM32.Device;
with STM32.SubGhzRF;  use STM32.SubGhzRF;

with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Radio_Int is

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure Radio_Handler
      is
         RFStatus : Subghz_Status;
         RxPayloadLength      : UInt8;
         RxStartBufferPointer : UInt8;
         Npkt    : UInt16;
         Ncrc    : UInt16;
         Nlen    : UInt16;
         X       : Irq_Status;
      begin
         X := Get_IrqStatus (RFStatus);
         --         if UInt16 (X and 16#063#) = 16#0002# then
         if X.HeaderErr then
            Turn_On (Red_LED);
         elsif X.Timeout then
            Turn_On (Red_LED);
         elsif X.Misc_Err then
            Turn_On (Red_LED);
         elsif X.RxDone then
            Get_RxBufferStatus (RFStatus, RxPayloadLength, RxStartBufferPointer);
            declare
               Buffer : SPI_Data_8b (1 .. Integer (RxPayloadLength));
            begin
               Turn_On (Green_LED);
               Read_Buffer (RxStartBufferPointer, RFStatus, Buffer);
--               Toggle_TxRx;
               LoRa_Get_Stats (RFStatus, Npkt, Ncrc, Nlen);
               Npkts := Npkt;
               Crc8 := Buffer (Integer (RxPayloadLength));
            end;
            Turn_Off (Red_LED);
            Set_True (Message_Go);
         end if;
         Set_Rx (Timeout => 2_000_000); --  > 30secs
         Clr_IrqStatus (X);
      end Radio_Handler;

   end Handler;

end Radio_Int;
