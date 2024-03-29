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

--  This program demonstrates reading the analog voltage value on a GPIO
--  pin with an ADC unit, using polling. The pin is continously polled in an
--  infinite loop, displaying the current sample on each iteration. Connect the
--  pin to an appropriate external input voltage to drive the displayed value.
--  Absent an input, the sensed (and displayed) value will be meaningless. The
--  green LED will toggle on each iteration, as an additional indication of
--  execution.
--
--  NB: The input voltage must not exceed the maximum allowed for the board's
--  circuitry!  A value between zero and three volts (inclusive) is safe.
--
--  The displayed value is the raw sample quantity in the range 0 .. 4095,
--  representing an input voltage of 0.0 to 3.0 volts. Thus, for an
--  incoming voltage of 1.5 volts, the sample would be approximately half of
--  4095, i.e., 2048.

--  Note that you will likely need to reset the board manually after loading.

--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);

with STM32.Board;  use STM32.Board;
with STM32.Device; use STM32.Device;

with HAL;          use HAL;
with Peripherals;  use Peripherals;
with STM32.ADC;    use STM32.ADC;
with STM32.GPIO;   use STM32.GPIO;

with Ada.Real_Time;  use Ada.Real_Time;

procedure Clkreq_f103 is

   ADC_Size  : constant := 12;
   ADC_Limit : constant := ((2 ** ADC_Size) - 1);
   subtype ADC_Volt_Range is Float range 0.0 .. 3.3;
   subtype ADC_Conv_Range is UInt12 range 0 .. ADC_Limit;
   ADC_V_Per  : constant := ADC_Volt_Range'Last / Float (ADC_Limit);
   type ADC_Voltage is
     delta ADC_V_Per
       range 0.0 .. ADC_Volt_Range'Last
       with Size => 12, Small => ADC_V_Per;

   ADC_Low_Thresh : constant ADC_Voltage := 0.600;

   --  Translate a Raw reading to a voltage and vice versa
   type Volt2Reading
     (As_Voltage : Boolean := False)
   is record
      case As_Voltage is
         when False =>
            X : ADC_Conv_Range;
         when True =>
            V : ADC_Voltage;
      end case;
   end record
     with Unchecked_Union;

   Converter      : Analog_To_Digital_Converter renames ADC_1;
   Input_Channel  : constant Analog_Input_Channel := 0;

   All_Regular_Conversions : constant Regular_Channel_Conversions :=
     (1 => (Channel => Input_Channel, Sample_Time => Sample_144_Cycles)
     );

   Raw : Volt2Reading;

   Successful : Boolean;
   Timed_Out  : exception;
   Init_Fail  : exception;

   procedure Configure_Analog_Input;
   procedure Assert_ClkReq;
   procedure Deassert_ClkReq;
   procedure My_Delay;

--   function ADC_Bits_To_Volts return
   ----------------------------
   -- Configure_Analog_Input --
   ----------------------------

   procedure Configure_Analog_Input
   is
   begin
      Enable_Clock (ADC_Input);
      Configure_IO (ADC_Input, (Mode => Mode_In, Resistors => Floating, others => <>));
   end Configure_Analog_Input;

   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;

   procedure Deassert_ClkReq
   is
   begin
      Disable_Clock (ClkReq);
      Turn_Off (Green_LED);
   end Deassert_ClkReq;

   procedure Assert_ClkReq
   is
      GPIO_Conf            : GPIO_Port_Configuration;
   begin
      Enable_Clock (ClkReq);

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (ClkReq, Config => GPIO_Conf);
      Turn_On (Green_LED);
      Clear (ClkReq);
      My_Delay;
      Turn_Off (Green_LED);
      Deassert_ClkReq;
   end Assert_ClkReq;

begin
   Initialize_Board;

   Configure_Analog_Input;

   Enable_Clock (Converter);

   Reset_All_ADC_Units;

   Configure_Unit
     (Converter,
      Alignment  => Right_Aligned);

   Configure_Regular_Conversions
     (Converter,
      Continuous  => False,
      Trigger     => Software_Triggered,
      Conversions => All_Regular_Conversions);

   Enable (Converter);

   Deassert_ClkReq;

   loop
      Start_Conversion (Converter);

      Poll_For_Status (Converter, Regular_Channel_Conversion_Complete, Successful);
      if not Successful then
         raise Timed_Out;
      end if;

      Raw.X := ADC_Conv_Range (Conversion_Value (Converter));
      if Raw.V > ADC_Low_Thresh then
         Assert_ClkReq;
      end if;
   end loop;
end Clkreq_f103;
