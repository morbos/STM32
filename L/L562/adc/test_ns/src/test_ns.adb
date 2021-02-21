with HAL;                use HAL;
with STM32.Device;       use STM32.Device;
with STM32.Board;        use STM32.Board;
with STM32.MPU;          use STM32.MPU;
with STM32.GPIO;         use STM32.GPIO;
with STM32.ADC;          use STM32.ADC;

with Ada.Real_Time; use Ada.Real_Time;

procedure Test_Ns is
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

   Converter     : Analog_To_Digital_Converter renames ADC_1;
   Input_Channel0 : constant Analog_Input_Channel := 0;
   Input0         : constant GPIO_Point := PA0;

   Input_Channel1 : constant Analog_Input_Channel := 1;
   Input1         : constant GPIO_Point := PA1;

   All_Regular_Conversions : constant Regular_Channel_Conversions :=
     (1 => (Channel => Input_Channel0, Sample_Time => Sample_144_Cycles),
      2 => (Channel => Input_Channel1, Sample_Time => Sample_144_Cycles)
     );

   Raw : UInt32 := 0;

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
      Configure_IO (Input0, (Mode => Mode_In, Resistors => Floating, others => <>));
      Enable_Clock (Input1);
      Configure_IO (Input1, (Mode => Mode_In, Resistors => Floating, others => <>));
   end Configure_Analog_Input;


begin
   Init_MPU;

   Configure_Analog_Input;

   Enable_Clock (Converter);

   Reset_All_ADC_Units;

   Configure_Unit
     (Converter,
--      Resolution => ADC_Resolution_12_Bits,
      Alignment  => Right_Aligned);

   Configure_Regular_Conversions
     (Converter,
      Continuous  => False,
      Trigger     => Software_Triggered,
--      Enable_EOC  => True,
      Conversions => All_Regular_Conversions);

   Enable (Converter);

   loop
      Start_Conversion (Converter);

      Poll_For_Status (Converter, Regular_Channel_Conversion_Complete, Successful);
      if not Successful then
         raise Timed_Out;
      end if;

      Raw := UInt32 (Conversion_Value (Converter));

      Raw := UInt32 (Conversion_Value (Converter));

   end loop;
end Test_Ns;
