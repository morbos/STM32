--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL;             use HAL;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
use STM32; -- for GPIO_Alternate_Function

with Ada.Real_Time;   use Ada.Real_Time;

procedure pinny2
is

   BP_Points    : GPIO_Points :=
     PA0  & PA1  & PA2  & PA3  & PA4  & PA5  & PA6  & PA7 &
     PA8  & PA9  & PA10 & PA11 & PA12 & PA15 &
     PB0  & PB1  & PB3  & PB4  & PB5  & PB6  & PB7  & PB8 &
     PB9  & PB10 & PB11 & PB12 & PB13 & PB14 & PB15 &
     PC13 & PC14 & PC15;

   Set1    : GPIO_Points :=
     PC13 & PC15 & PA1  & PA4  & PA6  & PB0  & PB10 & PB12 &
     PB14 & PA8  & PA10 & PA12 & PB3  & PB5  & PB7  & PB9;

   Set2    : GPIO_Points :=
     PC14 & PA0  & PA2  & PA3  & PA5  & PA7  & PB1  & PB11 &
     PB13 & PB15 & PA9  & PA11 & PA15 & PB4  & PB6  & PB8;

   procedure Initialize;

   procedure Initialize
   is
      GPIO_Conf    : GPIO_Port_Configuration;
   begin
      Enable_Clock (BP_Points);

      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Resistors   := Floating;
      GPIO_Conf.Speed       := Speed_2MHz;
      GPIO_Conf.Mode        := Mode_Out;

      Configure_IO (BP_Points, GPIO_Conf);

   end Initialize;

begin
   Initialize;

   Clear (Set1);
   Set (Set2);

   loop
      Toggle (BP_Points);
      delay until Clock + Milliseconds (1000);
   end loop;
end pinny2;
