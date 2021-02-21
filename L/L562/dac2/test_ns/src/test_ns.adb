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
   procedure Configure_DAC_GPIO;
   procedure Configure_DAC_GPIO is
      Output : constant GPIO_Point := DAC_Channel_1_IO;
      Config : GPIO_Port_Configuration;
   begin
      Enable_Clock (Output);
      Config.Mode := Mode_Analog;
      Config.Resistors := Floating;
      Configure_IO (Output, Config);
   end Configure_DAC_GPIO;
   procedure Xyzzy;
   procedure Xyzzy
   is
   begin
      null;
   end Xyzzy;
--   Step : constant Natural := 1024; -- This flickers quite noticably
   Step : constant Natural := 256;
--   Step : constant Natural := 32; --  this doesnt flicker but the dots are visible

   type ValIdx is mod Step;

   type Value_Type is digits 6 range
     -1.0 .. 1.0;
   type Value_Array is array (ValIdx) of Float;

   X : Value_Array;


   Stop_Val : Integer := 1800; -- 1825 - 1990 (1.462v - 1.5) (D 2.865 - 0,04)
   --  ~0.006v to ~0.025v etc / dac step

begin
   Configure_DAC_GPIO;

   Enable_Clock (DAC);

   Reset (DAC);

   Select_Trigger (DAC, Output_Channel1, Software_Trigger);

   Enable_Trigger (DAC, Output_Channel1);

   Enable (DAC, Output_Channel1);

   declare
      type Dirs is (Forwards, Backwards);
      Value   : UInt32 := 0;

      Resolution : constant DAC_Resolution := DAC_Resolution_12_Bits;
      --  Arbitrary, change as desired.  Counts will automatically adjust.

      Max_Counts : constant UInt32 := Max_12bit_Resolution;
   begin
      loop
         --         for I in 0 .. Max_12bit_Resolution loop
         for I in 1800 .. 2042 loop
            if I = Stop_Val then
               Xyzzy;
            end if;
            Set_Output
              (DAC,
               Output_Channel1,
               UInt32 (I),
               Resolution,
               Right_Aligned);
            Trigger_Conversion_By_Software (DAC); --  Hits both channels
         end loop;
      end loop;
   end;
end Test_Ns;
