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
--     3. Neither the name of STMicroelectronics nor the names of its       --
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
--                                                                          --
--  This file is based on the Pololu Arduino port of ST's API               --
--                                                                          --
------------------------------------------------------------------------------

with HAL;        use HAL;
with HAL.I2C;

package VL53L8X is

   type VL53L8X_Ranging_Sensor
     (Port  : not null HAL.I2C.Any_I2C_Port) is limited private;

   type VL53L8X_GPIO_Functionality is
     (No_Interrupt,
      Level_Low,
      Level_High,
      Out_Of_Window,
      New_Sample_Ready);

   VL53L8_ID : constant := 16#f00c#;

   procedure Initialize
     (This : in out VL53L8X_Ranging_Sensor);

   function Read_Id (This : VL53L8X_Ranging_Sensor) return UInt16;

private

   type VL53L8X_Ranging_Sensor (Port : not null HAL.I2C.Any_I2C_Port)
   is limited record
      --  Default address: can be changed by software
      I2C_Address            : HAL.I2C.I2C_Address := 16#52#;
      Stop_Variable          : HAL.UInt8;
   end record;

   procedure I2C_Write
     (This   : VL53L8X_Ranging_Sensor;
      Data   : HAL.UInt8_Array;
      Status : out Boolean);

   procedure I2C_Read
     (This   : VL53L8X_Ranging_Sensor;
      Data   : out HAL.UInt8_Array;
      Status : out Boolean);

   procedure Write
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt8_Array;
      Status : out Boolean);
   procedure Write
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt8;
      Status : out Boolean);
   procedure Write
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt16;
      Status : out Boolean);
   procedure Write
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt32;
      Status : out Boolean);

   procedure Read
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt8_Array;
      Status : out Boolean);
   procedure Read
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt8;
      Status : out Boolean);
   procedure Read
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt16;
      Status : out Boolean);
   procedure Read
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt32;
      Status : out Boolean);

   IDENTIFICATION_MODEL_ID                                                   : constant := 16#00#;

end VL53L8X;
