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

with Ada.Unchecked_Conversion;
with Ada.Real_Time; use Ada.Real_Time;

--  with Ada.Real_Time; use Ada.Real_Time;

package body LSM303AGR is

   subtype Register_Address is UInt8;

   ---------------
   -- Device_Id --
   ---------------

   function Device_Id (This : in out LSM303AGR_Acc) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM303AGR_WHO_AM_I_A, Value => Result);
      return Result;
   end Device_Id;

   function Device_Id (This : in out LSM303AGR_Mag) return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, LSM303AGR_WHO_AM_I_M, Value => Result);
      return Result;
   end Device_Id;

   procedure Configure (This : in out LSM303AGR_Acc)
   is
      Result : UInt8;
   begin
      Write (This.Port, LSM303AGR_CTRL_REG4_A, Value => 1); --  3 Wire SPI
      Write (This.Port, LSM303AGR_CTRL_REG1_A, Value => 16#57#);
   end Configure;

   procedure Configure (This : in out LSM303AGR_Mag)
   is
   begin
      Write (This.Port, LSM303AGR_CFG_REG_C_M, 16#21#);
      Write (This.Port, LSM303AGR_CFG_REG_A_M, 0);
   end Configure;

end LSM303AGR;
