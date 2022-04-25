with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with Peripherals;     use Peripherals;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure EZstepper_F103
is
   procedure Delay_Milliseconds (Count : Positive);
   procedure Delay_Milliseconds (Count : Positive) is
   begin
      delay until Clock + Milliseconds (Count);
   end Delay_Milliseconds;
   procedure Delay_Microseconds (Count : Positive);
   procedure Delay_Microseconds (Count : Positive) is
   begin
      delay until Clock + Microseconds (Count);
   end Delay_Microseconds;
   procedure Initialize_GPIO;
   procedure Initialize_GPIO is
      Config : GPIO_Port_Configuration;
      EZ_Points : constant GPIO_Points :=
        Ena & Step & Dir & MS1 & MS2;
   begin
      Enable_Clock (EZ_Points);

      Config.Mode        := Mode_Out;
      Config.Output_Type := Push_Pull;
      Config.Resistors   := Floating;
      Config.Speed       := Speed_50MHz;

      Configure_IO (EZ_Points, Config);

      Clear (Ena);
      --      Clear (Dir);
      Set (Dir);
      --  1/2 step
--      Set (MS1);
--      Clear (MS2);

      --  1/8 step
      Set (MS1);
      Set (MS2);

   end Initialize_GPIO;
   Dval : Positive;
begin
   Initialize_Board;
   Initialize_GPIO;
   Dval := 1000;
   loop
      Set (Step);
      Delay_Microseconds (Dval);
      Clear (Step);
   end loop;
end EZstepper_F103;
