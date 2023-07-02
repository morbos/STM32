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
with System;

package VL53L8X is

   type VL53L8X_Ranging_Sensor
     (Port  : not null HAL.I2C.Any_I2C_Port) is limited private;

   type VL53L8X_GPIO_Functionality is
     (No_Interrupt,
      Level_Low,
      Level_High,
      Out_Of_Window,
      New_Sample_Ready);

   VL53L8_ID                      : constant := 16#f00c#;
   VL53L8CX_RESOLUTION_4X4        : constant :=   16;
   VL53L8CX_RESOLUTION_8X8        : constant :=   64;

   procedure Initialize
     (This : in out VL53L8X_Ranging_Sensor);

   function Read_Id (This : VL53L8X_Ranging_Sensor) return UInt16;

   procedure Poll_For_Answer
     (This           : in out VL53L8X_Ranging_Sensor;
      Size           : UInt8;
      Pos            : UInt8;
      Address        : UInt16;
      Mask           : UInt8;
      Expected_Value : UInt8;
      Status         : out Boolean);

   procedure Poll_For_Mcu_Boot
     (This           : in out VL53L8X_Ranging_Sensor;
      Status         : out Boolean);

   procedure Send_Offset_Data
     (This           : in out VL53L8X_Ranging_Sensor;
      Resolution     : UInt8;
      Status         : out Boolean);

   procedure Send_Xtalk_Data
     (This           : in out VL53L8X_Ranging_Sensor;
      Resolution     : UInt8;
      Status         : out Boolean);

   procedure Dci_Write_Data
     (This           : in out VL53L8X_Ranging_Sensor;
      Data           : HAL.UInt8_Array;
      Index          : UInt16;
      Status         : out Boolean);

   procedure Dci_Read_Data
     (This           : in out VL53L8X_Ranging_Sensor;
      Data           : out HAL.UInt8_Array;
      Index          : UInt16;
      Data_Size      : UInt16;
      Status         : out Boolean);

   procedure SwapBuffer (Buffer : in out UInt8_Array);

   procedure Get_Resolution
     (This           : in out VL53L8X_Ranging_Sensor;
      Resolution     : out UInt8;
      Status         : out Boolean);

   procedure Set_Resolution
     (This           : in out VL53L8X_Ranging_Sensor;
      Resolution     : UInt8;
      Status         : out Boolean);

   procedure Start_Ranging
     (This : in out VL53L8X_Ranging_Sensor;
      Status : out Boolean);

   procedure Check_Data_Ready
     (This : in out VL53L8X_Ranging_Sensor;
      Ready : out Boolean;
      Status : out Boolean);

   type Block_Header is record
      Ty    : UInt4;
      Size  : UInt12;
      Idx   : UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for Block_Header use record
      Ty    at 0 range 0 .. 3;
      Size  at 0 range 4 .. 15;
      Idx   at 0 range 16 .. 31;
   end record;

   VL53L8CX_DISABLE_AMBIENT_DMAX : constant Boolean := True;
   VL53L8CX_DISABLE_RANGE_SIGMA_MM : constant Boolean := True;
   VL53L8CX_DISABLE_NB_SPADS_ENABLED : constant Boolean := True;

   VL53L8CX_DISABLE_AMBIENT_PER_SPAD : constant Boolean := False;
   VL53L8CX_DISABLE_NB_TARGET_DETECTED : constant Boolean := False;
   VL53L8CX_DISABLE_SIGNAL_PER_SPAD : constant Boolean := False;
   VL53L8CX_DISABLE_DISTANCE_MM : constant Boolean := False;
   VL53L8CX_DISABLE_REFLECTANCE_PERCENT  : constant Boolean := False;
   VL53L8CX_DISABLE_TARGET_STATUS  : constant Boolean := False;
   VL53L8CX_DISABLE_MOTION_INDICATOR  : constant Boolean := False;

   VL53L8CX_NB_TARGET_PER_ZONE               : constant := 1;
   type Motion_Indicator_Record is record
      Global_Indicator_1        : UInt32;
      Global_Indicator_2        : UInt32;
      Status                    : UInt8;
      Nb_Of_Detected_Aggregates : UInt8;
      Nb_Of_Aggregates          : UInt8;
      Spare                     : UInt8;
      Motion                    : UInt32_Array (0 .. 31);
   end record;
   type ResultsData is record
      Silicon_Temp_Degc : UInt8;
      --  Ambient noise in kcps/spads
      Ambient_Per_Spad  : UInt32_Array (0 .. VL53L8CX_RESOLUTION_8X8 - 1);
      --  Number of valid target detected for 1 zone
      Nb_Target_Detected : UInt8_Array (0 .. VL53L8CX_RESOLUTION_8X8 - 1);
      --  Signal returned to the sensor in kcps/spads
      Signal_Per_Spad : UInt32_Array (0 .. (VL53L8CX_RESOLUTION_8X8 * VL53L8CX_NB_TARGET_PER_ZONE) - 1);
      Distance_mm : UInt16_Array (0 .. (VL53L8CX_RESOLUTION_8X8 * VL53L8CX_NB_TARGET_PER_ZONE) - 1);
      Reflectance : UInt8_Array (0 .. (VL53L8CX_RESOLUTION_8X8 * VL53L8CX_NB_TARGET_PER_ZONE) - 1);
      Target_Status : UInt8_Array (0 .. (VL53L8CX_RESOLUTION_8X8 * VL53L8CX_NB_TARGET_PER_ZONE) - 1);
      Motion_Indicator :  Motion_Indicator_Record;
   end record;

   procedure Get_Ranging_Data (This : in out VL53L8X_Ranging_Sensor;
                               Results : out ResultsData;
                               Status : out Boolean
                              );

private
   VL53L8CX_NVM_DATA_SIZE                    : constant := 492;
   VL53L8CX_CONFIGURATION_SIZE               : constant := 972;
   VL53L8CX_OFFSET_BUFFER_SIZE               : constant := 488;
   VL53L8CX_XTALK_BUFFER_SIZE                : constant := 776;
   VL53L8CX_TEMPORARY_BUFFER_SIZE            : constant := 4096;

   VL53L8CX_START_BH              : constant := 16#0000000D#;
   VL53L8CX_METADATA_BH           : constant := 16#54B400C0#;
   VL53L8CX_COMMONDATA_BH         : constant := 16#54C00040#;
   VL53L8CX_AMBIENT_RATE_BH       : constant := 16#54D00104#;
   VL53L8CX_SPAD_COUNT_BH         : constant := 16#55D00404#;
   VL53L8CX_NB_TARGET_DETECTED_BH : constant := 16#DB840401#;
   VL53L8CX_SIGNAL_RATE_BH        : constant := 16#DBC40404#;
   VL53L8CX_RANGE_SIGMA_MM_BH     : constant := 16#DEC40402#;
   VL53L8CX_DISTANCE_BH           : constant := 16#DF440402#;
   VL53L8CX_REFLECTANCE_BH        : constant := 16#E0440401#;
   VL53L8CX_TARGET_STATUS_BH      : constant := 16#E0840401#;
   VL53L8CX_MOTION_DETECT_BH      : constant := 16#D85808C0#;

   VL53L8CX_METADATA_IDX                : constant := 16#54B4#;
   VL53L8CX_SPAD_COUNT_IDX              : constant := 16#55D0#;
   VL53L8CX_AMBIENT_RATE_IDX            : constant := 16#54D0#;
   VL53L8CX_NB_TARGET_DETECTED_IDX      : constant := 16#DB84#;
   VL53L8CX_SIGNAL_RATE_IDX             : constant := 16#DBC4#;
   VL53L8CX_RANGE_SIGMA_MM_IDX          : constant := 16#DEC4#;
   VL53L8CX_DISTANCE_IDX                : constant := 16#DF44#;
   VL53L8CX_REFLECTANCE_EST_PC_IDX      : constant := 16#E044#;
   VL53L8CX_TARGET_STATUS_IDX           : constant := 16#E084#;
   VL53L8CX_MOTION_DETEC_IDX            : constant := 16#D858#;

   type Temp_Overlay
     (As_What : UInt2 := 0)
   is record
      case As_What is
         when 0 =>
            Byte     : UInt8_Array (0 .. VL53L8CX_TEMPORARY_BUFFER_SIZE - 1);
         when 1 =>
            Short    : UInt16_Array (0 .. (VL53L8CX_TEMPORARY_BUFFER_SIZE / 2) - 1);
         when 2 =>
            Word     : UInt32_Array (0 .. (VL53L8CX_TEMPORARY_BUFFER_SIZE / 4) - 1);
         when others =>
            null;
      end case;
   end record
     with Unchecked_Union, Size => VL53L8CX_TEMPORARY_BUFFER_SIZE * 8;

   type VL53L8X_Ranging_Sensor (Port : not null HAL.I2C.Any_I2C_Port)
      is limited record
         --  Default address: can be changed by software
         I2C_Address            : HAL.I2C.I2C_Address := 16#52#;
         Stop_Variable          : HAL.UInt8;
         --  This is sized at build time by ST...
         Temp_Buffer            : Temp_Overlay;
         Offset_Data            : UInt8_Array (0 .. VL53L8CX_OFFSET_BUFFER_SIZE - 1);
         Xtalk_Data             : UInt8_Array (0 .. VL53L8CX_XTALK_BUFFER_SIZE - 1);
         Data_Read_Size         : HAL.UInt32;
         Streamcount            : HAL.UInt8;
      end record;

   procedure I2C_Write
     (This   : VL53L8X_Ranging_Sensor;
      Data   : HAL.UInt8_Array;
      Status : out Boolean);

   procedure I2C_Write
     (This   : VL53L8X_Ranging_Sensor;
      Data1  : HAL.UInt8_Array;
      Data2  : HAL.UInt8_Array;
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
      Data1  : HAL.UInt8_Array;
      Data2  : HAL.UInt8_Array;
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


   VL53L8CX_ID_REG                           : constant := 16#0000#;

   VL53L8CX_DCI_ZONE_CONFIG                  : constant := 16#5450#;
   VL53L8CX_DCI_FREQ_HZ                      : constant := 16#5458#;
   VL53L8CX_DCI_INT_TIME                     : constant := 16#545C#;
   VL53L8CX_DCI_FW_NB_TARGET                 : constant := 16#5478#;
   VL53L8CX_DCI_RANGING_MODE                 : constant := 16#AD30#;
   VL53L8CX_DCI_DSS_CONFIG                   : constant := 16#AD38#;
   VL53L8CX_DCI_TARGET_ORDER                 : constant := 16#AE64#;
   VL53L8CX_DCI_SHARPENER                    : constant := 16#AED8#;
   VL53L8CX_DCI_INTERNAL_CP                  : constant := 16#B39C#;
   VL53L8CX_DCI_SYNC_PIN                     : constant := 16#B5F0#;
   VL53L8CX_DCI_MOTION_DETECTOR_CFG          : constant := 16#BFAC#;
   VL53L8CX_DCI_SINGLE_RANGE                 : constant := 16#D964#;
   VL53L8CX_DCI_OUTPUT_CONFIG                : constant := 16#D968#;
   VL53L8CX_DCI_OUTPUT_ENABLES               : constant := 16#D970#;
   VL53L8CX_DCI_OUTPUT_LIST                  : constant := 16#D980#;
   VL53L8CX_DCI_PIPE_CONTROL                 : constant := 16#DB80#;

   VL53L8CX_UI_CMD_STATUS                    : constant := 16#2C00#;
   VL53L8CX_UI_CMD_START                     : constant := 16#2C04#;
   VL53L8CX_UI_CMD_END                       : constant := 16#2FFF#;


end VL53L8X;
