with HAL;                use HAL;
with STM32.Device;       use STM32.Device;
with STM32.Board;        use STM32.Board;
with STM32.MPU;          use STM32.MPU;
with STM32.GPIO;         use STM32.GPIO;
with STM32.DAC;          use STM32.DAC;
with Ada.Numerics;       use Ada.Numerics;
with System.Libm_Single; use System.Libm_Single;

with Ada.Real_Time; use Ada.Real_Time;

procedure Test_Ns is
   Output_Channel1 : constant DAC_Channel := Channel_1;  -- arbitrary
   Output_Channel2 : constant DAC_Channel := Channel_2;  -- arbitrary
   procedure Init_MPU;
   procedure Init_MPU
   is
      Ram : Attr_Type := (Outer => 4, Inner => 4);
      Dev : Attr_Type := (Outer => 0, Inner => 0);
   begin
      Add_Attrib (AttrIdx => 0, Attrib => Ram);
      Add_Attrib (AttrIdx => 1, Attrib => Dev);
      Add_Region (Region_Num => 0,
                  Addr       => 16#3000_0000#,
                  Size       => (2 ** 18),
                  AttIdx     => 0);
      Add_Region (Region_Num => 1,
                  Addr       => 16#2000_0000#,
                  Size       => (2 ** 18),
                  AttIdx     => 0);
      Add_Region (Region_Num => 3,
                  Addr       => 16#4000_0000#,
                  Size       => 16#1000_0000#,
                  AttIdx     => 1);
      Add_Region (Region_Num => 4,
                  Addr       => 16#E000_0000#,
                  Size       => 16#1000_0000#,
                  AttIdx     => 1);
      Enable_MPU;
   end Init_MPU;
   procedure Configure_DAC_GPIO (Output_Channel : DAC_Channel);
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
   Step : constant Natural := 256;
--   Step : constant Natural := 32; --  this doesnt flicker but the dots are visible

   type ValIdx is mod Step;

   type Value_Type is digits 6 range
     -1.0 .. 1.0;
   type Value_Array is array (ValIdx) of Float;

   X : Value_Array;


begin
   Configure_DAC_GPIO (Output_Channel1);
   Configure_DAC_GPIO (Output_Channel2);

   Enable_Clock (DAC);

   Reset (DAC);

   Select_Trigger (DAC, Output_Channel1, Software_Trigger);
   Select_Trigger (DAC, Output_Channel2, Software_Trigger);

   Enable_Trigger (DAC, Output_Channel1);
   Enable_Trigger (DAC, Output_Channel2);

   Enable (DAC, Output_Channel1);
   Enable (DAC, Output_Channel2);

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
         X (I) := Sin (Pi_O_2 * Tmp) * 0.9;
      end loop;
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
                 (DAC,
                  Output_Channel1,
                  Count_X,
                  Resolution,
                  Right_Aligned);
               Set_Output
                 (DAC,
                  Output_Channel2,
                  Count_Y,
                  Resolution,
                  Right_Aligned);
               Trigger_Conversion_By_Software (DAC); --  Hits both channels
            end loop;
         end loop;
      end loop;
   end;
end Test_Ns;
