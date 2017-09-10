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

pragma Restrictions (No_Streams);

with System;
--  with Interfaces; use Interfaces;
with HAL.I2C;    use HAL.I2C;

use HAL;

generic

   type IO_Port (<>) is abstract tagged limited private;

   type Any_IO_Port is access all IO_Port'Class;

   with procedure Read
     (This     : Any_IO_Port;
      Register : UInt16;
      Value    : out UInt8) is <>;
   --  Get the Value at the address specified in Register via This port.

   with procedure Write
     (This     : Any_IO_Port;
      Register : UInt16;
      Value    : UInt8) is <>;
   --  Write the Value to the address specified in Register via This port.

   type Sensor_Data_Buffer is array (Natural range <>) of UInt8;

--   with procedure Read_Buffer
--     (This     : Any_IO_Port;
--      Register : UInt8;
--      Value    : out Sensor_Data_Buffer) is <>;
   --  Get the multiple Values at the address specified in Register via This
   --  port.

--   with procedure Delay_Milliseconds (Count : Positive) is <>;
   --  Issue a relative delay for Count milliseconds. This formal subprogram
   --  removes the dependency on Ada.Real_Time so that this driver can be used
   --  with runtimes that do not have that language-defined facility.

package VL6180X is

   type VL6180X_Rng_ALS (Port : not null Any_IO_Port) is tagged limited private;
   --  The BNO055 is a System in Package (SiP) integrating a triaxial 14-bit
   --  accelerometer, a triaxial 16-bit gyroscope, a triaxial geomagnetic
   --  sensor and a 32-bit Cortex M0+ microcontroller running Bosch Sensortec
   --  sensor fusion software providing fused orientation data. The designated
   --  IO_Port is used to communicate with the sensor, and will be a concrete
   --  instance of either an I2C port or a USART port.

   function Device_Id (This : in out VL6180X_Rng_ALS) return UInt8;
   --  Interacts with the device to read a device-class specific identifier
   --  that can be checked for a VL6180X-specific value

   I_Am_VL6180X : constant := 16#B4#;
   --  The value expected to be returned from Device_Id

   function RangeStatus (This : in out VL6180X_Rng_ALS) return UInt8;

   function ReadRange (This : in out VL6180X_Rng_ALS; Timeout : Natural) return UInt8;

   function ReadAls (This : in out VL6180X_Rng_ALS; Timeout : Natural) return UInt16;

   procedure StaticInit (This : in out VL6180X_Rng_ALS);

   --  These are the possible I2C addresses for the VL6180X. Note that I2C is
   --  one of two options for communicating with the VL6180X device (the other
   --  being serial, ie USART).
   VL6180X_Primary_Address   : constant I2C_Address := 16#29# * 2;
   VL6180X_Alternate_Address : constant I2C_Address := 16#2A# * 2;
   --  shift left one bit since we're using 7-bit addresses.

private

   type VL6180X_Rng_ALS (Port : not null Any_IO_Port) is
   tagged limited record
      Mode : Natural;
   end record;

   --  Status register 1
   type Status_GPIO_Register
     (As_UInt8 : Boolean := True)
      is record
      case As_UInt8 is
         when True =>
            AllStat      : UInt8;
         when False =>
            Rng_Result   : UInt3;
            ALS_Result   : UInt3;
            Error_Result : UInt2;
      end case;
   end record
     with Unchecked_Union, Size => 8,
          Bit_Order => System.Low_Order_First;

   for Status_GPIO_Register use record
      Rng_Result     at 0 range 0 .. 2;
      ALS_Result     at 0 range 3 .. 5;
      Error_Result   at 0 range 6 .. 7;
      AllStat        at 0 range 0 .. 7;
   end record;

--   VL6180X_CHIP_ID_ADDR         : constant := 16#000#;
--   VL6180X_SYSRANGE_START       : constant := 16#018#;

--   VL6180X_RESULT_RANGE_STATUS  : constant := 16#04D#;
--   VL6180X_RESULT_INTERRUPT_STATUS_GPIO  : constant := 16#04F#;
--   VL6180X_RESULT_RANGE_VAL     : constant := 16#062#;

   VL6180X_IDENTIFICATION_MODEL_ID              : constant := 16#0000#;
   VL6180X_IDENTIFICATION_MODEL_REV_MAJOR       : constant := 16#0001#;
   VL6180X_IDENTIFICATION_MODEL_REV_MINOR       : constant := 16#0002#;
   VL6180X_IDENTIFICATION_MODULE_REV_MAJOR      : constant := 16#0003#;
   VL6180X_IDENTIFICATION_MODULE_REV_MINOR      : constant := 16#0004#;
   VL6180X_IDENTIFICATION_DATE                  : constant := 16#0006#; -- 16bit Value
   VL6180X_IDENTIFICATION_TIME                  : constant := 16#0008#; -- 16bit value

   VL6180X_SYSTEM_MODE_GPIO0                    : constant := 16#0010#;
   VL6180X_SYSTEM_MODE_GPIO1                    : constant := 16#0011#;
   VL6180X_SYSTEM_HISTORY_CTRL                  : constant := 16#0012#;
   VL6180X_SYSTEM_INTERRUPT_CONFIG_GPIO         : constant := 16#0014#;
   VL6180X_SYSTEM_INTERRUPT_CLEAR               : constant := 16#0015#;
   VL6180X_SYSTEM_FRESH_OUT_OF_RESET            : constant := 16#0016#;
   VL6180X_SYSTEM_GROUPED_PARAMETER_HOLD        : constant := 16#0017#;

   VL6180X_SYSRANGE_START                       : constant := 16#0018#;
   VL6180X_SYSRANGE_THRESH_HIGH                 : constant := 16#0019#;
   VL6180X_SYSRANGE_THRESH_LOW                  : constant := 16#001A#;
   VL6180X_SYSRANGE_INTERMEASUREMENT_PERIOD     : constant := 16#001B#;
   VL6180X_SYSRANGE_MAX_CONVERGENCE_TIME        : constant := 16#001C#;
   VL6180X_SYSRANGE_CROSSTALK_COMPENSATION_RATE : constant := 16#001E#;
   VL6180X_SYSRANGE_CROSSTALK_VALID_HEIGHT      : constant := 16#0021#;
   VL6180X_SYSRANGE_EARLY_CONVERGENCE_ESTIMATE  : constant := 16#0022#;
   VL6180X_SYSRANGE_PART_TO_PART_RANGE_OFFSET   : constant := 16#0024#;
   VL6180X_SYSRANGE_RANGE_IGNORE_VALID_HEIGHT   : constant := 16#0025#;
   VL6180X_SYSRANGE_RANGE_IGNORE_THRESHOLD      : constant := 16#0026#;
   VL6180X_SYSRANGE_MAX_AMBIENT_LEVEL_MULT      : constant := 16#002C#;
   VL6180X_SYSRANGE_RANGE_CHECK_ENABLES         : constant := 16#002D#;
   VL6180X_SYSRANGE_VHV_RECALIBRATE             : constant := 16#002E#;
   VL6180X_SYSRANGE_VHV_REPEAT_RATE             : constant := 16#0031#;

   VL6180X_SYSALS_START                         : constant := 16#0038#;
   VL6180X_SYSALS_THRESH_HIGH                   : constant := 16#003A#;
   VL6180X_SYSALS_THRESH_LOW                    : constant := 16#003C#;
   VL6180X_SYSALS_INTERMEASUREMENT_PERIOD       : constant := 16#003E#;
   VL6180X_SYSALS_ANALOGUE_GAIN                 : constant := 16#003F#;
   VL6180X_SYSALS_INTEGRATION_PERIOD            : constant := 16#0040#;

   VL6180X_RESULT_RANGE_STATUS                  : constant := 16#004D#;
   VL6180X_RESULT_ALS_STATUS                    : constant := 16#004E#;
   VL6180X_RESULT_INTERRUPT_STATUS_GPIO         : constant := 16#004F#;
   VL6180X_RESULT_ALS_VAL                       : constant := 16#0050#;
   VL6180X_RESULT_HISTORY_BUFFER                : constant := 16#0052#;
   VL6180X_RESULT_RANGE_VAL                     : constant := 16#0062#;
   VL6180X_RESULT_RANGE_RAW                     : constant := 16#0064#;
   VL6180X_RESULT_RANGE_RETURN_RATE             : constant := 16#0066#;
   VL6180X_RESULT_RANGE_REFERENCE_RATE          : constant := 16#0068#;
   VL6180X_RESULT_RANGE_RETURN_SIGNAL_COUNT     : constant := 16#006C#;
   VL6180X_RESULT_RANGE_REFERENCE_SIGNAL_COUNT  : constant := 16#0070#;
   VL6180X_RESULT_RANGE_RETURN_AMB_COUNT        : constant := 16#0074#;
   VL6180X_RESULT_RANGE_REFERENCE_AMB_COUNT     : constant := 16#0078#;
   VL6180X_RESULT_RANGE_RETURN_CONV_TIME        : constant := 16#007C#;
   VL6180X_RESULT_RANGE_REFERENCE_CONV_TIME     : constant := 16#0080#;

   VL6180X_READOUT_AVERAGING_SAMPLE_PERIOD      : constant := 16#010A#;
   VL6180X_FIRMWARE_BOOTUP                      : constant := 16#0119#;
   VL6180X_FIRMWARE_RESULT_SCALER               : constant := 16#0120#;
   VL6180X_I2C_SLAVE_DEVICE_ADDRESS             : constant := 16#0212#;
   VL6180X_INTERLEAVED_MODE_ENABLE              : constant := 16#02A3#;



end VL6180X;
