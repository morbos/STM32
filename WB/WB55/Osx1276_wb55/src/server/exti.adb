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

with HAL;           use HAL;
with STM32.Board;   use STM32.Board;
with STM32.Device;  use STM32.Device;
with STM32.EXTI;    use STM32.EXTI;
with STM32.GPIO;    use STM32.GPIO;
with Main;          use Main;
with SX1276_SPI;    use SX1276_SPI;

with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

package body Exti is

   SX : SX1276_Radio (SX1276_Port'Access);

   PrevSW1 : Time := Clock;
   PrevSW2 : Time := Clock;

   -------------
   -- Handler --
   -------------

   protected body Handler is

      -----------------
      -- IRQ_Handler --
      -----------------

      procedure SW1_Handler
      is
         Curr : Time;
      begin
         Curr := Clock;
         if (Curr - PrevSW1) > Milliseconds (200) then --  Debounce
            Set_True (SW1_Go); --  Kick the button task
         end if;
         PrevSW1 := Curr;
         Clear_External_Interrupt (SW1_Line);
      end SW1_Handler;

      procedure SW2_Handler
      is
         Curr : Time;
      begin
         Curr := Clock;
         if (Curr - PrevSW2) > Milliseconds (200) then --  Debounce
            Set_True (SW2_Go);
         end if;
         PrevSW2 := Curr;
         Clear_External_Interrupt (SW2_Line);
      end SW2_Handler;

      procedure EXTI_Handler is
         Flags    : IrqFlags_Register;
      begin
         if External_Interrupt_Pending (EXTI_Line_2) then
            Clear_External_Interrupt (EXTI_Line_2);
         end if;
         if External_Interrupt_Pending (EXTI_Line_3) then  --  recv T/O
            Clear_External_Interrupt (EXTI_Line_3);
         end if;
         SX.ReadFlags (Flags);
         SX.SumBits (Flags);
         if Flags.TxDone then
            Tx_Done_Flag := True;
--            Set_True (Tx_Done);
         end if;
         if Flags.RxDone then
            Rx_Done_Flag := True;
--            Set_True (Rx_Done);
         end if;
         if Flags.PayloadCrcError then
            Rx_Error_Flag := True;
--            Set_True (Rx_Done);
         end if;
         if Flags.CadDone then
            Cad_Done_Flag := True;
         end if;
         if Flags.RxTimeout then
            Rx_Error_Flag := True;
--            Set_True (Rx_Done);
         end if;
         SX.ClearFlags (Flags);
      end EXTI_Handler;

   end Handler;

end Exti;
