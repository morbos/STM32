------------------------------------------------------------------------------
--                                                                          --
--                    Copyright (C) 2016, AdaCore                           --
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

with Ada.Real_Time;    use Ada.Real_Time;

package body BlueNRG_SPI_IO is

   procedure Reset (This : Any_IO_Port)
   is
   begin
      This.RST.Clear;
      delay until Clock + Milliseconds (10);
      This.RST.Set;
      delay until Clock + Milliseconds (10);
   end Reset;

   procedure Transmit_Receive (This     : Any_IO_Port;
                               Xmit     : SPI_Data_8b;
                               Recv     : out SPI_Data_8b
                              )
   is
      Status   : SPI_Status;
   begin
      This.CS.Clear;

      This.Port.Transmit_Receive (Xmit, Recv, Status);

      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;

--      This.Port.Receive (Recv, Status);

--      This.Port.Send_Receive_8bit_Mode (Xmit, Recv, Recv'Size);

      This.CS.Set;

      if Status /= Ok then
         --  No error handling...
         raise Program_Error;
      end if;

   end Transmit_Receive;

end BlueNRG_SPI_IO;
