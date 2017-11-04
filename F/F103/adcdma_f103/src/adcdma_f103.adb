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
with STM32.ADC;    use STM32.ADC;
with STM32.DMA;    use STM32.DMA;
with STM32.GPIO;   use STM32.GPIO;

with Ada.Real_Time;  use Ada.Real_Time;

procedure Adcdma_f103 is

   Controller     : DMA_Controller renames DMA_1;
   Channel        : constant DMA_Channel_Selector := Channel_1;
   Converter      : Analog_To_Digital_Converter renames ADC_1;
   Input_Channel0 : constant Analog_Input_Channel := 0;
   Input0         : constant GPIO_Point := PA0;

   Input_Channel1 : constant Analog_Input_Channel := 1;
   Input1         : constant GPIO_Point := PA1;

   All_Regular_Conversions : constant Regular_Channel_Conversions :=
     (1 => (Channel => Input_Channel0, Sample_Time => Sample_144_Cycles),
      2 => (Channel => Input_Channel1, Sample_Time => Sample_144_Cycles)
     );

   Raw : UInt32 := 0;

   type CountsT is array (0 .. 1) of UInt16;

   Counts  : CountsT;

   --  The raw sample from the ADC conversion of the VBat input

   Successful : Boolean;
   Timed_Out  : exception;
   Init_Fail  : exception;

   procedure Configure_Analog_Input;
   procedure Initialize_DMA;
   procedure Initialize_ADC;

   ----------------------------
   -- Configure_Analog_Input --
   ----------------------------

   procedure Configure_Analog_Input is
   begin
      Enable_Clock (Input0);
      Configure_IO (Input0, (Mode => Mode_In, Resistors => Floating, others => <>));
      Enable_Clock (Input1);
      Configure_IO (Input1, (Mode => Mode_In, Resistors => Floating, others => <>));
   end Configure_Analog_Input;

   --------------------
   -- Initialize_DMA --
   --------------------

   procedure Initialize_DMA is
      Config : DMA_Channel_Configuration;
   begin
      Enable_Clock (Controller);

--      Reset (Controller, Channel);

      Config.Channel                      := Channel_1;
      Config.Direction                    := Peripheral_To_Memory;
      Config.Memory_Data_Format           := HalfWords;
      Config.Peripheral_Data_Format       := HalfWords;
      Config.Increment_Peripheral_Address := False;
      Config.Increment_Memory_Address     := True;
      Config.Operation_Mode               := Circular_Mode;
      Config.Priority                     := Priority_Very_High;
      Config.FIFO_Enabled                 := False;
      Config.Memory_Burst_Size            := Memory_Burst_Single;
      Config.Peripheral_Burst_Size        := Peripheral_Burst_Single;

      Configure (Controller, Channel, Config);

      Clear_All_Status (Controller, Channel);
   end Initialize_DMA;

   --------------------
   -- Initialize_ADC --
   --------------------

   procedure Initialize_ADC is
   begin
      Reset_All_ADC_Units;

      Configure_Unit
        (Converter,
         Alignment  => Right_Aligned);

      Configure_Regular_Conversions
        (Converter,
         Continuous  => True,
         Trigger     => Software_Triggered,
         Conversions => All_Regular_Conversions);

      Enable_DMA (Converter);

   end Initialize_ADC;

begin
   Initialize_Board;

   Configure_Analog_Input;

   Enable_Clock (Converter);

   Initialize_DMA;

   Initialize_ADC;

--   Reset_All_ADC_Units;

   Enable (Converter);

   Start_Conversion (Converter);

   Start_Transfer
     (Controller,
      Channel,
      Source      => Data_Register_Address (Converter),
      Destination => Counts'Address,
      Data_Count  => 4);

   loop

      Toggle (Green_LED);

      delay until Clock + Milliseconds (100);
   end loop;

end Adcdma_f103;
