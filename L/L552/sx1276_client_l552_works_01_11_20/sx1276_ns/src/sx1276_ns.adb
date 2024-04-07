with HAL;      use HAL;
with HAL.SPI;  use HAL.SPI;
with STM32.Device;   use STM32.Device;
with STM32.Board;    use STM32.Board;
with STM32.MPU;      use STM32.MPU;
with LoRa_Client;    use LoRa_Client;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Synchronous_Task_Control; use Ada.Synchronous_Task_Control;

with Exti;  pragma Unreferenced (Exti);

procedure sx1276_Ns is
   Idx   : Integer := LEDs'First;

   procedure My_Delay;
   procedure My_Delay is
   begin
      delay until Clock + Milliseconds (1000);
   end My_Delay;

   procedure Init_MPU;
   procedure Init_MPU
   is
      Ram : Attr_Type := (Outer => 4, Inner => 4);
      Rom : Attr_Type := (Outer => 4, Inner => 5);
      Dev : Attr_Type := (Outer => 0, Inner => 0);
   begin
      Add_Attrib (AttrIdx => 0, Attrib => Ram);
      Add_Attrib (AttrIdx => 1, Attrib => Dev);
      Add_Attrib (AttrIdx => 2, Attrib => Rom);
      Add_Region (Region_Num => 0,
                  Addr       => 16#3000_0000#,
                  Size       => (2 ** 18) - 1,
                  AttIdx     => 0);
      Add_Region (Region_Num => 1,
                  Addr       => 16#2000_0000#,
                  Size       => (2 ** 18) - 1,
                  AttIdx     => 0);
      Add_Region (Region_Num => 3,
                  Addr       => 16#4000_0000#,
                  Size       => 16#1000_0000# - 1,
                  AttIdx     => 1);
      Add_Region (Region_Num => 4,
                  Addr       => 16#E000_0000#,
                  Size       => 16#1000_0000# - 1,
                  AttIdx     => 1);
      Add_Region (Region_Num => 5,
                  Addr       => 16#0802_0000#,
                  Size       => 16#0004_0000# - 1,
                  AttIdx     => 2);
      Enable_MPU;
   end Init_MPU;

   procedure Advance_LEDs;
   procedure Advance_LEDs
   is
   begin
      Toggle (LEDs (Idx));
      if Idx = LEDs'Last then
         Idx := LEDs'First;
      else
         Idx := Idx + 1;
      end if;
   end Advance_LEDs;

   procedure Initialize_SX1276;
   pragma Import (C, Initialize_SX1276, "initialize_sx1276_from_ns");
begin
   Init_MPU;
   Initialize_SX1276;

   LoRa_Start;

   loop
      null;
   end loop;

end sx1276_Ns;
