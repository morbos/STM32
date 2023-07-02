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

with VL53L8x_FIRMWARE; use VL53L8x_FIRMWARE;
with Ada.Unchecked_Conversion;
with Ada.Real_Time;             use Ada.Real_Time;

package body VL53L8X is

   ---------------
   -- I2C_Write --
   ---------------

   procedure I2C_Write
     (This   : VL53L8X_Ranging_Sensor;
      Data   : HAL.UInt8_Array;
      Status : out Boolean)
   is
      use type HAL.I2C.I2C_Status;
      Ret : HAL.I2C.I2C_Status;
   begin
      HAL.I2C.Master_Transmit
        (This    => This.Port.all,
         Addr    => This.I2C_Address,
         Data    => Data,
         Status  => Ret);
      Status := Ret = HAL.I2C.Ok;
   end I2C_Write;

   procedure I2C_Write
     (This   : VL53L8X_Ranging_Sensor;
      Data1   : HAL.UInt8_Array;
      Data2   : HAL.UInt8_Array;
      Status : out Boolean)
   is
      use type HAL.I2C.I2C_Status;
      Ret : HAL.I2C.I2C_Status;
   begin
      HAL.I2C.Master_Transmit
        (This    => This.Port.all,
         Addr    => This.I2C_Address,
         Data1   => Data1,
         Data2   => Data2,
         Status  => Ret);
      Status := Ret = HAL.I2C.Ok;
   end I2C_Write;

   --------------
   -- I2C_Read --
   --------------

   procedure I2C_Read
     (This   : VL53L8X_Ranging_Sensor;
      Data   : out HAL.UInt8_Array;
      Status : out Boolean)
   is
      use type HAL.I2C.I2C_Status;
      Ret : HAL.I2C.I2C_Status;
   begin
      HAL.I2C.Master_Receive
        (This    => This.Port.all,
         Addr    => This.I2C_Address,
         Data    => Data,
         Status  => Ret);
      Status := Ret = HAL.I2C.Ok;
   end I2C_Read;

   -----------
   -- Write --
   -----------

   procedure Write
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt8_Array;
      Status : out Boolean)
   is
      IndexHi : constant UInt8 := UInt8 (Shift_Right (Index, 8) and 16#ff#);
      IndexLo : constant UInt8 := UInt8 (Index and 16#ff#);
      Buf : constant HAL.UInt8_Array := (1 => IndexHi, 2 => IndexLo) & Data;
   begin
      I2C_Write (This, Buf, Status);
   end Write;

   procedure Write
     (This   : VL53L8X_Ranging_Sensor;
      Data1  : HAL.UInt8_Array;
      Data2  : HAL.UInt8_Array;
      Status : out Boolean)
   is
   begin
      I2C_Write (This, Data1, Data2, Status);
   end Write;

   -----------
   -- Write --
   -----------

   procedure Write
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt8;
      Status : out Boolean)
   is
      IndexHi : constant UInt8 := UInt8 (Shift_Right (Index, 8) and 16#ff#);
      IndexLo : constant UInt8 := UInt8 (Index and 16#ff#);
   begin
      I2C_Write (This, (IndexHi, IndexLo, Data), Status);
   end Write;

   -----------
   -- Write --
   -----------

   procedure Write
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt16;
      Status : out Boolean)
   is
      IndexHi : constant UInt8 := UInt8 (Shift_Right (Index, 8) and 16#ff#);
      IndexLo : constant UInt8 := UInt8 (Index and 16#ff#);
   begin
      I2C_Write
        (This,
         (IndexHi, IndexLo,
          HAL.UInt8 (Shift_Right (Data, 8)),
          HAL.UInt8 (Data and 16#FF#)),
         Status);
   end Write;

   -----------
   -- Write --
   -----------

   procedure Write
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt32;
      Status : out Boolean)
   is
      IndexHi : constant UInt8 := UInt8 (Shift_Right (Index, 8) and 16#ff#);
      IndexLo : constant UInt8 := UInt8 (Index and 16#ff#);
   begin
      I2C_Write
        (This,
         (IndexHi, IndexLo,
          HAL.UInt8 (Shift_Right (Data, 24)),
          HAL.UInt8 (Shift_Right (Data, 16) and 16#FF#),
          HAL.UInt8 (Shift_Right (Data, 8) and 16#FF#),
          HAL.UInt8 (Data and 16#FF#)),
         Status);
   end Write;

   ----------
   -- Read --
   ----------

   procedure Read
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt8_Array;
      Status : out Boolean)
   is
      IndexHi : constant UInt8 := UInt8 (Shift_Right (Index, 8) and 16#ff#);
      IndexLo : constant UInt8 := UInt8 (Index and 16#ff#);
   begin
      I2C_Write (This, (1 => IndexHi, 2 => IndexLo), Status);
      if Status then
         I2C_Read (This, Data, Status);
      end if;
   end Read;

   ----------
   -- Read --
   ----------

   procedure Read
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt8;
      Status : out Boolean)
   is
      IndexHi : constant UInt8 := UInt8 (Shift_Right (Index, 8) and 16#ff#);
      IndexLo : constant UInt8 := UInt8 (Index and 16#ff#);
      Buf : UInt8_Array (1 .. 1);
   begin
      I2C_Write (This, (1 => IndexHi, 2 => IndexLo), Status);
      if Status then
         I2C_Read (This, Buf, Status);
         Data := Buf (1);
      end if;
   end Read;

   ----------
   -- Read --
   ----------

   procedure Read
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt16;
      Status : out Boolean)
   is
      IndexHi : constant UInt8 := UInt8 (Shift_Right (Index, 8) and 16#ff#);
      IndexLo : constant UInt8 := UInt8 (Index and 16#ff#);
      Buf : UInt8_Array (1 .. 2);
   begin
      I2C_Write (This, (1 => IndexHi, 2 => IndexLo), Status);
      if Status then
         I2C_Read (This, Buf, Status);
         Data := Shift_Left (UInt16 (Buf (1)), 8) or UInt16 (Buf (2));
      end if;
   end Read;

   ----------
   -- Read --
   ----------

   procedure Read
     (This   : VL53L8X_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt32;
      Status : out Boolean)
   is
      IndexHi : constant UInt8 := UInt8 (Shift_Right (Index, 8) and 16#ff#);
      IndexLo : constant UInt8 := UInt8 (Index and 16#ff#);
      Buf : UInt8_Array (1 .. 4);
   begin
      I2C_Write (This, (1 => IndexHi, 2 => IndexLo), Status);
      if Status then
         I2C_Read (This, Buf, Status);
         Data := Shift_Left (UInt32 (Buf (1)), 24) or
           Shift_Left (UInt32 (Buf (2)), 16) or
           Shift_Left (UInt32 (Buf (3)), 8) or
           UInt32 (Buf (4));
      end if;
   end Read;

   procedure Poll_For_Answer
     (This           : in out VL53L8X_Ranging_Sensor;
      Size           : UInt8;
      Pos            : UInt8;
      Address        : UInt16;
      Mask           : UInt8;
      Expected_Value : UInt8;
      Status         : out Boolean)
   is
      Results : UInt8_Array (0 .. Integer (Size - 1));
      Stat    : Boolean;
      Leave   : Time;
   begin
      Leave := Clock + Milliseconds (2000);
      Status := False;
      loop
         if Clock >= Leave then
            exit;
         end if;
         Read (This, Address, Results, Stat);
         delay until Clock + Milliseconds (10);
         if Size >= 4 and then Results (2) >= 16#7f# then
            exit;
         end if;
         if (Results (Integer (Pos)) and Mask) = Expected_Value then
            Status := True;
            exit;
         end if;
      end loop;
   end Poll_For_Answer;

   procedure Poll_For_Mcu_Boot
     (This           : in out VL53L8X_Ranging_Sensor;
      Status         : out Boolean)
   is
      Stat        : Boolean;
      Go2_Status0 : UInt8;
      Go2_Status1 : UInt8;
      Leave       : Time;
   begin
      Leave := Clock + Milliseconds (500);
      Status := False;
      loop
         if Clock >= Leave then
            exit;
         end if;
         Read (This, 16#0006#, Go2_Status0, Stat);
         if (Go2_Status0 and 16#80#) /= 0 then
            Read (This, 16#0007#, Go2_Status1, Stat);
            if (Go2_Status1 and 16#01#) /= 0 then
               Status := True;
               exit;
            end if;
         end if;
         delay until Clock + Milliseconds (1);
         if (Go2_Status0 and 16#01#) /= UInt8 (0) then
            Status := True;
            exit;
         end if;
      end loop;
   end Poll_For_Mcu_Boot;

   procedure Send_Offset_Data
     (This           : in out VL53L8X_Ranging_Sensor;
      Resolution     : UInt8;
      Status         : out Boolean)
   is
--      uint32_t signal_grid[64];
--      int16_t range_grid[64];
--      uint8_t dss_4x4[] = {0x0F, 0x04, 0x04, 0x00, 0x08, 0x10, 0x10, 0x07};
      Footer :  UInt8_Array := (16#00#, 16#00#, 16#00#, 16#0F#, 16#03#, 16#01#, 16#01#, 16#E4#);
--      uint8_t footer[] = {0x00, 0x00, 0x00, 0x0F, 0x03, 0x01, 0x01, 0xE4};
--      int8_t i, j;
--      uint16_t k;
   begin
      Status := True;
      for I in 0 .. VL53L8CX_OFFSET_BUFFER_SIZE - 1 loop
         This.Temp_Buffer.Byte (I) := This.Offset_Data (I);
      end loop;

      --  Only 8x8
      for K in 0 .. VL53L8CX_OFFSET_BUFFER_SIZE - 4 loop
         This.Temp_Buffer.Byte (K) := This.Temp_Buffer.Byte (K + 8);
      end loop;

      for I in Footer'Range loop
         This.Temp_Buffer.Byte (16#1E0# + I) := Footer (I);
      end loop;

      Write (This, (16#2e#, 16#18#), This.Temp_Buffer.Byte (0 .. VL53L8CX_OFFSET_BUFFER_SIZE - 1), Status);

      Poll_For_Answer (This, 4, 1, VL53L8CX_UI_CMD_STATUS, 16#ff#, 3, Status);
      if not Status then
         raise Program_Error with "ui cmd status failed";
      end if;

--
--      (void)memcpy(&(p_dev->temp_buffer[0x1E0]), footer, 8);
--      status |= WrMulti(&(p_dev->platform), 0x2e18, p_dev->temp_buffer,
--              VL53L8CX_OFFSET_BUFFER_SIZE);
--      status |=_vl53l8cx_poll_for_answer(p_dev, 4, 1,
--              VL53L8CX_UI_CMD_STATUS, 0xff, 0x03);
--
--      return status;
   end Send_Offset_Data;

   procedure Send_Xtalk_Data
     (This           : in out VL53L8X_Ranging_Sensor;
      Resolution     : UInt8;
      Status         : out Boolean)
   is
   begin
      Status := True;
      for I in 0 .. VL53L8CX_XTALK_BUFFER_SIZE - 1 loop
         This.Temp_Buffer.Byte (I) := This.Xtalk_Data (I);
      end loop;

      --  8x8 only for now

--      Write (This, UInt16 (16#2cf8#), This.Temp_Buffer.Byte (0 .. VL53L8CX_XTALK_BUFFER_SIZE - 1), Status);
      Write (This, (16#2c#, 16#f8#), This.Temp_Buffer.Byte (0 .. VL53L8CX_XTALK_BUFFER_SIZE - 1), Status);

      Poll_For_Answer (This, 4, 1, VL53L8CX_UI_CMD_STATUS, 16#ff#, 3, Status);
      if not Status then
         raise Program_Error with "ui cmd status failed";
      end if;

   end Send_Xtalk_Data;

   procedure SwapBuffer (Buffer : in out UInt8_Array)
   is
      Local : UInt32_Array (0 .. (Buffer'Size / 32) - 1);
      for Local'Alignment use 1;
      for Local'Address use Buffer'Address;
      X : UInt32;
   begin
      for I in 0 .. (Buffer'Size / 32) - 1 loop
         X := Local (I);
         X := (Shift_Right (X, 24) and 16#ff#) or
              (Shift_Right (X, 8) and 16#ff00#) or
              (Shift_Left (X, 8) and 16#ff0000#) or
              (Shift_Left (X, 24) and 16#ff000000#);
         Local (I) := X;
      end loop;
   end SwapBuffer;

   procedure Dci_Write_Data
     (This           : in out VL53L8X_Ranging_Sensor;
      Data           : HAL.UInt8_Array;
      Index          : UInt16;
      Status         : out Boolean)
   is
      Headers   : UInt8_Array := (0, 0, 0, 0);
      Data_Size : UInt16 := Data'Size / 8;
      Footer    : UInt8_Array := (16#00#, 16#00#, 16#00#, 16#0f#, 16#05#, 16#01#,
                                  UInt8 (Shift_Right (8 + Data_Size, 8)), UInt8 (8 + Data_Size) and 16#ff#);
      Address   : UInt16 := VL53L8CX_UI_CMD_END - (Data_Size + 12) + 1;
      Local_Data : UInt8_Array := Data;
      I         : Integer;
   begin
      Status := True;

      if Data_Size + 12 > VL53L8CX_TEMPORARY_BUFFER_SIZE then
         Status := False;
         return;
      end if;

      Headers (0) := UInt8 (Shift_Right (Index, 8));
      Headers (1) := UInt8 (Index and 16#ff#);
      Headers (2) := UInt8 (Shift_Right (Data_Size and 16#ff0#, 4));
      Headers (3) := UInt8 (Shift_Left (Data_Size and 16#0f#, 4));

      SwapBuffer (Local_Data);

      I := Integer (Data_Size - 1);
      while I >= 0 loop
         This.Temp_Buffer.Byte (I + 4) := Local_Data (I);
         I := I - 1;
      end loop;

      for I in Headers'Range loop
         This.Temp_Buffer.Byte (I) := Headers (I);
      end loop;

      for I in Footer'Range loop
         This.Temp_Buffer.Byte (I + Integer (Data_Size + 4)) := Footer (I);
      end loop;

      Write (This, Address, This.Temp_Buffer.Byte (0 .. Integer ((Data_Size + 12) - 1)), Status);

      Poll_For_Answer (This, 4, 1, VL53L8CX_UI_CMD_STATUS, 16#ff#, 3, Status);
      if not Status then
         raise Program_Error with "ui cmd status failed";
      end if;

   end Dci_Write_Data;

   procedure Dci_Read_Data
     (This           : in out VL53L8X_Ranging_Sensor;
      Data           : out HAL.UInt8_Array;
      Index          : UInt16;
      Data_Size      : UInt16;
      Status         : out Boolean)
   is
      Headers   : UInt8_Array := (0, 0, 0, 0);
      Rd_Size   : UInt16 := Data_Size + 12;
      Cmd       : UInt8_Array :=
        (16#00#, 16#00#, 16#00#, 16#00#,
         16#00#, 16#00#, 16#00#, 16#0f#,
         16#00#, 16#02#, 16#00#, 16#08#);
   begin
      Status := True;

      if Data_Size + 12 > VL53L8CX_TEMPORARY_BUFFER_SIZE then
         Status := False;
         return;
      end if;

      Cmd (0) := UInt8 (Shift_Right (Index, 8));
      Cmd (1) := UInt8 (Index and 16#ff#);
      Cmd (2) := UInt8 (Shift_Right (Data_Size and 16#ff0#, 4));
      Cmd (3) := UInt8 (Shift_Left (Data_Size and 16#0f#, 4));

      Write (This, VL53L8CX_UI_CMD_END - 11, Cmd, Status);
      Poll_For_Answer (This, 4, 1, VL53L8CX_UI_CMD_STATUS, 16#ff#, 3, Status);
      if not Status then
         raise Program_Error with "dci_read cmd failed";
      end if;

      Read (This, VL53L8CX_UI_CMD_START, This.Temp_Buffer.Byte (0 .. Integer (Rd_Size - 1)), Status);

      SwapBuffer (This.Temp_Buffer.Byte (0 .. Integer ((Data_Size + 12) - 1)));

      for I in 0 .. Data_Size loop
         Data (Integer (I)) := This.Temp_Buffer.Byte (Integer (I + 4));
      end loop;

   end Dci_Read_Data;

   procedure Get_Resolution
     (This           : in out VL53L8X_Ranging_Sensor;
      Resolution     : out UInt8;
      Status         : out Boolean)
   is

   begin
      Status := True;
      Dci_Read_Data (This, This.Temp_Buffer.Byte, VL53L8CX_DCI_ZONE_CONFIG, 8, Status);
      Resolution := This.Temp_Buffer.Byte (0) * This.Temp_Buffer.Byte (1);
   end Get_Resolution;

   procedure Set_Resolution
     (This           : in out VL53L8X_Ranging_Sensor;
      Resolution     : UInt8;
      Status         : out Boolean)
   is
   begin
      Status := True;

      case Resolution is
         when VL53L8CX_RESOLUTION_4X4 =>
            raise Program_Error with "set_resolution 4x4 unhandled";
         when VL53L8CX_RESOLUTION_8X8 =>
            Dci_Read_Data (This, This.Temp_Buffer.Byte, VL53L8CX_DCI_DSS_CONFIG, 16, Status);
            This.Temp_Buffer.Byte (4) := 16;
            This.Temp_Buffer.Byte (6) := 16;
            This.Temp_Buffer.Byte (9) := 1;
            Dci_Write_Data (This, This.Temp_Buffer.Byte (0 .. 15), VL53L8CX_DCI_DSS_CONFIG, Status);
            Dci_Read_Data (This, This.Temp_Buffer.Byte, VL53L8CX_DCI_ZONE_CONFIG, 8, Status);
            This.Temp_Buffer.Byte (0) := 8;
            This.Temp_Buffer.Byte (1) := 8;
            This.Temp_Buffer.Byte (4) := 4;
            This.Temp_Buffer.Byte (5) := 4;
            Dci_Write_Data (This, This.Temp_Buffer.Byte (0 .. 7), VL53L8CX_DCI_ZONE_CONFIG, Status);
         when others =>
            raise Program_Error with "set_resolution unhandled req";
      end case;

      Send_Offset_Data (This, VL53L8CX_RESOLUTION_8X8, Status);
      Send_Xtalk_Data (This, VL53L8CX_RESOLUTION_8X8, Status);

   end Set_Resolution;

   procedure Start_Ranging (This : in out VL53L8X_Ranging_Sensor; Status : out Boolean)
   is
      Resolution    : UInt8;
      Tmp           : UInt16;
      Tmp_Shadow    : UInt8_Array (0 .. 1);
      for Tmp_Shadow'Address use Tmp'Address;
      Header_Config : UInt32_Array := (0, 0);
      Header_Config_Shadow : UInt8_Array (0 .. (Header_Config'Size / 8) - 1);
      for Header_Config_Shadow'Address use Header_Config'Address;
      Cmd           : UInt8_Array := (16#00#, 16#03#, 16#00#, 16#00#);
      --  Enable mandatory output (meta and common data)
      Output_Bh_Enable : UInt32_Array := (16#00000007#, 16#00000000#, 16#00000000#, 16#C0000000#);
      Output_Bh_Enable_Shadow : UInt8_Array (0 .. ((Output_Bh_Enable'Size / 8) - 1));
      for Output_Bh_Enable_Shadow'Address use Output_Bh_Enable'Address;
      Output        : UInt32_Array :=
         (
           VL53L8CX_START_BH,
           VL53L8CX_METADATA_BH,
           VL53L8CX_COMMONDATA_BH,
           VL53L8CX_AMBIENT_RATE_BH,
           VL53L8CX_SPAD_COUNT_BH,
           VL53L8CX_NB_TARGET_DETECTED_BH,
           VL53L8CX_SIGNAL_RATE_BH,
           VL53L8CX_RANGE_SIGMA_MM_BH,
           VL53L8CX_DISTANCE_BH,
           VL53L8CX_REFLECTANCE_BH,
           VL53L8CX_TARGET_STATUS_BH,
           VL53L8CX_MOTION_DETECT_BH);
      Output_Shadow : UInt8_Array (0 .. (Output'Size / 8) - 1);
      for Output_Shadow'Address use Output'Address;
   begin
      Status := True;

      Get_Resolution (This, Resolution, Status);
      This.Data_Read_Size := 0;
      This.Streamcount := 255;

      --  Enable selected outputs in the 'platform.h' file */
      if not VL53L8CX_DISABLE_AMBIENT_PER_SPAD then
         Output_Bh_Enable (0) := Output_Bh_Enable (0) + 8;
      end if;
      if not VL53L8CX_DISABLE_NB_SPADS_ENABLED then
         Output_Bh_Enable (0) := Output_Bh_Enable (0) + 16;
      end if;
      if not VL53L8CX_DISABLE_NB_TARGET_DETECTED then
         Output_Bh_Enable (0) := Output_Bh_Enable (0) + 32;
      end if;
      if not VL53L8CX_DISABLE_SIGNAL_PER_SPAD then
         Output_Bh_Enable (0) := Output_Bh_Enable (0) + 64;
      end if;
      if not VL53L8CX_DISABLE_RANGE_SIGMA_MM then
         Output_Bh_Enable (0) := Output_Bh_Enable (0) + 128;
      end if;
      if not VL53L8CX_DISABLE_DISTANCE_MM then
         Output_Bh_Enable (0) := Output_Bh_Enable (0) + 256;
      end if;
      if not VL53L8CX_DISABLE_REFLECTANCE_PERCENT then
         Output_Bh_Enable (0) := Output_Bh_Enable (0) + 512;
      end if;
      if not VL53L8CX_DISABLE_TARGET_STATUS then
         Output_Bh_Enable (0) := Output_Bh_Enable (0) + 1024;
      end if;
      if not VL53L8CX_DISABLE_MOTION_INDICATOR then
         Output_Bh_Enable (0) := Output_Bh_Enable (0) + 2048;
      end if;

      for I in Output'Range loop
         --  Update data size
         if (Output (I) = 0) or ((Output_Bh_Enable (I / 32) and Shift_Left (1, I mod 32)) = 0) then
            null; -- C used a continue here
         else
            declare
               Bh : Block_Header;
               U  : UInt32 := Output (I);
               for U'Address use Bh'Address;
            begin
               --  bh_ptr = (union Block_header *)&(output[i]);
               if (Bh.Ty >= 1) and (Bh.Ty < 16#d#) then
                  if (Bh.Idx >= 16#54d0#) and (Bh.Idx < (16#54d0# + 960)) then
                     Bh.Size := UInt12 (Resolution);
                  else
                     Bh.Size := UInt12 (Resolution * VL53L8CX_NB_TARGET_PER_ZONE);
                  end if;
                  Output (I) := U;
                  This.Data_Read_Size := This.Data_Read_Size + (UInt32 (Bh.Ty) * UInt32 (Bh.Size));
               else
                  This.Data_Read_Size := UInt32 (This.Data_Read_Size) + UInt32 (Bh.Size);
               end if;
               This.Data_Read_Size := This.Data_Read_Size + 4;
            end;
         end if;
      end loop;
      This.Data_Read_Size := This.Data_Read_Size + 24;

      Dci_Write_Data (This, Output_Shadow, VL53L8CX_DCI_OUTPUT_LIST, Status);

      Header_Config (0) := This.Data_Read_Size;
      Header_Config (1) := (Output'Size / 32) + 1;

      Dci_Write_Data (This, Header_Config_Shadow, VL53L8CX_DCI_OUTPUT_CONFIG, Status);

      Dci_Write_Data (This, Output_Bh_Enable_Shadow, VL53L8CX_DCI_OUTPUT_ENABLES, Status);
      Write (This, 16#7fff#, UInt8 (16#00#), Status);
      Write (This, 16#0009#, UInt8 (16#05#), Status);
      Write (This, 16#7fff#, UInt8 (16#02#), Status);

      --  Start ranging session
      Write (This, UInt16 (VL53L8CX_UI_CMD_END - (4 - 1)), Cmd, Status);
      Poll_For_Answer (This, 4, 1, VL53L8CX_UI_CMD_STATUS, 16#ff#, 3, Status);
      if not Status then
         raise Program_Error with "start_ranging cmd failed";
      end if;

      --  Read ui range data content and compare if data size is the correct one
      Dci_Read_Data (This, This.Temp_Buffer.Byte, 16#5440#, 12, Status);

      Tmp_Shadow := This.Temp_Buffer.Byte (8 .. 9);
      if UInt32 (Tmp) /= This.Data_Read_Size then
         Status := False;
         return;
      end if;

      --  Ensure that there is no laser safety fault
      Dci_Read_Data (This, This.Temp_Buffer.Byte, 16#e0c4#, 8, Status);

      if This.Temp_Buffer.Byte (16#6#) /= 0 then
         Status := False;
      end if;
   end Start_Ranging;

   procedure Check_Data_Ready (This : in out VL53L8X_Ranging_Sensor; Ready : out Boolean; Status : out Boolean)
   is
   begin
      Status := True;
      Ready := False;
      Read (This, 0, This.Temp_Buffer.Byte (0 .. 3), Status);
      if This.Temp_Buffer.Byte (0) /= This.Streamcount and
        This.Temp_Buffer.Byte (0) /= 255 and
        This.Temp_Buffer.Byte (1) = 5 and
        (This.Temp_Buffer.Byte (2) and 5) = 5 and
        (This.Temp_Buffer.Byte (3) and 16#10#) = 16#10#
      then
         Ready := True;
         This.Streamcount := This.Temp_Buffer.Byte (0);
      else
         if (This.Temp_Buffer.Byte (3) and 16#80#) /= 16#0# then
            Status := False;
         end if;
      end if;
   end Check_Data_Ready;

   procedure Get_Ranging_Data (This : in out VL53L8X_Ranging_Sensor;
                               Results : out ResultsData;
                               Status : out Boolean
                              )
   is
      Header_Id : UInt16;
      Footer_Id : UInt16;
   begin
      Status := True;
      Read (This, 0, This.Temp_Buffer.Byte (0 .. Integer (This.Data_Read_Size - 1)), Status);
      This.Streamcount := This.Temp_Buffer.Byte (0);
      SwapBuffer (This.Temp_Buffer.Byte (0 .. Integer (This.Data_Read_Size - 1)));
      declare
         Bh : Block_Header;
         U  : UInt32;
         for U'Address use Bh'Address;
         Msize : UInt32;
         I     : Integer;
      begin
         I := 16;
         while I < Integer (This.Data_Read_Size) loop
            U := This.Temp_Buffer.Word (I / 4);
            if (Bh.Ty > 1) and (Bh.Ty < 16#d#) then
               Msize := UInt32 (Bh.Ty) * UInt32 (Bh.Size);
            else
               Msize := UInt32 (Bh.Size);
            end if;
            case Bh.Idx is
            when VL53L8CX_METADATA_IDX =>
                  Results.Silicon_Temp_Degc := This.Temp_Buffer.Byte (I + 12);
            when VL53L8CX_AMBIENT_RATE_IDX =>
                  Results.Ambient_Per_Spad :=
                          This.Temp_Buffer.Word ((I + 4) / 4 ..
                                                 (((I + 4) / 4) + Integer (Msize) / 4) - 1);
            when VL53L8CX_NB_TARGET_DETECTED_IDX =>
                  Results.Nb_Target_Detected  :=
                          This.Temp_Buffer.Byte (I + 4 ..
                                                 (I + 4 + Integer (Msize)) - 1);
            when VL53L8CX_SIGNAL_RATE_IDX =>
                  Results.Signal_Per_Spad :=
                          This.Temp_Buffer.Word ((I + 4) / 4 ..
                                                 (((I + 4) / 4) + Integer (Msize) / 4) - 1);
            when VL53L8CX_DISTANCE_IDX =>
                  Results.Distance_mm :=
                          This.Temp_Buffer.Short ((I + 4) / 2 ..
                                                  (((I + 4) / 2) + Integer (Msize) / 2) - 1);
            when VL53L8CX_REFLECTANCE_EST_PC_IDX =>
                  Results.Reflectance (0 .. Integer (Msize - 1)) :=
                          This.Temp_Buffer.Byte ((I * 4) + 4 ..
                                                 ((I * 4) + 4 + Integer (Msize)) - 1);
            when VL53L8CX_TARGET_STATUS_IDX =>
                  Results.Target_Status :=
                          This.Temp_Buffer.Byte (I + 4 ..
                                                 (I + 4 + Integer (Msize)) - 1);
            when VL53L8CX_MOTION_DETEC_IDX =>
                  Results.Motion_Indicator.Global_Indicator_1 :=
                        This.Temp_Buffer.Word ((I + 4) / 4);
                  Results.Motion_Indicator.Global_Indicator_2 :=
                        This.Temp_Buffer.Word ((I + 8) / 4);
                  Results.Motion_Indicator.Status :=
                        This.Temp_Buffer.Byte (I + 4 + 8);
                  Results.Motion_Indicator.Nb_Of_Detected_Aggregates :=
                        This.Temp_Buffer.Byte (I + 4 + 9);
                  Results.Motion_Indicator.Nb_Of_Aggregates :=
                        This.Temp_Buffer.Byte (I + 4 + 10);
                  Results.Motion_Indicator.Spare :=
                        This.Temp_Buffer.Byte (I + 4 + 11);
                  null;
                  Results.Motion_Indicator.Motion :=
                        This.Temp_Buffer.Word ((I + 4 + 12) / 4 .. ((I + 4 + 12 + 128) / 4) - 1);
            when others =>
                  null;
            end case;
            I := I + 4 + Integer (Msize);
         end loop;
         for I in Results.Ambient_Per_Spad'Range loop
            Results.Ambient_Per_Spad (I) := Results.Ambient_Per_Spad (I) / 2048;
         end loop;
         for I in Results.Distance_mm'Range loop
            Results.Distance_mm (I) := Results.Distance_mm (I) / 4;
         end loop;
         for I in Results.Reflectance'Range loop
            Results.Reflectance (I) := Results.Reflectance (I) / 2;
         end loop;
         for I in Results.Signal_Per_Spad'Range loop
            Results.Signal_Per_Spad (I) := Results.Signal_Per_Spad (I) / 2048;
         end loop;
         for I in Results.Motion_Indicator.Motion'Range loop
            Results.Motion_Indicator.Motion (I) := Results.Motion_Indicator.Motion (I) / 65535;
         end loop;
         --  Check for corrupted frame
--      /* Check if footer id and header id are matching. This allows to detect
--       * corrupted frames */
--      header_id = ((uint16_t)(p_dev->temp_buffer[0x8])<<8) & 0xFF00U;
--      header_id |= ((uint16_t)(p_dev->temp_buffer[0x9])) & 0x00FFU;
--
--      footer_id = ((uint16_t)(p_dev->temp_buffer[p_dev->data_read_size
--              - (uint32_t)4]) << 8) & 0xFF00U;
--      footer_id |= ((uint16_t)(p_dev->temp_buffer[p_dev->data_read_size
--              - (uint32_t)3])) & 0xFFU;
--
--      if(header_id != footer_id)
--      {
--              status |= VL53L8CX_STATUS_CORRUPTED_FRAME;
--      }
      end;
   end Get_Ranging_Data;
--  {
--      uint16_t header_id, footer_id;
--      union Block_header *bh_ptr;
--      uint32_t i, j, msize;
--      status |= RdMulti(&(p_dev->platform), 0x0,
--                      p_dev->temp_buffer, p_dev->data_read_size);
--      p_dev->streamcount = p_dev->temp_buffer[0];
--      SwapBuffer(p_dev->temp_buffer, (uint16_t)p_dev->data_read_size);
--
--      /* Start conversion at position 16 to avoid headers */
--      for (i = (uint32_t)16; i
--               < (uint32_t)p_dev->data_read_size; i+=(uint32_t)4)
--      {
--              bh_ptr = (union Block_header *)&(p_dev->temp_buffer[i]);
--              if ((bh_ptr->type > (uint32_t)0x1)
--                      && (bh_ptr->type < (uint32_t)0xd))
--              {
--                      msize = bh_ptr->type * bh_ptr->size;
--              }
--              else
--              {
--                      msize = bh_ptr->size;
--              }
--
--              switch(bh_ptr->idx){
--                      case VL53L8CX_METADATA_IDX:
--                              p_results->silicon_temp_degc =
--                                              (int8_t)p_dev->temp_buffer[i + (uint32_t)12];
--                              break;
--
--  #ifndef VL53L8CX_DISABLE_AMBIENT_PER_SPAD
--                      case VL53L8CX_AMBIENT_RATE_IDX:
--                              (void)memcpy(p_results->ambient_per_spad,
--                              &(p_dev->temp_buffer[i + (uint32_t)4]), msize);
--                              break;
--  #endif
--  #ifndef VL53L8CX_DISABLE_NB_SPADS_ENABLED
--                      case VL53L8CX_SPAD_COUNT_IDX:
--                              (void)memcpy(p_results->nb_spads_enabled,
--                              &(p_dev->temp_buffer[i + (uint32_t)4]), msize);
--                              break;
--  #endif
--  #ifndef VL53L8CX_DISABLE_NB_TARGET_DETECTED
--                      case VL53L8CX_NB_TARGET_DETECTED_IDX:
--                              (void)memcpy(p_results->nb_target_detected,
--                              &(p_dev->temp_buffer[i + (uint32_t)4]), msize);
--                              break;
--  #endif
--  #ifndef VL53L8CX_DISABLE_SIGNAL_PER_SPAD
--                      case VL53L8CX_SIGNAL_RATE_IDX:
--                              (void)memcpy(p_results->signal_per_spad,
--                              &(p_dev->temp_buffer[i + (uint32_t)4]), msize);
--                              break;
--  #endif
--  #ifndef VL53L8CX_DISABLE_RANGE_SIGMA_MM
--                      case VL53L8CX_RANGE_SIGMA_MM_IDX:
--                              (void)memcpy(p_results->range_sigma_mm,
--                              &(p_dev->temp_buffer[i + (uint32_t)4]), msize);
--                              break;
--  #endif
--  #ifndef VL53L8CX_DISABLE_DISTANCE_MM
--                      case VL53L8CX_DISTANCE_IDX:
--                              (void)memcpy(p_results->distance_mm,
--                              &(p_dev->temp_buffer[i + (uint32_t)4]), msize);
--                              break;
--  #endif
--  #ifndef VL53L8CX_DISABLE_REFLECTANCE_PERCENT
--                      case VL53L8CX_REFLECTANCE_EST_PC_IDX:
--                              (void)memcpy(p_results->reflectance,
--                              &(p_dev->temp_buffer[i + (uint32_t)4]), msize);
--                              break;
--  #endif
--  #ifndef VL53L8CX_DISABLE_TARGET_STATUS
--                      case VL53L8CX_TARGET_STATUS_IDX:
--                              (void)memcpy(p_results->target_status,
--                              &(p_dev->temp_buffer[i + (uint32_t)4]), msize);
--                              break;
--  #endif
--  #ifndef VL53L8CX_DISABLE_MOTION_INDICATOR
--                      case VL53L8CX_MOTION_DETEC_IDX:
--                              (void)memcpy(&p_results->motion_indicator,
--                              &(p_dev->temp_buffer[i + (uint32_t)4]), msize);
--                              break;
--  #endif
--                      default:
--                              break;
--              }
--              i += msize;
--      }
--
--  #ifndef VL53L8CX_USE_RAW_FORMAT
--
--      /* Convert data into their real format */
--  #ifndef VL53L8CX_DISABLE_AMBIENT_PER_SPAD
--      for(i = 0; i < (uint32_t)VL53L8CX_RESOLUTION_8X8; i++)
--      {
--              p_results->ambient_per_spad[i] /= (uint32_t)2048;
--      }
--  #endif
--
--      for(i = 0; i < (uint32_t)(VL53L8CX_RESOLUTION_8X8
--                      *VL53L8CX_NB_TARGET_PER_ZONE); i++)
--      {
--  #ifndef VL53L8CX_DISABLE_DISTANCE_MM
--              p_results->distance_mm[i] /= 4;
--  #endif
--  #ifndef VL53L8CX_DISABLE_REFLECTANCE_PERCENT
--              p_results->reflectance[i] /= (uint8_t)2;
--  #endif
--  #ifndef VL53L8CX_DISABLE_RANGE_SIGMA_MM
--              p_results->range_sigma_mm[i] /= (uint16_t)128;
--  #endif
--  #ifndef VL53L8CX_DISABLE_SIGNAL_PER_SPAD
--              p_results->signal_per_spad[i] /= (uint32_t)2048;
--  #endif
--      }
--
--      /* Set target status to 255 if no target is detected for this zone */
--  #ifndef VL53L8CX_DISABLE_NB_TARGET_DETECTED
--      for(i = 0; i < (uint32_t)VL53L8CX_RESOLUTION_8X8; i++)
--      {
--              if(p_results->nb_target_detected[i] == (uint8_t)0){
--                      for(j = 0; j < (uint32_t)
--                              VL53L8CX_NB_TARGET_PER_ZONE; j++)
--                      {
--  #ifndef VL53L8CX_DISABLE_TARGET_STATUS
--                              p_results->target_status
--                              [((uint32_t)VL53L8CX_NB_TARGET_PER_ZONE
--                                      *(uint32_t)i) + j]=(uint8_t)255;
--  #endif
--                      }
--              }
--      }
--  #endif
--
--  #ifndef VL53L8CX_DISABLE_MOTION_INDICATOR
--      for(i = 0; i < (uint32_t)32; i++)
--      {
--              p_results->motion_indicator.motion[i] /= (uint32_t)65535;
--      }
--  #endif
--
--  #endif
--
--      /* Check if footer id and header id are matching. This allows to detect
--       * corrupted frames */
--      header_id = ((uint16_t)(p_dev->temp_buffer[0x8])<<8) & 0xFF00U;
--      header_id |= ((uint16_t)(p_dev->temp_buffer[0x9])) & 0x00FFU;
--
--      footer_id = ((uint16_t)(p_dev->temp_buffer[p_dev->data_read_size
--              - (uint32_t)4]) << 8) & 0xFF00U;
--      footer_id |= ((uint16_t)(p_dev->temp_buffer[p_dev->data_read_size
--              - (uint32_t)3])) & 0xFFU;
--
--      if(header_id != footer_id)
--      {
--              status |= VL53L8CX_STATUS_CORRUPTED_FRAME;
--      }
--
--      return status;
--  }

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize
     (This : in out VL53L8X_Ranging_Sensor)
   is
      Result   : UInt8;
      Result16 : UInt16;
      Start    : Time;
      Status   : Boolean;
      Value16  : UInt16;
      Result32 : UInt32;
      Tmp      : UInt8;
   begin
      This.I2C_Address := 16#52#;

      if Read_Id (This) /= VL53L8_ID then
         raise Program_Error with "No VL53L8!";
      end if;

      This.Temp_Buffer.Byte := (others => 16#de#);

      --  SW reboot sequence
      Write (This, 16#7fff#, UInt8 (16#00#), Status);
      Write (This, 16#0009#, UInt8 (16#04#), Status);
      Write (This, 16#000f#, UInt8 (16#40#), Status);
      Write (This, 16#000a#, UInt8 (16#03#), Status);
      Read (This, 16#7fff#, Tmp, Status);
      Write (This, 16#000c#, UInt8 (16#01#), Status);

      Write (This, 16#0101#, UInt8 (16#00#), Status);
      Write (This, 16#0102#, UInt8 (16#00#), Status);
      Write (This, 16#010A#, UInt8 (16#01#), Status);
      Write (This, 16#4002#, UInt8 (16#01#), Status);
      Write (This, 16#4002#, UInt8 (16#00#), Status);
      Write (This, 16#010A#, UInt8 (16#03#), Status);
      Write (This, 16#0103#, UInt8 (16#01#), Status);
      Write (This, 16#000C#, UInt8 (16#00#), Status);
      Write (This, 16#000F#, UInt8 (16#43#), Status);

      delay until Clock + Milliseconds (1000);

      Write (This, 16#000f#, UInt8 (16#40#), Status);
      Write (This, 16#000a#, UInt8 (16#01#), Status);

      delay until Clock + Milliseconds (100);

--      Read (This, VL53L8CX_ID_REG, Ret, Status);
--      Write (This, 16#7fff#, UInt8 (2), Status);

--  Wait for sensor booted (several ms required to get sensor ready )
      Write (This, 16#7fff#, UInt8 (16#00#), Status);
      Poll_For_Answer (This, 1, 0, 6, 16#ff#, 1, Status);
      if not Status then
         raise Program_Error with "poll failed";
      end if;

      Write (This, 16#000e#, UInt8 (16#01#), Status);
      Write (This, 16#7fff#, UInt8 (16#02#), Status);
      --  Enable FW access
      Write (This, 16#7fff#, UInt8 (16#01#), Status);
      Write (This, 16#0006#, UInt8 (16#03#), Status);
      Poll_For_Answer (This, 1, 0, 16#21#, 16#10#, 16#10#, Status);
      if not Status then
         raise Program_Error with "FW access enable failed";
      end if;
      Write (This, 16#7fff#, UInt8 (16#00#), Status);

      --  Enable host access to GO1
      Read (This, 16#7fff#, Tmp, Status);
      Write (This, 16#0C#, UInt8 (16#01#), Status);

      Write (This, 16#7fff#, UInt8 (16#00#), Status);
      Write (This, 16#101#, UInt8 (16#00#), Status);
      Write (This, 16#102#, UInt8 (16#00#), Status);
      Write (This, 16#010A#, UInt8 (16#01#), Status);
      Write (This, 16#4002#, UInt8 (16#01#), Status);
      Write (This, 16#4002#, UInt8 (16#00#), Status);
      Write (This, 16#010A#, UInt8 (16#03#), Status);
      Write (This, 16#103#, UInt8 (16#01#), Status);
      Write (This, 16#400F#, UInt8 (16#00#), Status);
      Write (This, 16#21A#, UInt8 (16#43#), Status);
      Write (This, 16#21A#, UInt8 (16#03#), Status);
      Write (This, 16#21A#, UInt8 (16#01#), Status);
      Write (This, 16#21A#, UInt8 (16#00#), Status);
      Write (This, 16#219#, UInt8 (16#00#), Status);
      Write (This, 16#21B#, UInt8 (16#00#), Status);

      --  Wake up MCU
      Write (This, 16#7fff#, UInt8 (16#00#), Status);
      Read (This, 16#7fff#, Tmp, Status);
      Write (This, 16#0C#, UInt8 (16#00#), Status);
      Write (This, 16#7fff#, UInt8 (16#01#), Status);
      Write (This, 16#20#, UInt8 (16#07#), Status);
      Write (This, 16#20#, UInt8 (16#06#), Status);

      --  Download FW into VL53L8
      Write (This, 16#7fff#, UInt8 (16#09#), Status);
      Write (This, (0, 0), Firmware (0 .. 32767), Status);
      Write (This, 16#7fff#, UInt8 (16#0a#), Status);
      Write (This, (0, 0), Firmware (32768 .. 65535), Status);
      Write (This, 16#7fff#, UInt8 (16#0b#), Status);
      Write (This, (0, 0), Firmware (65536 .. Firmware'Last - 1), Status);
      Write (This, 16#7fff#, UInt8 (16#01#), Status);

      --  Check if FW correctly downloaded
      Write (This, 16#7fff#, UInt8 (16#01#), Status);
      Write (This, 16#06#, UInt8 (16#03#), Status);
      Poll_For_Answer (This, 1, 0, 16#21#, 16#10#, 16#10#, Status);
      if not Status then
         raise Program_Error with "FW access enable failed";
      end if;
      Write (This, 16#7fff#, UInt8 (16#00#), Status);
      Read (This, 16#7fff#, Tmp, Status);
      Write (This, 16#0C#, UInt8 (16#01#), Status);

      --  Reset MCU and wait boot
      Write (This, 16#7FFF#, UInt8 (16#00#), Status);
      Write (This, 16#114#, UInt8 (16#00#), Status);
      Write (This, 16#115#, UInt8 (16#00#), Status);
      Write (This, 16#116#, UInt8 (16#42#), Status);
      Write (This, 16#117#, UInt8 (16#00#), Status);
      Write (This, 16#0B#, UInt8 (16#00#), Status);
      Read (This, 16#7fff#, Tmp, Status);
      Write (This, 16#0C#, UInt8 (16#00#), Status);
      Write (This, 16#0B#, UInt8 (16#01#), Status);

      Poll_For_Mcu_Boot (This, Status);
      if not Status then
         raise Program_Error with "MCU boot fail";
      end if;

      Write (This, 16#7FFF#, UInt8 (16#02#), Status);

      --  Get offset NVM data and store them into the offset buffer
      Write (This, UInt16 (16#2fd8#), Get_NVM_Cmd, Status);
      Poll_For_Answer (This, 4, 0, VL53L8CX_UI_CMD_STATUS, 16#ff#, 16#02#, Status);
      if not Status then
         raise Program_Error with "FW cmd status failed";
      end if;

--      Read (This, VL53L8CX_UI_CMD_START, This.Temp_Buffer, Status);
      Read (This, VL53L8CX_UI_CMD_START, This.Temp_Buffer.Byte (0 .. VL53L8CX_NVM_DATA_SIZE - 1), Status);
      for I in 0 .. VL53L8CX_OFFSET_BUFFER_SIZE - 1 loop
         This.Offset_Data (I) := This.Temp_Buffer.Byte (I);
      end loop;
--      Send_Offset_Data (This, VL53L8CX_RESOLUTION_4X4);
      Send_Offset_Data (This, VL53L8CX_RESOLUTION_8X8, Status);

      --  Set default Xtalk shape. Send Xtalk to sensor
      for I in Default_XTALK'Range loop
         This.Xtalk_Data (I) := Default_XTALK (I);
      end loop;

      Send_Xtalk_Data (This, VL53L8CX_RESOLUTION_8X8, Status);


      --  Send default configuration to VL53L8CX firmware
      Write (This, (16#2c#, 16#34#), Default_Configuration, Status);

      Poll_For_Answer (This, 4, 1, VL53L8CX_UI_CMD_STATUS, 16#ff#, 3, Status);
      if not Status then
         raise Program_Error with "ui cmd status failed";
      end if;

      declare
         Pipe_Ctrl : UInt8_Array := (VL53L8CX_NB_TARGET_PER_ZONE, 0, 1, 0);
         Single_Range : UInt8_Array := (1, 0, 0, 0);
      begin
         Dci_Write_Data (This, Pipe_Ctrl, VL53L8CX_DCI_PIPE_CONTROL, Status);
         Dci_Write_Data (This, Single_Range, VL53L8CX_DCI_SINGLE_RANGE, Status);
      end;

   end Initialize;

   -------------
   -- Read_Id --
   -------------

   function Read_Id (This : VL53L8X_Ranging_Sensor) return UInt16
   is
      Ret    : UInt16;
      Status : Boolean;
      Val    : UInt16;
   begin
      Write (This, 16#7fff#, UInt8 (0), Status);
      Read (This, VL53L8CX_ID_REG, Ret, Status);
      Write (This, 16#7fff#, UInt8 (2), Status);

      if not Status then
         return 0;
      else
         return Ret;
      end if;
   end Read_Id;

end VL53L8X;
