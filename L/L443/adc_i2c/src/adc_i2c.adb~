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
with HAL.Bitmap;
with Peripherals;  use Peripherals;
with STM32.ADC;    use STM32.ADC;
with STM32.GPIO;   use STM32.GPIO;
with STM32.I2C;    use STM32.I2C;
with SSD1306;      use SSD1306;
with Fonts;        use Fonts;
--  use STM32; -- for GPIO_Alternate_Function
with Ravenscar_Time;
with Ada.Real_Time;  use Ada.Real_Time;
with Ada.Text_IO;  use Ada.Text_IO;

procedure Adc_i2c is

   Display : SSD1306_Screen (Buffer_Size_In_Byte => (128 * 64) / 8,
                             Width => 128,
                             Height => 64,
                             Port => Selected_I2C_Port,
                             RST => Selected_RST_Pin'Access,
                             Time => Ravenscar_Time.Delays);


   Converter     : Analog_To_Digital_Converter renames ADC;
   Input_Channel0 : constant Analog_Input_Channel := 9;
   Input0         : constant GPIO_Point := PA4;

   Input_Channel1 : constant Analog_Input_Channel := 10;
   Input1         : constant GPIO_Point := PA5;

   All_Regular_Conversions : constant Regular_Channel_Conversions :=
     (1 => (Channel => Input_Channel0, Sample_Time => Sample_144_Cycles),
      2 => (Channel => Input_Channel1, Sample_Time => Sample_144_Cycles)
     );

   Raw : UInt32 := 0;
   Volt : Float := 0.0;

   Successful : Boolean;
   Timed_Out  : exception;
   Init_Fail  : exception;

   procedure Configure_Analog_Input;

   ----------------------------
   -- Configure_Analog_Input --
   ----------------------------

   procedure Configure_Analog_Input is
   begin
      Enable_Clock (Input0);
      Configure_IO (Input0, (Mode => Mode_Analog, Resistors => Floating, others => <>));
      Enable_Clock (Input1);
      Configure_IO (Input1, (Mode => Mode_Analog, Resistors => Floating, others => <>));
   end Configure_Analog_Input;

   procedure Initialize_GPIO
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      I2C_AF   : STM32.GPIO_Alternate_Function;
      RST      : GPIO_Point
     );

   procedure Initialize_GPIO
     (Port     : access I2C_Port;
      SCL      : GPIO_Point;
      SDA      : GPIO_Point;
      I2C_AF   : STM32.GPIO_Alternate_Function;
      RST      : GPIO_Point
     )
   is
      GPIO_Conf            : GPIO_Port_Configuration;
      Selected_Clock_Speed : constant := 400_000;
      I2C_Points           : constant GPIO_Points := SDA & SCL;
   begin
      Enable_Clock (SCL);
      Enable_Clock (SDA);
      Enable_Clock (RST);
      Enable_Clock (Port.all);

      STM32.Device.Reset (Port.all);

      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Mode        := Mode_AF;
      GPIO_Conf.Output_Type := Open_Drain;
      GPIO_Conf.Resistors   := Pull_Up;
      Configure_IO (SCL, GPIO_Conf);
      Configure_IO (SDA, GPIO_Conf);

      Configure_Alternate_Function (I2C_Points, I2C_AF);

      STM32.I2C.Configure
        (Port.all,
         (Clock_Speed              => Selected_Clock_Speed,
          Addressing_Mode          => Addressing_Mode_7bit,
          General_Call_Enabled     => False,
          Clock_Stretching_Enabled => True,
          Own_Address              => 16#00#,
          others                   => <>));

      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (RST, Config => GPIO_Conf);

   end Initialize_GPIO;

   X, Y : UInt16;
begin
   Initialize_Board;

   Initialize_GPIO (Port  => Selected_I2C_Port,
                    SCL   => Selected_I2C_Clock_Pin,
                    SDA   => Selected_I2C_Data_Pin,
                    I2C_AF => Selected_I2C_Port_AF,
                    RST   => Selected_RST_Pin
                   );

   Initialize (Display, False);

   Initialize_Layer (This => Display,
                     Layer => 1,
                     Mode => HAL.Bitmap.M_1);

   --  Draw a bounding box by
   --  a) fill
   Fill_Region (This => Display,
                X_Start => 0,
                X_End => Display.Width - 1,
                Y_Start => 0,
                Y_End => Display.Height - 1, Colour => 1);

   --  b) unfill 1 pel in around.
   Fill_Region (This => Display,
                X_Start => 1,
                X_End => Display.Width - 2,
                Y_Start => 1,
                Y_End => Display.Height - 2, Colour => 0);


   X := 4;
   Y := 20;
   DrawString (Display, X, Y, "ADC09: ", 1);
   X := 4;
   Y := 40;
   DrawString (Display, X, Y, "ADC10: ", 1);

   --  Display what we have drawn.
   Turn_On (Display);

   Configure_Analog_Input;

   Enable_Clock (Converter);

   Reset_All_ADC_Units;

   Configure_Unit
     (Converter,
      Resolution => ADC_Resolution_12_Bits,
      Alignment  => Right_Aligned);

   Configure_Regular_Conversions
     (Converter,
      Continuous  => False,
      Trigger     => Software_Triggered,
      Enable_EOC  => True,
      Conversions => All_Regular_Conversions);

   Enable (Converter);

   loop
      Start_Conversion (Converter);

      Poll_For_Status (Converter, Regular_Channel_Conversion_Complete, Successful);
      if not Successful then
         raise Timed_Out;
      end if;

      Raw := UInt32 (Conversion_Value (Converter));
      Volt := 3.3 * Float (Raw) / 4096.0;
      X := 39;
      Y := 20;
      DrawString (Display, X, Y, "     ", 1);
      X := 39;
      Y := 20;
      DrawString (Display, X, Y, Float'Image (Volt), 1);


      Raw := UInt32 (Conversion_Value (Converter));
      Volt := 3.3 * Float (Raw) / 4096.0;
      X := 39;
      Y := 40;
      DrawString (Display, X, Y, "     ", 1);
      X := 39;
      Y := 40;
      DrawString (Display, X, Y, Float'Image (Volt), 1);
      delay until Clock + Milliseconds (1000);
   end loop;
end Adc_i2c;
