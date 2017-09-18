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

--  with Ada.Unchecked_Conversion;

with Ada.Real_Time; use Ada.Real_Time;

package body VL6180X is

--   subtype Register_Address is UInt8;

   ---------------
   -- Device_Id --
   ---------------

   function Device_Id
     (This : in out VL6180X_Rng_ALS)
      return UInt8
   is
      Result : UInt8;
   begin
      Read (This.Port, VL6180X_IDENTIFICATION_MODEL_ID, Value => Result);
      return Result;
   end Device_Id;

   function RangeStatus (This : in out VL6180X_Rng_ALS) return UInt8 is
      Result : UInt8;
   begin
      Read (This.Port, VL6180X_RESULT_RANGE_STATUS, Value => Result);
      return Result;
   end RangeStatus;

   function ReadRange
     (This : in out VL6180X_Rng_ALS;
      Timeout : Natural) return UInt8 is
      Result : UInt8;
      Status : UInt8;
      Start : constant Time := Clock;
   begin
      Write (This.Port, VL6180X_SYSTEM_INTERRUPT_CLEAR, 16#1#); -- safe polling

      Write (This.Port, VL6180X_SYSRANGE_START, Value => 1);
      loop
         Read (This.Port, VL6180X_RESULT_INTERRUPT_STATUS_GPIO, Value => Status);
         if Clock - Start > Milliseconds (Timeout) then
            return 16#ff#;
         end if;
         exit when (Status and 7) = 4;
      end loop;
      Read (This.Port, VL6180X_RESULT_RANGE_VAL, Value => Result);
      Write (This.Port, VL6180X_SYSTEM_INTERRUPT_CLEAR, 16#1#);

      return Result;
   end ReadRange;

   function ReadAls
     (This : in out VL6180X_Rng_ALS;
      Timeout : Natural) return UInt16 is
      Result : UInt16;
      Result1 : UInt8;
      Result2 : UInt8;
      Status : Status_GPIO_Register;
      Start : constant Time := Clock;
   begin
      Write (This.Port, VL6180X_SYSTEM_INTERRUPT_CLEAR, 16#2#); -- safe polling

      Write (This.Port, VL6180X_SYSALS_START, Value => 1);
      loop
         Read (This.Port, VL6180X_RESULT_INTERRUPT_STATUS_GPIO, Value => Status.AllStat);
         if Clock - Start > Milliseconds (Timeout) then
            return 9999;
         end if;
         exit when (Status.ALS_Result = 4);
      end loop;
      Read (This.Port, VL6180X_RESULT_ALS_VAL+1, Value => Result2);
      Read (This.Port, VL6180X_RESULT_ALS_VAL, Value => Result1);
      Write (This.Port, VL6180X_SYSTEM_INTERRUPT_CLEAR, 16#2#);

      Result := Shift_Left (UInt16 (Result1), 8) or UInt16 (Result2);

      return Result;

   end ReadAls;

   procedure StaticInit (This : in out VL6180X_Rng_ALS) is
      Result : UInt8;
      Fw : UInt8;
   begin

      if This.Device_Id /= I_Am_VL6180X then
         raise Program_Error with "No VL6180X!";
      end if;

      --  REGISTER_TUNING_SR03_270514_CustomerView.txt
      Write (this.Port, 16#0207#, 16#01#);
      Write (this.Port, 16#0208#, 16#01#);
      Write (this.Port, 16#0096#, 16#00#);
      Write (this.Port, 16#0097#, 16#fd#);
      Write (this.Port, 16#00e3#, 16#00#);
      Write (this.Port, 16#00e4#, 16#04#);
      Write (this.Port, 16#00e5#, 16#02#);
      Write (this.Port, 16#00e6#, 16#01#);
      Write (this.Port, 16#00e7#, 16#03#);
      Write (this.Port, 16#00f5#, 16#02#);
      Write (this.Port, 16#00d9#, 16#05#);
      Write (this.Port, 16#00db#, 16#ce#);
      Write (this.Port, 16#00dc#, 16#03#);
      Write (this.Port, 16#00dd#, 16#f8#);
      Write (this.Port, 16#009f#, 16#00#);
      Write (this.Port, 16#00a3#, 16#3c#);
      Write (this.Port, 16#00b7#, 16#00#);
      Write (this.Port, 16#00bb#, 16#3c#);
      Write (this.Port, 16#00b2#, 16#09#);
      Write (this.Port, 16#00ca#, 16#09#);
      Write (this.Port, 16#0198#, 16#01#);
      Write (this.Port, 16#01b0#, 16#17#);
      Write (this.Port, 16#01ad#, 16#00#);
      Write (this.Port, 16#00ff#, 16#05#);
      Write (this.Port, 16#0100#, 16#05#);
      Write (this.Port, 16#0199#, 16#05#);
      Write (this.Port, 16#01a6#, 16#1b#);
      Write (this.Port, 16#01ac#, 16#3e#);
      Write (this.Port, 16#01a7#, 16#1f#);
      Write (this.Port, 16#0030#, 16#00#);

--      Write (this.Port, VL6180X_SYSTEM_INTERRUPT_CONFIG_GPIO, Shift_Left(4, 3) or 4);

      Write (this.port, VL6180X_SYSTEM_MODE_GPIO1, 16#10#); -- Set GPIO1 high when sample complete
      Write (this.port, VL6180X_READOUT_AVERAGING_SAMPLE_PERIOD, 16#30#); -- Set Avg sample period
      Write (this.port, VL6180X_SYSALS_ANALOGUE_GAIN, 16#46#); -- Set the ALS gain
      Write (this.port, VL6180X_SYSRANGE_VHV_REPEAT_RATE, 16#FF#);
      -- Set auto calibration period (Max = 255)/(OFF = 0)
      Write (this.port, VL6180X_SYSALS_INTEGRATION_PERIOD, 16#63#);
      -- Set ALS integration time to 100ms
      Write (this.port, VL6180X_SYSRANGE_VHV_RECALIBRATE, 16#01#);
      -- perform a single temperature calibration
      -- Optional settings from datasheet
      -- http://www.st.com/st-web-ui/static/active/en/resource/technical/document/application_note/DM00122600.pdf
      Write (this.port, VL6180X_SYSRANGE_INTERMEASUREMENT_PERIOD, 16#09#);
      -- Set default ranging inter-measurement period to 100ms
      Write (this.port, VL6180X_SYSALS_INTERMEASUREMENT_PERIOD, 16#0A#);
      -- Set default ALS inter-measurement period to 100ms
      Write (this.port, VL6180X_SYSTEM_INTERRUPT_CONFIG_GPIO, 16#24#);
      -- Configures interrupt on ‘New Sample Ready threshold event’

      -- Additional settings defaults from community
      Write (this.port, VL6180X_SYSRANGE_MAX_CONVERGENCE_TIME, 16#32#);
--      Write (this.port, VL6180X_SYSRANGE_RANGE_CHECK_ENABLES, 16#11#);
--      Write (this.port, VL6180X_SYSRANGE_EARLY_CONVERGENCE_ESTIMATE, 16#7B#);
--      Write (this.port, VL6180X_SYSRANGE_EARLY_CONVERGENCE_ESTIMATE+1, 0);

      Write (this.port, VL6180X_SYSALS_INTEGRATION_PERIOD, 16#64#);
      Write (this.port, VL6180X_SYSALS_INTEGRATION_PERIOD+1, 0);

--      Write (this.port, VL6180X_READOUT_AVERAGING_SAMPLE_PERIOD, 16#30#);
      Write (this.port, VL6180X_SYSALS_ANALOGUE_GAIN, 16#40#);
--      Write (this.port, VL6180X_FIRMWARE_RESULT_SCALER, 16#01#);

   end StaticInit;

end VL6180X;
