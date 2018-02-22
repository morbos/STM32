with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
with HAL; use HAL;
with Peripherals;     use Peripherals;
with Interfaces;      use Interfaces;
with STM32.Device;    use STM32.Device;
with STM32.Board;     use STM32.Board;
with STM32.GPIO;      use STM32.GPIO;
use STM32; -- for GPIO_Alternate_Function

with Neo;             use Neo;
with Ada.Real_Time;   use Ada.Real_Time;
with Ada.Text_IO;     use Ada.Text_IO;

procedure Neo60_f103 is

   procedure Initialize_GPIO (Neo : GPIO_Point);

   procedure Initialize_GPIO (Neo : GPIO_Point) is
      GPIO_Conf : GPIO_Port_Configuration;
   begin
      Enable_Clock (Neo);
      GPIO_Conf.Mode        := Mode_Out;
      GPIO_Conf.Output_Type := Push_Pull;
      GPIO_Conf.Speed       := Speed_50MHz;
      GPIO_Conf.Resistors   := Floating;
      Configure_IO (Neo, Config => GPIO_Conf);
   end Initialize_GPIO;

begin
   Initialize_GPIO (Neo => Neo_Pin);
--   loop
--      Test (Neo_Pin, 60);
--   end loop;
   Test2 (Neo_Pin);

end Neo60_f103;
