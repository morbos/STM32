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

package VL53L4CX is

   Fix_Point_16_16_Delta : constant := 1.0 / (2.0 ** 16);

   type Fix_Point_16_16 is
     delta Fix_Point_16_16_Delta
     range -2.0 ** 15 .. 2.0 ** 15 - Fix_Point_16_16_Delta
     with Size => 32;

   type VL53L4CX_Ranging_Sensor
     (Port  : not null HAL.I2C.Any_I2C_Port) is limited private;

   type VL53L4CX_GPIO_Functionality is
     (No_Interrupt,
      Level_Low,
      Level_High,
      Out_Of_Window,
      New_Sample_Ready);

   type VL53L4CX_Interrupt_Polarity is
     (Polarity_Low,
      Polarity_High);

   type VL53L1_Range_Type is
     (Short_Range,
      Medium_Range,
      Long_Range);

   type VL53L1_Range_Status is
     (
      RangeValid,
      SigmaFail,
      SignalFail,
      RangeValidMinRangeClipped,
      OutOfBoundsFail,
      HardwareFail,
      RangeValidNoWrapCheckFail,
      WrapTargetFail,
      ProcessingFail,
      XtalkSignalFail,
      SynchronizationInt,
      MergedPulse,
      TargetPresentLackOfSignal,
      MinRangeFail,
      RangeInvalid,
      None
     ) with Size => 8;


   for VL53L1_Range_Status use
     (
      RangeValid                =>   0,

      --  "sigma estimator check is above the internal defined threshold"
      --  (sigma = standard deviation of measurement)
      SigmaFail                 =>   1,

      --  "signal value is below the internal defined threshold"
      SignalFail                =>   2,

      --  "Target is below minimum detection threshold."
      RangeValidMinRangeClipped =>   3,

      --  "phase is out of bounds"
      --  (nothing detected in range; try a longer distance mode if applicable)
      OutOfBoundsFail           =>   4,

      --  "HW or VCSEL failure"
      HardwareFail              =>   5,

      --  "The Range is valid but the wraparound check has not been done."
      RangeValidNoWrapCheckFail =>   6,

      --  "Wrapped target, not matching phases"
      --  "no matching phase in other VCSEL period timing."
      WrapTargetFail            =>   7,

      --  "Internal algo underflow or overflow in lite ranging."
      ProcessingFail            =>   8,

      --  "Specific to lite ranging."
      --  should never occur with this lib (which uses low power auto ranging,
      --  as the API does)
      XtalkSignalFail           =>   9,

      --  "1st interrupt when starting ranging in back to back mode. Ignore
      --  data."
      --  should never occur with this lib
      SynchronizationInt         =>  10, --  (the API spells this "syncronisation")

      --  "All Range ok but object is result of multiple pulses merging together.
      --  Used by RQL for merged pulse detection"
      MergedPulse    =>  11,

      --  "Used by RQL as different to phase fail."
      TargetPresentLackOfSignal =>  12,

      --  "Target is below minimum detection threshold."
      MinRangeFail              =>  13,

      --  "The reported range is invalid"
      RangeInvalid              =>  14,  --  can't actually be returned by API
      --  (range can never become negative, even after correction)

      --  "No Update."
      None                      => 255
     );

   VL53L1_ID : constant := 16#eacc#;

   TimingGuard : constant UInt32 := 4528;
   TargetRate  : constant UInt16 := 16#0A00#;

   procedure Initialize
     (This : in out VL53L4CX_Ranging_Sensor);

   function Read_Id (This : VL53L4CX_Ranging_Sensor) return UInt16;

   procedure SetMeasurementTimingBudget (This   : VL53L4CX_Ranging_Sensor;
                                         Budget : UInt32;
                                         Status : out Boolean);

   function GetMeasurementTimingBudget (This : VL53L4CX_Ranging_Sensor) return UInt32;

   procedure SetDistanceMode (This : in out VL53L4CX_Ranging_Sensor; Mode : VL53L1_Range_Type);

   function TimeoutMicrosecondsToMclks (Timeout : UInt32; Macro_Period_Us : UInt32) return UInt32;

   function TimeoutMclksToMicroseconds (Timeout_Mclks   : UInt32;
                                        Macro_Period_Us : UInt32) return UInt32;

   function DecodeTimeout (Reg_Val : UInt16) return UInt32;

   function EncodeTimeout (Timeout_Mclks : UInt32) return UInt16;

   function CalcMacroPeriod (This : VL53L4CX_Ranging_Sensor; Vcsel_Period : UInt8) return UInt32;

   procedure StartContinuous (This : VL53L4CX_Ranging_Sensor; Period_Ms : UInt32);

   procedure SetTimeout (This : in out VL53L4CX_Ranging_Sensor; Timeout : UInt16);

   function GetTimeout (This : VL53L4CX_Ranging_Sensor) return Natural;

   function Read_Range (This : in out VL53L4CX_Ranging_Sensor; Status : out Boolean) return UInt16;

   procedure SetupManualCalibration (This : in out VL53L4CX_Ranging_Sensor);

   procedure ReadResults (This : in out VL53L4CX_Ranging_Sensor);

   function To_UInt16 (MSB : UInt8;  LSB : UInt8) return UInt16;

   procedure UpdateDSS (This : in out VL53L4CX_Ranging_Sensor);

   procedure GetRangingData (This : in out VL53L4CX_Ranging_Sensor);

   function Range_Status_String (This : in out VL53L4CX_Ranging_Sensor) return String;

private

   type Ranging_Data_Type is record
      Range_Mm                    : UInt16;
      Range_Status                : VL53L1_Range_Status;
      Peak_Signal_Count_Rate_MCPS : Float;
      Ambient_Count_Rate_MCPS     : Float;
   end record;

   type Range_Results_Type is record
      Range_Status                                        : UInt8;
      Report_Status                                       : UInt8;
      Stream_Count                                        : UInt8;
      Dss_Actual_Effective_Spads_Sd0                      : UInt16;
      Peak_Signal_Count_Rate_Mcps_Sd0                     : UInt16;
      Ambient_Count_Rate_Mcps_Sd0                         : UInt16;
      Sigma_Sd0                                           : UInt16;
      Phase_Sd0                                           : UInt16;
      Final_Crosstalk_Corrected_Range_Mm_Sd0              : UInt16;
      Peak_Signal_Count_Rate_Crosstalk_Corrected_Mcps_Sd0 : UInt16;
   end record;

   type VL53L4CX_Device_Parameters is record
      Fast_Osc_Frequency : UInt16;
      Osc_Calibrate_Val  : UInt16;
      Distance_Mode      : VL53L1_Range_Type;
      IO_Timeout         : UInt16;
      Calibrated         : Boolean;
      Saved_Vhv_Init     : UInt8;
      Saved_Vhv_Timeout  : UInt8;
      Range_Results      : Range_Results_Type;
      Range_Data         : Ranging_Data_Type;
   end record;

   type VL53L4CX_Ranging_Sensor (Port : not null HAL.I2C.Any_I2C_Port)
   is limited record
      --  Default address: can be changed by software
      I2C_Address            : HAL.I2C.I2C_Address := 16#52#;
      Stop_Variable          : HAL.UInt8;
      Device_Params          : VL53L4CX_Device_Parameters;
   end record;

   procedure I2C_Write
     (This   : VL53L4CX_Ranging_Sensor;
      Data   : HAL.UInt8_Array;
      Status : out Boolean);

   procedure I2C_Read
     (This   : VL53L4CX_Ranging_Sensor;
      Data   : out HAL.UInt8_Array;
      Status : out Boolean);

   procedure Write
     (This   : VL53L4CX_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt8_Array;
      Status : out Boolean);
   procedure Write
     (This   : VL53L4CX_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt8;
      Status : out Boolean);
   procedure Write
     (This   : VL53L4CX_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt16;
      Status : out Boolean);
   procedure Write
     (This   : VL53L4CX_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : HAL.UInt32;
      Status : out Boolean);

   procedure Read
     (This   : VL53L4CX_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt8_Array;
      Status : out Boolean);
   procedure Read
     (This   : VL53L4CX_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt8;
      Status : out Boolean);
   procedure Read
     (This   : VL53L4CX_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt16;
      Status : out Boolean);
   procedure Read
     (This   : VL53L4CX_Ranging_Sensor;
      Index  : HAL.UInt16;
      Data   : out HAL.UInt32;
      Status : out Boolean);

      SOFT_RESET                                                                : constant := 16#0000#;
      I2C_SLAVE_DEVICE_ADDRESS                                                  : constant := 16#0001#;
      ANA_CONFIG_VHV_REF_SEL_VDDPIX                                             : constant := 16#0002#;
      ANA_CONFIG_VHV_REF_SEL_VQUENCH                                            : constant := 16#0003#;
      ANA_CONFIG_REG_AVDD1V2_SEL                                                : constant := 16#0004#;
      ANA_CONFIG_FAST_OSC_TRIM                                                  : constant := 16#0005#;
      OSC_MEASURED_FAST_OSC_FREQUENCY                                           : constant := 16#0006#;
      OSC_MEASURED_FAST_OSC_FREQUENCY_HI                                        : constant := 16#0006#;
      OSC_MEASURED_FAST_OSC_FREQUENCY_LO                                        : constant := 16#0007#;
      VHV_CONFIG_TIMEOUT_MACROP_LOOP_BOUND                                      : constant := 16#0008#;
      VHV_CONFIG_COUNT_THRESH                                                   : constant := 16#0009#;
      VHV_CONFIG_OFFSET                                                         : constant := 16#000A#;
      VHV_CONFIG_INIT                                                           : constant := 16#000B#;
      GLOBAL_CONFIG_SPAD_ENABLES_REF_0                                          : constant := 16#000D#;
      GLOBAL_CONFIG_SPAD_ENABLES_REF_1                                          : constant := 16#000E#;
      GLOBAL_CONFIG_SPAD_ENABLES_REF_2                                          : constant := 16#000F#;
      GLOBAL_CONFIG_SPAD_ENABLES_REF_3                                          : constant := 16#0010#;
      GLOBAL_CONFIG_SPAD_ENABLES_REF_4                                          : constant := 16#0011#;
      GLOBAL_CONFIG_SPAD_ENABLES_REF_5                                          : constant := 16#0012#;
      GLOBAL_CONFIG_REF_EN_START_SELECT                                         : constant := 16#0013#;
      REF_SPAD_MAN_NUM_REQUESTED_REF_SPADS                                      : constant := 16#0014#;
      REF_SPAD_MAN_REF_LOCATION                                                 : constant := 16#0015#;
      ALGO_CROSSTALK_COMPENSATION_PLANE_OFFSET_KCPS                             : constant := 16#0016#;
      ALGO_CROSSTALK_COMPENSATION_PLANE_OFFSET_KCPS_HI                          : constant := 16#0016#;
      ALGO_CROSSTALK_COMPENSATION_PLANE_OFFSET_KCPS_LO                          : constant := 16#0017#;
      ALGO_CROSSTALK_COMPENSATION_X_PLANE_GRADIENT_KCPS                         : constant := 16#0018#;
      ALGO_CROSSTALK_COMPENSATION_X_PLANE_GRADIENT_KCPS_HI                      : constant := 16#0018#;
      ALGO_CROSSTALK_COMPENSATION_X_PLANE_GRADIENT_KCPS_LO                      : constant := 16#0019#;
      ALGO_CROSSTALK_COMPENSATION_Y_PLANE_GRADIENT_KCPS                         : constant := 16#001A#;
      ALGO_CROSSTALK_COMPENSATION_Y_PLANE_GRADIENT_KCPS_HI                      : constant := 16#001A#;
      ALGO_CROSSTALK_COMPENSATION_Y_PLANE_GRADIENT_KCPS_LO                      : constant := 16#001B#;
      REF_SPAD_CHAR_TOTAL_RATE_TARGET_MCPS                                      : constant := 16#001C#;
      REF_SPAD_CHAR_TOTAL_RATE_TARGET_MCPS_HI                                   : constant := 16#001C#;
      REF_SPAD_CHAR_TOTAL_RATE_TARGET_MCPS_LO                                   : constant := 16#001D#;
      ALGO_PART_TO_PART_RANGE_OFFSET_MM                                         : constant := 16#001E#;
      ALGO_PART_TO_PART_RANGE_OFFSET_MM_HI                                      : constant := 16#001E#;
      ALGO_PART_TO_PART_RANGE_OFFSET_MM_LO                                      : constant := 16#001F#;
      MM_CONFIG_INNER_OFFSET_MM                                                 : constant := 16#0020#;
      MM_CONFIG_INNER_OFFSET_MM_HI                                              : constant := 16#0020#;
      MM_CONFIG_INNER_OFFSET_MM_LO                                              : constant := 16#0021#;
      MM_CONFIG_OUTER_OFFSET_MM                                                 : constant := 16#0022#;
      MM_CONFIG_OUTER_OFFSET_MM_HI                                              : constant := 16#0022#;
      MM_CONFIG_OUTER_OFFSET_MM_LO                                              : constant := 16#0023#;
      DSS_CONFIG_TARGET_TOTAL_RATE_MCPS                                         : constant := 16#0024#;
      DSS_CONFIG_TARGET_TOTAL_RATE_MCPS_HI                                      : constant := 16#0024#;
      DSS_CONFIG_TARGET_TOTAL_RATE_MCPS_LO                                      : constant := 16#0025#;
      DEBUG_CTRL                                                                : constant := 16#0026#;
      TEST_MODE_CTRL                                                            : constant := 16#0027#;
      CLK_GATING_CTRL                                                           : constant := 16#0028#;
      NVM_BIST_CTRL                                                             : constant := 16#0029#;
      NVM_BIST_NUM_NVM_WORDS                                                    : constant := 16#002A#;
      NVM_BIST_START_ADDRESS                                                    : constant := 16#002B#;
      HOST_IF_STATUS                                                            : constant := 16#002C#;
      PAD_I2C_HV_CONFIG                                                         : constant := 16#002D#;
      PAD_I2C_HV_EXTSUP_CONFIG                                                  : constant := 16#002E#;
      GPIO_HV_PAD_CTRL                                                          : constant := 16#002F#;
      GPIO_HV_MUX_CTRL                                                          : constant := 16#0030#;
      GPIO_TIO_HV_STATUS                                                        : constant := 16#0031#;
      GPIO_FIO_HV_STATUS                                                        : constant := 16#0032#;
      ANA_CONFIG_SPAD_SEL_PSWIDTH                                               : constant := 16#0033#;
      ANA_CONFIG_VCSEL_PULSE_WIDTH_OFFSET                                       : constant := 16#0034#;
      ANA_CONFIG_FAST_OSC_CONFIG_CTRL                                           : constant := 16#0035#;
      SIGMA_ESTIMATOR_EFFECTIVE_PULSE_WIDTH_NS                                  : constant := 16#0036#;
      SIGMA_ESTIMATOR_EFFECTIVE_AMBIENT_WIDTH_NS                                : constant := 16#0037#;
      SIGMA_ESTIMATOR_SIGMA_REF_MM                                              : constant := 16#0038#;
      ALGO_CROSSTALK_COMPENSATION_VALID_HEIGHT_MM                               : constant := 16#0039#;
      SPARE_HOST_CONFIG_STATIC_CONFIG_SPARE_0                                   : constant := 16#003A#;
      SPARE_HOST_CONFIG_STATIC_CONFIG_SPARE_1                                   : constant := 16#003B#;
      ALGO_RANGE_IGNORE_THRESHOLD_MCPS                                          : constant := 16#003C#;
      ALGO_RANGE_IGNORE_THRESHOLD_MCPS_HI                                       : constant := 16#003C#;
      ALGO_RANGE_IGNORE_THRESHOLD_MCPS_LO                                       : constant := 16#003D#;
      ALGO_RANGE_IGNORE_VALID_HEIGHT_MM                                         : constant := 16#003E#;
      ALGO_RANGE_MIN_CLIP                                                       : constant := 16#003F#;
      ALGO_CONSISTENCY_CHECK_TOLERANCE                                          : constant := 16#0040#;
      SPARE_HOST_CONFIG_STATIC_CONFIG_SPARE_2                                   : constant := 16#0041#;
      SD_CONFIG_RESET_STAGES_MSB                                                : constant := 16#0042#;
      SD_CONFIG_RESET_STAGES_LSB                                                : constant := 16#0043#;
      GPH_CONFIG_STREAM_COUNT_UPDATE_VALUE                                      : constant := 16#0044#;
      GLOBAL_CONFIG_STREAM_DIVIDER                                              : constant := 16#0045#;
      SYSTEM_INTERRUPT_CONFIG_GPIO                                              : constant := 16#0046#;
      CAL_CONFIG_VCSEL_START                                                    : constant := 16#0047#;
      CAL_CONFIG_REPEAT_RATE                                                    : constant := 16#0048#;
      CAL_CONFIG_REPEAT_RATE_HI                                                 : constant := 16#0048#;
      CAL_CONFIG_REPEAT_RATE_LO                                                 : constant := 16#0049#;
      GLOBAL_CONFIG_VCSEL_WIDTH                                                 : constant := 16#004A#;
      PHASECAL_CONFIG_TIMEOUT_MACROP                                            : constant := 16#004B#;
      PHASECAL_CONFIG_TARGET                                                    : constant := 16#004C#;
      PHASECAL_CONFIG_OVERRIDE                                                  : constant := 16#004D#;
      DSS_CONFIG_ROI_MODE_CONTROL                                               : constant := 16#004F#;
      SYSTEM_THRESH_RATE_HIGH                                                   : constant := 16#0050#;
      SYSTEM_THRESH_RATE_HIGH_HI                                                : constant := 16#0050#;
      SYSTEM_THRESH_RATE_HIGH_LO                                                : constant := 16#0051#;
      SYSTEM_THRESH_RATE_LOW                                                    : constant := 16#0052#;
      SYSTEM_THRESH_RATE_LOW_HI                                                 : constant := 16#0052#;
      SYSTEM_THRESH_RATE_LOW_LO                                                 : constant := 16#0053#;
      DSS_CONFIG_MANUAL_EFFECTIVE_SPADS_SELECT                                  : constant := 16#0054#;
      DSS_CONFIG_MANUAL_EFFECTIVE_SPADS_SELECT_HI                               : constant := 16#0054#;
      DSS_CONFIG_MANUAL_EFFECTIVE_SPADS_SELECT_LO                               : constant := 16#0055#;
      DSS_CONFIG_MANUAL_BLOCK_SELECT                                            : constant := 16#0056#;
      DSS_CONFIG_APERTURE_ATTENUATION                                           : constant := 16#0057#;
      DSS_CONFIG_MAX_SPADS_LIMIT                                                : constant := 16#0058#;
      DSS_CONFIG_MIN_SPADS_LIMIT                                                : constant := 16#0059#;
      --  added by Pololu for 16-bit accesses
      MM_CONFIG_TIMEOUT_MACROP_A                                                : constant := 16#005A#;
      MM_CONFIG_TIMEOUT_MACROP_A_HI                                             : constant := 16#005A#;
      MM_CONFIG_TIMEOUT_MACROP_A_LO                                             : constant := 16#005B#;
      --  added by Pololu for 16-bit accesses
      MM_CONFIG_TIMEOUT_MACROP_B                                                : constant := 16#005C#;
      MM_CONFIG_TIMEOUT_MACROP_B_HI                                             : constant := 16#005C#;
      MM_CONFIG_TIMEOUT_MACROP_B_LO                                             : constant := 16#005D#;
      --  added by Pololu for 16-bit accesses
      RANGE_CONFIG_TIMEOUT_MACROP_A                                             : constant := 16#005E#;
      RANGE_CONFIG_TIMEOUT_MACROP_A_HI                                          : constant := 16#005E#;
      RANGE_CONFIG_TIMEOUT_MACROP_A_LO                                          : constant := 16#005F#;
      RANGE_CONFIG_VCSEL_PERIOD_A                                               : constant := 16#0060#;
      --  added by Pololu for 16-bit accesses
      RANGE_CONFIG_TIMEOUT_MACROP_B                                             : constant := 16#0061#;
      RANGE_CONFIG_TIMEOUT_MACROP_B_HI                                          : constant := 16#0061#;
      RANGE_CONFIG_TIMEOUT_MACROP_B_LO                                          : constant := 16#0062#;
      RANGE_CONFIG_VCSEL_PERIOD_B                                               : constant := 16#0063#;
      RANGE_CONFIG_SIGMA_THRESH                                                 : constant := 16#0064#;
      RANGE_CONFIG_SIGMA_THRESH_HI                                              : constant := 16#0064#;
      RANGE_CONFIG_SIGMA_THRESH_LO                                              : constant := 16#0065#;
      RANGE_CONFIG_MIN_COUNT_RATE_RTN_LIMIT_MCPS                                : constant := 16#0066#;
      RANGE_CONFIG_MIN_COUNT_RATE_RTN_LIMIT_MCPS_HI                             : constant := 16#0066#;
      RANGE_CONFIG_MIN_COUNT_RATE_RTN_LIMIT_MCPS_LO                             : constant := 16#0067#;
      RANGE_CONFIG_VALID_PHASE_LOW                                              : constant := 16#0068#;
      RANGE_CONFIG_VALID_PHASE_HIGH                                             : constant := 16#0069#;
      SYSTEM_INTERMEASUREMENT_PERIOD                                            : constant := 16#006C#;
      SYSTEM_INTERMEASUREMENT_PERIOD_3                                          : constant := 16#006C#;
      SYSTEM_INTERMEASUREMENT_PERIOD_2                                          : constant := 16#006D#;
      SYSTEM_INTERMEASUREMENT_PERIOD_1                                          : constant := 16#006E#;
      SYSTEM_INTERMEASUREMENT_PERIOD_0                                          : constant := 16#006F#;
      SYSTEM_FRACTIONAL_ENABLE                                                  : constant := 16#0070#;
      SYSTEM_GROUPED_PARAMETER_HOLD_0                                           : constant := 16#0071#;
      SYSTEM_THRESH_HIGH                                                        : constant := 16#0072#;
      SYSTEM_THRESH_HIGH_HI                                                     : constant := 16#0072#;
      SYSTEM_THRESH_HIGH_LO                                                     : constant := 16#0073#;
      SYSTEM_THRESH_LOW                                                         : constant := 16#0074#;
      SYSTEM_THRESH_LOW_HI                                                      : constant := 16#0074#;
      SYSTEM_THRESH_LOW_LO                                                      : constant := 16#0075#;
      SYSTEM_ENABLE_XTALK_PER_QUADRANT                                          : constant := 16#0076#;
      SYSTEM_SEED_CONFIG                                                        : constant := 16#0077#;
      SD_CONFIG_WOI_SD0                                                         : constant := 16#0078#;
      SD_CONFIG_WOI_SD1                                                         : constant := 16#0079#;
      SD_CONFIG_INITIAL_PHASE_SD0                                               : constant := 16#007A#;
      SD_CONFIG_INITIAL_PHASE_SD1                                               : constant := 16#007B#;
      SYSTEM_GROUPED_PARAMETER_HOLD_1                                           : constant := 16#007C#;
      SD_CONFIG_FIRST_ORDER_SELECT                                              : constant := 16#007D#;
      SD_CONFIG_QUANTIFIER                                                      : constant := 16#007E#;
      ROI_CONFIG_USER_ROI_CENTRE_SPAD                                           : constant := 16#007F#;
      ROI_CONFIG_USER_ROI_REQUESTED_GLOBAL_XY_SIZE                              : constant := 16#0080#;
      SYSTEM_SEQUENCE_CONFIG                                                    : constant := 16#0081#;
      SYSTEM_GROUPED_PARAMETER_HOLD                                             : constant := 16#0082#;
      POWER_MANAGEMENT_GO1_POWER_FORCE                                          : constant := 16#0083#;
      SYSTEM_STREAM_COUNT_CTRL                                                  : constant := 16#0084#;
      FIRMWARE_ENABLE                                                           : constant := 16#0085#;
      SYSTEM_INTERRUPT_CLEAR                                                    : constant := 16#0086#;
      SYSTEM_MODE_START                                                         : constant := 16#0087#;
      RESULT_INTERRUPT_STATUS                                                   : constant := 16#0088#;
      RESULT_RANGE_STATUS                                                       : constant := 16#0089#;
      RESULT_REPORT_STATUS                                                      : constant := 16#008A#;
      RESULT_STREAM_COUNT                                                       : constant := 16#008B#;
      RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD0                                     : constant := 16#008C#;
      RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD0_HI                                  : constant := 16#008C#;
      RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD0_LO                                  : constant := 16#008D#;
      RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD0                                    : constant := 16#008E#;
      RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD0_HI                                 : constant := 16#008E#;
      RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD0_LO                                 : constant := 16#008F#;
      RESULT_AMBIENT_COUNT_RATE_MCPS_SD0                                        : constant := 16#0090#;
      RESULT_AMBIENT_COUNT_RATE_MCPS_SD0_HI                                     : constant := 16#0090#;
      RESULT_AMBIENT_COUNT_RATE_MCPS_SD0_LO                                     : constant := 16#0091#;
      RESULT_SIGMA_SD0                                                          : constant := 16#0092#;
      RESULT_SIGMA_SD0_HI                                                       : constant := 16#0092#;
      RESULT_SIGMA_SD0_LO                                                       : constant := 16#0093#;
      RESULT_PHASE_SD0                                                          : constant := 16#0094#;
      RESULT_PHASE_SD0_HI                                                       : constant := 16#0094#;
      RESULT_PHASE_SD0_LO                                                       : constant := 16#0095#;
      RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0                             : constant := 16#0096#;
      RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0_HI                          : constant := 16#0096#;
      RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0_LO                          : constant := 16#0097#;
      RESULT_PEAK_SIGNAL_COUNT_RATE_CROSSTALK_CORRECTED_MCPS_SD0                : constant := 16#0098#;
      RESULT_PEAK_SIGNAL_COUNT_RATE_CROSSTALK_CORRECTED_MCPS_SD0_HI             : constant := 16#0098#;
      RESULT_PEAK_SIGNAL_COUNT_RATE_CROSSTALK_CORRECTED_MCPS_SD0_LO             : constant := 16#0099#;
      RESULT_MM_INNER_ACTUAL_EFFECTIVE_SPADS_SD0                                : constant := 16#009A#;
      RESULT_MM_INNER_ACTUAL_EFFECTIVE_SPADS_SD0_HI                             : constant := 16#009A#;
      RESULT_MM_INNER_ACTUAL_EFFECTIVE_SPADS_SD0_LO                             : constant := 16#009B#;
      RESULT_MM_OUTER_ACTUAL_EFFECTIVE_SPADS_SD0                                : constant := 16#009C#;
      RESULT_MM_OUTER_ACTUAL_EFFECTIVE_SPADS_SD0_HI                             : constant := 16#009C#;
      RESULT_MM_OUTER_ACTUAL_EFFECTIVE_SPADS_SD0_LO                             : constant := 16#009D#;
      RESULT_AVG_SIGNAL_COUNT_RATE_MCPS_SD0                                     : constant := 16#009E#;
      RESULT_AVG_SIGNAL_COUNT_RATE_MCPS_SD0_HI                                  : constant := 16#009E#;
      RESULT_AVG_SIGNAL_COUNT_RATE_MCPS_SD0_LO                                  : constant := 16#009F#;
      RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD1                                     : constant := 16#00A0#;
      RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD1_HI                                  : constant := 16#00A0#;
      RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD1_LO                                  : constant := 16#00A1#;
      RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD1                                    : constant := 16#00A2#;
      RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD1_HI                                 : constant := 16#00A2#;
      RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD1_LO                                 : constant := 16#00A3#;
      RESULT_AMBIENT_COUNT_RATE_MCPS_SD1                                        : constant := 16#00A4#;
      RESULT_AMBIENT_COUNT_RATE_MCPS_SD1_HI                                     : constant := 16#00A4#;
      RESULT_AMBIENT_COUNT_RATE_MCPS_SD1_LO                                     : constant := 16#00A5#;
      RESULT_SIGMA_SD1                                                          : constant := 16#00A6#;
      RESULT_SIGMA_SD1_HI                                                       : constant := 16#00A6#;
      RESULT_SIGMA_SD1_LO                                                       : constant := 16#00A7#;
      RESULT_PHASE_SD1                                                          : constant := 16#00A8#;
      RESULT_PHASE_SD1_HI                                                       : constant := 16#00A8#;
      RESULT_PHASE_SD1_LO                                                       : constant := 16#00A9#;
      RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD1                             : constant := 16#00AA#;
      RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD1_HI                          : constant := 16#00AA#;
      RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD1_LO                          : constant := 16#00AB#;
      RESULT_SPARE_0_SD1                                                        : constant := 16#00AC#;
      RESULT_SPARE_0_SD1_HI                                                     : constant := 16#00AC#;
      RESULT_SPARE_0_SD1_LO                                                     : constant := 16#00AD#;
      RESULT_SPARE_1_SD1                                                        : constant := 16#00AE#;
      RESULT_SPARE_1_SD1_HI                                                     : constant := 16#00AE#;
      RESULT_SPARE_1_SD1_LO                                                     : constant := 16#00AF#;
      RESULT_SPARE_2_SD1                                                        : constant := 16#00B0#;
      RESULT_SPARE_2_SD1_HI                                                     : constant := 16#00B0#;
      RESULT_SPARE_2_SD1_LO                                                     : constant := 16#00B1#;
      RESULT_SPARE_3_SD1                                                        : constant := 16#00B2#;
      RESULT_THRESH_INFO                                                        : constant := 16#00B3#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0                                     : constant := 16#00B4#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_3                                   : constant := 16#00B4#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_2                                   : constant := 16#00B5#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_1                                   : constant := 16#00B6#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_0                                   : constant := 16#00B7#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD0                                      : constant := 16#00B8#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_3                                    : constant := 16#00B8#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_2                                    : constant := 16#00B9#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_1                                    : constant := 16#00BA#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_0                                    : constant := 16#00BB#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0                                       : constant := 16#00BC#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_3                                     : constant := 16#00BC#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_2                                     : constant := 16#00BD#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_1                                     : constant := 16#00BE#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_0                                     : constant := 16#00BF#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0                                     : constant := 16#00C0#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_3                                   : constant := 16#00C0#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_2                                   : constant := 16#00C1#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_1                                   : constant := 16#00C2#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_0                                   : constant := 16#00C3#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1                                     : constant := 16#00C4#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_3                                   : constant := 16#00C4#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_2                                   : constant := 16#00C5#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_1                                   : constant := 16#00C6#;
      RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_0                                   : constant := 16#00C7#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD1                                      : constant := 16#00C8#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_3                                    : constant := 16#00C8#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_2                                    : constant := 16#00C9#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_1                                    : constant := 16#00CA#;
      RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_0                                    : constant := 16#00CB#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1                                       : constant := 16#00CC#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_3                                     : constant := 16#00CC#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_2                                     : constant := 16#00CD#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_1                                     : constant := 16#00CE#;
      RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_0                                     : constant := 16#00CF#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1                                     : constant := 16#00D0#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_3                                   : constant := 16#00D0#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_2                                   : constant := 16#00D1#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_1                                   : constant := 16#00D2#;
      RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_0                                   : constant := 16#00D3#;
      RESULT_CORE_SPARE_0                                                       : constant := 16#00D4#;
      PHASECAL_RESULT_REFERENCE_PHASE                                           : constant := 16#00D6#;
      PHASECAL_RESULT_REFERENCE_PHASE_HI                                        : constant := 16#00D6#;
      PHASECAL_RESULT_REFERENCE_PHASE_LO                                        : constant := 16#00D7#;
      PHASECAL_RESULT_VCSEL_START                                               : constant := 16#00D8#;
      REF_SPAD_CHAR_RESULT_NUM_ACTUAL_REF_SPADS                                 : constant := 16#00D9#;
      REF_SPAD_CHAR_RESULT_REF_LOCATION                                         : constant := 16#00DA#;
      VHV_RESULT_COLDBOOT_STATUS                                                : constant := 16#00DB#;
      VHV_RESULT_SEARCH_RESULT                                                  : constant := 16#00DC#;
      VHV_RESULT_LATEST_SETTING                                                 : constant := 16#00DD#;
      RESULT_OSC_CALIBRATE_VAL                                                  : constant := 16#00DE#;
      RESULT_OSC_CALIBRATE_VAL_HI                                               : constant := 16#00DE#;
      RESULT_OSC_CALIBRATE_VAL_LO                                               : constant := 16#00DF#;
      ANA_CONFIG_POWERDOWN_GO1                                                  : constant := 16#00E0#;
      ANA_CONFIG_REF_BG_CTRL                                                    : constant := 16#00E1#;
      ANA_CONFIG_REGDVDD1V2_CTRL                                                : constant := 16#00E2#;
      ANA_CONFIG_OSC_SLOW_CTRL                                                  : constant := 16#00E3#;
      TEST_MODE_STATUS                                                          : constant := 16#00E4#;
      FIRMWARE_SYSTEM_STATUS                                                    : constant := 16#00E5#;
      FIRMWARE_MODE_STATUS                                                      : constant := 16#00E6#;
      FIRMWARE_SECONDARY_MODE_STATUS                                            : constant := 16#00E7#;
      FIRMWARE_CAL_REPEAT_RATE_COUNTER                                          : constant := 16#00E8#;
      FIRMWARE_CAL_REPEAT_RATE_COUNTER_HI                                       : constant := 16#00E8#;
      FIRMWARE_CAL_REPEAT_RATE_COUNTER_LO                                       : constant := 16#00E9#;
      FIRMWARE_HISTOGRAM_BIN                                                    : constant := 16#00EA#;
      GPH_SYSTEM_THRESH_HIGH                                                    : constant := 16#00EC#;
      GPH_SYSTEM_THRESH_HIGH_HI                                                 : constant := 16#00EC#;
      GPH_SYSTEM_THRESH_HIGH_LO                                                 : constant := 16#00ED#;
      GPH_SYSTEM_THRESH_LOW                                                     : constant := 16#00EE#;
      GPH_SYSTEM_THRESH_LOW_HI                                                  : constant := 16#00EE#;
      GPH_SYSTEM_THRESH_LOW_LO                                                  : constant := 16#00EF#;
      GPH_SYSTEM_ENABLE_XTALK_PER_QUADRANT                                      : constant := 16#00F0#;
      GPH_SPARE_0                                                               : constant := 16#00F1#;
      GPH_SD_CONFIG_WOI_SD0                                                     : constant := 16#00F2#;
      GPH_SD_CONFIG_WOI_SD1                                                     : constant := 16#00F3#;
      GPH_SD_CONFIG_INITIAL_PHASE_SD0                                           : constant := 16#00F4#;
      GPH_SD_CONFIG_INITIAL_PHASE_SD1                                           : constant := 16#00F5#;
      GPH_SD_CONFIG_FIRST_ORDER_SELECT                                          : constant := 16#00F6#;
      GPH_SD_CONFIG_QUANTIFIER                                                  : constant := 16#00F7#;
      GPH_ROI_CONFIG_USER_ROI_CENTRE_SPAD                                       : constant := 16#00F8#;
      GPH_ROI_CONFIG_USER_ROI_REQUESTED_GLOBAL_XY_SIZE                          : constant := 16#00F9#;
      GPH_SYSTEM_SEQUENCE_CONFIG                                                : constant := 16#00FA#;
      GPH_GPH_ID                                                                : constant := 16#00FB#;
      SYSTEM_INTERRUPT_SET                                                      : constant := 16#00FC#;
      INTERRUPT_MANAGER_ENABLES                                                 : constant := 16#00FD#;
      INTERRUPT_MANAGER_CLEAR                                                   : constant := 16#00FE#;
      INTERRUPT_MANAGER_STATUS                                                  : constant := 16#00FF#;
      MCU_TO_HOST_BANK_WR_ACCESS_EN                                             : constant := 16#0100#;
      POWER_MANAGEMENT_GO1_RESET_STATUS                                         : constant := 16#0101#;
      PAD_STARTUP_MODE_VALUE_RO                                                 : constant := 16#0102#;
      PAD_STARTUP_MODE_VALUE_CTRL                                               : constant := 16#0103#;
      PLL_PERIOD_US                                                             : constant := 16#0104#;
      PLL_PERIOD_US_3                                                           : constant := 16#0104#;
      PLL_PERIOD_US_2                                                           : constant := 16#0105#;
      PLL_PERIOD_US_1                                                           : constant := 16#0106#;
      PLL_PERIOD_US_0                                                           : constant := 16#0107#;
      INTERRUPT_SCHEDULER_DATA_OUT                                              : constant := 16#0108#;
      INTERRUPT_SCHEDULER_DATA_OUT_3                                            : constant := 16#0108#;
      INTERRUPT_SCHEDULER_DATA_OUT_2                                            : constant := 16#0109#;
      INTERRUPT_SCHEDULER_DATA_OUT_1                                            : constant := 16#010A#;
      INTERRUPT_SCHEDULER_DATA_OUT_0                                            : constant := 16#010B#;
      NVM_BIST_COMPLETE                                                         : constant := 16#010C#;
      NVM_BIST_STATUS                                                           : constant := 16#010D#;
      IDENTIFICATION_MODEL_ID                                                   : constant := 16#010F#;
      IDENTIFICATION_MODULE_TYPE                                                : constant := 16#0110#;
      IDENTIFICATION_REVISION_ID                                                : constant := 16#0111#;
      IDENTIFICATION_MODULE_ID                                                  : constant := 16#0112#;
      IDENTIFICATION_MODULE_ID_HI                                               : constant := 16#0112#;
      IDENTIFICATION_MODULE_ID_LO                                               : constant := 16#0113#;
      ANA_CONFIG_FAST_OSC_TRIM_MAX                                              : constant := 16#0114#;
      ANA_CONFIG_FAST_OSC_FREQ_SET                                              : constant := 16#0115#;
      ANA_CONFIG_VCSEL_TRIM                                                     : constant := 16#0116#;
      ANA_CONFIG_VCSEL_SELION                                                   : constant := 16#0117#;
      ANA_CONFIG_VCSEL_SELION_MAX                                               : constant := 16#0118#;
      PROTECTED_LASER_SAFETY_LOCK_BIT                                           : constant := 16#0119#;
      LASER_SAFETY_KEY                                                          : constant := 16#011A#;
      LASER_SAFETY_KEY_RO                                                       : constant := 16#011B#;
      LASER_SAFETY_CLIP                                                         : constant := 16#011C#;
      LASER_SAFETY_MULT                                                         : constant := 16#011D#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_0                                          : constant := 16#011E#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_1                                          : constant := 16#011F#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_2                                          : constant := 16#0120#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_3                                          : constant := 16#0121#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_4                                          : constant := 16#0122#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_5                                          : constant := 16#0123#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_6                                          : constant := 16#0124#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_7                                          : constant := 16#0125#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_8                                          : constant := 16#0126#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_9                                          : constant := 16#0127#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_10                                         : constant := 16#0128#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_11                                         : constant := 16#0129#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_12                                         : constant := 16#012A#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_13                                         : constant := 16#012B#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_14                                         : constant := 16#012C#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_15                                         : constant := 16#012D#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_16                                         : constant := 16#012E#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_17                                         : constant := 16#012F#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_18                                         : constant := 16#0130#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_19                                         : constant := 16#0131#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_20                                         : constant := 16#0132#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_21                                         : constant := 16#0133#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_22                                         : constant := 16#0134#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_23                                         : constant := 16#0135#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_24                                         : constant := 16#0136#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_25                                         : constant := 16#0137#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_26                                         : constant := 16#0138#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_27                                         : constant := 16#0139#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_28                                         : constant := 16#013A#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_29                                         : constant := 16#013B#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_30                                         : constant := 16#013C#;
      GLOBAL_CONFIG_SPAD_ENABLES_RTN_31                                         : constant := 16#013D#;
      ROI_CONFIG_MODE_ROI_CENTRE_SPAD                                           : constant := 16#013E#;
      ROI_CONFIG_MODE_ROI_XY_SIZE                                               : constant := 16#013F#;
      GO2_HOST_BANK_ACCESS_OVERRIDE                                             : constant := 16#0300#;
      MCU_UTIL_MULTIPLIER_MULTIPLICAND                                          : constant := 16#0400#;
      MCU_UTIL_MULTIPLIER_MULTIPLICAND_3                                        : constant := 16#0400#;
      MCU_UTIL_MULTIPLIER_MULTIPLICAND_2                                        : constant := 16#0401#;
      MCU_UTIL_MULTIPLIER_MULTIPLICAND_1                                        : constant := 16#0402#;
      MCU_UTIL_MULTIPLIER_MULTIPLICAND_0                                        : constant := 16#0403#;
      MCU_UTIL_MULTIPLIER_MULTIPLIER                                            : constant := 16#0404#;
      MCU_UTIL_MULTIPLIER_MULTIPLIER_3                                          : constant := 16#0404#;
      MCU_UTIL_MULTIPLIER_MULTIPLIER_2                                          : constant := 16#0405#;
      MCU_UTIL_MULTIPLIER_MULTIPLIER_1                                          : constant := 16#0406#;
      MCU_UTIL_MULTIPLIER_MULTIPLIER_0                                          : constant := 16#0407#;
      MCU_UTIL_MULTIPLIER_PRODUCT_HI                                            : constant := 16#0408#;
      MCU_UTIL_MULTIPLIER_PRODUCT_HI_3                                          : constant := 16#0408#;
      MCU_UTIL_MULTIPLIER_PRODUCT_HI_2                                          : constant := 16#0409#;
      MCU_UTIL_MULTIPLIER_PRODUCT_HI_1                                          : constant := 16#040A#;
      MCU_UTIL_MULTIPLIER_PRODUCT_HI_0                                          : constant := 16#040B#;
      MCU_UTIL_MULTIPLIER_PRODUCT_LO                                            : constant := 16#040C#;
      MCU_UTIL_MULTIPLIER_PRODUCT_LO_3                                          : constant := 16#040C#;
      MCU_UTIL_MULTIPLIER_PRODUCT_LO_2                                          : constant := 16#040D#;
      MCU_UTIL_MULTIPLIER_PRODUCT_LO_1                                          : constant := 16#040E#;
      MCU_UTIL_MULTIPLIER_PRODUCT_LO_0                                          : constant := 16#040F#;
      MCU_UTIL_MULTIPLIER_START                                                 : constant := 16#0410#;
      MCU_UTIL_MULTIPLIER_STATUS                                                : constant := 16#0411#;
      MCU_UTIL_DIVIDER_START                                                    : constant := 16#0412#;
      MCU_UTIL_DIVIDER_STATUS                                                   : constant := 16#0413#;
      MCU_UTIL_DIVIDER_DIVIDEND                                                 : constant := 16#0414#;
      MCU_UTIL_DIVIDER_DIVIDEND_3                                               : constant := 16#0414#;
      MCU_UTIL_DIVIDER_DIVIDEND_2                                               : constant := 16#0415#;
      MCU_UTIL_DIVIDER_DIVIDEND_1                                               : constant := 16#0416#;
      MCU_UTIL_DIVIDER_DIVIDEND_0                                               : constant := 16#0417#;
      MCU_UTIL_DIVIDER_DIVISOR                                                  : constant := 16#0418#;
      MCU_UTIL_DIVIDER_DIVISOR_3                                                : constant := 16#0418#;
      MCU_UTIL_DIVIDER_DIVISOR_2                                                : constant := 16#0419#;
      MCU_UTIL_DIVIDER_DIVISOR_1                                                : constant := 16#041A#;
      MCU_UTIL_DIVIDER_DIVISOR_0                                                : constant := 16#041B#;
      MCU_UTIL_DIVIDER_QUOTIENT                                                 : constant := 16#041C#;
      MCU_UTIL_DIVIDER_QUOTIENT_3                                               : constant := 16#041C#;
      MCU_UTIL_DIVIDER_QUOTIENT_2                                               : constant := 16#041D#;
      MCU_UTIL_DIVIDER_QUOTIENT_1                                               : constant := 16#041E#;
      MCU_UTIL_DIVIDER_QUOTIENT_0                                               : constant := 16#041F#;
      TIMER0_VALUE_IN                                                           : constant := 16#0420#;
      TIMER0_VALUE_IN_3                                                         : constant := 16#0420#;
      TIMER0_VALUE_IN_2                                                         : constant := 16#0421#;
      TIMER0_VALUE_IN_1                                                         : constant := 16#0422#;
      TIMER0_VALUE_IN_0                                                         : constant := 16#0423#;
      TIMER1_VALUE_IN                                                           : constant := 16#0424#;
      TIMER1_VALUE_IN_3                                                         : constant := 16#0424#;
      TIMER1_VALUE_IN_2                                                         : constant := 16#0425#;
      TIMER1_VALUE_IN_1                                                         : constant := 16#0426#;
      TIMER1_VALUE_IN_0                                                         : constant := 16#0427#;
      TIMER0_CTRL                                                               : constant := 16#0428#;
      TIMER1_CTRL                                                               : constant := 16#0429#;
      MCU_GENERAL_PURPOSE_GP_0                                                  : constant := 16#042C#;
      MCU_GENERAL_PURPOSE_GP_1                                                  : constant := 16#042D#;
      MCU_GENERAL_PURPOSE_GP_2                                                  : constant := 16#042E#;
      MCU_GENERAL_PURPOSE_GP_3                                                  : constant := 16#042F#;
      MCU_RANGE_CALC_CONFIG                                                     : constant := 16#0430#;
      MCU_RANGE_CALC_OFFSET_CORRECTED_RANGE                                     : constant := 16#0432#;
      MCU_RANGE_CALC_OFFSET_CORRECTED_RANGE_HI                                  : constant := 16#0432#;
      MCU_RANGE_CALC_OFFSET_CORRECTED_RANGE_LO                                  : constant := 16#0433#;
      MCU_RANGE_CALC_SPARE_4                                                    : constant := 16#0434#;
      MCU_RANGE_CALC_SPARE_4_3                                                  : constant := 16#0434#;
      MCU_RANGE_CALC_SPARE_4_2                                                  : constant := 16#0435#;
      MCU_RANGE_CALC_SPARE_4_1                                                  : constant := 16#0436#;
      MCU_RANGE_CALC_SPARE_4_0                                                  : constant := 16#0437#;
      MCU_RANGE_CALC_AMBIENT_DURATION_PRE_CALC                                  : constant := 16#0438#;
      MCU_RANGE_CALC_AMBIENT_DURATION_PRE_CALC_HI                               : constant := 16#0438#;
      MCU_RANGE_CALC_AMBIENT_DURATION_PRE_CALC_LO                               : constant := 16#0439#;
      MCU_RANGE_CALC_ALGO_VCSEL_PERIOD                                          : constant := 16#043C#;
      MCU_RANGE_CALC_SPARE_5                                                    : constant := 16#043D#;
      MCU_RANGE_CALC_ALGO_TOTAL_PERIODS                                         : constant := 16#043E#;
      MCU_RANGE_CALC_ALGO_TOTAL_PERIODS_HI                                      : constant := 16#043E#;
      MCU_RANGE_CALC_ALGO_TOTAL_PERIODS_LO                                      : constant := 16#043F#;
      MCU_RANGE_CALC_ALGO_ACCUM_PHASE                                           : constant := 16#0440#;
      MCU_RANGE_CALC_ALGO_ACCUM_PHASE_3                                         : constant := 16#0440#;
      MCU_RANGE_CALC_ALGO_ACCUM_PHASE_2                                         : constant := 16#0441#;
      MCU_RANGE_CALC_ALGO_ACCUM_PHASE_1                                         : constant := 16#0442#;
      MCU_RANGE_CALC_ALGO_ACCUM_PHASE_0                                         : constant := 16#0443#;
      MCU_RANGE_CALC_ALGO_SIGNAL_EVENTS                                         : constant := 16#0444#;
      MCU_RANGE_CALC_ALGO_SIGNAL_EVENTS_3                                       : constant := 16#0444#;
      MCU_RANGE_CALC_ALGO_SIGNAL_EVENTS_2                                       : constant := 16#0445#;
      MCU_RANGE_CALC_ALGO_SIGNAL_EVENTS_1                                       : constant := 16#0446#;
      MCU_RANGE_CALC_ALGO_SIGNAL_EVENTS_0                                       : constant := 16#0447#;
      MCU_RANGE_CALC_ALGO_AMBIENT_EVENTS                                        : constant := 16#0448#;
      MCU_RANGE_CALC_ALGO_AMBIENT_EVENTS_3                                      : constant := 16#0448#;
      MCU_RANGE_CALC_ALGO_AMBIENT_EVENTS_2                                      : constant := 16#0449#;
      MCU_RANGE_CALC_ALGO_AMBIENT_EVENTS_1                                      : constant := 16#044A#;
      MCU_RANGE_CALC_ALGO_AMBIENT_EVENTS_0                                      : constant := 16#044B#;
      MCU_RANGE_CALC_SPARE_6                                                    : constant := 16#044C#;
      MCU_RANGE_CALC_SPARE_6_HI                                                 : constant := 16#044C#;
      MCU_RANGE_CALC_SPARE_6_LO                                                 : constant := 16#044D#;
      MCU_RANGE_CALC_ALGO_ADJUST_VCSEL_PERIOD                                   : constant := 16#044E#;
      MCU_RANGE_CALC_ALGO_ADJUST_VCSEL_PERIOD_HI                                : constant := 16#044E#;
      MCU_RANGE_CALC_ALGO_ADJUST_VCSEL_PERIOD_LO                                : constant := 16#044F#;
      MCU_RANGE_CALC_NUM_SPADS                                                  : constant := 16#0450#;
      MCU_RANGE_CALC_NUM_SPADS_HI                                               : constant := 16#0450#;
      MCU_RANGE_CALC_NUM_SPADS_LO                                               : constant := 16#0451#;
      MCU_RANGE_CALC_PHASE_OUTPUT                                               : constant := 16#0452#;
      MCU_RANGE_CALC_PHASE_OUTPUT_HI                                            : constant := 16#0452#;
      MCU_RANGE_CALC_PHASE_OUTPUT_LO                                            : constant := 16#0453#;
      MCU_RANGE_CALC_RATE_PER_SPAD_MCPS                                         : constant := 16#0454#;
      MCU_RANGE_CALC_RATE_PER_SPAD_MCPS_3                                       : constant := 16#0454#;
      MCU_RANGE_CALC_RATE_PER_SPAD_MCPS_2                                       : constant := 16#0455#;
      MCU_RANGE_CALC_RATE_PER_SPAD_MCPS_1                                       : constant := 16#0456#;
      MCU_RANGE_CALC_RATE_PER_SPAD_MCPS_0                                       : constant := 16#0457#;
      MCU_RANGE_CALC_SPARE_7                                                    : constant := 16#0458#;
      MCU_RANGE_CALC_SPARE_8                                                    : constant := 16#0459#;
      MCU_RANGE_CALC_PEAK_SIGNAL_RATE_MCPS                                      : constant := 16#045A#;
      MCU_RANGE_CALC_PEAK_SIGNAL_RATE_MCPS_HI                                   : constant := 16#045A#;
      MCU_RANGE_CALC_PEAK_SIGNAL_RATE_MCPS_LO                                   : constant := 16#045B#;
      MCU_RANGE_CALC_AVG_SIGNAL_RATE_MCPS                                       : constant := 16#045C#;
      MCU_RANGE_CALC_AVG_SIGNAL_RATE_MCPS_HI                                    : constant := 16#045C#;
      MCU_RANGE_CALC_AVG_SIGNAL_RATE_MCPS_LO                                    : constant := 16#045D#;
      MCU_RANGE_CALC_AMBIENT_RATE_MCPS                                          : constant := 16#045E#;
      MCU_RANGE_CALC_AMBIENT_RATE_MCPS_HI                                       : constant := 16#045E#;
      MCU_RANGE_CALC_AMBIENT_RATE_MCPS_LO                                       : constant := 16#045F#;
      MCU_RANGE_CALC_XTALK                                                      : constant := 16#0460#;
      MCU_RANGE_CALC_XTALK_HI                                                   : constant := 16#0460#;
      MCU_RANGE_CALC_XTALK_LO                                                   : constant := 16#0461#;
      MCU_RANGE_CALC_CALC_STATUS                                                : constant := 16#0462#;
      MCU_RANGE_CALC_DEBUG                                                      : constant := 16#0463#;
      MCU_RANGE_CALC_PEAK_SIGNAL_RATE_XTALK_CORR_MCPS                           : constant := 16#0464#;
      MCU_RANGE_CALC_PEAK_SIGNAL_RATE_XTALK_CORR_MCPS_HI                        : constant := 16#0464#;
      MCU_RANGE_CALC_PEAK_SIGNAL_RATE_XTALK_CORR_MCPS_LO                        : constant := 16#0465#;
      MCU_RANGE_CALC_SPARE_0                                                    : constant := 16#0468#;
      MCU_RANGE_CALC_SPARE_1                                                    : constant := 16#0469#;
      MCU_RANGE_CALC_SPARE_2                                                    : constant := 16#046A#;
      MCU_RANGE_CALC_SPARE_3                                                    : constant := 16#046B#;
      PATCH_CTRL                                                                : constant := 16#0470#;
      PATCH_JMP_ENABLES                                                         : constant := 16#0472#;
      PATCH_JMP_ENABLES_HI                                                      : constant := 16#0472#;
      PATCH_JMP_ENABLES_LO                                                      : constant := 16#0473#;
      PATCH_DATA_ENABLES                                                        : constant := 16#0474#;
      PATCH_DATA_ENABLES_HI                                                     : constant := 16#0474#;
      PATCH_DATA_ENABLES_LO                                                     : constant := 16#0475#;
      PATCH_OFFSET_0                                                            : constant := 16#0476#;
      PATCH_OFFSET_0_HI                                                         : constant := 16#0476#;
      PATCH_OFFSET_0_LO                                                         : constant := 16#0477#;
      PATCH_OFFSET_1                                                            : constant := 16#0478#;
      PATCH_OFFSET_1_HI                                                         : constant := 16#0478#;
      PATCH_OFFSET_1_LO                                                         : constant := 16#0479#;
      PATCH_OFFSET_2                                                            : constant := 16#047A#;
      PATCH_OFFSET_2_HI                                                         : constant := 16#047A#;
      PATCH_OFFSET_2_LO                                                         : constant := 16#047B#;
      PATCH_OFFSET_3                                                            : constant := 16#047C#;
      PATCH_OFFSET_3_HI                                                         : constant := 16#047C#;
      PATCH_OFFSET_3_LO                                                         : constant := 16#047D#;
      PATCH_OFFSET_4                                                            : constant := 16#047E#;
      PATCH_OFFSET_4_HI                                                         : constant := 16#047E#;
      PATCH_OFFSET_4_LO                                                         : constant := 16#047F#;
      PATCH_OFFSET_5                                                            : constant := 16#0480#;
      PATCH_OFFSET_5_HI                                                         : constant := 16#0480#;
      PATCH_OFFSET_5_LO                                                         : constant := 16#0481#;
      PATCH_OFFSET_6                                                            : constant := 16#0482#;
      PATCH_OFFSET_6_HI                                                         : constant := 16#0482#;
      PATCH_OFFSET_6_LO                                                         : constant := 16#0483#;
      PATCH_OFFSET_7                                                            : constant := 16#0484#;
      PATCH_OFFSET_7_HI                                                         : constant := 16#0484#;
      PATCH_OFFSET_7_LO                                                         : constant := 16#0485#;
      PATCH_OFFSET_8                                                            : constant := 16#0486#;
      PATCH_OFFSET_8_HI                                                         : constant := 16#0486#;
      PATCH_OFFSET_8_LO                                                         : constant := 16#0487#;
      PATCH_OFFSET_9                                                            : constant := 16#0488#;
      PATCH_OFFSET_9_HI                                                         : constant := 16#0488#;
      PATCH_OFFSET_9_LO                                                         : constant := 16#0489#;
      PATCH_OFFSET_10                                                           : constant := 16#048A#;
      PATCH_OFFSET_10_HI                                                        : constant := 16#048A#;
      PATCH_OFFSET_10_LO                                                        : constant := 16#048B#;
      PATCH_OFFSET_11                                                           : constant := 16#048C#;
      PATCH_OFFSET_11_HI                                                        : constant := 16#048C#;
      PATCH_OFFSET_11_LO                                                        : constant := 16#048D#;
      PATCH_OFFSET_12                                                           : constant := 16#048E#;
      PATCH_OFFSET_12_HI                                                        : constant := 16#048E#;
      PATCH_OFFSET_12_LO                                                        : constant := 16#048F#;
      PATCH_OFFSET_13                                                           : constant := 16#0490#;
      PATCH_OFFSET_13_HI                                                        : constant := 16#0490#;
      PATCH_OFFSET_13_LO                                                        : constant := 16#0491#;
      PATCH_OFFSET_14                                                           : constant := 16#0492#;
      PATCH_OFFSET_14_HI                                                        : constant := 16#0492#;
      PATCH_OFFSET_14_LO                                                        : constant := 16#0493#;
      PATCH_OFFSET_15                                                           : constant := 16#0494#;
      PATCH_OFFSET_15_HI                                                        : constant := 16#0494#;
      PATCH_OFFSET_15_LO                                                        : constant := 16#0495#;
      PATCH_ADDRESS_0                                                           : constant := 16#0496#;
      PATCH_ADDRESS_0_HI                                                        : constant := 16#0496#;
      PATCH_ADDRESS_0_LO                                                        : constant := 16#0497#;
      PATCH_ADDRESS_1                                                           : constant := 16#0498#;
      PATCH_ADDRESS_1_HI                                                        : constant := 16#0498#;
      PATCH_ADDRESS_1_LO                                                        : constant := 16#0499#;
      PATCH_ADDRESS_2                                                           : constant := 16#049A#;
      PATCH_ADDRESS_2_HI                                                        : constant := 16#049A#;
      PATCH_ADDRESS_2_LO                                                        : constant := 16#049B#;
      PATCH_ADDRESS_3                                                           : constant := 16#049C#;
      PATCH_ADDRESS_3_HI                                                        : constant := 16#049C#;
      PATCH_ADDRESS_3_LO                                                        : constant := 16#049D#;
      PATCH_ADDRESS_4                                                           : constant := 16#049E#;
      PATCH_ADDRESS_4_HI                                                        : constant := 16#049E#;
      PATCH_ADDRESS_4_LO                                                        : constant := 16#049F#;
      PATCH_ADDRESS_5                                                           : constant := 16#04A0#;
      PATCH_ADDRESS_5_HI                                                        : constant := 16#04A0#;
      PATCH_ADDRESS_5_LO                                                        : constant := 16#04A1#;
      PATCH_ADDRESS_6                                                           : constant := 16#04A2#;
      PATCH_ADDRESS_6_HI                                                        : constant := 16#04A2#;
      PATCH_ADDRESS_6_LO                                                        : constant := 16#04A3#;
      PATCH_ADDRESS_7                                                           : constant := 16#04A4#;
      PATCH_ADDRESS_7_HI                                                        : constant := 16#04A4#;
      PATCH_ADDRESS_7_LO                                                        : constant := 16#04A5#;
      PATCH_ADDRESS_8                                                           : constant := 16#04A6#;
      PATCH_ADDRESS_8_HI                                                        : constant := 16#04A6#;
      PATCH_ADDRESS_8_LO                                                        : constant := 16#04A7#;
      PATCH_ADDRESS_9                                                           : constant := 16#04A8#;
      PATCH_ADDRESS_9_HI                                                        : constant := 16#04A8#;
      PATCH_ADDRESS_9_LO                                                        : constant := 16#04A9#;
      PATCH_ADDRESS_10                                                          : constant := 16#04AA#;
      PATCH_ADDRESS_10_HI                                                       : constant := 16#04AA#;
      PATCH_ADDRESS_10_LO                                                       : constant := 16#04AB#;
      PATCH_ADDRESS_11                                                          : constant := 16#04AC#;
      PATCH_ADDRESS_11_HI                                                       : constant := 16#04AC#;
      PATCH_ADDRESS_11_LO                                                       : constant := 16#04AD#;
      PATCH_ADDRESS_12                                                          : constant := 16#04AE#;
      PATCH_ADDRESS_12_HI                                                       : constant := 16#04AE#;
      PATCH_ADDRESS_12_LO                                                       : constant := 16#04AF#;
      PATCH_ADDRESS_13                                                          : constant := 16#04B0#;
      PATCH_ADDRESS_13_HI                                                       : constant := 16#04B0#;
      PATCH_ADDRESS_13_LO                                                       : constant := 16#04B1#;
      PATCH_ADDRESS_14                                                          : constant := 16#04B2#;
      PATCH_ADDRESS_14_HI                                                       : constant := 16#04B2#;
      PATCH_ADDRESS_14_LO                                                       : constant := 16#04B3#;
      PATCH_ADDRESS_15                                                          : constant := 16#04B4#;
      PATCH_ADDRESS_15_HI                                                       : constant := 16#04B4#;
      PATCH_ADDRESS_15_LO                                                       : constant := 16#04B5#;
      SPI_ASYNC_MUX_CTRL                                                        : constant := 16#04C0#;
      CLK_CONFIG                                                                : constant := 16#04C4#;
      GPIO_LV_MUX_CTRL                                                          : constant := 16#04CC#;
      GPIO_LV_PAD_CTRL                                                          : constant := 16#04CD#;
      PAD_I2C_LV_CONFIG                                                         : constant := 16#04D0#;
      PAD_STARTUP_MODE_VALUE_RO_GO1                                             : constant := 16#04D4#;
      HOST_IF_STATUS_GO1                                                        : constant := 16#04D5#;
      MCU_CLK_GATING_CTRL                                                       : constant := 16#04D8#;
      TEST_BIST_ROM_CTRL                                                        : constant := 16#04E0#;
      TEST_BIST_ROM_RESULT                                                      : constant := 16#04E1#;
      TEST_BIST_ROM_MCU_SIG                                                     : constant := 16#04E2#;
      TEST_BIST_ROM_MCU_SIG_HI                                                  : constant := 16#04E2#;
      TEST_BIST_ROM_MCU_SIG_LO                                                  : constant := 16#04E3#;
      TEST_BIST_RAM_CTRL                                                        : constant := 16#04E4#;
      TEST_BIST_RAM_RESULT                                                      : constant := 16#04E5#;
      TEST_TMC                                                                  : constant := 16#04E8#;
      TEST_PLL_BIST_MIN_THRESHOLD                                               : constant := 16#04F0#;
      TEST_PLL_BIST_MIN_THRESHOLD_HI                                            : constant := 16#04F0#;
      TEST_PLL_BIST_MIN_THRESHOLD_LO                                            : constant := 16#04F1#;
      TEST_PLL_BIST_MAX_THRESHOLD                                               : constant := 16#04F2#;
      TEST_PLL_BIST_MAX_THRESHOLD_HI                                            : constant := 16#04F2#;
      TEST_PLL_BIST_MAX_THRESHOLD_LO                                            : constant := 16#04F3#;
      TEST_PLL_BIST_COUNT_OUT                                                   : constant := 16#04F4#;
      TEST_PLL_BIST_COUNT_OUT_HI                                                : constant := 16#04F4#;
      TEST_PLL_BIST_COUNT_OUT_LO                                                : constant := 16#04F5#;
      TEST_PLL_BIST_GONOGO                                                      : constant := 16#04F6#;
      TEST_PLL_BIST_CTRL                                                        : constant := 16#04F7#;
      RANGING_CORE_DEVICE_ID                                                    : constant := 16#0680#;
      RANGING_CORE_REVISION_ID                                                  : constant := 16#0681#;
      RANGING_CORE_CLK_CTRL1                                                    : constant := 16#0683#;
      RANGING_CORE_CLK_CTRL2                                                    : constant := 16#0684#;
      RANGING_CORE_WOI_1                                                        : constant := 16#0685#;
      RANGING_CORE_WOI_REF_1                                                    : constant := 16#0686#;
      RANGING_CORE_START_RANGING                                                : constant := 16#0687#;
      RANGING_CORE_LOW_LIMIT_1                                                  : constant := 16#0690#;
      RANGING_CORE_HIGH_LIMIT_1                                                 : constant := 16#0691#;
      RANGING_CORE_LOW_LIMIT_REF_1                                              : constant := 16#0692#;
      RANGING_CORE_HIGH_LIMIT_REF_1                                             : constant := 16#0693#;
      RANGING_CORE_QUANTIFIER_1_MSB                                             : constant := 16#0694#;
      RANGING_CORE_QUANTIFIER_1_LSB                                             : constant := 16#0695#;
      RANGING_CORE_QUANTIFIER_REF_1_MSB                                         : constant := 16#0696#;
      RANGING_CORE_QUANTIFIER_REF_1_LSB                                         : constant := 16#0697#;
      RANGING_CORE_AMBIENT_OFFSET_1_MSB                                         : constant := 16#0698#;
      RANGING_CORE_AMBIENT_OFFSET_1_LSB                                         : constant := 16#0699#;
      RANGING_CORE_AMBIENT_OFFSET_REF_1_MSB                                     : constant := 16#069A#;
      RANGING_CORE_AMBIENT_OFFSET_REF_1_LSB                                     : constant := 16#069B#;
      RANGING_CORE_FILTER_STRENGTH_1                                            : constant := 16#069C#;
      RANGING_CORE_FILTER_STRENGTH_REF_1                                        : constant := 16#069D#;
      RANGING_CORE_SIGNAL_EVENT_LIMIT_1_MSB                                     : constant := 16#069E#;
      RANGING_CORE_SIGNAL_EVENT_LIMIT_1_LSB                                     : constant := 16#069F#;
      RANGING_CORE_SIGNAL_EVENT_LIMIT_REF_1_MSB                                 : constant := 16#06A0#;
      RANGING_CORE_SIGNAL_EVENT_LIMIT_REF_1_LSB                                 : constant := 16#06A1#;
      RANGING_CORE_TIMEOUT_OVERALL_PERIODS_MSB                                  : constant := 16#06A4#;
      RANGING_CORE_TIMEOUT_OVERALL_PERIODS_LSB                                  : constant := 16#06A5#;
      RANGING_CORE_INVERT_HW                                                    : constant := 16#06A6#;
      RANGING_CORE_FORCE_HW                                                     : constant := 16#06A7#;
      RANGING_CORE_STATIC_HW_VALUE                                              : constant := 16#06A8#;
      RANGING_CORE_FORCE_CONTINUOUS_AMBIENT                                     : constant := 16#06A9#;
      RANGING_CORE_TEST_PHASE_SELECT_TO_FILTER                                  : constant := 16#06AA#;
      RANGING_CORE_TEST_PHASE_SELECT_TO_TIMING_GEN                              : constant := 16#06AB#;
      RANGING_CORE_INITIAL_PHASE_VALUE_1                                        : constant := 16#06AC#;
      RANGING_CORE_INITIAL_PHASE_VALUE_REF_1                                    : constant := 16#06AD#;
      RANGING_CORE_FORCE_UP_IN                                                  : constant := 16#06AE#;
      RANGING_CORE_FORCE_DN_IN                                                  : constant := 16#06AF#;
      RANGING_CORE_STATIC_UP_VALUE_1                                            : constant := 16#06B0#;
      RANGING_CORE_STATIC_UP_VALUE_REF_1                                        : constant := 16#06B1#;
      RANGING_CORE_STATIC_DN_VALUE_1                                            : constant := 16#06B2#;
      RANGING_CORE_STATIC_DN_VALUE_REF_1                                        : constant := 16#06B3#;
      RANGING_CORE_MONITOR_UP_DN                                                : constant := 16#06B4#;
      RANGING_CORE_INVERT_UP_DN                                                 : constant := 16#06B5#;
      RANGING_CORE_CPUMP_1                                                      : constant := 16#06B6#;
      RANGING_CORE_CPUMP_2                                                      : constant := 16#06B7#;
      RANGING_CORE_CPUMP_3                                                      : constant := 16#06B8#;
      RANGING_CORE_OSC_1                                                        : constant := 16#06B9#;
      RANGING_CORE_PLL_1                                                        : constant := 16#06BB#;
      RANGING_CORE_PLL_2                                                        : constant := 16#06BC#;
      RANGING_CORE_REFERENCE_1                                                  : constant := 16#06BD#;
      RANGING_CORE_REFERENCE_3                                                  : constant := 16#06BF#;
      RANGING_CORE_REFERENCE_4                                                  : constant := 16#06C0#;
      RANGING_CORE_REFERENCE_5                                                  : constant := 16#06C1#;
      RANGING_CORE_REGAVDD1V2                                                   : constant := 16#06C3#;
      RANGING_CORE_CALIB_1                                                      : constant := 16#06C4#;
      RANGING_CORE_CALIB_2                                                      : constant := 16#06C5#;
      RANGING_CORE_CALIB_3                                                      : constant := 16#06C6#;
      RANGING_CORE_TST_MUX_SEL1                                                 : constant := 16#06C9#;
      RANGING_CORE_TST_MUX_SEL2                                                 : constant := 16#06CA#;
      RANGING_CORE_TST_MUX                                                      : constant := 16#06CB#;
      RANGING_CORE_GPIO_OUT_TESTMUX                                             : constant := 16#06CC#;
      RANGING_CORE_CUSTOM_FE                                                    : constant := 16#06CD#;
      RANGING_CORE_CUSTOM_FE_2                                                  : constant := 16#06CE#;
      RANGING_CORE_SPAD_READOUT                                                 : constant := 16#06CF#;
      RANGING_CORE_SPAD_READOUT_1                                               : constant := 16#06D0#;
      RANGING_CORE_SPAD_READOUT_2                                               : constant := 16#06D1#;
      RANGING_CORE_SPAD_PS                                                      : constant := 16#06D2#;
      RANGING_CORE_LASER_SAFETY_2                                               : constant := 16#06D4#;
      RANGING_CORE_NVM_CTRL_MODE                                                : constant := 16#0780#;
      RANGING_CORE_NVM_CTRL_PDN                                                 : constant := 16#0781#;
      RANGING_CORE_NVM_CTRL_PROGN                                               : constant := 16#0782#;
      RANGING_CORE_NVM_CTRL_READN                                               : constant := 16#0783#;
      RANGING_CORE_NVM_CTRL_PULSE_WIDTH_MSB                                     : constant := 16#0784#;
      RANGING_CORE_NVM_CTRL_PULSE_WIDTH_LSB                                     : constant := 16#0785#;
      RANGING_CORE_NVM_CTRL_HV_RISE_MSB                                         : constant := 16#0786#;
      RANGING_CORE_NVM_CTRL_HV_RISE_LSB                                         : constant := 16#0787#;
      RANGING_CORE_NVM_CTRL_HV_FALL_MSB                                         : constant := 16#0788#;
      RANGING_CORE_NVM_CTRL_HV_FALL_LSB                                         : constant := 16#0789#;
      RANGING_CORE_NVM_CTRL_TST                                                 : constant := 16#078A#;
      RANGING_CORE_NVM_CTRL_TESTREAD                                            : constant := 16#078B#;
      RANGING_CORE_NVM_CTRL_DATAIN_MMM                                          : constant := 16#078C#;
      RANGING_CORE_NVM_CTRL_DATAIN_LMM                                          : constant := 16#078D#;
      RANGING_CORE_NVM_CTRL_DATAIN_LLM                                          : constant := 16#078E#;
      RANGING_CORE_NVM_CTRL_DATAIN_LLL                                          : constant := 16#078F#;
      RANGING_CORE_NVM_CTRL_DATAOUT_MMM                                         : constant := 16#0790#;
      RANGING_CORE_NVM_CTRL_DATAOUT_LMM                                         : constant := 16#0791#;
      RANGING_CORE_NVM_CTRL_DATAOUT_LLM                                         : constant := 16#0792#;
      RANGING_CORE_NVM_CTRL_DATAOUT_LLL                                         : constant := 16#0793#;
      RANGING_CORE_NVM_CTRL_ADDR                                                : constant := 16#0794#;
      RANGING_CORE_NVM_CTRL_DATAOUT_ECC                                         : constant := 16#0795#;
      RANGING_CORE_RET_SPAD_EN_0                                                : constant := 16#0796#;
      RANGING_CORE_RET_SPAD_EN_1                                                : constant := 16#0797#;
      RANGING_CORE_RET_SPAD_EN_2                                                : constant := 16#0798#;
      RANGING_CORE_RET_SPAD_EN_3                                                : constant := 16#0799#;
      RANGING_CORE_RET_SPAD_EN_4                                                : constant := 16#079A#;
      RANGING_CORE_RET_SPAD_EN_5                                                : constant := 16#079B#;
      RANGING_CORE_RET_SPAD_EN_6                                                : constant := 16#079C#;
      RANGING_CORE_RET_SPAD_EN_7                                                : constant := 16#079D#;
      RANGING_CORE_RET_SPAD_EN_8                                                : constant := 16#079E#;
      RANGING_CORE_RET_SPAD_EN_9                                                : constant := 16#079F#;
      RANGING_CORE_RET_SPAD_EN_10                                               : constant := 16#07A0#;
      RANGING_CORE_RET_SPAD_EN_11                                               : constant := 16#07A1#;
      RANGING_CORE_RET_SPAD_EN_12                                               : constant := 16#07A2#;
      RANGING_CORE_RET_SPAD_EN_13                                               : constant := 16#07A3#;
      RANGING_CORE_RET_SPAD_EN_14                                               : constant := 16#07A4#;
      RANGING_CORE_RET_SPAD_EN_15                                               : constant := 16#07A5#;
      RANGING_CORE_RET_SPAD_EN_16                                               : constant := 16#07A6#;
      RANGING_CORE_RET_SPAD_EN_17                                               : constant := 16#07A7#;
      RANGING_CORE_SPAD_SHIFT_EN                                                : constant := 16#07BA#;
      RANGING_CORE_SPAD_DISABLE_CTRL                                            : constant := 16#07BB#;
      RANGING_CORE_SPAD_EN_SHIFT_OUT_DEBUG                                      : constant := 16#07BC#;
      RANGING_CORE_SPI_MODE                                                     : constant := 16#07BD#;
      RANGING_CORE_GPIO_DIR                                                     : constant := 16#07BE#;
      RANGING_CORE_VCSEL_PERIOD                                                 : constant := 16#0880#;
      RANGING_CORE_VCSEL_START                                                  : constant := 16#0881#;
      RANGING_CORE_VCSEL_STOP                                                   : constant := 16#0882#;
      RANGING_CORE_VCSEL_1                                                      : constant := 16#0885#;
      RANGING_CORE_VCSEL_STATUS                                                 : constant := 16#088D#;
      RANGING_CORE_STATUS                                                       : constant := 16#0980#;
      RANGING_CORE_LASER_CONTINUITY_STATE                                       : constant := 16#0981#;
      RANGING_CORE_RANGE_1_MMM                                                  : constant := 16#0982#;
      RANGING_CORE_RANGE_1_LMM                                                  : constant := 16#0983#;
      RANGING_CORE_RANGE_1_LLM                                                  : constant := 16#0984#;
      RANGING_CORE_RANGE_1_LLL                                                  : constant := 16#0985#;
      RANGING_CORE_RANGE_REF_1_MMM                                              : constant := 16#0986#;
      RANGING_CORE_RANGE_REF_1_LMM                                              : constant := 16#0987#;
      RANGING_CORE_RANGE_REF_1_LLM                                              : constant := 16#0988#;
      RANGING_CORE_RANGE_REF_1_LLL                                              : constant := 16#0989#;
      RANGING_CORE_AMBIENT_WINDOW_EVENTS_1_MMM                                  : constant := 16#098A#;
      RANGING_CORE_AMBIENT_WINDOW_EVENTS_1_LMM                                  : constant := 16#098B#;
      RANGING_CORE_AMBIENT_WINDOW_EVENTS_1_LLM                                  : constant := 16#098C#;
      RANGING_CORE_AMBIENT_WINDOW_EVENTS_1_LLL                                  : constant := 16#098D#;
      RANGING_CORE_RANGING_TOTAL_EVENTS_1_MMM                                   : constant := 16#098E#;
      RANGING_CORE_RANGING_TOTAL_EVENTS_1_LMM                                   : constant := 16#098F#;
      RANGING_CORE_RANGING_TOTAL_EVENTS_1_LLM                                   : constant := 16#0990#;
      RANGING_CORE_RANGING_TOTAL_EVENTS_1_LLL                                   : constant := 16#0991#;
      RANGING_CORE_SIGNAL_TOTAL_EVENTS_1_MMM                                    : constant := 16#0992#;
      RANGING_CORE_SIGNAL_TOTAL_EVENTS_1_LMM                                    : constant := 16#0993#;
      RANGING_CORE_SIGNAL_TOTAL_EVENTS_1_LLM                                    : constant := 16#0994#;
      RANGING_CORE_SIGNAL_TOTAL_EVENTS_1_LLL                                    : constant := 16#0995#;
      RANGING_CORE_TOTAL_PERIODS_ELAPSED_1_MM                                   : constant := 16#0996#;
      RANGING_CORE_TOTAL_PERIODS_ELAPSED_1_LM                                   : constant := 16#0997#;
      RANGING_CORE_TOTAL_PERIODS_ELAPSED_1_LL                                   : constant := 16#0998#;
      RANGING_CORE_AMBIENT_MISMATCH_MM                                          : constant := 16#0999#;
      RANGING_CORE_AMBIENT_MISMATCH_LM                                          : constant := 16#099A#;
      RANGING_CORE_AMBIENT_MISMATCH_LL                                          : constant := 16#099B#;
      RANGING_CORE_AMBIENT_WINDOW_EVENTS_REF_1_MMM                              : constant := 16#099C#;
      RANGING_CORE_AMBIENT_WINDOW_EVENTS_REF_1_LMM                              : constant := 16#099D#;
      RANGING_CORE_AMBIENT_WINDOW_EVENTS_REF_1_LLM                              : constant := 16#099E#;
      RANGING_CORE_AMBIENT_WINDOW_EVENTS_REF_1_LLL                              : constant := 16#099F#;
      RANGING_CORE_RANGING_TOTAL_EVENTS_REF_1_MMM                               : constant := 16#09A0#;
      RANGING_CORE_RANGING_TOTAL_EVENTS_REF_1_LMM                               : constant := 16#09A1#;
      RANGING_CORE_RANGING_TOTAL_EVENTS_REF_1_LLM                               : constant := 16#09A2#;
      RANGING_CORE_RANGING_TOTAL_EVENTS_REF_1_LLL                               : constant := 16#09A3#;
      RANGING_CORE_SIGNAL_TOTAL_EVENTS_REF_1_MMM                                : constant := 16#09A4#;
      RANGING_CORE_SIGNAL_TOTAL_EVENTS_REF_1_LMM                                : constant := 16#09A5#;
      RANGING_CORE_SIGNAL_TOTAL_EVENTS_REF_1_LLM                                : constant := 16#09A6#;
      RANGING_CORE_SIGNAL_TOTAL_EVENTS_REF_1_LLL                                : constant := 16#09A7#;
      RANGING_CORE_TOTAL_PERIODS_ELAPSED_REF_1_MM                               : constant := 16#09A8#;
      RANGING_CORE_TOTAL_PERIODS_ELAPSED_REF_1_LM                               : constant := 16#09A9#;
      RANGING_CORE_TOTAL_PERIODS_ELAPSED_REF_1_LL                               : constant := 16#09AA#;
      RANGING_CORE_AMBIENT_MISMATCH_REF_MM                                      : constant := 16#09AB#;
      RANGING_CORE_AMBIENT_MISMATCH_REF_LM                                      : constant := 16#09AC#;
      RANGING_CORE_AMBIENT_MISMATCH_REF_LL                                      : constant := 16#09AD#;
      RANGING_CORE_GPIO_CONFIG_A0                                               : constant := 16#0A00#;
      RANGING_CORE_RESET_CONTROL_A0                                             : constant := 16#0A01#;
      RANGING_CORE_INTR_MANAGER_A0                                              : constant := 16#0A02#;
      RANGING_CORE_POWER_FSM_TIME_OSC_A0                                        : constant := 16#0A06#;
      RANGING_CORE_VCSEL_ATEST_A0                                               : constant := 16#0A07#;
      RANGING_CORE_VCSEL_PERIOD_CLIPPED_A0                                      : constant := 16#0A08#;
      RANGING_CORE_VCSEL_STOP_CLIPPED_A0                                        : constant := 16#0A09#;
      RANGING_CORE_CALIB_2_A0                                                   : constant := 16#0A0A#;
      RANGING_CORE_STOP_CONDITION_A0                                            : constant := 16#0A0B#;
      RANGING_CORE_STATUS_RESET_A0                                              : constant := 16#0A0C#;
      RANGING_CORE_READOUT_CFG_A0                                               : constant := 16#0A0D#;
      RANGING_CORE_WINDOW_SETTING_A0                                            : constant := 16#0A0E#;
      RANGING_CORE_VCSEL_DELAY_A0                                               : constant := 16#0A1A#;
      RANGING_CORE_REFERENCE_2_A0                                               : constant := 16#0A1B#;
      RANGING_CORE_REGAVDD1V2_A0                                                : constant := 16#0A1D#;
      RANGING_CORE_TST_MUX_A0                                                   : constant := 16#0A1F#;
      RANGING_CORE_CUSTOM_FE_2_A0                                               : constant := 16#0A20#;
      RANGING_CORE_SPAD_READOUT_A0                                              : constant := 16#0A21#;
      RANGING_CORE_CPUMP_1_A0                                                   : constant := 16#0A22#;
      RANGING_CORE_SPARE_REGISTER_A0                                            : constant := 16#0A23#;
      RANGING_CORE_VCSEL_CONT_STAGE5_BYPASS_A0                                  : constant := 16#0A24#;
      RANGING_CORE_RET_SPAD_EN_18                                               : constant := 16#0A25#;
      RANGING_CORE_RET_SPAD_EN_19                                               : constant := 16#0A26#;
      RANGING_CORE_RET_SPAD_EN_20                                               : constant := 16#0A27#;
      RANGING_CORE_RET_SPAD_EN_21                                               : constant := 16#0A28#;
      RANGING_CORE_RET_SPAD_EN_22                                               : constant := 16#0A29#;
      RANGING_CORE_RET_SPAD_EN_23                                               : constant := 16#0A2A#;
      RANGING_CORE_RET_SPAD_EN_24                                               : constant := 16#0A2B#;
      RANGING_CORE_RET_SPAD_EN_25                                               : constant := 16#0A2C#;
      RANGING_CORE_RET_SPAD_EN_26                                               : constant := 16#0A2D#;
      RANGING_CORE_RET_SPAD_EN_27                                               : constant := 16#0A2E#;
      RANGING_CORE_RET_SPAD_EN_28                                               : constant := 16#0A2F#;
      RANGING_CORE_RET_SPAD_EN_29                                               : constant := 16#0A30#;
      RANGING_CORE_RET_SPAD_EN_30                                               : constant := 16#0A31#;
      RANGING_CORE_RET_SPAD_EN_31                                               : constant := 16#0A32#;
      RANGING_CORE_REF_SPAD_EN_0_EWOK                                           : constant := 16#0A33#;
      RANGING_CORE_REF_SPAD_EN_1_EWOK                                           : constant := 16#0A34#;
      RANGING_CORE_REF_SPAD_EN_2_EWOK                                           : constant := 16#0A35#;
      RANGING_CORE_REF_SPAD_EN_3_EWOK                                           : constant := 16#0A36#;
      RANGING_CORE_REF_SPAD_EN_4_EWOK                                           : constant := 16#0A37#;
      RANGING_CORE_REF_SPAD_EN_5_EWOK                                           : constant := 16#0A38#;
      RANGING_CORE_REF_EN_START_SELECT                                          : constant := 16#0A39#;
      RANGING_CORE_REGDVDD1V2_ATEST_EWOK                                        : constant := 16#0A41#;
      SOFT_RESET_GO1                                                            : constant := 16#0B00#;
      PRIVATE_PATCH_BASE_ADDR_RSLV                                              : constant := 16#0E00#;
      PREV_SHADOW_RESULT_INTERRUPT_STATUS                                       : constant := 16#0ED0#;
      PREV_SHADOW_RESULT_RANGE_STATUS                                           : constant := 16#0ED1#;
      PREV_SHADOW_RESULT_REPORT_STATUS                                          : constant := 16#0ED2#;
      PREV_SHADOW_RESULT_STREAM_COUNT                                           : constant := 16#0ED3#;
      PREV_SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD0                         : constant := 16#0ED4#;
      PREV_SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD0_HI                      : constant := 16#0ED4#;
      PREV_SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD0_LO                      : constant := 16#0ED5#;
      PREV_SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD0                        : constant := 16#0ED6#;
      PREV_SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD0_HI                     : constant := 16#0ED6#;
      PREV_SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD0_LO                     : constant := 16#0ED7#;
      PREV_SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD0                            : constant := 16#0ED8#;
      PREV_SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD0_HI                         : constant := 16#0ED8#;
      PREV_SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD0_LO                         : constant := 16#0ED9#;
      PREV_SHADOW_RESULT_SIGMA_SD0                                              : constant := 16#0EDA#;
      PREV_SHADOW_RESULT_SIGMA_SD0_HI                                           : constant := 16#0EDA#;
      PREV_SHADOW_RESULT_SIGMA_SD0_LO                                           : constant := 16#0EDB#;
      PREV_SHADOW_RESULT_PHASE_SD0                                              : constant := 16#0EDC#;
      PREV_SHADOW_RESULT_PHASE_SD0_HI                                           : constant := 16#0EDC#;
      PREV_SHADOW_RESULT_PHASE_SD0_LO                                           : constant := 16#0EDD#;
      PREV_SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0                 : constant := 16#0EDE#;
      PREV_SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0_HI              : constant := 16#0EDE#;
      PREV_SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0_LO              : constant := 16#0EDF#;
      PREV_SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_CROSSTALK_CORRECTED_MCPS_SD0    : constant := 16#0EE0#;
      PREV_SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_CROSSTALK_CORRECTED_MCPS_SD0_HI : constant := 16#0EE0#;
      PREV_SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_CROSSTALK_CORRECTED_MCPS_SD0_LO : constant := 16#0EE1#;
      PREV_SHADOW_RESULT_MM_INNER_ACTUAL_EFFECTIVE_SPADS_SD0                    : constant := 16#0EE2#;
      PREV_SHADOW_RESULT_MM_INNER_ACTUAL_EFFECTIVE_SPADS_SD0_HI                 : constant := 16#0EE2#;
      PREV_SHADOW_RESULT_MM_INNER_ACTUAL_EFFECTIVE_SPADS_SD0_LO                 : constant := 16#0EE3#;
      PREV_SHADOW_RESULT_MM_OUTER_ACTUAL_EFFECTIVE_SPADS_SD0                    : constant := 16#0EE4#;
      PREV_SHADOW_RESULT_MM_OUTER_ACTUAL_EFFECTIVE_SPADS_SD0_HI                 : constant := 16#0EE4#;
      PREV_SHADOW_RESULT_MM_OUTER_ACTUAL_EFFECTIVE_SPADS_SD0_LO                 : constant := 16#0EE5#;
      PREV_SHADOW_RESULT_AVG_SIGNAL_COUNT_RATE_MCPS_SD0                         : constant := 16#0EE6#;
      PREV_SHADOW_RESULT_AVG_SIGNAL_COUNT_RATE_MCPS_SD0_HI                      : constant := 16#0EE6#;
      PREV_SHADOW_RESULT_AVG_SIGNAL_COUNT_RATE_MCPS_SD0_LO                      : constant := 16#0EE7#;
      PREV_SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD1                         : constant := 16#0EE8#;
      PREV_SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD1_HI                      : constant := 16#0EE8#;
      PREV_SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD1_LO                      : constant := 16#0EE9#;
      PREV_SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD1                        : constant := 16#0EEA#;
      PREV_SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD1_HI                     : constant := 16#0EEA#;
      PREV_SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD1_LO                     : constant := 16#0EEB#;
      PREV_SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD1                            : constant := 16#0EEC#;
      PREV_SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD1_HI                         : constant := 16#0EEC#;
      PREV_SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD1_LO                         : constant := 16#0EED#;
      PREV_SHADOW_RESULT_SIGMA_SD1                                              : constant := 16#0EEE#;
      PREV_SHADOW_RESULT_SIGMA_SD1_HI                                           : constant := 16#0EEE#;
      PREV_SHADOW_RESULT_SIGMA_SD1_LO                                           : constant := 16#0EEF#;
      PREV_SHADOW_RESULT_PHASE_SD1                                              : constant := 16#0EF0#;
      PREV_SHADOW_RESULT_PHASE_SD1_HI                                           : constant := 16#0EF0#;
      PREV_SHADOW_RESULT_PHASE_SD1_LO                                           : constant := 16#0EF1#;
      PREV_SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD1                 : constant := 16#0EF2#;
      PREV_SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD1_HI              : constant := 16#0EF2#;
      PREV_SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD1_LO              : constant := 16#0EF3#;
      PREV_SHADOW_RESULT_SPARE_0_SD1                                            : constant := 16#0EF4#;
      PREV_SHADOW_RESULT_SPARE_0_SD1_HI                                         : constant := 16#0EF4#;
      PREV_SHADOW_RESULT_SPARE_0_SD1_LO                                         : constant := 16#0EF5#;
      PREV_SHADOW_RESULT_SPARE_1_SD1                                            : constant := 16#0EF6#;
      PREV_SHADOW_RESULT_SPARE_1_SD1_HI                                         : constant := 16#0EF6#;
      PREV_SHADOW_RESULT_SPARE_1_SD1_LO                                         : constant := 16#0EF7#;
      PREV_SHADOW_RESULT_SPARE_2_SD1                                            : constant := 16#0EF8#;
      PREV_SHADOW_RESULT_SPARE_2_SD1_HI                                         : constant := 16#0EF8#;
      PREV_SHADOW_RESULT_SPARE_2_SD1_LO                                         : constant := 16#0EF9#;
      PREV_SHADOW_RESULT_SPARE_3_SD1                                            : constant := 16#0EFA#;
      PREV_SHADOW_RESULT_SPARE_3_SD1_HI                                         : constant := 16#0EFA#;
      PREV_SHADOW_RESULT_SPARE_3_SD1_LO                                         : constant := 16#0EFB#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0                         : constant := 16#0EFC#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_3                       : constant := 16#0EFC#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_2                       : constant := 16#0EFD#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_1                       : constant := 16#0EFE#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_0                       : constant := 16#0EFF#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0                          : constant := 16#0F00#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_3                        : constant := 16#0F00#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_2                        : constant := 16#0F01#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_1                        : constant := 16#0F02#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_0                        : constant := 16#0F03#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0                           : constant := 16#0F04#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_3                         : constant := 16#0F04#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_2                         : constant := 16#0F05#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_1                         : constant := 16#0F06#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_0                         : constant := 16#0F07#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0                         : constant := 16#0F08#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_3                       : constant := 16#0F08#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_2                       : constant := 16#0F09#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_1                       : constant := 16#0F0A#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_0                       : constant := 16#0F0B#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1                         : constant := 16#0F0C#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_3                       : constant := 16#0F0C#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_2                       : constant := 16#0F0D#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_1                       : constant := 16#0F0E#;
      PREV_SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_0                       : constant := 16#0F0F#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1                          : constant := 16#0F10#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_3                        : constant := 16#0F10#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_2                        : constant := 16#0F11#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_1                        : constant := 16#0F12#;
      PREV_SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_0                        : constant := 16#0F13#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1                           : constant := 16#0F14#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_3                         : constant := 16#0F14#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_2                         : constant := 16#0F15#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_1                         : constant := 16#0F16#;
      PREV_SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_0                         : constant := 16#0F17#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1                         : constant := 16#0F18#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_3                       : constant := 16#0F18#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_2                       : constant := 16#0F19#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_1                       : constant := 16#0F1A#;
      PREV_SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_0                       : constant := 16#0F1B#;
      PREV_SHADOW_RESULT_CORE_SPARE_0                                           : constant := 16#0F1C#;
      RESULT_DEBUG_STATUS                                                       : constant := 16#0F20#;
      RESULT_DEBUG_STAGE                                                        : constant := 16#0F21#;
      GPH_SYSTEM_THRESH_RATE_HIGH                                               : constant := 16#0F24#;
      GPH_SYSTEM_THRESH_RATE_HIGH_HI                                            : constant := 16#0F24#;
      GPH_SYSTEM_THRESH_RATE_HIGH_LO                                            : constant := 16#0F25#;
      GPH_SYSTEM_THRESH_RATE_LOW                                                : constant := 16#0F26#;
      GPH_SYSTEM_THRESH_RATE_LOW_HI                                             : constant := 16#0F26#;
      GPH_SYSTEM_THRESH_RATE_LOW_LO                                             : constant := 16#0F27#;
      GPH_SYSTEM_INTERRUPT_CONFIG_GPIO                                          : constant := 16#0F28#;
      GPH_DSS_CONFIG_ROI_MODE_CONTROL                                           : constant := 16#0F2F#;
      GPH_DSS_CONFIG_MANUAL_EFFECTIVE_SPADS_SELECT                              : constant := 16#0F30#;
      GPH_DSS_CONFIG_MANUAL_EFFECTIVE_SPADS_SELECT_HI                           : constant := 16#0F30#;
      GPH_DSS_CONFIG_MANUAL_EFFECTIVE_SPADS_SELECT_LO                           : constant := 16#0F31#;
      GPH_DSS_CONFIG_MANUAL_BLOCK_SELECT                                        : constant := 16#0F32#;
      GPH_DSS_CONFIG_MAX_SPADS_LIMIT                                            : constant := 16#0F33#;
      GPH_DSS_CONFIG_MIN_SPADS_LIMIT                                            : constant := 16#0F34#;
      GPH_MM_CONFIG_TIMEOUT_MACROP_A_HI                                         : constant := 16#0F36#;
      GPH_MM_CONFIG_TIMEOUT_MACROP_A_LO                                         : constant := 16#0F37#;
      GPH_MM_CONFIG_TIMEOUT_MACROP_B_HI                                         : constant := 16#0F38#;
      GPH_MM_CONFIG_TIMEOUT_MACROP_B_LO                                         : constant := 16#0F39#;
      GPH_RANGE_CONFIG_TIMEOUT_MACROP_A_HI                                      : constant := 16#0F3A#;
      GPH_RANGE_CONFIG_TIMEOUT_MACROP_A_LO                                      : constant := 16#0F3B#;
      GPH_RANGE_CONFIG_VCSEL_PERIOD_A                                           : constant := 16#0F3C#;
      GPH_RANGE_CONFIG_VCSEL_PERIOD_B                                           : constant := 16#0F3D#;
      GPH_RANGE_CONFIG_TIMEOUT_MACROP_B_HI                                      : constant := 16#0F3E#;
      GPH_RANGE_CONFIG_TIMEOUT_MACROP_B_LO                                      : constant := 16#0F3F#;
      GPH_RANGE_CONFIG_SIGMA_THRESH                                             : constant := 16#0F40#;
      GPH_RANGE_CONFIG_SIGMA_THRESH_HI                                          : constant := 16#0F40#;
      GPH_RANGE_CONFIG_SIGMA_THRESH_LO                                          : constant := 16#0F41#;
      GPH_RANGE_CONFIG_MIN_COUNT_RATE_RTN_LIMIT_MCPS                            : constant := 16#0F42#;
      GPH_RANGE_CONFIG_MIN_COUNT_RATE_RTN_LIMIT_MCPS_HI                         : constant := 16#0F42#;
      GPH_RANGE_CONFIG_MIN_COUNT_RATE_RTN_LIMIT_MCPS_LO                         : constant := 16#0F43#;
      GPH_RANGE_CONFIG_VALID_PHASE_LOW                                          : constant := 16#0F44#;
      GPH_RANGE_CONFIG_VALID_PHASE_HIGH                                         : constant := 16#0F45#;
      FIRMWARE_INTERNAL_STREAM_COUNT_DIV                                        : constant := 16#0F46#;
      FIRMWARE_INTERNAL_STREAM_COUNTER_VAL                                      : constant := 16#0F47#;
      DSS_CALC_ROI_CTRL                                                         : constant := 16#0F54#;
      DSS_CALC_SPARE_1                                                          : constant := 16#0F55#;
      DSS_CALC_SPARE_2                                                          : constant := 16#0F56#;
      DSS_CALC_SPARE_3                                                          : constant := 16#0F57#;
      DSS_CALC_SPARE_4                                                          : constant := 16#0F58#;
      DSS_CALC_SPARE_5                                                          : constant := 16#0F59#;
      DSS_CALC_SPARE_6                                                          : constant := 16#0F5A#;
      DSS_CALC_SPARE_7                                                          : constant := 16#0F5B#;
      DSS_CALC_USER_ROI_SPAD_EN_0                                               : constant := 16#0F5C#;
      DSS_CALC_USER_ROI_SPAD_EN_1                                               : constant := 16#0F5D#;
      DSS_CALC_USER_ROI_SPAD_EN_2                                               : constant := 16#0F5E#;
      DSS_CALC_USER_ROI_SPAD_EN_3                                               : constant := 16#0F5F#;
      DSS_CALC_USER_ROI_SPAD_EN_4                                               : constant := 16#0F60#;
      DSS_CALC_USER_ROI_SPAD_EN_5                                               : constant := 16#0F61#;
      DSS_CALC_USER_ROI_SPAD_EN_6                                               : constant := 16#0F62#;
      DSS_CALC_USER_ROI_SPAD_EN_7                                               : constant := 16#0F63#;
      DSS_CALC_USER_ROI_SPAD_EN_8                                               : constant := 16#0F64#;
      DSS_CALC_USER_ROI_SPAD_EN_9                                               : constant := 16#0F65#;
      DSS_CALC_USER_ROI_SPAD_EN_10                                              : constant := 16#0F66#;
      DSS_CALC_USER_ROI_SPAD_EN_11                                              : constant := 16#0F67#;
      DSS_CALC_USER_ROI_SPAD_EN_12                                              : constant := 16#0F68#;
      DSS_CALC_USER_ROI_SPAD_EN_13                                              : constant := 16#0F69#;
      DSS_CALC_USER_ROI_SPAD_EN_14                                              : constant := 16#0F6A#;
      DSS_CALC_USER_ROI_SPAD_EN_15                                              : constant := 16#0F6B#;
      DSS_CALC_USER_ROI_SPAD_EN_16                                              : constant := 16#0F6C#;
      DSS_CALC_USER_ROI_SPAD_EN_17                                              : constant := 16#0F6D#;
      DSS_CALC_USER_ROI_SPAD_EN_18                                              : constant := 16#0F6E#;
      DSS_CALC_USER_ROI_SPAD_EN_19                                              : constant := 16#0F6F#;
      DSS_CALC_USER_ROI_SPAD_EN_20                                              : constant := 16#0F70#;
      DSS_CALC_USER_ROI_SPAD_EN_21                                              : constant := 16#0F71#;
      DSS_CALC_USER_ROI_SPAD_EN_22                                              : constant := 16#0F72#;
      DSS_CALC_USER_ROI_SPAD_EN_23                                              : constant := 16#0F73#;
      DSS_CALC_USER_ROI_SPAD_EN_24                                              : constant := 16#0F74#;
      DSS_CALC_USER_ROI_SPAD_EN_25                                              : constant := 16#0F75#;
      DSS_CALC_USER_ROI_SPAD_EN_26                                              : constant := 16#0F76#;
      DSS_CALC_USER_ROI_SPAD_EN_27                                              : constant := 16#0F77#;
      DSS_CALC_USER_ROI_SPAD_EN_28                                              : constant := 16#0F78#;
      DSS_CALC_USER_ROI_SPAD_EN_29                                              : constant := 16#0F79#;
      DSS_CALC_USER_ROI_SPAD_EN_30                                              : constant := 16#0F7A#;
      DSS_CALC_USER_ROI_SPAD_EN_31                                              : constant := 16#0F7B#;
      DSS_CALC_USER_ROI_0                                                       : constant := 16#0F7C#;
      DSS_CALC_USER_ROI_1                                                       : constant := 16#0F7D#;
      DSS_CALC_MODE_ROI_0                                                       : constant := 16#0F7E#;
      DSS_CALC_MODE_ROI_1                                                       : constant := 16#0F7F#;
      SIGMA_ESTIMATOR_CALC_SPARE_0                                              : constant := 16#0F80#;
      VHV_RESULT_PEAK_SIGNAL_RATE_MCPS                                          : constant := 16#0F82#;
      VHV_RESULT_PEAK_SIGNAL_RATE_MCPS_HI                                       : constant := 16#0F82#;
      VHV_RESULT_PEAK_SIGNAL_RATE_MCPS_LO                                       : constant := 16#0F83#;
      VHV_RESULT_SIGNAL_TOTAL_EVENTS_REF                                        : constant := 16#0F84#;
      VHV_RESULT_SIGNAL_TOTAL_EVENTS_REF_3                                      : constant := 16#0F84#;
      VHV_RESULT_SIGNAL_TOTAL_EVENTS_REF_2                                      : constant := 16#0F85#;
      VHV_RESULT_SIGNAL_TOTAL_EVENTS_REF_1                                      : constant := 16#0F86#;
      VHV_RESULT_SIGNAL_TOTAL_EVENTS_REF_0                                      : constant := 16#0F87#;
      PHASECAL_RESULT_PHASE_OUTPUT_REF                                          : constant := 16#0F88#;
      PHASECAL_RESULT_PHASE_OUTPUT_REF_HI                                       : constant := 16#0F88#;
      PHASECAL_RESULT_PHASE_OUTPUT_REF_LO                                       : constant := 16#0F89#;
      DSS_RESULT_TOTAL_RATE_PER_SPAD                                            : constant := 16#0F8A#;
      DSS_RESULT_TOTAL_RATE_PER_SPAD_HI                                         : constant := 16#0F8A#;
      DSS_RESULT_TOTAL_RATE_PER_SPAD_LO                                         : constant := 16#0F8B#;
      DSS_RESULT_ENABLED_BLOCKS                                                 : constant := 16#0F8C#;
      DSS_RESULT_NUM_REQUESTED_SPADS                                            : constant := 16#0F8E#;
      DSS_RESULT_NUM_REQUESTED_SPADS_HI                                         : constant := 16#0F8E#;
      DSS_RESULT_NUM_REQUESTED_SPADS_LO                                         : constant := 16#0F8F#;
      MM_RESULT_INNER_INTERSECTION_RATE                                         : constant := 16#0F92#;
      MM_RESULT_INNER_INTERSECTION_RATE_HI                                      : constant := 16#0F92#;
      MM_RESULT_INNER_INTERSECTION_RATE_LO                                      : constant := 16#0F93#;
      MM_RESULT_OUTER_COMPLEMENT_RATE                                           : constant := 16#0F94#;
      MM_RESULT_OUTER_COMPLEMENT_RATE_HI                                        : constant := 16#0F94#;
      MM_RESULT_OUTER_COMPLEMENT_RATE_LO                                        : constant := 16#0F95#;
      MM_RESULT_TOTAL_OFFSET                                                    : constant := 16#0F96#;
      MM_RESULT_TOTAL_OFFSET_HI                                                 : constant := 16#0F96#;
      MM_RESULT_TOTAL_OFFSET_LO                                                 : constant := 16#0F97#;
      XTALK_CALC_XTALK_FOR_ENABLED_SPADS                                        : constant := 16#0F98#;
      XTALK_CALC_XTALK_FOR_ENABLED_SPADS_3                                      : constant := 16#0F98#;
      XTALK_CALC_XTALK_FOR_ENABLED_SPADS_2                                      : constant := 16#0F99#;
      XTALK_CALC_XTALK_FOR_ENABLED_SPADS_1                                      : constant := 16#0F9A#;
      XTALK_CALC_XTALK_FOR_ENABLED_SPADS_0                                      : constant := 16#0F9B#;
      XTALK_RESULT_AVG_XTALK_USER_ROI_KCPS                                      : constant := 16#0F9C#;
      XTALK_RESULT_AVG_XTALK_USER_ROI_KCPS_3                                    : constant := 16#0F9C#;
      XTALK_RESULT_AVG_XTALK_USER_ROI_KCPS_2                                    : constant := 16#0F9D#;
      XTALK_RESULT_AVG_XTALK_USER_ROI_KCPS_1                                    : constant := 16#0F9E#;
      XTALK_RESULT_AVG_XTALK_USER_ROI_KCPS_0                                    : constant := 16#0F9F#;
      XTALK_RESULT_AVG_XTALK_MM_INNER_ROI_KCPS                                  : constant := 16#0FA0#;
      XTALK_RESULT_AVG_XTALK_MM_INNER_ROI_KCPS_3                                : constant := 16#0FA0#;
      XTALK_RESULT_AVG_XTALK_MM_INNER_ROI_KCPS_2                                : constant := 16#0FA1#;
      XTALK_RESULT_AVG_XTALK_MM_INNER_ROI_KCPS_1                                : constant := 16#0FA2#;
      XTALK_RESULT_AVG_XTALK_MM_INNER_ROI_KCPS_0                                : constant := 16#0FA3#;
      XTALK_RESULT_AVG_XTALK_MM_OUTER_ROI_KCPS                                  : constant := 16#0FA4#;
      XTALK_RESULT_AVG_XTALK_MM_OUTER_ROI_KCPS_3                                : constant := 16#0FA4#;
      XTALK_RESULT_AVG_XTALK_MM_OUTER_ROI_KCPS_2                                : constant := 16#0FA5#;
      XTALK_RESULT_AVG_XTALK_MM_OUTER_ROI_KCPS_1                                : constant := 16#0FA6#;
      XTALK_RESULT_AVG_XTALK_MM_OUTER_ROI_KCPS_0                                : constant := 16#0FA7#;
      RANGE_RESULT_ACCUM_PHASE                                                  : constant := 16#0FA8#;
      RANGE_RESULT_ACCUM_PHASE_3                                                : constant := 16#0FA8#;
      RANGE_RESULT_ACCUM_PHASE_2                                                : constant := 16#0FA9#;
      RANGE_RESULT_ACCUM_PHASE_1                                                : constant := 16#0FAA#;
      RANGE_RESULT_ACCUM_PHASE_0                                                : constant := 16#0FAB#;
      RANGE_RESULT_OFFSET_CORRECTED_RANGE                                       : constant := 16#0FAC#;
      RANGE_RESULT_OFFSET_CORRECTED_RANGE_HI                                    : constant := 16#0FAC#;
      RANGE_RESULT_OFFSET_CORRECTED_RANGE_LO                                    : constant := 16#0FAD#;
      SHADOW_PHASECAL_RESULT_VCSEL_START                                        : constant := 16#0FAE#;
      SHADOW_RESULT_INTERRUPT_STATUS                                            : constant := 16#0FB0#;
      SHADOW_RESULT_RANGE_STATUS                                                : constant := 16#0FB1#;
      SHADOW_RESULT_REPORT_STATUS                                               : constant := 16#0FB2#;
      SHADOW_RESULT_STREAM_COUNT                                                : constant := 16#0FB3#;
      SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD0                              : constant := 16#0FB4#;
      SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD0_HI                           : constant := 16#0FB4#;
      SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD0_LO                           : constant := 16#0FB5#;
      SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD0                             : constant := 16#0FB6#;
      SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD0_HI                          : constant := 16#0FB6#;
      SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD0_LO                          : constant := 16#0FB7#;
      SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD0                                 : constant := 16#0FB8#;
      SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD0_HI                              : constant := 16#0FB8#;
      SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD0_LO                              : constant := 16#0FB9#;
      SHADOW_RESULT_SIGMA_SD0                                                   : constant := 16#0FBA#;
      SHADOW_RESULT_SIGMA_SD0_HI                                                : constant := 16#0FBA#;
      SHADOW_RESULT_SIGMA_SD0_LO                                                : constant := 16#0FBB#;
      SHADOW_RESULT_PHASE_SD0                                                   : constant := 16#0FBC#;
      SHADOW_RESULT_PHASE_SD0_HI                                                : constant := 16#0FBC#;
      SHADOW_RESULT_PHASE_SD0_LO                                                : constant := 16#0FBD#;
      SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0                      : constant := 16#0FBE#;
      SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0_HI                   : constant := 16#0FBE#;
      SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0_LO                   : constant := 16#0FBF#;
      SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_CROSSTALK_CORRECTED_MCPS_SD0         : constant := 16#0FC0#;
      SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_CROSSTALK_CORRECTED_MCPS_SD0_HI      : constant := 16#0FC0#;
      SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_CROSSTALK_CORRECTED_MCPS_SD0_LO      : constant := 16#0FC1#;
      SHADOW_RESULT_MM_INNER_ACTUAL_EFFECTIVE_SPADS_SD0                         : constant := 16#0FC2#;
      SHADOW_RESULT_MM_INNER_ACTUAL_EFFECTIVE_SPADS_SD0_HI                      : constant := 16#0FC2#;
      SHADOW_RESULT_MM_INNER_ACTUAL_EFFECTIVE_SPADS_SD0_LO                      : constant := 16#0FC3#;
      SHADOW_RESULT_MM_OUTER_ACTUAL_EFFECTIVE_SPADS_SD0                         : constant := 16#0FC4#;
      SHADOW_RESULT_MM_OUTER_ACTUAL_EFFECTIVE_SPADS_SD0_HI                      : constant := 16#0FC4#;
      SHADOW_RESULT_MM_OUTER_ACTUAL_EFFECTIVE_SPADS_SD0_LO                      : constant := 16#0FC5#;
      SHADOW_RESULT_AVG_SIGNAL_COUNT_RATE_MCPS_SD0                              : constant := 16#0FC6#;
      SHADOW_RESULT_AVG_SIGNAL_COUNT_RATE_MCPS_SD0_HI                           : constant := 16#0FC6#;
      SHADOW_RESULT_AVG_SIGNAL_COUNT_RATE_MCPS_SD0_LO                           : constant := 16#0FC7#;
      SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD1                              : constant := 16#0FC8#;
      SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD1_HI                           : constant := 16#0FC8#;
      SHADOW_RESULT_DSS_ACTUAL_EFFECTIVE_SPADS_SD1_LO                           : constant := 16#0FC9#;
      SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD1                             : constant := 16#0FCA#;
      SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD1_HI                          : constant := 16#0FCA#;
      SHADOW_RESULT_PEAK_SIGNAL_COUNT_RATE_MCPS_SD1_LO                          : constant := 16#0FCB#;
      SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD1                                 : constant := 16#0FCC#;
      SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD1_HI                              : constant := 16#0FCC#;
      SHADOW_RESULT_AMBIENT_COUNT_RATE_MCPS_SD1_LO                              : constant := 16#0FCD#;
      SHADOW_RESULT_SIGMA_SD1                                                   : constant := 16#0FCE#;
      SHADOW_RESULT_SIGMA_SD1_HI                                                : constant := 16#0FCE#;
      SHADOW_RESULT_SIGMA_SD1_LO                                                : constant := 16#0FCF#;
      SHADOW_RESULT_PHASE_SD1                                                   : constant := 16#0FD0#;
      SHADOW_RESULT_PHASE_SD1_HI                                                : constant := 16#0FD0#;
      SHADOW_RESULT_PHASE_SD1_LO                                                : constant := 16#0FD1#;
      SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD1                      : constant := 16#0FD2#;
      SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD1_HI                   : constant := 16#0FD2#;
      SHADOW_RESULT_FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD1_LO                   : constant := 16#0FD3#;
      SHADOW_RESULT_SPARE_0_SD1                                                 : constant := 16#0FD4#;
      SHADOW_RESULT_SPARE_0_SD1_HI                                              : constant := 16#0FD4#;
      SHADOW_RESULT_SPARE_0_SD1_LO                                              : constant := 16#0FD5#;
      SHADOW_RESULT_SPARE_1_SD1                                                 : constant := 16#0FD6#;
      SHADOW_RESULT_SPARE_1_SD1_HI                                              : constant := 16#0FD6#;
      SHADOW_RESULT_SPARE_1_SD1_LO                                              : constant := 16#0FD7#;
      SHADOW_RESULT_SPARE_2_SD1                                                 : constant := 16#0FD8#;
      SHADOW_RESULT_SPARE_2_SD1_HI                                              : constant := 16#0FD8#;
      SHADOW_RESULT_SPARE_2_SD1_LO                                              : constant := 16#0FD9#;
      SHADOW_RESULT_SPARE_3_SD1                                                 : constant := 16#0FDA#;
      SHADOW_RESULT_THRESH_INFO                                                 : constant := 16#0FDB#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0                              : constant := 16#0FDC#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_3                            : constant := 16#0FDC#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_2                            : constant := 16#0FDD#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_1                            : constant := 16#0FDE#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD0_0                            : constant := 16#0FDF#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0                               : constant := 16#0FE0#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_3                             : constant := 16#0FE0#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_2                             : constant := 16#0FE1#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_1                             : constant := 16#0FE2#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD0_0                             : constant := 16#0FE3#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0                                : constant := 16#0FE4#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_3                              : constant := 16#0FE4#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_2                              : constant := 16#0FE5#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_1                              : constant := 16#0FE6#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD0_0                              : constant := 16#0FE7#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0                              : constant := 16#0FE8#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_3                            : constant := 16#0FE8#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_2                            : constant := 16#0FE9#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_1                            : constant := 16#0FEA#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD0_0                            : constant := 16#0FEB#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1                              : constant := 16#0FEC#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_3                            : constant := 16#0FEC#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_2                            : constant := 16#0FED#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_1                            : constant := 16#0FEE#;
      SHADOW_RESULT_CORE_AMBIENT_WINDOW_EVENTS_SD1_0                            : constant := 16#0FEF#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1                               : constant := 16#0FF0#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_3                             : constant := 16#0FF0#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_2                             : constant := 16#0FF1#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_1                             : constant := 16#0FF2#;
      SHADOW_RESULT_CORE_RANGING_TOTAL_EVENTS_SD1_0                             : constant := 16#0FF3#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1                                : constant := 16#0FF4#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_3                              : constant := 16#0FF4#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_2                              : constant := 16#0FF5#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_1                              : constant := 16#0FF6#;
      SHADOW_RESULT_CORE_SIGNAL_TOTAL_EVENTS_SD1_0                              : constant := 16#0FF7#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1                              : constant := 16#0FF8#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_3                            : constant := 16#0FF8#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_2                            : constant := 16#0FF9#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_1                            : constant := 16#0FFA#;
      SHADOW_RESULT_CORE_TOTAL_PERIODS_ELAPSED_SD1_0                            : constant := 16#0FFB#;
      SHADOW_RESULT_CORE_SPARE_0                                                : constant := 16#0FFC#;
      SHADOW_PHASECAL_RESULT_REFERENCE_PHASE_HI                                 : constant := 16#0FFE#;
      SHADOW_PHASECAL_RESULT_REFERENCE_PHASE_LO                                 : constant := 16#0FFF#;

end VL53L4CX;
