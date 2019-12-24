with HAL;                use HAL;
with STM32.Device;       use STM32.Device;
with STM32.GPIO;         use STM32.GPIO;
with STM32.DAC;          use STM32.DAC;
with Ada.Text_IO;        use Ada.Text_IO;
with Ada.Numerics;       use Ada.Numerics;
with System.Libm_Single; use System.Libm_Single;
with Trace;              use Trace;

use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;      use Ada.Real_Time;

procedure Dac_Sw is

   Output_Channel1 : constant DAC_Channel := Channel_1;  -- arbitrary
   Output_Channel2 : constant DAC_Channel := Channel_2;  -- arbitrary

   procedure Configure_DAC_GPIO (Output_Channel : DAC_Channel);
   --  Once the channel is enabled, the corresponding GPIO pin is automatically
   --  connected to the analog converter output. However, in order to avoid
   --  parasitic consumption, the PA4 pin (Channel_1) or PA5 pin (Channel_2)
   --  should first be configured to analog mode. See the note in the RM, page
   --  431.

   ------------------------
   -- Configure_DAC_GPIO --
   ------------------------

   procedure Configure_DAC_GPIO (Output_Channel : DAC_Channel) is
      Output : constant GPIO_Point := (if Output_Channel = Channel_1
                                       then DAC_Channel_1_IO
                                       else DAC_Channel_2_IO);
      Config : GPIO_Port_Configuration;
   begin
      Enable_Clock (Output);
      Config.Mode := Mode_Analog;
      Config.Resistors := Floating;
      Configure_IO (Output, Config);
   end Configure_DAC_GPIO;

--   Step : constant Natural := 1024; -- This flickers quite noticably
   Step : constant Natural := 32; --  this doesnt flicker but the dots are visible

   type ValIdx is mod Step;

   type Value_Type is digits 6 range
     -1.0 .. 1.0;
   type Value_Array is array (ValIdx) of Float;

   X : Value_Array;

   subtype SWO is GPIO_Point;

   SWO_Pin  : SWO renames PB3;

begin
   Enable_Clock (SWO_Pin);

   Configure_Tracing;

   Configure_DAC_GPIO (Output_Channel1);
   Configure_DAC_GPIO (Output_Channel2);

   Enable_Clock (DAC_1);

   Reset (DAC_1);

   Select_Trigger (DAC_1, Output_Channel1, Software_Trigger);
   Select_Trigger (DAC_1, Output_Channel2, Software_Trigger);

   Enable_Trigger (DAC_1, Output_Channel1);
   Enable_Trigger (DAC_1, Output_Channel2);

   Enable (DAC_1, Output_Channel1);
   Enable (DAC_1, Output_Channel2);

   ITM_Print (1, "Hello");

   declare
      type Dirs is (Forwards, Backwards);
      Value   : UInt32 := 0;
      Tmp     : Float;
      Tmp_X   : Float;
      Tmp_Y   : Float;
      Dir_X   : Dirs;
      Dir_Y   : Dirs;
      Sign_X  : Float;
      Sign_Y  : Float;
      Idx_X   : ValIdx;
      Idx_Y   : ValIdx;
      Count_X : UInt32;
      Count_Y : UInt32;

      Resolution : constant DAC_Resolution := DAC_Resolution_12_Bits;
      --  Arbitrary, change as desired.  Counts will automatically adjust.

      Max_Counts : constant UInt32 := (if Resolution = DAC_Resolution_12_Bits
                                       then Max_12bit_Resolution
                                       else Max_8bit_Resolution);
      Pi_O_2 : Float := Pi / 2.0;
   begin
      --  Amount of radians per Range elem
      for I in X'Range loop
         Tmp := Float (I) / Float (Step);
         X (I) := Sin (Pi_O_2 * Tmp);
      end loop;

      Main_Loop :
      loop
         for Quadrant in 1 .. 4 loop
            case Quadrant is
               when 1 =>
                  Dir_X := Backwards;
                  Dir_Y := Forwards;
                  Sign_X := 1.0;
                  Sign_Y := 1.0;
               when 2 =>
                  Dir_X := Forwards;
                  Dir_Y := Backwards;
                  Sign_X := -1.0;
                  Sign_Y := 1.0;
               when 3 =>
                  Dir_X := Backwards;
                  Dir_Y := Forwards;
                  Sign_X := -1.0;
                  Sign_Y := -1.0;
               when 4 =>
                  Dir_X := Forwards;
                  Dir_Y := Backwards;
                  Sign_X := 1.0;
                  Sign_Y := -1.0;
            end case;

            for I in X'Range loop
               Idx_X := (if Dir_X = Forwards then I else X'Last - I);
               Idx_Y := (if Dir_Y = Forwards then I else X'Last - I);
               Tmp_X := X (Idx_X) * Sign_X;
               Tmp_Y := X (Idx_Y) * Sign_Y;
               --  Tmps are now -1..1 we need 0..maxcount
               --  Tmp += 1, Tmp /= 2 makes it 0 .. 2 -> 0..1
               Tmp_X := Tmp_X + 1.0;
               Tmp_Y := Tmp_Y + 1.0;
               Tmp_X := Tmp_X / 2.0;
               Tmp_Y := Tmp_Y / 2.0;
               Count_X := UInt32 (Tmp_X * Float (Max_Counts));
               Count_Y := UInt32 (Tmp_Y * Float (Max_Counts));
               Set_Output
                 (DAC_1,
                  Output_Channel1,
                  Count_X,
                  Resolution,
                  Right_Aligned);
               Set_Output
                 (DAC_1,
                  Output_Channel2,
                  Count_Y,
                  Resolution,
                  Right_Aligned);
--                Trigger_Conversion_By_Software (DAC_1, Output_Channel1);
--                Trigger_Conversion_By_Software (DAC_1, Output_Channel2);
               Trigger_Conversion_By_Software (DAC_1); --  Hits both channels
--               ITM_SendValue (0, UInt8 (I));
            end loop;
         end loop;
      end loop Main_Loop;
   end;
end Dac_Sw;
